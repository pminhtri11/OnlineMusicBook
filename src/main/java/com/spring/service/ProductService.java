package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.model.Cart;
import com.spring.model.Product;

public interface ProductService {
	public void addProduct(Product product);
	public void updateSave(Product product);
	public List<Product> fetchProduct();
	public List<Product> searchProduct(String search);
	public List<Product> fetchCategory(String category);
	public List<Product> fetchlowQuantityProduct();
	public Product fetchOneProduct(int ID);
	public List<Product> listofMostPopularProduct();
}
