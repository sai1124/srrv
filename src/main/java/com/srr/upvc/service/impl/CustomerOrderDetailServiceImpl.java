package com.srr.upvc.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.srr.upvc.dto.CustomerOrderDto;
import com.srr.upvc.dto.TurnOverDto;
import com.srr.upvc.entity.CustomerOrder;
//import com.srr.upvc.entity.InvoiceInfo;
import com.srr.upvc.repository.CustomerOrderRepo;
import com.srr.upvc.repository.InvoiceDetailRepo;
import com.srr.upvc.service.CustomerOrderDetailService;
import com.srr.upvc.utils.AppUtils;

@Service
public class CustomerOrderDetailServiceImpl implements CustomerOrderDetailService {

	@Autowired
	public CustomerOrderRepo customerOrderRepo;

	@Autowired
	public InvoiceDetailRepo invoiceDetailRepo;
	
	@Autowired
	public EntityManager em;

 	public CustomerOrder updateCustomerOrder(CustomerOrderDto req) {
		CustomerOrder CustomerOrder = convertDtoToEntity(req);

		return customerOrderRepo.save(CustomerOrder);

	}

	public CustomerOrder convertDtoToEntity(CustomerOrderDto req) {
		CustomerOrder record = new CustomerOrder();
		record.setOrderId(req.getOrderId());
		record.setContactNumber(req.getContactNumber());
		record.setCustomerAddress(req.getCustomerAddress());
		record.setCustomerName(req.getCustomerName());
		record.setCreatedBy(req.getCreatedBy());
		record.setEmail(req.getEmail());
		record.setOrderDate(AppUtils.convertDate(req.getOrderDate()));
		record.setDueDate(AppUtils.convertDate(req.getDueDate()));
		record.setOrderNum(req.getOrderNum());
		record.setAdvanceAmount(req.getAdvanceAmount());
		record.setOrderAmount(req.getOrderAmount());
		record.setBalanceAmount(req.getBalanceAmount());
		record.setAmountReceived(req.getAmountReceived());

		record.setCreatedBy(req.getCreatedBy());

		record.setStatus(req.getStatus());
		record.setModifiedBy(req.getModifiedBy());
		record.setInvoiceId(req.getInvoiceId());
		record.setInvoiceAmount(req.getInvoiceAmount()); 
		record.setInvoiceNum(req.getInvoiceNum());
		if (req.getModifiedOn() != null && !req.getModifiedOn().isEmpty())
			record.setModifiedOn(AppUtils.convertDate(req.getModifiedOn()));
		record.setPaymentType(req.getPaymentType());
		return record;
	}

	public CustomerOrderDto convertEntityToDTO(CustomerOrder req) {
		CustomerOrderDto record = new CustomerOrderDto();
		record.setOrderId(req.getOrderId());
		record.setContactNumber(req.getContactNumber());
		record.setCustomerAddress(req.getCustomerAddress());
		record.setCustomerName(req.getCustomerName());
		record.setCreatedBy(req.getCreatedBy());
		record.setEmail(req.getEmail());
		record.setOrderDate(AppUtils.covertDateToString(req.getOrderDate()));
		record.setDueDate(AppUtils.covertDateToString(req.getDueDate()));
		record.setOrderNum(req.getOrderNum());
		record.setAdvanceAmount(req.getAdvanceAmount());
		record.setBalanceAmount(req.getBalanceAmount());
		record.setOrderAmount(req.getOrderAmount());
		record.setPaymentType(req.getPaymentType());
		record.setCreatedBy(req.getCreatedBy());
		record.setStatus(req.getStatus());
		record.setModifiedBy(req.getModifiedBy());
		record.setInvoiceAmount(req.getInvoiceAmount());
		record.setInvoiceId(req.getInvoiceId());
		record.setAmountReceived(req.getAmountReceived());
		if ((req.getModifiedOn() != null))
			record.setModifiedOn(AppUtils.covertDateToString(req.getModifiedOn()));

		return record;
	}

	 

	public CustomerOrder saveByEntity(CustomerOrder req) {
		// TODO Auto-generated method stub
		return customerOrderRepo.save(req);
	}

