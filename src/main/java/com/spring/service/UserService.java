package com.spring.service;

import java.util.List;


import com.spring.model.Cart;
import com.spring.model.Payment;
import com.spring.model.User;

public interface UserService {
	public void addUser(User user);
	public void addCart(Cart cart);
	public void updateCart(int id);
	public void confirmCheckout(Payment payment);
	public List<Payment> recentOrder();
	public User checkLogin (String username, String password);
	public List<Cart> purchasehistory(int id);
	public List<Cart> checkoutCart(int id);
	public boolean removeCart(int id);
}
