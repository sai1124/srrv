package com.srr.upvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.srr.upvc.entity.InvoicePayment;

public interface PaymentDetailRepo extends JpaRepository<InvoicePayment, Long>{

	public List<InvoicePayment> findByInvoiceId(Long inoviceId);
	public List<InvoicePayment> findByOrderId(Long orderId);
	
	@Query(value = "select sum(amount) from InvoicePayment where orderId=?1")
	public Double fetchOrderAmountRecieved(@Param("orderId") Long orderId);
	
	@Query(value = "select sum(amount) from InvoicePayment where invoiceId=?1")
	public Double fetchInvoiceAmountRecieved(@Param("invoiceId") Long invoiceId);
	
}
