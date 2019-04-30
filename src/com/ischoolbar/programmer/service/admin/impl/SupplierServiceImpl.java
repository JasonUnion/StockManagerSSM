package com.ischoolbar.programmer.service.admin.impl;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;







import com.ischoolbar.programmer.dao.admin.SupplierDao;
import com.ischoolbar.programmer.entity.admin.Supplier;
/**
 * 供应商service实现类
 */
import com.ischoolbar.programmer.service.admin.SupplierService;
@Service
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	private SupplierDao supplierDao;
	@Override
	public int add(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierDao.add(supplier);
	}
	@Override
	public List<Supplier> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return supplierDao.findList(queryMap);
	}
	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return supplierDao.getTotal(queryMap);
	}
	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return supplierDao.delete(id);
	}
	@Override
	public int edit(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierDao.edit(supplier);
	}
	
}
