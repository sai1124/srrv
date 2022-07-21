package com.srr.upvc.repository;

import java.util.List;
import java.util.Map;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.srr.upvc.entity.CustomerOrder;

public interface CustomerOrderRepo extends JpaRepository<CustomerOrder, Long> {

	// List<Order>
	// findByCustomerNameContainingAndContactNumberAndOrderId(@Param("contactNumber")
	// String customerName, @Param("contactNumber") String contactNumber,
	// @Param("orderId") Long orderId);
	@Query(value="SELECT  CONCAT(MONTH(ORDER_DATE),'-',YEAR(ORDER_DATE)) AS NUM_MONTH_YEAR,CONCAT(MONTHNAME(ORDER_DATE),'-',YEAR(ORDER_DATE)) AS MONTH_YEAR,SUM(ORDER_AMOUNT) AS AMOUNT FROM CUSTOMER_ORDER_INFO WHERE ORDER_DATE BETWEEN  STR_TO_DATE(:orderStartDate, '%d/%m/%Y') and  STR_TO_DATE(:orderEndDate, '%d/%m/%Y') GROUP BY MONTH_YEAR,NUM_MONTH_YEAR UNION SELECT 'Total' AS NUM_MONTH_YEAR,'Total' AS MONTH_YEAR,SUM(ORDER_AMOUNT) AS AMOUNT  FROM CUSTOMER_ORDER_INFO WHERE ORDER_DATE BETWEEN  STR_TO_DATE(:orderStartDate, '%d/%m/%Y') and  STR_TO_DATE(:orderEndDate, '%d/%m/%Y') GROUP BY MONTH_YEAR,NUM_MONTH_YEAR ", nativeQuery=true)
	List<Map<String,Object>> findSumByDateRange(String orderStartDate, String orderEndDate);

	
}
