package com.ischoolbar.programmer.controller.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.admin.OrderIn;
import com.ischoolbar.programmer.entity.admin.OrderInDetail;
import com.ischoolbar.programmer.entity.admin.Stock;
import com.ischoolbar.programmer.entity.admin.User;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.admin.OrderInService;
import com.ischoolbar.programmer.service.admin.ProductService;
import com.ischoolbar.programmer.service.admin.StockService;

/**
 * 进货单管理控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/order_in")
@Controller
public class OrderInController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderInService orderInService;
	@Autowired
	private StockService stockService;
	/**
	 * 进货单管理列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("order_in/list");
		return model;
	}
	
	/**
	 * 模糊搜索分页获取进货单信息
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(
			@RequestParam(name="payType",required=false) Integer payType,
			@RequestParam(name="status",required=false) Integer status,
			@RequestParam(name="minMoney",required=false) Float minMoney,
			@RequestParam(name="maxMoney",required=false) Float maxMoney,
			@RequestParam(name="operator",defaultValue="") String operator,Page page
			){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("operator", operator);
		if(payType != null){
			queryMap.put("payType", payType);
		}
		if(status != null){
			queryMap.put("status", status);
		}
		if(minMoney != null){
			queryMap.put("minMoney", minMoney);
		}
		if(maxMoney != null){
			queryMap.put("maxMoney", maxMoney);
		}
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("total", orderInService.getTotal(queryMap));
		ret.put("rows", orderInService.findList(queryMap));
		return ret;
	}
	
	
	/**
	 * 添加进货单信息
	 * @param orderIn
	 * @return
	 */
	@RequestMapping(value="add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(String productList,OrderIn orderIn,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		if(StringUtils.isEmpty(productList)){
			ret.put("type", "error");
			ret.put("msg", "请至少选择一个商品信息!");
			return ret;
		}
		if(orderIn == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的进货单信息!");
			return ret;
		}
		JSONArray productArray = JSONArray.fromObject(productList);
		float money = 0;
		int num = 0;
		List<Stock> stockList = new ArrayList<Stock>();
		for(int i = 0; i < productArray.size(); i++){
			JSONObject jsonObject = productArray.getJSONObject(i);
			OrderInDetail orderInDetail = new OrderInDetail();
			orderInDetail.setProductName(jsonObject.getString("name"));
			orderInDetail.setProductNum(jsonObject.getInt("productNum"));
			orderInDetail.setPrice(Float.valueOf(jsonObject.getString("price")));
			orderInDetail.setMoney(orderInDetail.getPrice() * orderInDetail.getProductNum());
			orderIn.getOrderInDetailList().add(orderInDetail);
			money += orderInDetail.getMoney();
			num += orderInDetail.getProductNum();
			Stock stock = new Stock();
			stock.setProductId(Long.valueOf(jsonObject.getInt("id")+""));
			stock.setProductNum(orderInDetail.getProductNum());
			stock.setCreateTime(new Date());
			stock.setSellNum(0);
			stockList.add(stock);
		}
		orderIn.setMoney(money);
		orderIn.setProductNum(num);
		User admin = (User)request.getSession().getAttribute("admin");
		orderIn.setOperator(admin.getUsername());
		orderIn.setCreateTime(new Date());
		if(orderInService.add(orderIn) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		//进行入库操作
		addStock(stockList);
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 编辑进货单信息
	 * @param product
	 * @return
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(OrderIn orderIn){
		Map<String, String> ret = new HashMap<String, String>();
		if(orderIn == null){
			ret.put("type", "error");
			ret.put("msg", "请选择正确的进货单信息!");
			return ret;
		}
		orderIn.setStatus(1);
		if(orderInService.edit(orderIn) <= 0){
			ret.put("type", "error");
			ret.put("msg", "编辑失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "编辑成功!");
		return ret;
	}
	
	/**
	 * 商品入库
	 * @param stockList
	 */
	private void addStock(List<Stock> stockList){
		for(Stock stock : stockList){
			Stock existStock = stockService.findByProductId(stock.getProductId());
			if(existStock == null){
				//表示库存里还没有这个商品
				stockService.add(stock);
				continue;
			}
			//走到这里表示数据库中已经存在，则更新商品数量
			existStock.setProductNum(existStock.getProductNum() + stock.getProductNum());
			stockService.edit(existStock);
		}
	}
	
}
