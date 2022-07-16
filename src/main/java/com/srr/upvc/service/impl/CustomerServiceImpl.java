package com.srr.upvc.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.srr.upvc.dto.CustomerDto;
import com.srr.upvc.entity.Customer;
import com.srr.upvc.repository.CustomerRepo;
import com.srr.upvc.service.CustomerService;


public class CustomerServiceImpl implements CustomerService {

	@Autowired
	public CustomerRepo customerRepo;

	public String AddCustomer(CustomerDto customer) {
		String status;
		Optional<Customer> customer2 =  customerRepo.findByContactNumber(customer.getContactNumber());
		if(customer2.isPresent()) {
			status = "Customer with given phone already exist";
		}else {
			//customerRepo.save(customer.prepareEntity());
			status = "Added Successfuly";
		}
		
		return status;
	}

	@Override
	public List<Customer> searchCustomer(CustomerDto customer) {
	 List<Customer> custList = 	customerRepo.findByNameContainingOrAddressContainingOrContactNumberContaining(customer.getName(),customer.getAddress(),customer.getContactNumber());
	 
		return custList;
	}

	@Override
	public String UpdateCustomer(CustomerDto customer) {
		String status;
		// Optional<Customer> records =  null;//customerRepo.findById(customer.getId());
		// if(records != null &&records.isPresent()) {
		// 	status = "Updated Successfuly";
		// }else {
		// 	status = "Customer not found created a new entry";
		// }
		
		//customerRepo.save(customer.prepareEntity());
		status = "Customer not found created a new entry";
		return status;
	}
	
}
