package com.srr.upvc.service;

import java.util.List;

import com.srr.upvc.entity.InvoicePayment;

public interface PaymentDetailService {

	public List<InvoicePayment> getInvoicePaymentByFK(Long inoviceId);
	public List<InvoicePayment> getPaymentsByOrderId(Long orderId);
	public InvoicePayment saveInvoicePayment(InvoicePayment payment);
	public InvoicePayment getInvoicePaymentById(Long paymentId);
	public void deleteInvoicePaymentById(Long paymentId);
}
