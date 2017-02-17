package com.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CommerceItemDao;
import com.dao.ProductDao;
import com.entities.CommerceItem;
import com.entities.Product;
import com.services.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDao productDao;
	CommerceItemDao commerceDao;
	
	//CommerceItemDao commerceItemDao;
	
	public List<Product> list() {
		// TODO Auto-generated method stub
		return productDao.list();
	}
	
	public List<CommerceItem> listCommerce() {
		// TODO Auto-generated method stub
		return productDao.listCommerce();
	}
	public boolean delete(CommerceItem commerceItem) {
		// TODO Auto-generated method stub
		return productDao.delete(commerceItem);
	}

	public boolean saveOrUpdate(CommerceItem commerceItem) {
		// TODO Auto-generated method stub
		return productDao.saveOrUpdate(commerceItem);
	}
	
	public boolean delete_all() {
		// TODO Auto-generated method stub
		return productDao.delete_all();
	}
}
