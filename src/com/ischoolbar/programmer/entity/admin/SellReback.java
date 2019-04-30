package com.ischoolbar.programmer.entity.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

/**
 * 销售退货单实体
 * @author Administrator
 *
 */
@Component
public class SellReback {
	private Long id;
	private Float money;//销售退货单总金额
	private Integer productNum;//商品数量
	private int payType = 0;//支付方式，0：现金，1：银行转账，2：支付宝，3：微信，4：支票，5：其他
	private int status = 0;//状态：0：未支付，1：已支付
	private String operator;//操作人
	private String remark;//备注
	private List<SellRebackDetail> sellRebackDetailList = new ArrayList<SellRebackDetail>();
	private Date createTime;//销售退货时间
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Float getMoney() {
		return money;
	}
	public void setMoney(Float money) {
		this.money = money;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public int getPayType() {
		return payType;
	}
	public void setPayType(int payType) {
		this.payType = payType;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	public List<SellRebackDetail> getSellRebackDetailList() {
		return sellRebackDetailList;
	}
	public void setSellRebackDetailList(List<SellRebackDetail> sellRebackDetailList) {
		this.sellRebackDetailList = sellRebackDetailList;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
