package com.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CommerceItemDao;
import com.entities.CommerceItem;

@Repository
@Transactional

public class CommerceItemDaoImpl implements CommerceItemDao {
	@Autowired
    SessionFactory session;
	
	public List<CommerceItem> list() {
        return session.getCurrentSession().createQuery("from CommerceItem").list();
    }
}
