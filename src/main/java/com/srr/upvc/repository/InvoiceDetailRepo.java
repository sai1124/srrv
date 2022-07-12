package com.srr.upvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import com.srr.upvc.entity.InvoiceInfo;

public interface InvoiceDetailRepo extends JpaRepository<InvoiceInfo, Long>{
 
	public List<InvoiceInfo> findByOrderId(Long Id);
	 
	@Procedure(procedureName = "updateGSTOut",outputParameterName = "par_out")
	public String updateGST(@Param("invoiceId") Long invoiceId);
}
