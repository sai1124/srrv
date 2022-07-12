package com.srr.upvc.dto;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import com.srr.upvc.entity.Customer;

public class CustomerDto {

	private Long id;

	@NotNull(message = "Customer Name should not be empty")
	@NotEmpty(message = "Customer Name should not be empty")
	private String name;

	@NotNull(message = "Customer Name should not be empty")
	@NotEmpty(message = "Customer Name should not be empty")
	private String address;

	private Date orderDate;
 
	@Pattern(regexp = "^\\d{10}$",message="Customer Phone number should only be 10 digits")
	private String contactNumber;

	@Email(message = "Customer Email should be vaild")
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
	
	public Customer prepareEntity() {
		
		Customer cust =  new Customer();
		cust.setAddress(this.address);
		cust.setName(this.name);
		cust.setId(this.id);
		cust.setContactNumber(this.contactNumber);
		cust.setEmail(this.email);
		return cust;
	}

}
