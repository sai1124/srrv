package com.srr.upvc.entity;

import java.util.List;

public class InvoiceDetailsDto {

	private InvoiceInfo invoice;
	
	private CustomerOrder order;
	
	private List<InvoiceItem> items;
	
	private List<InvoicePayment> payments;

	public InvoiceInfo getInvoice() {
		return invoice;
	}

	public void setInvoice(InvoiceInfo invoice) {
		this.invoice = invoice;
	}

	public List<InvoiceItem> getItems() {
		return items;
	}

	public void setItems(List<InvoiceItem> items) {
		this.items = items;
	}

	public List<InvoicePayment> getPayments() {
		return payments;
	}

	public void setPayments(List<InvoicePayment> payments) {
		this.payments = payments;
	}

	public CustomerOrder getOrder() {
		return order;
	}

	public void setOrder(CustomerOrder order) {
		this.order = order;
	}
	
}
