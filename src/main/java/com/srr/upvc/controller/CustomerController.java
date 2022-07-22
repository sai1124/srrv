package com.srr.upvc.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.srr.upvc.config.ResponseCode;
import com.srr.upvc.dto.CustomerOrderDto;
import com.srr.upvc.dto.PaymentDto;
import com.srr.upvc.entity.CustomerOrder;
import com.srr.upvc.entity.InvoicePayment;
import com.srr.upvc.response.AppEntity;
import com.srr.upvc.service.CustomerOrderDetailService;
import com.srr.upvc.service.PaymentDetailService;

@RestController
@RequestMapping(path = "/customer")
public class CustomerController {


	@Autowired
	private CustomerOrderDetailService customerOrderDetailService;
	
	@Autowired
	private PaymentDetailService paymentDetailService;
	
	@PostMapping("/create/order")
	public AppEntity<CustomerOrderDto> createCustomerOrder(@RequestBody CustomerOrderDto req) {
		AppEntity<CustomerOrderDto> res = new AppEntity<CustomerOrderDto>();
		res.setStatus(ResponseCode.FAILURE);
		ArrayList<CustomerOrderDto> records = new ArrayList<CustomerOrderDto>(); 
		PaymentDto pay = new PaymentDto();
		pay.setAmount(req.getAdvanceAmount());
		pay.setPaymentType(req.getPaymentType());
		pay.setUserName(req.getCreatedBy()); 
		req.setAdvanceAmount(0.0);
		CustomerOrder order = customerOrderDetailService.createNewCustomerOrder(req, false); 
		pay.setOrderId(order.getOrderId());
		CustomerOrderDto output = customerOrderDetailService.convertEntityToDTO(order);
		savePayment(pay);
		records.add(output);
		res.setRecords(records); 
		res.setStatus(ResponseCode.SUCCESS);
		return res;
	}
	

	@PostMapping("/copy/order")
	public AppEntity<CustomerOrderDto> copyCustomerOrder(@RequestBody CustomerOrderDto input) {
		AppEntity<CustomerOrderDto> res = new AppEntity<CustomerOrderDto>();
		res.setStatus(ResponseCode.FAILURE);
		ArrayList<CustomerOrderDto> records = new ArrayList<CustomerOrderDto>(); 
		CustomerOrderDto req = customerOrderDetailService.convertEntityToDTO(customerOrderDetailService.findCustomerOrderbyId(input.getOrderId()));
		req.setAdvanceAmount(0.0);
		req.setAmountReceived(0.0);
		req.setBalanceAmount(0.0);
		req.setOrderAmount(0.0);
		req.setOrderId(null);		
		
		req.setStatus("NO_INVOICE_GENERATED");

		req.setCreatedBy(input.getCreatedBy());
		req.setInvoiceId(null);
		req.setInvoiceNum("");
		req.setInvoiceAmount(0.0);
		req.setInvoiceDate("");
		CustomerOrder order = customerOrderDetailService.createNewCustomerOrder(req, false);  
		CustomerOrderDto output = customerOrderDetailService.convertEntityToDTO(order); 
		records.add(output);
		res.setRecords(records); 
		res.setStatus(ResponseCode.SUCCESS);
		return res;
	}

	public void savePayment(PaymentDto req) { 
			InvoicePayment rec = new InvoicePayment();
			 
			rec.setOrderId(req.getOrderId());
			rec.setCreatedBy(req.getUserName());
			rec.setCreatedOn(new Date());
			rec.setDate(new Date()); 
			rec.setPaymentType(req.getPaymentType());
			rec.setReference("Adavance Amount");
			rec.setAmount(req.getAmount()); 
			paymentDetailService.saveInvoicePayment(rec); 
	}
	
	
	@PostMapping("/order/update")
	public AppEntity<CustomerOrderDto> findCustomerOrder(@RequestBody CustomerOrderDto req) {
		AppEntity<CustomerOrderDto> res = new AppEntity<CustomerOrderDto>();
		res.setStatus(ResponseCode.FAILURE);
		ArrayList<CustomerOrderDto> records = new ArrayList<CustomerOrderDto>(); 
		CustomerOrder order = customerOrderDetailService.createNewCustomerOrder(req, true);   
		CustomerOrderDto output = customerOrderDetailService.convertEntityToDTO(order);

		records.add(output);
		res.setRecords(records); 
		res.setStatus(ResponseCode.SUCCESS);
		return res;
	}
	
	@PostMapping("/{orderId}/find")
	public AppEntity<CustomerOrderDto> findCustomerOrder(@PathVariable String orderId) {
		AppEntity<CustomerOrderDto> res = new AppEntity<CustomerOrderDto>();
		res.setStatus(ResponseCode.FAILURE);
		ArrayList<CustomerOrderDto> records = new ArrayList<CustomerOrderDto>(); 
		CustomerOrder order = customerOrderDetailService.findCustomerOrderbyId(Long.valueOf(orderId));   
		CustomerOrderDto output = customerOrderDetailService.convertEntityToDTO(order);


		records.add(output);
		res.setRecords(records); 
		res.setStatus(ResponseCode.SUCCESS);
		return res;
	}
	
}
