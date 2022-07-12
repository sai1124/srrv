package com.srr.upvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.srr.upvc.entity.InvoiceItem;

@Repository
public interface InvoiceItemRepo extends JpaRepository<InvoiceItem, Long> {
	 
	public List<InvoiceItem> findByInvoiceId(Long invoiceId);
	  
	
}
