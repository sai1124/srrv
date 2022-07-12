package com.srr.upvc.service;

import java.util.List;

import com.srr.upvc.dto.CustomerDto;
import com.srr.upvc.entity.Customer;

public interface CustomerService {

	public String AddCustomer(CustomerDto customer);
	public List<Customer> searchCustomer(CustomerDto customer);
	
	public String UpdateCustomer(CustomerDto customer);
}
