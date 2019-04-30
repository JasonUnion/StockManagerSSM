package com.ischoolbar.programmer.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.admin.Stock;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.admin.StockService;
import com.ischoolbar.programmer.service.admin.SupplierService;

/**
 * 商品库存管理控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/stock")
@Controller
public class StockController {
	
	@Autowired
	private StockService stockService;
	@Autowired
	private SupplierService supplierService;
	/**
	 * 商品库存管理列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 9999);
		model.addObject("supplierList", supplierService.findList(queryMap));
		model.setViewName("stock/list");
		return model;
	}
	
	/**
	 * 模糊搜索分页获取商品库存信息
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(
			@RequestParam(name="productNum",required=false) Integer productNum,
			@RequestParam(name="supplierId",required=false) Long supplierId,
			@RequestParam(name="productName",defaultValue="") String productName,Page page
			){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("productName", productName);
		if(supplierId != null){
			queryMap.put("supplierId", supplierId);
		}
		if(productNum != null){
			queryMap.put("productNum", productNum);
		}
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("total", stockService.getTotal(queryMap));
		ret.put("rows", stockService.findList(queryMap));
		return ret;
	}
	
	
	/**
	 * 编辑商品库存信息
	 * @param stock
	 * @return
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Stock stock){
		Map<String, String> ret = new HashMap<String, String>();
		if(stock == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的商品库存信息!");
			return ret;
		}
		if(stock.getProductNum() < 0){
			ret.put("type", "error");
			ret.put("msg", "商品库存数量不能小于0!");
			return ret;
		}
		if(stockService.edit(stock) <= 0){
			ret.put("type", "error");
			ret.put("msg", "编辑失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 删除指定id的商品库存
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "请选择要删除的商品库存!");
			return ret;
		}
		try {
			if(stockService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该商品库存下存在关联的入库或销售信息，请先将商品库存关联信息删除!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
	
}
