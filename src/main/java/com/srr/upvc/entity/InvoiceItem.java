package com.srr.upvc.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "invoice_item")
public class InvoiceItem {

	@Id
	@GeneratedValue(generator = "invoice_item_seq", strategy = GenerationType.SEQUENCE)
	@SequenceGenerator(name = "invoice_item_seq", sequenceName = "invoice_item_seq", allocationSize = 1)
	@Column(name = "item_id")
	private long itemId;
	
	private String itemDesc;
	
	private double quantity;
	
	private double price;
	
	private double total;
	
	private Long invoiceId;

	private int gstRate;
	
	private double sGstAmount;
	
	private double cGstAmount;

	private double gstRounding;
	
	@Column(precision = 2)
	private double excludingGst;
	
	private String  createdBy;
	
	private Date createdOn;
	
	private String modifiedBy;
	
	private String hsn;
	
	
	private Date modifiedOn;

	public long getItemId() {
		return itemId;
	}

	public void setItemId(long itemId) {
		this.itemId = itemId;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Long getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(Long invoiceId) {
		this.invoiceId = invoiceId;
	}

	public int getGstRate() {
		return gstRate;
	}

	public void setGstRate(int gstRate) {
		this.gstRate = gstRate;
	}

	public double getsGstAmount() {
		return sGstAmount;
	}

	public void setsGstAmount(double sGstAmount) {
		this.sGstAmount = sGstAmount;
	}

	public double getcGstAmount() {
		return cGstAmount;
	}

	public void setcGstAmount(double cGstAmount) {
		this.cGstAmount = cGstAmount;
	}

	public double getGstRounding() {
		return gstRounding;
	}

	public void setGstRounding(double gstRounding) {
		this.gstRounding = gstRounding;
	}

	public double getExcludingGst() {
		return excludingGst;
	}

	public void setExcludingGst(double excludingGst) {
		this.excludingGst = excludingGst;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
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

	public String getHsn() {
		return hsn;
	}

	public void setHsn(String hsn) {
		this.hsn = hsn;
	}	
}
