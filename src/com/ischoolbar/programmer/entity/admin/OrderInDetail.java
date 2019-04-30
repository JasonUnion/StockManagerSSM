package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * 进货单详细商品实体
 * @author Administrator
 *
 */
@Component
public class OrderInDetail {
	private Long id;
	private Long orderInId;//所属进货订单id
	private String productName;//商品名称
	private Float price;//商品价格
	private Integer productNum;//商品数量
	private Float money;//该商品金额
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getOrderInId() {
		return orderInId;
	}
	public void setOrderInId(Long orderInId) {
		this.orderInId = orderInId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public Float getMoney() {
		return money;
	}
	public void setMoney(Float money) {
		this.money = money;
	}
	
}
