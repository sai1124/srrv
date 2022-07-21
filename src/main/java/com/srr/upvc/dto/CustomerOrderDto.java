package com.srr.upvc.dto;

public class CustomerOrderDto {

	private Long orderId;

	private String customerName;

	private String customerAddress;

	private String orderDate;

	private String orderStartDate;

	private String orderEndDate;

	private String dueDate;
	
	private String dueStartDate;

	private String dueEndDate;

	private String contactNumber;

	private String orderNum;

	private String status;

	private Double orderAmount;

	private Double advanceAmount;

	private Double balanceAmount;

	private String paymentType;

	private String email;

	private String createdBy;

	private String modifiedBy;

	private String modifiedOn;
	
	private Long invoiceId;
	
	private Double invoiceAmount;

	private String invoiceNum;

	private String gstNumber;
	
	private String lastDateRange;
	
	private String invoiceDate;
	
	public  CustomerOrderDto() {

	}
	public CustomerOrderDto(Long orderId, String customerName, String  contactNumber, String  orderDate, String  dueDate, Double  orderAmount, Double  balanceAmount, Long  invoiceId, String   invoiceDate, String  invoiceNum, Double  totalAmount,String status) {
		this.orderId = orderId;
		this.customerName =customerName;
		this.contactNumber =contactNumber;
		this.invoiceAmount =totalAmount;
		this.invoiceNum = invoiceNum;
		this.orderDate =  orderDate;
		this.dueDate =  dueDate;
		this.orderAmount = orderAmount;
		this.balanceAmount =balanceAmount;
		this.invoiceId = invoiceId;
		this.invoiceNum = invoiceNum;
		this.invoiceAmount = totalAmount;
		this.invoiceDate=invoiceDate;
		this.status = status;
	}


	
	public String getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}


	public String getLastDateRange() {
		return lastDateRange;
	}

	public void setLastDateRange(String lastDateRange) {
		this.lastDateRange = lastDateRange;
	}

	public String getGstNumber() {
		return gstNumber;
	}

	public void setGstNumber(String gstNumber) {
		this.gstNumber = gstNumber;
	}

	public String getInvoiceNum() {
		return invoiceNum;
	}

	public void setInvoiceNum(String invoiceNum) {
		this.invoiceNum = invoiceNum;
	}

	private Double amountReceived;

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStartDate() {
		return orderStartDate;
	}

	public void setOrderStartDate(String orderStartDate) {
		this.orderStartDate = orderStartDate;
	}

	public String getOrderEndDate() {
		return orderEndDate;
	}

	public void setOrderEndDate(String orderEndDate) {
		this.orderEndDate = orderEndDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getDueStartDate() {
		return dueStartDate;
	}

	public void setDueStartDate(String dueStartDate) {
		this.dueStartDate = dueStartDate;
	}

	public String getDueEndDate() {
		return dueEndDate;
	}

	public void setDueEndDate(String dueEndDate) {
		this.dueEndDate = dueEndDate;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Double getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(Double orderAmount) {
		this.orderAmount = orderAmount;
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

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(String modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public Long getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(Long invoiceId) {
		this.invoiceId = invoiceId;
	}

	public Double getInvoiceAmount() {
		return invoiceAmount;
	}

	public void setInvoiceAmount(Double invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}

	public Double getAmountReceived() {
		return amountReceived;
	}

	public void setAmountReceived(Double amountReceived) {
		this.amountReceived = amountReceived;
	}
	
 
}
