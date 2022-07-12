package com.srr.upvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.srr.upvc.entity.CustomerOrder;

public interface CustomerOrderRepo extends JpaRepository<CustomerOrder, Long>{
	 
	//List<Order> findByCustomerNameContainingAndContactNumberAndOrderId(@Param("contactNumber") String customerName, @Param("contactNumber") String contactNumber, @Param("orderId") Long orderId);

}
