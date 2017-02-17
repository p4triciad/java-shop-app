package com.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CommerceItemDao;
import com.entities.CommerceItem;
import com.services.CommerceItemService;

@Service
public class CommerceItemServiceImpl implements CommerceItemService{
	
	@Autowired
	CommerceItemDao commerceItemDao;
	
	public List<CommerceItem> list() {
		// TODO Auto-generated method stub
		return commerceItemDao.list();
	}
}
