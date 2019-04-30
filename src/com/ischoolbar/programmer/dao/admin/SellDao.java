package com.ischoolbar.programmer.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.admin.Sell;
import com.ischoolbar.programmer.entity.admin.SellDetail;

/**
 * œ˙ €µ•dao
 * @author Administrator
 *
 */
@Repository
public interface SellDao {
	public int addDetail(SellDetail sellDetail);
	public int add(Sell sell);
	public int edit(Sell sell);
	public List<Sell> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public int delete(Long id);
	public List<Map<String,String>> getStats(String date);
}
