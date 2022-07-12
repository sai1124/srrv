package com.srr.upvc.service;

import java.util.List;

import com.srr.upvc.dto.InvoiceInfoDto;
import com.srr.upvc.entity.InvoiceInfo;

public interface InvoiceDetailService {

	public InvoiceInfo getInvoiceById(Long Id);

	public List<InvoiceInfo> getInvoiceByOrderId(Long Id);

	public InvoiceInfo SaveInvoiceDetails(InvoiceInfo obj);
	
	public void updateGST(Long Id);

	public List<InvoiceInfo> findAllByPredictor();

	public InvoiceInfoDto convertEntityToDTO(InvoiceInfo req);

	public InvoiceInfo convertDtoToEntity(InvoiceInfoDto req);
}
