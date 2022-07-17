package com.srr.upvc.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TurnOverDto {

	private Double orderAmount;

	private String monthYear;// MONTH_YEAR

	private String numMonthYear;// NUM_MONTH_YEAR

	public Double getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(Double orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getMonthYear() {
		return monthYear;
	}

	public void setMonthYear(String monthYear) {
		this.monthYear = monthYear;
	}

	public String getNumMonthYear() {
		return numMonthYear;
	}

	public void setNumMonthYear(String numMonthYear) {
		this.numMonthYear = numMonthYear;
	}
}
