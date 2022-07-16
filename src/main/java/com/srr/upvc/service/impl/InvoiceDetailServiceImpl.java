package com.srr.upvc.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.srr.upvc.dto.InvoiceInfoDto;
import com.srr.upvc.entity.InvoiceInfo;
import com.srr.upvc.repository.InvoiceDetailRepo;
import com.srr.upvc.service.InvoiceDetailService;
import com.srr.upvc.utils.AppUtils;

@Service
public class InvoiceDetailServiceImpl implements InvoiceDetailService {

	@Autowired
	public InvoiceDetailRepo invoiceDetailRepo;
	
	
	@Override
	public InvoiceInfo getInvoiceById(Long Id) {
		// TODO Auto-generated method stub
		return invoiceDetailRepo.findById(Id).orElse(null);
	}

	@Override
	public InvoiceInfo SaveInvoiceDetails(InvoiceInfo obj) {
		// TODO Auto-generated method stub
		return invoiceDetailRepo.save(obj);
	}

	@Override
	public List<InvoiceInfo> findAllByPredictor() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InvoiceInfo> getInvoiceByOrderId(Long Id) {
		// TODO Auto-generated method stub
		return invoiceDetailRepo.findByOrderId(Id);
	}

	@Override
	public InvoiceInfoDto convertEntityToDTO(InvoiceInfo req) {
		InvoiceInfo info = null;
		InvoiceInfoDto rec = new InvoiceInfoDto();
		if(req.getInvoiceId() != null) {
			info = invoiceDetailRepo.findById(req.getInvoiceId()).orElse(new InvoiceInfo());
		}else {
			info = new InvoiceInfo();
		}
		rec = convertEntityToDTO(info);
		return rec;
	}

	@Override
	public InvoiceInfo convertDtoToEntity(InvoiceInfoDto item) {
		InvoiceInfo record = null; 
		if(item.getInvoiceId() != null) {
			record = invoiceDetailRepo.findById(item.getInvoiceId()).orElse(new InvoiceInfo());
			record.setModifiedBy(item.getModifiedBy());
			record.setModifiedOn(new Date());
		}else {
			record = new InvoiceInfo();
			record.setOrderId(item.getOrderId());
			record.setInvoiceId(item.getInvoiceId());
			record.setCreatedBy(item.getModifiedBy());
			record.setCreatedOn(new Date());
		} 
		 record.setInvoiceNum(item.getInvoiceNum());
		 record.setAdvanceAmount(item.getAdvanceAmount());
		 record.setBalanceAmount(item.getBalanceAmount());
		 record.setTotalAmount(item.getTotalAmount());
		 record.setGst_amount(item.getGst_amount());
		 record.setGstRounding(item.getGstRounding());
		 record.setCgst_amount(item.getCgst_amount());
		 record.setSgst_amount(item.getSgst_amount());
		 record.setStatus(item.getStatus());
		 record.setDueDate(AppUtils.convertDate(item.getDueDate()));
		 record.setInvoiceDate(AppUtils.convertDate(item.getInvoiceDate()));
		 
		 record.setTransMode(item.getTransMode());
		 record.setTransNumber(item.getTransNumber());
		 record.setManual(item.isManual());
		return record;
	}

	@Override
	public void updateGST(Long Id) {
		invoiceDetailRepo.updateGST(Id);
	}

}
