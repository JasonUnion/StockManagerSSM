package com.ischoolbar.programmer.service.admin.impl;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.admin.OrderInDao;
import com.ischoolbar.programmer.entity.admin.OrderIn;
import com.ischoolbar.programmer.entity.admin.OrderInDetail;
import com.ischoolbar.programmer.service.admin.OrderInService;
/**
 * 进货单service实现类
 */
@Service
public class OrderInServiceImpl implements OrderInService {

	@Autowired
	private OrderInDao orderInDao;

	@Override
	public int add(OrderIn orderIn) {
		// TODO Auto-generated method stub
		int rst = orderInDao.add(orderIn);
		if(rst > 0){
			//表示进货单添加成功,接下来添加进货单子项
			for(OrderInDetail orderInDetail : orderIn.getOrderInDetailList()){
				orderInDetail.setOrderInId(orderIn.getId());
				orderInDao.addDetail(orderInDetail);
			}
		}
		return rst;
	}

	@Override
	public int edit(OrderIn orderIn) {
		// TODO Auto-generated method stub
		return orderInDao.edit(orderIn);
	}

	@Override
	public List<OrderIn> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return orderInDao.findList(queryMap);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return orderInDao.getTotal(queryMap);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return orderInDao.delete(id);
	}
	
}
