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

	@Query(value="SELECT INV.*, CO.CUSTOMER_NAME,CO.CUSTOMER_NUMBER,CO.GST_NUMBER, MONTH(ORDER_DATE) AS NUM_MONTH,MONTHNAME(INV.INVOICE_DATE) AS MONTH_NAME FROM INVOICE_INFO INV INNER JOIN CUSTOMER_ORDER_INFO CO ON CO.ORDER_ID=INV.ORDER_ID WHERE INV.INVOICE_DATE BETWEEN  STR_TO_DATE(:invStartDate, '%d/%m/%Y') and  STR_TO_DATE(:invEndDate, '%d/%m/%Y') AND CO.STATUS NOT IN ('NO_INVOICE_REQUIRED') ORDER BY INV.INVOICE_ID ASC ", nativeQuery=true)
	List<Map<String,Object>> findInvoiceByDateRange(@Param("invStartDate") String invStartDate,@Param("invEndDate") String invEndDate);

	@Query(value="SELECT  SUM(INV.AMOUNT_EXCLUDING_TAX) AS amount_excluding_tax ,SUM(INV.C_GST_AMT) AS c_gst_amt ,SUM(INV.S_GST_AMT) AS s_gst_amt ,SUM(INV.GST_AMT) AS gst_amt ,SUM(INV.GST_ROUNDING) AS gst_rounding ,SUM(INV.TOTAL_AMOUNT) AS total_amount,MONTHNAME(INV.INVOICE_DATE) AS MONTH_NAME FROM INVOICE_INFO INV INNER JOIN CUSTOMER_ORDER_INFO CO ON CO.ORDER_ID=INV.ORDER_ID WHERE INV.INVOICE_DATE BETWEEN STR_TO_DATE(:invStartDate, '%d/%m/%Y') and  STR_TO_DATE(:invEndDate, '%d/%m/%Y') AND CO.STATUS NOT IN ('NO_INVOICE_REQUIRED') GROUP BY MONTH_NAME", nativeQuery=true)
	List<Map<String,Object>> findInvoiceTotalsByDateRange(@Param("invStartDate") String invStartDate,@Param("invEndDate") String invEndDate);
}
