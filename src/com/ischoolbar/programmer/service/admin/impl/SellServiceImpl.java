package com.ischoolbar.programmer.service.admin.impl;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.admin.SellDao;
import com.ischoolbar.programmer.entity.admin.Sell;
import com.ischoolbar.programmer.entity.admin.SellDetail;
import com.ischoolbar.programmer.service.admin.SellService;
/**
 * 销售单service实现类
 */
@Service
public class SellServiceImpl implements SellService {

	@Autowired
	private SellDao sellDao;

	@Override
	public int add(Sell sell) {
		// TODO Auto-generated method stub
		int rst = sellDao.add(sell);
		if(rst > 0){
			//表示销售单添加成功,接下来添加销售单子项
			for(SellDetail sellDetail : sell.getSellDetailList()){
				sellDetail.setSellId(sell.getId());
				sellDao.addDetail(sellDetail);
			}
		}
		return rst;
	}

	@Override
	public int edit(Sell sell) {
		// TODO Auto-generated method stub
		return sellDao.edit(sell);
	}

	@Override
	public List<Sell> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return sellDao.findList(queryMap);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return sellDao.getTotal(queryMap);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return sellDao.delete(id);
	}

	@Override
	public List<Map<String,String>> getStats(String date) {
		// TODO Auto-generated method stub
		return sellDao.getStats(date);
	}

	
	
}
