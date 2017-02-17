package com.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entities.CommerceItem;
import com.entities.Product;
import com.services.ProductService;


@Controller
@RequestMapping("/")

public class ProductController {
	
	@Autowired
	ProductService productServices;
	//CommerceItemService commerceItemServices;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getPage() {
        ModelAndView view = new ModelAndView("products");
        return view;
    }
 
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> getAll(Product product) {
        Map<String, Object> map = new HashMap<String, Object>();
 
        List<Product> list = productServices.list();
        
        if (list != null) {
            map.put("status", "200");
            map.put("message", "Data found");
            map.put("data", list);
        } else {
            map.put("status", "404");
            map.put("message", "Data not found");
        }
        //System.out.println(list.get(0).getId());
        return map;
    }
    
    @RequestMapping(value = "/listCommerce", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> getAll(CommerceItem commerceItem) {
        Map<String, Object> map = new HashMap<String, Object>();
 
        List<CommerceItem> list = productServices.listCommerce();
        
        if (list != null) {
            map.put("status", "200");
            map.put("message", "Data found");
            map.put("data", list);
        } else {
            map.put("status", "404");
            map.put("message", "Data not found");
 
        }
        //System.out.println(list.get(0).getId());
        return map;
    }
    
    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> getSaved(CommerceItem commerceItem) {
        Map<String, Object> map = new HashMap<String, Object>();
 
        if (productServices.saveOrUpdate(commerceItem)) {
            map.put("status", "200");
            map.put("message", "Your product have been added successfully");
        }
 
        return map;
    }
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> delete(CommerceItem commerceItem) {
        Map<String, Object> map = new HashMap<String, Object>();
 
        if (productServices.delete(commerceItem)) {
            map.put("status", "200");
            map.put("message", "Your commerce item have been deleted successfully");
        }
 
        return map;
    }
    
    @RequestMapping(value = "/delete_all", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> delete_all() {
        Map<String, Object> map = new HashMap<String, Object>();
 
        if (productServices.delete_all()) {
            map.put("status", "200");
            map.put("message", "Your products were deleted from the cart");
        }
 
        return map;
    }
}
