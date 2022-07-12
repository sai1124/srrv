package com.srr.upvc.response;

import java.util.List;

import com.srr.upvc.exception.Error;


public class AppEntity<T> {

	private String message;
	
	private List<T> records;
	
	private List<Error> errors;
	
	
	private String status;

	

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<T> getRecords() {
		return records;
	}

	public void setRecords(List<T> records) {
		this.records = records;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<Error> getErrors() {
		return errors;
	}

	public void setErrors(List<Error> errors) {
		this.errors = errors;
	}
}
