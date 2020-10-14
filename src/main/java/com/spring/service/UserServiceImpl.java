package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.DAO.UserDAO;
import com.spring.model.Cart;
import com.spring.model.Payment;
import com.spring.model.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDao;
	
	@Override
	@Transactional
	public void addUser(User user) {
		userDao.save(user);
	}

	
	@Override
	@Transactional
	public User checkLogin(String username, String password) {
		System.out.println("In Service class...Check Login");
        return userDao.checkLogin(username, password);
	}

	@Override
	@Transactional
	public void addCart(Cart cart) {
		userDao.addCart(cart);
		System.out.println("save to cart successul");
	}
	
	@Override
	@Transactional
	public void updateCart(int id) {
		// TODO Auto-generated method stub
		userDao.updateCart(id);
	}	

	@Override
	@Transactional
	public List<Cart> checkoutCart(int id) {
		return userDao.checkoutCart(id);
	}


	@Override
	@Transactional
	public boolean removeCart(int id) {
		return userDao.removeCart(id);
	}


	@Override
	@Transactional
	public void confirmCheckout(Payment payment) {
		userDao.confirmCheckout(payment);		
	}


	@Override
	@Transactional
	public List<Cart> purchasehistory(int id) {
		return userDao.purchaseHistory(id);
	}


	@Override
	@Transactional
	public List<Payment> recentOrder() {
		return userDao.recentOrder();
	}



	
//	@Override
//	@Transactional
//	public List<Cart> checkoutCart(int id){
//		return userDao.checkoutCart(id);
//	}
}
