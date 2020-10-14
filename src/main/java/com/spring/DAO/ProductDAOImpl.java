package com.spring.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaQuery;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Cart;
import com.spring.model.Product;

@Repository("ProductDAO")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void save(Product product) {
		getSession().save(product);
	}
	
	@Override
	public void updateSave(Product product) {
		getSession().saveOrUpdate(product);		
	}
	
	@Override
	public List<Product> fetchProduct() {
		CriteriaQuery<Product> criteria = getSession().getCriteriaBuilder().
				createQuery(Product.class);
		criteria.select(criteria.from(Product.class));		
		return getSession().createQuery(criteria).getResultList();		
	}
	
	@Override
	public List<Product> searchProduct(String search) {
		Criteria query = getSession().createCriteria(Product.class);
		query.add(Restrictions.like("name", "%" + search + "%"));
		return query.list();
	}


	@Override
	public List<Product> fetchCategory(String category) {
		Criteria criteria = getSession().createCriteria(Product.class);
		criteria.add(Restrictions.like("category", category));
		List<Product> list = criteria.list();
		return list;
	}
	

	@Override
	public Product fetchOneProduct(int ID) {
		// TODO Auto-generated method stub
		System.out.println("Getting One Product Data");
		System.out.println("ID: " + ID);
		Session session = sessionFactory.openSession();
		Product product = null;
		String HQL ="from Product where id = :id";
		Query query = session.createQuery(HQL,Product.class);
		query.setParameter("id", ID);
		List<Product> list = query.getResultList();
//		System.out.println(query.getResultList());
		if (list != null && list.size() == 1) {
			System.out.println("Found product");
			product = list.get(0);
		}
		return product;
	}

	@Override
	public List<Product> listofMostPopularProduct() {
		Criteria criteria = getSession().createCriteria(Cart.class)
				.setProjection(Projections.projectionList()
			    .add(Projections.groupProperty("bookID"))
			    .add(Projections.rowCount(), "rCount"))
				.addOrder(org.hibernate.criterion.Order.desc("rCount")) 
				.setMaxResults(3);
		
		List<Product> popular= new ArrayList<Product>();
		
		for (Object o : criteria.list()) {
			Object [] row = (Object []) o;
			System.out.println(row[0]);
			System.out.println(row[1]);
			Criteria criteria1 = getSession().createCriteria(Product.class);
			criteria1.add(Restrictions.like("id", row[0]));	
			popular.add((Product) criteria1.list().get(0));
		}
		return popular;
	}

	@Override
	public List<Product> fetchlowQuantityProduct() {
		Criteria criteria = getSession().createCriteria(Product.class)
				.add(Restrictions.lt("quantity", 5));
		List<Product> list = criteria.list();
		return list;
	}


}
