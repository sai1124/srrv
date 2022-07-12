package com.srr.upvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.srr.upvc.entity.InvoiceItem;
import com.srr.upvc.repository.InvoiceItemRepo;
import com.srr.upvc.service.InvoiceItemService;

@Service
public class InvoiceItemServiceImpl implements InvoiceItemService {

	@Autowired
	public InvoiceItemRepo invoiceItemRepo;
	
	@Override
	public List<InvoiceItem> fetchAllInvoiceByInvId(Long invoiceId) {
		// TODO Auto-generated method stub
		return invoiceItemRepo.findByInvoiceId(invoiceId);
	}

	@Override
	public InvoiceItem saveItem(InvoiceItem item) {
		// TODO Auto-generated method stub
		return invoiceItemRepo.save(item);
	}

	@Override
	public InvoiceItem fetchById(Long id) {
		// TODO Auto-generated method stub
		return invoiceItemRepo.findById(id).orElse(null);
	}

	@Override
	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		invoiceItemRepo.deleteById(id);
	}

}
