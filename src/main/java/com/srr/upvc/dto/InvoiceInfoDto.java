package com.srr.upvc.dto;

public class InvoiceInfoDto {  
	 
	private Long invoiceId;
 
	private String invoiceNum;
  
	private String dueDate;
	 
	private String invoiceDate; 
	
	private String status;
 
	private Double totalAmount;
 
	private Double advanceAmount;
 
	private Double balanceAmount;
  
	private String createdBy;
 
	private String modifiedBy;  
	
	private Double cgst_amount;
	 
	private Double sgst_amount; 
	
	private Double gst_amount;

	private Double gstRounding;

	private Double amountExcludingTax;
	
	private String transMode;
	
	private String transNumber;
	
	private boolean manual;
	
	private Long orderId;

	public Long getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(Long invoiceId) {
		this.invoiceId = invoiceId;
	}

	public String getInvoiceNum() {
		return invoiceNum;
	}

	public void setInvoiceNum(String invoiceNum) {
		this.invoiceNum = invoiceNum;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Double getAdvanceAmount() {
		return advanceAmount;
	}

	public void setAdvanceAmount(Double advanceAmount) {
		this.advanceAmount = advanceAmount;
	}

	public Double getBalanceAmount() {
		return balanceAmount;
	}

	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Double getCgst_amount() {
		return cgst_amount;
	}

	public void setCgst_amount(Double cgst_amount) {
		this.cgst_amount = cgst_amount;
	}

	public Double getSgst_amount() {
		return sgst_amount;
	}

	public void setSgst_amount(Double sgst_amount) {
		this.sgst_amount = sgst_amount;
	}

	public Double getGst_amount() {
		return gst_amount;
	}

	public void setGst_amount(Double gst_amount) {
		this.gst_amount = gst_amount;
	}

	public Double getGstRounding() {
		return gstRounding;
	}

	public void setGstRounding(Double gstRounding) {
		this.gstRounding = gstRounding;
	}

	public Double getAmountExcludingTax() {
		return amountExcludingTax;
	}

	public void setAmountExcludingTax(Double amountExcludingTax) {
		this.amountExcludingTax = amountExcludingTax;
	}

	public String getTransMode() {
		return transMode;
	}

	public void setTransMode(String transMode) {
		this.transMode = transMode;
	}

	public String getTransNumber() {
		return transNumber;
	}

	public void setTransNumber(String transNumber) {
		this.transNumber = transNumber;
	}

	public boolean isManual() {
		return manual;
	}

	public void setManual(boolean manual) {
		this.manual = manual;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
 
	
}
