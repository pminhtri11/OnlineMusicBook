package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.DAO.ProductDAO;
import com.spring.model.Cart;
//import com.spring.model.CustomerModel;
import com.spring.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDao;

	@Override
	@Transactional
	public void addProduct(Product product) {
		productDao.save(product);
	}
	
	@Override
	@Transactional
	public void updateSave(Product product) {
		productDao.updateSave(product);
	}

	@Override
	@Transactional
	public List<Product> fetchProduct() {
		return productDao.fetchProduct();
	}

	@Override
	@Transactional
	public List<Product> searchProduct(String search) {
		// TODO Auto-generated method stub
		return productDao.searchProduct(search);
	}
	
	@Override
	@Transactional
	public List<Product> fetchCategory(String category) {
		return productDao.fetchCategory(category);
	}

	@Override
	@Transactional 
	public Product fetchOneProduct(int ID) {
		// TODO Auto-generated method stub
		return productDao.fetchOneProduct(ID);
	}

	@Override
	@Transactional
	public List<Product> listofMostPopularProduct() {		
		return productDao.listofMostPopularProduct();
	}

	@Override
	@Transactional
	public List<Product> fetchlowQuantityProduct() {
		return productDao.fetchlowQuantityProduct();
	}


}
