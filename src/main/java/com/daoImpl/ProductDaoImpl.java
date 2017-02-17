package com.daoImpl;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ProductDao;
import com.entities.CommerceItem;
import com.entities.Product;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
    SessionFactory session;
 
    public boolean saveOrUpdate(CommerceItem commerceItem) {
    // TODO Auto-generated method stub
    	
    	SQLQuery query = session.getCurrentSession().createSQLQuery("select * from test.commerce_item where product_id = '"+commerceItem.getProduct_id()+"';");
    	
    	List<Object[]> rows = query.list();
    	if(rows.size()==0)
    		session.getCurrentSession().saveOrUpdate(commerceItem);
    	else{
    		CommerceItem commerceItem1 = new CommerceItem();
    		
	    	for(Object[] row : rows){
	    		commerceItem1.setId(row[0].toString());
	    		commerceItem1.setProduct_id(row[1].toString());
	    		commerceItem1.setQuantity(Integer.parseInt(row[2].toString()));
	    		commerceItem1.setAmount(new BigDecimal(row[3].toString()));	    		

	    		commerceItem.setId(commerceItem1.getId());
	    		commerceItem.setQuantity(commerceItem1.getQuantity()+ commerceItem.getQuantity());	    
	    		commerceItem.setAmount(commerceItem.getAmount().add(commerceItem1.getAmount()));
	    		
	    		session.getCurrentSession().update(commerceItem);
	    		 
	    	}
	    	  
    	}
    	
	    return true;
	}
	
    public List<Product> list() {
        return session.getCurrentSession().createQuery("from Product").list();
    }
    
    public List<CommerceItem> listCommerce() {
        return session.getCurrentSession().createQuery("from CommerceItem").list();
    }
    
    public boolean delete(CommerceItem commerceItem) {
        try {
            session.getCurrentSession().delete(commerceItem);
        } catch (Exception ex) {
            return false;
        }
 
        return true;
    }
    
    public boolean delete_all() {
        try {
        	session.getCurrentSession().createQuery("delete from CommerceItem").executeUpdate();
        } catch (Exception ex) {
            return false;
        }
 
        return true;
    }
 
}
