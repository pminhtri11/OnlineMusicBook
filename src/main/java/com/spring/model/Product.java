package com.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "Product_ID")
	private int id;	
	
	@Column(name = "Name", unique =true)
	private String name;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name = "Public_Date")
	private String publicDate;
	
	@Column(name = "Picture")
	private String picture;
	
	@Column(name = "Category")
	private String category;
	
	@Column(name = "Author")
	private String author;
	
	@Column(name = "Price")
	private int price;
	
	@Column(name = "Quantity")
	private int quantity;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPublicDate() {
		return publicDate;
	}

	public void setPublicDate(String publicDate) {
		this.publicDate = publicDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
 
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", publicDate=" + publicDate + ", picture=" + picture
				+ ", category=" + category + ", author=" + author + ", price=" + price + ", quantity=" + quantity + "]";
	}
	
}
