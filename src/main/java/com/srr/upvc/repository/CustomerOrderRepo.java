package com.srr.upvc.repository;

import java.util.List;
import java.util.Map;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.srr.upvc.entity.CustomerOrder;

public interface CustomerOrderRepo extends JpaRepository<CustomerOrder, Long> {

	// List<Order>
	// findByCustomerNameContainingAndContactNumberAndOrderId(@Param("contactNumber")
	// String customerName, @Param("contactNumber") String contactNumber,
	// @Param("orderId") Long orderId);
	@Query(value="SELECT T.* FROM (SELECT  MONTH(ORDER_DATE)+(YEAR(ORDER_DATE)*10) AS NUM_MONTH_YEAR,CONCAT(MONTHNAME(ORDER_DATE),'-',YEAR(ORDER_DATE)) AS MONTH_YEAR,SUM(ORDER_AMOUNT) AS AMOUNT FROM CUSTOMER_ORDER_INFO WHERE STATUS NOT IN ('NO_INVOICE_REQUIRED') AND  ORDER_DATE BETWEEN  STR_TO_DATE(:orderStartDate, '%d/%m/%Y') and  STR_TO_DATE(:orderEndDate, '%d/%m/%Y') GROUP BY MONTH_YEAR,NUM_MONTH_YEAR UNION SELECT 99999 AS NUM_MONTH_YEAR,'Total' AS MONTH_YEAR,SUM(ORDER_AMOUNT) AS AMOUNT  FROM CUSTOMER_ORDER_INFO WHERE STATUS NOT IN ('NO_INVOICE_REQUIRED') AND ORDER_DATE BETWEEN  STR_TO_DATE(:orderStartDate, '%d/%m/%Y') and  STR_TO_DATE(:orderEndDate, '%d/%m/%Y') GROUP BY MONTH_YEAR,NUM_MONTH_YEAR) T  ORDER BY T.NUM_MONTH_YEAR ASC ", nativeQuery=true)
	List<Map<String,Object>> findSumByDateRange(@Param("orderStartDate") String orderStartDate,@Param("orderEndDate") String orderEndDate);

	
}
