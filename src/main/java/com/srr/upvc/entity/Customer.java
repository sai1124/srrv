package com.srr.upvc.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;


public class Customer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5426703969970097716L;
	
	@Id
	@GeneratedValue(generator = "cust_seq", strategy = GenerationType.SEQUENCE)
	@SequenceGenerator(name = "cust_seq", sequenceName = "cust_seq")
	private Long id;
	
	@Column(nullable = false,name = "name")
	private String name;
	
	private String address;
	
	private Date orderDate;
	
	@Column(nullable = false,name = "customer_number",unique = true,updatable = false,length = 10)
	private String contactNumber;
	
	private String email;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	} 

}
