package com.spring.DAO;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Payment;
import com.spring.model.Product;
import com.spring.model.Cart;
import com.spring.model.User;

@Repository("UserDAO")
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void save(User user) {
		getSession().save(user);
	}
	
	@Override
	public void confirmCheckout(Payment payment) {

		getSession().save(payment);		
	}
	
	@Override
	public User checkLogin(String username, String password) {
		System.out.println("In Check login");
//		System.out.println(username);
//		System.out.println(password);
		Session session = sessionFactory.openSession();
		User user = null;
		String HQL ="from User where username= :username and password= :password";
		Query query = session.createQuery(HQL,User.class);
		query.setParameter("username", username);
		query.setParameter("password", password);
		List<User> list = query.getResultList();
//		System.out.println(list);
		if (list != null && list.size() == 1) {
			System.out.println("Found user");
			user = list.get(0);
		}
//		System.out.println(user);
		session.close();
		return user;           
	}

	@Override
	public void addCart(Cart cart) {
		getSession().save(cart);
	}
	
	@Override
	public void updateCart(int userID) {
		Format f = new SimpleDateFormat("MM/dd/yy");
	    String strDate = f.format(new Date());
	    System.out.println("Current Date = "+strDate);
		Session session = sessionFactory.openSession();		
		Criteria crit = session.createCriteria(Cart.class);
        crit.add(Restrictions.like("userID", userID));
        ScrollableResults items = crit.scroll();
        int count=0;
        while ( items.next() ) {
            Cart e = (Cart)items.get(0);
            int productAmount = e.getAmount();
            int productID = e.getBookID();
//            System.out.println(productID);
        	Criteria crit1 = session.createCriteria(Product.class);
    		crit1.add(Restrictions.like("id", productID));
    		List<Product> list = crit1.list();
//    		System.out.println(list);
    		Product product = list.get(0);
    		int current = product.getQuantity();
    		product.setQuantity(current - productAmount);    				
            
            e.setStatus(2);
            e.setPurchaseDate(strDate);
            session.saveOrUpdate(product);    
            session.saveOrUpdate(e);
            if ( ++count % 100 == 0 ) {
            	session.flush();
            	session.clear();
            }
        }
		session.beginTransaction().commit();
		session.close();
		
		// Update Quantify of Product Class
//		Session session = sessionFactory.openSession();	
//		Criteria crit1 = session.createCriteria(Product.class);
//		crit.add(Restrictions.like("id", id));
//		List<Product> list = crit.list();
//		Product product = list.get(0);
//		int current = product.getQuantity();
//		product.setQuantity(current - amount);
//		session.saveOrUpdate(product);
//		session.beginTransaction().commit();
//		session.close();	
	}
	
	@Override
	public List<Cart> checkoutCart(int id) {
		Criteria cr = getSession().createCriteria(Cart.class);
		cr.add(Restrictions.like("status", 1));
		cr.add(Restrictions.like("userID", id));
		List <Cart> list = cr.list();
		getSession().flush();
		return list;		
	}

	@Override
	public boolean removeCart(int id) {
		Session session = sessionFactory.openSession();
		Cart mycart = null;
		mycart = (Cart) session.load(Cart.class, id);
		session.delete(mycart);
		session.beginTransaction().commit();
		return true;
	}

	@Override
	public List<Cart> purchaseHistory(int id) {
		Criteria cr = getSession().createCriteria(Cart.class);
		cr.add(Restrictions.like("status", 2));
		cr.add(Restrictions.like("userID", id));
		List <Cart> list = cr.list();
		getSession().flush();
		return list;	
	}

	@Override
	public List<Payment> recentOrder() {
		Criteria criteria = getSession().createCriteria(Payment.class);
		criteria.addOrder(Order.desc("id")).setMaxResults(5);		
		List<Payment> popular= criteria.list();
		return popular;
	}


//	@Override
//	public List<Cart> checkoutCart(int id) {
//		Session session = sessionFactory.openSession();
//		String HQL = "select p.picture, p.price, p.name, s.amount from Product p, Save s, User u "
//				+ "where p.id = s.bookID and u.id= :id";
//		Query query = session.createSQLQuery(HQL);
//		query.setParameter("id", id);
//		String HQL = "select p.picture as \"picture\", p.price as \"price\", p.name as \"name\", s.amount_order as \"amount\" from Product p join saveandcheckout s on p.product_id = s.book_ID join useraccount u on s.user_id = u.user_id where u.user_id ="+ id;
//		Map<String,Cart> cart = (Map<String, Cart>) ((SQLQuery) session.createSQLQuery(HQL)
//				.setResultTransformer(Transformers.aliasToBean(Cart.class)))
//			    .addScalar("ID", new LongType())
//			    .addScalar("NAME", new StringType())
//				.list();
//		
//		String HQL = "select new com.spring.model.Cart(u.user_id, p.name, p.price, s.amount_order, p.picture) FROM Product p join saveandcheckout s on p.product_id = s.book_ID join useraccount u on s.user_id = u.user_id where u.user_id =" + id;
//		List<Cart> cart = session.createSQLQuery(HQL).setResultTransformer(Transformers.aliasToBean(Cart.class)).list();
		
//		String HQL = "select * from saveandcheckout where user_id = " + id;		
//		Query query = session.createQuery(HQL);
//		List <Cart> cart= query.getResultList();
		
//		System.out.println(session.createSQLQuery(HQL).getResultList());
//		List<Cart> p = null;
//		return p;
//	}

}
