package com.ischoolbar.programmer.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.admin.SellReback;

/**
 * 销售退货单service接口
 * @author Administrator
 *
 */
@Service
public interface SellRebackService {
	public int add(SellReback sellReback);
	public int edit(SellReback sellReback);
	public List<SellReback> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public int delete(Long id);
	public List<Map<String,String>> getStats(String date);
}
