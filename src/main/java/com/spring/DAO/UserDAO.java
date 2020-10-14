package com.spring.DAO;

import java.util.List;

import com.spring.model.Product;
import com.spring.model.Cart;
import com.spring.model.Payment;
import com.spring.model.User;

public interface UserDAO {
	public void save(User user);	
	public User checkLogin (String username, String password);
	public void addCart(Cart cart);
	public void updateCart(int id);
	public boolean removeCart(int id);
	public void confirmCheckout(Payment payment);
	public List<Cart> checkoutCart(int id);
	public List<Cart> purchaseHistory(int id);
	public List<Payment> recentOrder();
}
