package com.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LoginTable")
public class Login implements Serializable{
	private static final long serialVersionUID = -7272512504560626231L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "Login_ID")
	private int id;
	
	@Column(name = "Login_username")
	private String username;
	
	@Column(name = "Login_password")
	private String password;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}	
	
}
