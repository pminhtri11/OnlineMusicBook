package com.spring.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.Login;
import com.spring.model.Payment;
import com.spring.model.Product;
import com.spring.model.Cart;
import com.spring.model.User;
import com.spring.service.ProductService;
import com.spring.service.UserService;

@Controller
@SessionAttributes("User")
public class CustomerController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
									//Mapping to the Page		
	@RequestMapping(value="/newproduct", method=RequestMethod.GET)
	public String userForm(Product product) {
		return "newproduct";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp(User user) {
		return "signUp";
	}
	
	@RequestMapping(value="/loginWithProduct", method=RequestMethod.GET)
	public String login(Model model, @RequestParam int productid) {
		model.addAttribute("login", new Login());
		model.addAttribute("productID", productid);
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("login", new Login());
		return "login";
	}
	
	@RequestMapping(value="checkout", method=RequestMethod.GET)
	public String checkout(Model model, @RequestParam int userid) {
		model.addAttribute("payment", new Payment());
		List<Cart> cartview= userService.checkoutCart(userid);
		model.addAttribute("cartview", cartview);
		model.addAttribute("userid", userid);
		return "checkout";
	}
	
	@RequestMapping(value="purchasehistory", method=RequestMethod.GET)
	public String purchasehistory(Model model, @RequestParam int userid) {
		List<Cart> cartview= userService.purchasehistory(userid);
		model.addAttribute("cartview", cartview);
		model.addAttribute("userid", userid);
		return "purchasehistory";
	}
	
	@RequestMapping(value="adminpage", method=RequestMethod.GET)
	public String adminpage(Model model) {		
		List<Product> list = productService.listofMostPopularProduct();
		List<Product> list1 = productService.fetchlowQuantityProduct();
		List<Payment> list2 = userService.recentOrder();
		model.addAttribute("product", list);
		model.addAttribute("low", list1);
		model.addAttribute("recentorder", list2);
		return "adminPage";
	}
										//Post Mapping
	@RequestMapping(value="searching", method=RequestMethod.POST)
	public String searching( @RequestParam("id") String search, Model model) {
		System.out.println(search);
		List<Product> products = productService.searchProduct(search);
		System.out.println(products);		
		model.addAttribute("productList", products);
		return "category";
	}
	
	@PostMapping("/saveUser")
	public ModelAndView saveUser(@ModelAttribute(name="user") User user) {
		userService.addUser(user);
		ModelAndView model = new ModelAndView("redirect:/");
		return model;
	}
	
	// Saved Product 
	@PostMapping("/saveProduct")
	public ModelAndView saveProduct(@ModelAttribute (name = "product") Product product) {
		productService.addProduct(product);
		ModelAndView model = new ModelAndView("redirect:/");
		return model;
	}
	
	@PostMapping("/editProduct")
	public ModelAndView updateProduct(@ModelAttribute (name = "product") Product product) {
		productService.updateSave(product);;
		ModelAndView model = new ModelAndView("redirect:/");
		return model;
	}
	
	// Final CheckOut
	@PostMapping("/confirmCheckout")
	public ModelAndView confirmCheckout(@ModelAttribute (name = "payment") Payment payment) {
		userService.confirmCheckout(payment);
//		System.out.println(payment.getUserid());
		int id = payment.getUserid();
		userService.updateCart(id);
		System.out.println("Updated");
		ModelAndView model = new ModelAndView("redirect:/");
		return model;
	}
	
	// Normal Login
	@PostMapping("/checkLogin")
	public ModelAndView checkLogin(@ModelAttribute(name = "login") Login login, Model model) 
	{	
		
		User user = userService.checkLogin(login.getUsername(),login.getPassword());
		if ( user != null) {
			ModelAndView view = new ModelAndView("redirect:/");
			model.addAttribute("User", user);
			return view;
		}
		else {
			System.out.println("Fail to Sign in");
			ModelAndView view = new ModelAndView("redirect:/login");
			return view;
		}
	}	
	
	// Redirected Login From One of the Product. This way We can redirect the user back to the product Page
	@PostMapping("/checkLoginwithProduct")
	public ModelAndView checkLogin(@ModelAttribute(name = "login") Login login, Model model, @RequestParam int productID) 
	{	
		
		User user = userService.checkLogin(login.getUsername(),login.getPassword());
		if ( user != null) {
			String redirect = "product?id=" + productID;
			ModelAndView view = new ModelAndView("redirect:/" + redirect);
			model.addAttribute("User", user);
			return view;
		}
		else {
			String redirect = "/loginWithProduct?productid=" + productID;
			System.out.println("Fail to Sign in");
			ModelAndView view = new ModelAndView("redirect:/" + redirect);
			return view;
		}
	}	
	
									//Request Mapping
	// Admin Edit Page
	@RequestMapping(value= "/editProduct", method=RequestMethod.GET)
	public String adminEdit(@RequestParam int productid, Model model) {
		Product product = productService.fetchOneProduct(productid);
		List<Product> RelatedProduct = productService.fetchCategory(product.getCategory());
		model.addAttribute("product", product);
		model.addAttribute("RelatedProduct", RelatedProduct);
		return "adminProduct";		
	}
	
	// Sign Out
	@RequestMapping(value= "/logout", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, SessionStatus session, Model model){
	    session.setComplete();
	    request.getSession().invalidate();
	    ModelAndView view = new ModelAndView("redirect:/");
	    return view;
	}
	
	// Front Page Shop
	@RequestMapping(value= "/", method=RequestMethod.GET)
	public String getProduct(Model model)
	{
		model.addAttribute("productList", productService.fetchProduct());
//		System.out.println(model);
		return "index";
	}
	
	// Viewing Shop Category
	@RequestMapping(value= "/category", method=RequestMethod.GET)
	public String getCategory(@RequestParam String name, Model model)
	{
		List<Product> product = productService.fetchCategory(name);
		model.addAttribute("productList", product);
		model.addAttribute("category", name);
		model.addAttribute("found", product.size());
		return "category";
	}
	
	
	// Product Detail page
	@RequestMapping(value= "/product", method=RequestMethod.GET)
	public String getOneProduct(@RequestParam int id, Model model) {
		Product product = productService.fetchOneProduct(id);
		List<Product> RelatedProduct = productService.fetchCategory(product.getCategory());
		model.addAttribute("product", product);
		model.addAttribute("RelatedProduct", RelatedProduct);
		return "detail";		
	}
	
	// Adding to our Cart
	@RequestMapping(value = "/add", method=RequestMethod.GET)
	public ModelAndView save(Model model, @RequestParam int productid,
										  @RequestParam int userid,
										  @RequestParam String currentPage,
										  @RequestParam String name,
										  @RequestParam String picture,
										  @RequestParam int price)
	{
		Cart cart = new Cart ();
		cart.setBookID(productid);
		cart.setUserID(userid);
		cart.setStatus(1);
		cart.setAmount(1);
		cart.setName(name);
		cart.setPicture(picture);
		cart.setPrice(price);
		userService.addCart(cart);
		String redirect = "/category?name=" + currentPage;
		ModelAndView view = new ModelAndView("redirect:/"+ redirect);
		return view;
	}
	
	//Check Out Cart
	@RequestMapping(value = "cart", method=RequestMethod.GET)
	public String cart(Model model,@RequestParam int userid) {
		List<Cart> cartview= userService.checkoutCart(userid);
		model.addAttribute("cartview", cartview);
		model.addAttribute("userid", userid);
//		System.out.println(model);
		return "shoppingcart";
	}
	
	//Remove from Cart
	@RequestMapping(value = "removefromcart", method=RequestMethod.GET)
	public ModelAndView removecart(ModelAndView model,@RequestParam int id,
			@RequestParam int userid) {
		if (userService.removeCart(id)) {
			System.out.println("remove successfully");
			ModelAndView view = new ModelAndView("redirect:/cart?userid=" + userid);
			return view;
		}else {
			System.out.println("Unable to remove");
			ModelAndView view = new ModelAndView("redirect:/cart?userid=" + userid);
			return view;
		}
	}
		
	
}