	public List<CustomerOrder> findCustomerOrders(CustomerOrderDto req) {

		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<CustomerOrder> cq = cb.createQuery(CustomerOrder.class);
		Root<CustomerOrder> root = cq.from(CustomerOrder.class);
		List<Predicate> predicates = new ArrayList<>();
		 
		if (req.getContactNumber() != null && !req.getContactNumber().isEmpty()) {
			predicates.add(cb.like(root.get("contactNumber"), req.getContactNumber()));
		}
		if (req.getCustomerName() != null && !req.getCustomerName().isEmpty()) {
			predicates.add(cb.like(root.get("customerName"), req.getCustomerName()));
		}

		if (req.getOrderNum() != null) {
			predicates.add(cb.like(root.get("orderNum"), "%"+req.getOrderNum()+"%"));
		}
		
		
		if (req.getStatus() != null && !req.getStatus().isEmpty()) {
			predicates.add(cb.equal(root.get("status"), req.getStatus()));
		}
		if (req.getOrderStartDate() != null && req.getOrderEndDate() != null) {

			predicates.add(cb.between(root.get("orderDate"), AppUtils.convertDate(req.getOrderStartDate())
					, AppUtils.convertDate(req.getOrderEndDate())));
		}
		/*
		 * if (req.getDueStartDate() != null && req.getDueEndDate() != null) {
		 * 
		 * predicates.add(cb.between(root.get("CustomerOrderDate"),
		 * AppUtils.convertDate(req.getDueStartDate()) ,
		 * AppUtils.convertDate(req.getDueEndDate()))); }
		 * 
		 */		 
		cq.where(predicates.toArray(new Predicate[0]));

		return em.createQuery(cq).getResultList();
	}

	public CustomerOrder createNewCustomerOrder(CustomerOrderDto req,boolean isModify) {

		CustomerOrder customerOrder = convertDtoToEntity(req);
	//	customerOrder.setBalanceAmount(customerOrder.getOrderAmount()-customerOrder.getAmountReceived());
		if(!isModify) {
			String orderNum=req.getOrderDate().replaceAll("/", "");
			customerOrder.setCreatedOn(new Date());
			customerOrder = customerOrderRepo.save(customerOrder);	
			customerOrder.setOrderNum(orderNum+"-"+String.valueOf(customerOrder.getOrderId()));
			//generateInitInvoice(customerOrder);
			
		}		
		return customerOrderRepo.save(customerOrder);
	}

	 
	// private void generateInitInvoice(CustomerOrder order) {
	// 	 InvoiceInfo inv = new InvoiceInfo();
	// 	 inv.setTotalAmount(order.getOrderAmount());
	// 	 inv.setAdvanceAmount(order.getAdvanceAmount());
	// 	 inv.setBalanceAmount(order.getBalanceAmount());
	// 	 inv.setCgst_amount(0.0);
	// 	 inv.setSgst_amount(0.0);
	// 	 inv.setGst_amount(0.0);
	// 	 inv.setInvoiceDate(order.getOrderDate());
	// 	 inv.setDueDate(order.getDueDate());
	// 	 inv.setCreatedOn(new Date());
	// 	 inv.setStatus("NEW");
	// 	 inv.setOrderId(order.getOrderId());
	// 	 inv.setCreatedBy(order.getCreatedBy());
	// 	 inv.setCreatedOn(new Date());
	// 	 inv = invoiceDetailRepo.save(inv);	
	// 	 inv.setInvoiceNum("INV-"+order.getOrderNum().split("-")[0]+"-"+String.valueOf(inv.getInvoiceId()));
		 
	// 	 invoiceDetailRepo.save(inv);	
	// }

	public CustomerOrder findCustomerOrderbyId(Long orderId) {
		Optional<CustomerOrder> customerOrder = customerOrderRepo.findById(orderId);
		if(customerOrder.isPresent()) {
			return customerOrder.get();	
		}
		else {
			return null;
		}
	}

	@Override
	public List<Map<String, Object>> fetchTurnOver(String orderStartDate, String orderEndDate) {
		return customerOrderRepo.findSumByDateRange(orderStartDate, orderEndDate);
	}

}
