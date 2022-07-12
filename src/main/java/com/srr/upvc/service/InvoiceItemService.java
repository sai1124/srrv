package com.srr.upvc.service;

import java.util.List;

import com.srr.upvc.entity.InvoiceItem;

public interface InvoiceItemService {
	public List<InvoiceItem> fetchAllInvoiceByInvId(Long invoiceId);
	
	public InvoiceItem fetchById(Long id);
	
	public InvoiceItem saveItem(InvoiceItem item);
	
	public void deleteById(Long id);
}
