package com.srr.upvc.service;

import java.util.List;
import java.util.Map;

import javax.persistence.Entity;

import com.srr.upvc.dto.CustomerOrderDto;
import com.srr.upvc.entity.CustomerOrder;

public interface CustomerOrderDetailService {
 
	public CustomerOrder saveByEntity(CustomerOrder req);
	
	public CustomerOrder updateCustomerOrder(CustomerOrderDto req);
	
	public CustomerOrderDto convertEntityToDTO(CustomerOrder req);
	
	public CustomerOrder convertDtoToEntity(CustomerOrderDto req);
	
	public List<CustomerOrder> findCustomerOrders(CustomerOrderDto req);
	 
	public CustomerOrder createNewCustomerOrder(CustomerOrderDto req,boolean isModify);
	
	public CustomerOrder findCustomerOrderbyId(Long orderId);

	public List<Map<String, Object>> fetchTurnOver(String orderStartDate,String orderEndDate);
}
