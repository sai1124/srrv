package com.srr.upvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.srr.upvc.entity.CustomerOrder;
import com.srr.upvc.entity.InvoicePayment;
import com.srr.upvc.repository.CustomerOrderRepo;
import com.srr.upvc.repository.PaymentDetailRepo;
import com.srr.upvc.service.PaymentDetailService;

@Service
public class PaymentDetailServiceImpl implements PaymentDetailService {

	@Autowired
	private PaymentDetailRepo paymentDetailRepo;
	
	@Autowired
	private CustomerOrderRepo customerOrderRepo;
	
	 
	
	@Override
	public List<InvoicePayment> getInvoicePaymentByFK(Long inoviceId) {
		// TODO Auto-generated method stub
		return paymentDetailRepo.findByInvoiceId(inoviceId);
	}

	@Override
	public InvoicePayment saveInvoicePayment(InvoicePayment payment) {
		InvoicePayment rec = paymentDetailRepo.save(payment);
		double total = paymentDetailRepo.fetchOrderAmountRecieved(rec.getOrderId());
		CustomerOrder order =  customerOrderRepo.findById(rec.getOrderId()).get();
		order.setAmountReceived(total);
		double balance = 0;
		if(order.getOrderAmount() != null) {
			balance = order.getOrderAmount();
		}
		if(order.getAmountReceived() != null) {
			balance = balance - order.getAmountReceived();
		}
		order.setBalanceAmount(balance);
		customerOrderRepo.save(order);
		return rec;
	}

	public void updateOrderData(InvoicePayment rec) {
		double total = paymentDetailRepo.fetchOrderAmountRecieved(rec.getOrderId());
		CustomerOrder order =  customerOrderRepo.findById(rec.getOrderId()).get();
		order.setAmountReceived(total);
		order.setBalanceAmount(order.getOrderAmount()-order.getAdvanceAmount()-order.getAmountReceived());
		customerOrderRepo.save(order);
	}
	@Override
	public InvoicePayment getInvoicePaymentById(Long paymentId) {
		// TODO Auto-generated method stub
		return paymentDetailRepo.findById(paymentId).orElse(null);
	}

	@Override
	public void deleteInvoicePaymentById(Long paymentId) {
		// TODO Auto-generated method stub
		///validation 
		InvoicePayment rec = paymentDetailRepo.findById(paymentId).get();
		
		 paymentDetailRepo.deleteById(paymentId);
		 updateOrderData(rec);
		 
	}

	@Override
	public List<InvoicePayment> getPaymentsByOrderId(Long orderId) {
		// TODO Auto-generated method stub
		return paymentDetailRepo.findByOrderId(orderId);
	}

}
