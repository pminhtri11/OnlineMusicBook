package com.spring.model;

import java.io.Serializable;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Payment")
public class Payment implements Serializable{

	private static final long serialVersionUID = -4962894736401348899L;
	static Format f = new SimpleDateFormat("MM/dd/yy");
	static String strDate = f.format(new Date());
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private int userid;
	
	private String cardName;
	
	private int cardNumber;
	
	private int cardCVV;
	
	private String cardExpirationDate;	
	
	private String checkoutDate = strDate;
	
	private String address;
	
	private String city;
	
	private String state;
	
	private int zip;
	
	private String note;
	
	private double total;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public int getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(int cardNumber) {
		this.cardNumber = cardNumber;
	}

	public int getCardCVV() {
		return cardCVV;
	}

	public void setCardCVV(int cardCVV) {
		this.cardCVV = cardCVV;
	}

	public String getCardExpirationDate() {
		return cardExpirationDate;
	}

	public void setCardExpirationDate(String cardExpirationDate) {
		this.cardExpirationDate = cardExpirationDate;
	}
	
	public String getCheckoutDate() {
		return checkoutDate;
	}

	public void setCheckoutDate(String checkoutDate) {
		this.checkoutDate = checkoutDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getZip() {
		return zip;
	}

	public void setZip(int zip) {
		this.zip = zip;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Payment [id=" + id + ", userid=" + userid + ", cardName=" + cardName + ", cardNumber=" + cardNumber
				+ ", cardCVV=" + cardCVV + ", cardExpirationDate=" + cardExpirationDate + ", checkoutDate="
				+ checkoutDate + ", address=" + address + ", city=" + city + ", state=" + state + ", zip=" + zip
				+ ", note=" + note + ", total=" + total + "]";
	}

}
