package com.services;

import java.util.List;

import com.entities.CommerceItem;
import com.entities.Product;

public interface ProductService {
	public List<Product> list();
	public List<CommerceItem> listCommerce();
	public boolean delete(CommerceItem commerceItem);
	public boolean delete_all();
	public boolean saveOrUpdate(CommerceItem commerceItem);
}
