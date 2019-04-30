package com.ischoolbar.programmer.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.admin.OrderInReback;
import com.ischoolbar.programmer.entity.admin.OrderInRebackDetail;

/**
 * 进货退货单dao
 * @author Administrator
 *
 */
@Repository
public interface OrderInRebackDao {
	public int add(OrderInReback orderInReback);
	public int edit(OrderInReback orderInReback);
	public List<OrderInReback> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public int delete(Long id);
	public int addDetail(OrderInRebackDetail orderInRebackDetail);
}
