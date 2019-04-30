package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * 商品实体类
 * @author Administrator
 *
 */
@Component
public class Product {
	private Long id;
	private Long supplierId;//供应商id
	private String name;//商品名称
	private String place;//商品产地
	private String spec;//商品规格
	private String pk;//包装
	private String unit;//商品计量单位
	private Float price;//商品价格
	private String remark;//商品备注描述
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getPk() {
		return pk;
	}
	public void setPk(String pk) {
		this.pk = pk;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
