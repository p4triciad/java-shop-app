package com.dao;

import java.util.List;

import com.entities.CommerceItem;
import com.entities.Product;

public interface ProductDao {
	public List<Product> list();
	public List<CommerceItem> listCommerce();
	public boolean saveOrUpdate(CommerceItem commerceItem);
	public boolean delete(CommerceItem commerceItem);
	public boolean delete_all();
}
