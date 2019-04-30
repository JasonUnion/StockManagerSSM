package com.ischoolbar.programmer.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.admin.OrderIn;
import com.ischoolbar.programmer.entity.admin.OrderInDetail;

/**
 * ½ø»õµ¥dao
 * @author Administrator
 *
 */
@Repository
public interface OrderInDao {
	public int add(OrderIn orderIn);
	public int addDetail(OrderInDetail orderInDetail);
	public int edit(OrderIn orderIn);
	public List<OrderIn> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public int delete(Long id);
}
