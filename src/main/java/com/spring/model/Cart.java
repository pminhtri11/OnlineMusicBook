package com.spring.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Cart")
public class Cart{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	private int id;
	
	@Column(name = "User_ID")
	private int userID;
	
	@Column(name = "Book_ID")
	private int bookID;
	
	@Column(name="Amount_Order")
	private int amount;
	
	@Column(name = "Checkout")
	private int status;

	@Column(name = "ProductName")
	private String name;
	
	@Column(name = "ProductPicture")
	private String picture;
	
	@Column(name = "ProductPrice")
	private int price;
	
	@Column(name = "PurchaseDate")
	private String purchaseDate;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", userID=" + userID + ", bookID=" + bookID + ", amount=" + amount + ", status="
				+ status + ", name=" + name + ", picture=" + picture + ", price=" + price + ", purchaseDate="
				+ purchaseDate + "]";
	}


	
}
