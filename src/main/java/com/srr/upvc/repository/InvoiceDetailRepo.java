package com.srr.upvc.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import com.srr.upvc.entity.InvoiceInfo;

public interface InvoiceDetailRepo extends JpaRepository<InvoiceInfo, Long> {

	public List<InvoiceInfo> findByOrderId(Long Id);

	@Procedure(procedureName = "updateGSTOut", outputParameterName = "par_out")
	public String updateGST(@Param("invoiceId") Long invoiceId);

	@Query(value = "SELECT nextval(INV_SEQ)", nativeQuery = true)
	Long getNextSeriesId();

	@Query(value="SELECT INV.*, CO.CUSTOMER_NAME,CO.CUSTOMER_NUMBER,CO.GST_NUMBER, MONTH(INV.INVOICE_DATE) AS NUM_MONTH,MONTHNAME(INV.INVOICE_DATE) AS MONTH_NAME FROM INVOICE_INFO INV INNER JOIN CUSTOMER_ORDER_INFO CO ON CO.ORDER_ID=INV.ORDER_ID WHERE INV.INVOICE_DATE BETWEEN  STR_TO_DATE(:invStartDate, '%d/%m/%Y') and  STR_TO_DATE(:invEndDate, '%d/%m/%Y') AND CO.STATUS NOT IN ('ORDER_NOT_REQUIRED') ORDER BY INV.INVOICE_ID ASC ", nativeQuery=true)
	List<Map<String,Object>> findInvoiceByDateRange(@Param("invStartDate") String invStartDate,@Param("invEndDate") String invEndDate);

	@Query(value="SELECT T.* FROM (SELECT  MONTH(INV.INVOICE_DATE)+(YEAR(INV.INVOICE_DATE)*10) AS NUM_MONTH_YEAR,concat(MONTHNAME(INV.INVOICE_DATE), '-' ,EXTRACT(YEAR FROM INV.INVOICE_DATE)) AS MONTH_NAME ,SUM(INV.TOTAL_AMOUNT) AS MONTH_TOTAL_AMOUNT FROM INVOICE_INFO INV INNER JOIN CUSTOMER_ORDER_INFO CO ON CO.ORDER_ID=INV.ORDER_ID WHERE INV.INVOICE_DATE BETWEEN STR_TO_DATE(:invStartDate, '%d/%m/%Y') and  STR_TO_DATE(:invEndDate, '%d/%m/%Y') AND CO.STATUS NOT IN ('ORDER_NOT_REQUIRED') GROUP BY MONTH_NAME,NUM_MONTH_YEAR	UNION SELECT  99999 AS NUM_MONTH_YEAR,'Total' AS MONTH_NAME ,SUM(INV.TOTAL_AMOUNT) AS MONTH_TOTAL_AMOUNT FROM INVOICE_INFO INV INNER JOIN CUSTOMER_ORDER_INFO CO ON CO.ORDER_ID=INV.ORDER_ID WHERE INV.INVOICE_DATE BETWEEN STR_TO_DATE(:invStartDate, '%d/%m/%Y') and  STR_TO_DATE(:invEndDate, '%d/%m/%Y') AND CO.STATUS NOT IN ('ORDER_NOT_REQUIRED') GROUP BY MONTH_NAME,NUM_MONTH_YEAR) T ORDER BY NUM_MONTH_YEAR ASC	", nativeQuery=true)
	List<Map<String,Object>> findInvoiceTotalsByDateRange(@Param("invStartDate") String invStartDate,@Param("invEndDate") String invEndDate);
}
