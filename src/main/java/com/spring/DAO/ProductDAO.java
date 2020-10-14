package com.spring.DAO;

import java.util.List;

import com.spring.model.Product;

public interface ProductDAO {
	public void save(Product product);	
	public void updateSave(Product product);
	public List<Product> fetchProduct();
	public List<Product> searchProduct(String search);
	public List<Product> fetchCategory(String category);
	public List<Product> fetchlowQuantityProduct();
	public Product fetchOneProduct(int ID);
	public List<Product> listofMostPopularProduct();
}
