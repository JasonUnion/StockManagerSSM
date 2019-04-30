package com.ischoolbar.programmer.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.admin.Product;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.admin.ProductService;
import com.ischoolbar.programmer.service.admin.SupplierService;

/**
 * 商品管理控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/product")
@Controller
public class ProductController {
	
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private ProductService productService;
	
	/**
	 * 商品管理列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 9999);
		model.addObject("supplierList", supplierService.findList(queryMap));
		model.setViewName("product/list");
		return model;
	}
	
	/**
	 * 模糊搜索分页获取商品信息
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(
			@RequestParam(name="supplierId",required=false) Long supplierId,
			@RequestParam(name="name",defaultValue="") String name,Page page
			){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		if(supplierId != null){
			queryMap.put("supplierId", supplierId);
		}
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("total", productService.getTotal(queryMap));
		ret.put("rows", productService.findList(queryMap));
		return ret;
	}
	
	
	/**
	 * 添加商品信息
	 * @param product
	 * @return
	 */
	@RequestMapping(value="add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Product product){
		Map<String, String> ret = new HashMap<String, String>();
		if(product == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的商品信息!");
			return ret;
		}
		if(StringUtils.isEmpty(product.getName())){
			ret.put("type", "error");
			ret.put("msg", "请填写商品名称!");
			return ret;
		}
		if(product.getSupplierId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择商品供应商!");
			return ret;
		}
		if(product.getPrice() == null){
			ret.put("type", "error");
			ret.put("msg", "请填写商品价格!");
			return ret;
		}
		if(productService.add(product) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 编辑商品信息
	 * @param product
	 * @return
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Product product){
		Map<String, String> ret = new HashMap<String, String>();
		if(product == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的商品信息!");
			return ret;
		}
		if(StringUtils.isEmpty(product.getName())){
			ret.put("type", "error");
			ret.put("msg", "请填写商品名称!");
			return ret;
		}
		if(product.getSupplierId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择商品供应商!");
			return ret;
		}
		if(product.getPrice() == null){
			ret.put("type", "error");
			ret.put("msg", "请填写商品价格!");
			return ret;
		}
		if(productService.edit(product) <= 0){
			ret.put("type", "error");
			ret.put("msg", "编辑失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 删除指定id的商品
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "请选择要删除的商品!");
			return ret;
		}
		try {
			if(productService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该商品下存在关联的入库或销售信息，请先将商品关联信息删除!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
	
	@RequestMapping(value="import_product",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> importFile(MultipartFile excelFile,Long supplierId){
		Map<String, String> ret = new HashMap<String, String>();
		if(supplierId == null){
			ret.put("type", "error");
			ret.put("msg", "请选择供应商!");
			return ret;
		}
		if(excelFile == null){
			ret.put("type", "error");
			ret.put("msg", "请选择上传的文件!");
			return ret;
		}
		if(excelFile.getSize() > 5000000){
			ret.put("type", "error");
			ret.put("msg", "文件大小超过5M,请上传不大于5M的文件");
			return ret;
		}
		//获取文件后缀
		String suffix = excelFile.getOriginalFilename().substring(excelFile.getOriginalFilename().lastIndexOf(".")+1,excelFile.getOriginalFilename().length());
		if(!"xlsx,xls".contains(suffix)){
			ret.put("type", "error");
			ret.put("msg", "请上传xlsx或xls格式的文件!");
			return ret;
		}
		String msg = "";
		try {
			msg = addProductByFile(supplierId,excelFile.getInputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if("".equals(msg)){
			msg = "全部导入成功";
		}
		ret.put("type", "success");
		ret.put("msg", msg);
		return ret;
	}
	
	private String addProductByFile(Long supplierId,InputStream inputStream){
		String msg = "";
		try {
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(inputStream);
			HSSFSheet sheetAt = hssfWorkbook.getSheetAt(0);
			//去掉表头，送第二行开始读
			if(sheetAt.getLastRowNum() <= 0){
				msg = "文件内容为空!";
			}
			System.out.println(sheetAt.getLastRowNum());
			for(int rowIndex = 1; rowIndex <= sheetAt.getLastRowNum(); rowIndex++){
				HSSFRow row = sheetAt.getRow(rowIndex);
				Product product = new Product();
				if(row.getCell(0) == null){
					msg += "第" + (rowIndex+1) + "行商品名称为空，跳过!\n";
					continue;
				}
				String name = row.getCell(0).getStringCellValue();
				product.setName(name);
				product.setPlace(row.getCell(1) == null ? "" : row.getCell(1).getStringCellValue());
				product.setSpec(row.getCell(2) == null ? "" : row.getCell(2).getStringCellValue());
				product.setPk(row.getCell(3) == null ? "" : row.getCell(3).getStringCellValue());
				product.setUnit(row.getCell(4) == null ? "" : row.getCell(4).getStringCellValue());
				
				if(row.getCell(5) == null){
					msg += "第" + (rowIndex+1) + "行商品价格为空，跳过!\n";
					continue;
				}
				
				try {
					Double priceDouble = row.getCell(5).getNumericCellValue();
					float price = Float.valueOf(priceDouble+"");
					product.setPrice(price);
				} catch (Exception e) {
					// TODO: handle exception
					msg += "第" + (rowIndex+1) + "行商品价格格式错误，跳过!\n";
					continue;
				}
				
				
				product.setRemark(row.getCell(6) == null ? "" : row.getCell(6).getStringCellValue());
				
				product.setSupplierId(supplierId);
				if(productService.add(product) <= 0){
					msg += "第" + (rowIndex+1) + "行商品添加失败!\n";
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
}
