package com.srr.upvc.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.srr.upvc.config.ResponseCode;
import com.srr.upvc.dto.CustomerDto;
import com.srr.upvc.dto.CustomerOrderDto;
import com.srr.upvc.dto.InvoiceInfoDto;
import com.srr.upvc.dto.ItemDto;
import com.srr.upvc.dto.PaymentDto;
import com.srr.upvc.entity.Customer;
import com.srr.upvc.entity.CustomerOrder;
import com.srr.upvc.entity.InvoiceDetailsDto;
import com.srr.upvc.entity.InvoiceInfo;
import com.srr.upvc.entity.InvoiceItem;
import com.srr.upvc.entity.InvoicePayment;
import com.srr.upvc.entity.User;
import com.srr.upvc.exception.Error;
import com.srr.upvc.repository.UserRepository;
import com.srr.upvc.response.AppEntity;
import com.srr.upvc.service.CustomerOrderDetailService;
import com.srr.upvc.service.InvoiceDetailService;
import com.srr.upvc.service.InvoiceItemService;
import com.srr.upvc.service.PaymentDetailService;
import com.srr.upvc.utils.AppUtils; 
@RestController
@RequestMapping(path = "/post")
public class RestPostController {
	Logger logger = LoggerFactory.getLogger(RestPostController.class);

//	@Autowired
//	private CustomerService customerService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CustomerOrderDetailService customerOrderDetailService;
	
	@Autowired
	private InvoiceDetailService invoiceDetailService;
	
	@Autowired
	private InvoiceItemService invoiceItemService;
	
	@Autowired
	private PaymentDetailService paymentDetailService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	  	
	//private static DecimalFormat df2 = new DecimalFormat("#.##");
	/* @PreAuthorize("hasAnyRole('ADMIN')") */
	@PostMapping("/admin/add")
	public String addUserByAdmin(@RequestBody User user) {
		String pwd = user.getPassword();
		String encryptPwd = passwordEncoder.encode(pwd);
		user.setPassword(encryptPwd);
		userRepository.save(user);
		return "user added successfully...";
	}

