package com.srr.upvc.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "invoice_info")
public class InvoiceInfo implements Serializable {

	private static final long serialVersionUID = -2118173426342060985L;

	@Id
	@GeneratedValue(generator = "customer_invoice_seq", strategy = GenerationType.SEQUENCE)
	@SequenceGenerator(name = "customer_invoice_seq", sequenceName = "customer_invoice_seq", allocationSize = 1)
	@Column(name = "invoice_id")
	private Long invoiceId;

	@Column(name = "invoice_number")
	private String invoiceNum;

	@Column(nullable = false, name = "due_date")
	private Date dueDate;

	@Column(nullable = false, name = "invoice_date")
	private Date invoiceDate;

	@Column(name = "status")
	private String status;

	@Column(name = "total_amount", columnDefinition = "double default 0.0")
	private Double totalAmount;

	@Column(name = "advance_amount", columnDefinition = "double default 0.0")
	private Double advanceAmount;

	@Column(name = "balance", columnDefinition = "double default 0.0")
	private Double balanceAmount;

	@Column(name = "created_on")
	private Date createdOn;

	@Column(name = "created_by")
	private String createdBy;

	@Column(name = "modified_by")
	private String modifiedBy;

	@Column(name = "modified_on")
	private Date modifiedOn;

	@Column(name = "C_GST_AMT", columnDefinition = "double default 0.0")
	private Double cgst_amount;

	@Column(name = "S_GST_AMT", columnDefinition = "double default 0.0")
	private Double sgst_amount;

	@Column(name = "GST_AMT", columnDefinition = "double default 0.0")
	private Double gst_amount;

	@Column(name = "gst_rounding", columnDefinition = "double default 0.0")
	private Double gstRounding;

	@Column(name = "amount_excluding_tax", columnDefinition = "double default 0.0")
	private Double amountExcludingTax;

	private String transMode;

	private String transNumber;

	private boolean manual;

	@Column(name = "order_id")
	private Long orderId;

	@Column(name = "seq_Id")
	@GeneratedValue(generator = "inv_seq", strategy = GenerationType.SEQUENCE)
	@SequenceGenerator(name = "inv_seq", sequenceName = "inv_seq", allocationSize = 1)
	private Long seqId;

	public Long getSeqId() {
		return seqId;
	}

	public void setSeqId(Long seqId) {
		this.seqId = seqId;
	}

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

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
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

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
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

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
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

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
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

}
