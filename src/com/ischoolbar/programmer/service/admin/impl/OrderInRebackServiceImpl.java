package com.ischoolbar.programmer.service.admin.impl;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.admin.OrderInRebackDao;
import com.ischoolbar.programmer.entity.admin.OrderInReback;
import com.ischoolbar.programmer.entity.admin.OrderInRebackDetail;
import com.ischoolbar.programmer.service.admin.OrderInRebackService;
/**
 * 进货退货单service实现类
 */
@Service
public class OrderInRebackServiceImpl implements OrderInRebackService {

	@Autowired
	private OrderInRebackDao orderInRebackDao;

	@Override
	public int add(OrderInReback orderInReback) {
		// TODO Auto-generated method stub
		int rst = orderInRebackDao.add(orderInReback);
		if(rst > 0){
			//表示进货退货单添加成功,接下来添加进货退货单子项
			for(OrderInRebackDetail orderInRebackDetail : orderInReback.getOrderInRebackDetailList()){
				orderInRebackDetail.setOrderInRebackId(orderInReback.getId());
				orderInRebackDao.addDetail(orderInRebackDetail);
			}
		}
		return rst;
	}

	@Override
	public int edit(OrderInReback orderInReback) {
		// TODO Auto-generated method stub
		return orderInRebackDao.edit(orderInReback);
	}

	@Override
	public List<OrderInReback> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return orderInRebackDao.findList(queryMap);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return orderInRebackDao.getTotal(queryMap);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return orderInRebackDao.delete(id);
	}

	
	
}