	@PostMapping("/getAllUsers")
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}
	
	@PostMapping("/find/invoice")
	public AppEntity<InvoiceDetailsDto> findOrder(@RequestBody InvoiceInfo item) {
		AppEntity<InvoiceDetailsDto> res = new AppEntity<InvoiceDetailsDto>();
		ArrayList<InvoiceDetailsDto> records = new ArrayList<InvoiceDetailsDto>();
		InvoiceDetailsDto record = new InvoiceDetailsDto();
		 record.setOrder(customerOrderDetailService.findCustomerOrderbyId(item.getOrderId()));
		 record.setInvoice(invoiceDetailService.getInvoiceById(item.getInvoiceId())); 
		 record.setItems(invoiceItemService.fetchAllInvoiceByInvId(item.getInvoiceId())); 
		 record.setPayments(paymentDetailService.getInvoicePaymentByFK(item.getInvoiceId())); 
		 records.add(record);
		res.setRecords(records); 
		res.setStatus(ResponseCode.SUCCESS);
		return res;
	}

	@PostMapping("/save/invoice")
	public AppEntity<InvoiceInfo> saveInvoice(@RequestBody InvoiceInfoDto item) {
		AppEntity<InvoiceInfo> res = new AppEntity<InvoiceInfo>();
		res.setStatus(ResponseCode.FAILURE); 
		
		InvoiceInfo record =  invoiceDetailService.convertDtoToEntity(item);
		CustomerOrder order = customerOrderDetailService.findCustomerOrderbyId(item.getOrderId());
		String invNum = item.getInvoiceNum();
			if(record.getInvoiceNum() == null) {
				   int year = Calendar.getInstance().get(Calendar.YEAR);

				    int month = Calendar.getInstance().get(Calendar.MONTH) + 1;
				    
				    if (month < 3) {
				    	invNum =  (year - 1) + "-" + year;
				    } else {
				    	invNum =  year + "-" + (year + 1);
				    }				  
			}
			
			  
			record = invoiceDetailService.SaveInvoiceDetails(record);
			if(record.getInvoiceNum()==null) {
				record.setInvoiceNum(record.getInvoiceId()+"/"+invNum);
				record = invoiceDetailService.SaveInvoiceDetails(record);
			}
			order.setInvoiceId(record.getInvoiceId());
			order.setInvoiceNum(record.getInvoiceNum());
			order.setInvoiceAmount(record.getTotalAmount());
			order.setStatus("INVOICE_GENERATED");
			customerOrderDetailService.saveByEntity(order);
			invoiceDetailService.updateGST(record.getInvoiceId());
			res.setStatus(ResponseCode.SUCCESS);
		
		return res;
	}
	
	@PostMapping("/customer/add")
	public AppEntity<CustomerDto> addCusomer(@Valid @RequestBody CustomerDto customer, Errors errors) {
		AppEntity<CustomerDto> res = new AppEntity<CustomerDto>();
		res.setStatus(ResponseCode.FAILURE);
		if (errors.hasErrors()) {
			String responseStr = "";
			List<FieldError> errorList = errors.getFieldErrors();
			List<Error> errorRecords = new ArrayList<Error>();
			for (FieldError fieldError : errorList) {
				Error error = new Error();
				error.setField(fieldError.getField());
				error.setMessage(fieldError.getDefaultMessage());
				System.out.println("error message");
				System.out.println(fieldError.getField());
				System.out.println(fieldError.getDefaultMessage());
				errorRecords.add(error);
				responseStr += fieldError.getDefaultMessage() + ",";
			}
			res.setErrors(errorRecords);
			res.setMessage(responseStr);
		} else {
			//res.setMessage(customerService.AddCustomer(customer));
			res.setStatus(ResponseCode.SUCCESS);
		}

		return res;
	}

	@PostMapping("/customer/search")
	public AppEntity<Customer> searchCusomer(@RequestBody CustomerDto customer) {
		AppEntity<Customer> res = new AppEntity<Customer>();
		res.setStatus(ResponseCode.FAILURE);

		//res.setRecords(customerService.searchCustomer(customer));
		res.setStatus(ResponseCode.SUCCESS);

		return res;
	}
	
	@PostMapping("/fetch/inv")
	public AppEntity<InvoiceInfo> fetchInvoice(@RequestBody CustomerOrderDto rec) {
		AppEntity<InvoiceInfo> res = new AppEntity<InvoiceInfo>();
		res.setStatus(ResponseCode.FAILURE);
		CustomerOrder order= customerOrderDetailService.findCustomerOrderbyId(rec.getOrderId());
		
		List<InvoiceInfo> invoiceInfos =invoiceDetailService.getInvoiceByOrderId(rec.getOrderId()); 
		if(invoiceInfos == null ||invoiceInfos.size() == 0) { 
			InvoiceInfo inv = new InvoiceInfo();
			 inv.setTotalAmount(order.getOrderAmount());
			 inv.setAdvanceAmount(order.getAdvanceAmount());
			 inv.setBalanceAmount(order.getBalanceAmount());
			 inv.setCgst_amount(0.0);
			 inv.setSgst_amount(0.0);
			 inv.setGst_amount(0.0); 
			 inv.setGstRounding(0.0);
			 inv.setAmountExcludingTax(0.0);
			 inv.setInvoiceDate(order.getOrderDate());
			 inv.setDueDate(order.getDueDate());
			 inv.setStatus("NEW");
			 inv.setOrderId(order.getOrderId()); 
			 invoiceInfos = new  ArrayList<InvoiceInfo>();
			 invoiceInfos.add(inv);
		}
		res.setRecords(invoiceInfos);
		res.setStatus(ResponseCode.SUCCESS);
		return res;
	}
	
	@PostMapping("/add/items")
	public AppEntity<ItemDto> addItems(@RequestBody ItemDto req) {
		AppEntity<ItemDto> res = new AppEntity<ItemDto>();
		res.setMessage(ResponseCode.FAILURE); 
			InvoiceItem item = null;
			
			if(req.getItemId() !=null) {
				item =invoiceItemService.fetchById(req.getItemId());
				item.setModifiedBy(req.getUserName());
				item.setModifiedOn(new Date());
			}else {
				item = new InvoiceItem(); 
				item.setCreatedBy(req.getUserName());
				item.setCreatedOn(new Date());
			}
			item.setItemDesc(req.getItemDesc());
			item.setPrice(req.getPrice());
			item.setQuantity(req.getQuantity());
			item.setTotal(req.getTotal());
			item.setHsn(req.getHsn());
			item.setInvoiceId(req.getInvoiceId());
			  
			invoiceItemService.saveItem(item);
			res.setMessage(ResponseCode.SUCCESS); 
		return res;
	}
	
	@PostMapping("/fetchAll/items")
	public AppEntity<InvoiceItem> fetchItems(@RequestBody ItemDto req) {
		AppEntity<InvoiceItem> res = new AppEntity<InvoiceItem>();
		res.setMessage(ResponseCode.FAILURE); 
		List<InvoiceItem> records = null;
			if(req.getInvoiceId() !=null) {
				records = invoiceItemService.fetchAllInvoiceByInvId(req.getInvoiceId());
				res.setRecords(records);
			} 
			res.setMessage(ResponseCode.SUCCESS); 
		return res;
	}
	
	public void updateInvTotal(List<InvoiceItem> records,long invoiceId) {
		// double total= 0;
		// if(records != null) {

		// 	for (InvoiceItem invoiceItem : records) {
		// 		total += invoiceItem.getTotal();
		// 	}
			
		// }
	}
	@PostMapping("/delete/item/{itemId}")
	public AppEntity<InvoiceItem> deleteItem(@PathVariable Long itemId) {
		AppEntity<InvoiceItem> res = new AppEntity<InvoiceItem>();
		res.setMessage(ResponseCode.FAILURE);  
			if(itemId !=null) {
				invoiceItemService.deleteById(itemId);
			} 
			res.setMessage(ResponseCode.SUCCESS); 
		return res;
	}
	
	@PostMapping("/save/payment")
	public AppEntity<InvoicePayment> savePayment(@RequestBody PaymentDto req) {
		AppEntity<InvoicePayment> res = new AppEntity<InvoicePayment>();
		res.setMessage(ResponseCode.FAILURE); 
			InvoicePayment rec = null;
			
			if(req.getPaymentId() != null) {
				rec =paymentDetailService.getInvoicePaymentById(req.getPaymentId());
				rec.setModifiedBy(req.getUserName());
				rec.setModifiedOn(new Date());
			}else {
				rec = new InvoicePayment();
				rec.setInvoiceId(req.getInvoiceId());
				rec.setOrderId(req.getOrderId());
				rec.setCreatedBy(req.getUserName());
				rec.setCreatedOn(new Date());
				rec.setDate(new Date());
			}
			rec.setPaymentType(req.getPaymentType());
			rec.setReference(req.getReference());
			rec.setAmount(req.getAmount()); 
			rec.setDate(AppUtils.convertDate(req.getDate()));
			paymentDetailService.saveInvoicePayment(rec); 
			res.setMessage(ResponseCode.SUCCESS); 
		return res;
	}
	
	@PostMapping("/fetchAll/payments")
	public AppEntity<InvoicePayment> fetchPayments(@RequestBody PaymentDto req) {
		AppEntity<InvoicePayment> res = new AppEntity<InvoicePayment>();
		res.setMessage(ResponseCode.FAILURE);  
			if(req.getInvoiceId() != null) {
				res.setRecords(paymentDetailService.getInvoicePaymentByFK(req.getInvoiceId()));
			}
			if(req.getOrderId() != null) {
				res.setRecords(paymentDetailService.getPaymentsByOrderId(req.getOrderId()));
			}
			res.setMessage(ResponseCode.SUCCESS); 
		return res;
	}
	
	@PostMapping("/delete/payment/{paymentId}")
	public AppEntity<InvoicePayment> deletePayment(@PathVariable Long paymentId) {
		AppEntity<InvoicePayment> res = new AppEntity<InvoicePayment>();
		res.setMessage(ResponseCode.FAILURE);  
			if(paymentId !=null) {
				paymentDetailService.deleteInvoicePaymentById(paymentId);
			} 
			res.setMessage(ResponseCode.SUCCESS); 
		return res;
	}

	@PostMapping("/find/Order")
	public AppEntity<CustomerOrder> findOrder(@RequestBody CustomerOrderDto req, HttpServletRequest request) {
		AppEntity<CustomerOrder> res = new AppEntity<CustomerOrder>();
		res.setStatus(ResponseCode.FAILURE);
		
		List<CustomerOrder> invoiceInfos =customerOrderDetailService.findCustomerOrders(req);
		if(invoiceInfos != null && invoiceInfos.size() > 0) { 
			res.setRecords(invoiceInfos);
		}
		res.setStatus(ResponseCode.SUCCESS);
		return res;
	}

	@PostMapping("/find/turnOver")
	public AppEntity<Map<String,Object>> findTurnOver(@RequestBody CustomerOrderDto req, HttpServletRequest request) {
		AppEntity<Map<String, Object>> res = new AppEntity<Map<String, Object>>();
		res.setStatus(ResponseCode.FAILURE);
		res.setRecords(customerOrderDetailService.fetchTurnOver(req.getOrderStartDate(), req.getOrderEndDate()));
		res.setStatus(ResponseCode.SUCCESS);
		return res;
	}
}
