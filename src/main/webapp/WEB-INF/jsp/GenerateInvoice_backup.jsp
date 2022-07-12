<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invoice</title>
<jsp:directive.include file="ScriptTags.jsp" />
<style type="text/css">
.header {
	text-align: center;
	background-color: grey;
	color: white;
	font-weight: bold;
}
.row{
margin:0px !important;
}
th {
	text-align: center;
	background-color: grey;
	color: white;
	font-weight: bold;
}

thead > td{
font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;background-color:#efefef;font-weight:bold;text-align:left;padding:7px;color:#222222;
}
#mockRateDiv tr{
height:30px;
}


#mockRateDiv td{
padding:0px !important;
}
</style>
<script type="text/javascript">
	var invoiceId = "${invoiceId}";
	var orderId = "${orderId}";
	var userName = "${userName}";
</script>
</head>
<body>  
<div class="container" style="margin-top:5%">
	<table id="invoice_header" style="width: 100%;border:2px solid #0c0c0c;">
		<tr>
		<td  style="width: 20%;border-right:1px solid #0c0c0c;text-align: center;">
		<img src="images/bg-logo.jpg" style="height: 150px;width: 130px;"></img></td>
		<td  style="border-left:1px solid #0c0c0c;text-align: center;">
		<div class="row" style="text-align: center; font-size: 20px;margin:0px !important;border-bottom:1px solid #0c0c0c;">INVOICE
		</div>
		<div class="row" style="text-align: center; font-size: 20px;margin::0px !important;font: bold;font-family: Arial Black;border-bottom:1px solid #0c0c0c;" id="companyName">
 		</div>
		<div class="row" style="text-align: center; font-size: 16px;"  id="companyAddress1"></div>
		<div class="row" style="text-align: center; font-size: 16px;"  id="companyAddress2"></div>
		<div class="row" style="text-align: center; font-size: 12px;"  >
		<div class="col-md-6 col-sm-6">
			Tel NO. <span id="companyPhone" style="font: bold;font-family: Arial Black;"></span>
			<div id="companyGST" style="font-family: Arial Black;"></div>
		</div>
		<div class="col-md-6 col-sm-6">
			Email. <span id="companyEmail" style="font-family: Arial Black;"></span>
			<div id="companyState" style="font-weight:12px;font-family: Arial Black;font: "></div>
		</div>	
		</div>
		</td>
		</tr> 
		</table> 
		<table style="width: 100%;border-left:2px solid #0c0c0c;border-right :2px solid #0c0c0c;border-bottom:2px solid #0c0c0c;">
		<tr>
		<td style="border-right:1px solid #0c0c0c;width: 10%;font: bold;">
		&nbsp;&nbsp;Invocie No
		</td>
		<td id="orderInvoiceNo" style="border-right:1px solid #0c0c0c; text-align: center">
		</td>
		<td style="border-right:1px solid #0c0c0c; ">
		 &nbsp;&nbsp;Invocie Date&nbsp;&nbsp; <span id="orderInvoiceDate" style="font: bold;"></span>
		</td>
		 
		<td style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;font: bold;">
			&nbsp;&nbsp;Name
		</td>
		<td   id="customerName" colspan="2" style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;text-align: center;">
			 
		</td>
		 
		</tr>
		<tr>
		<td style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;">
		&nbsp;&nbsp;Address
		</td>
		<td id="customerAddress" colspan="2" style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;text-align: center;">
		 
		</td>
		<td style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;">
		&nbsp;&nbsp;Customer No
		</td>
		<td id="customerNumber" colspan="2" style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;text-align: center;">
		 
		</td>
		
		</tr>
		
		</table>
		
		<table style='width:100%;'>
		<thead>
		<tr  style='border:1px solid  #0c0c0c;'>
		<th style='border-right:1px solid  #0c0c0c;'>
		S No.	
		</th>
		<th style='border-right:1px solid  #0c0c0c;'>
		Description
		</th> 
		<th style='border-right:1px solid  #0c0c0c;'>
		QTY
		</th>
		<th style='border-right:1px solid  #0c0c0c;'>
		Price
		</th>
		<th style='border-right:1px solid  #0c0c0c;'>
		GST Rate
		</th>
		<th style='border-right:1px solid  #0c0c0c;'>
		CGST Amt
		</th>
		<th style='border-right:1px solid  #0c0c0c;'>
		SGST Amt
		</th>
		
		<th style='border-right:1px solid  #0c0c0c;'>
		Exc Tax Amt
		</th>
		<th style='border-right:1px solid  #0c0c0c;'>
		Inc Tax Amt
		</th>
		</tr>
		</thead>
		<tbody id="invoiceAgg">
		</tbody>
		 </table>
	
	<div style="display:none">
	<table style
	
	
	="border-collapse:collapse;width:100%;border-top:1px solid  #0c0c0c;border-left:1px solid  #0c0c0c;margin-bottom:20px">
    <thead>
      <tr>
        <td style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;background-color:#efefef;font-weight:bold;text-align:left;padding:7px;color:#222222" colspan="2">Order Details</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;text-align:left;padding:7px">
        <b>Order ID:</b><span id="orderId"></span> <br>
          <b>Date Added:</b><span id="orderDate"></span><br>
          <b>Payment Method:</b><span id="paymentType"></span><br>
          </td>
        <td style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;text-align:left;padding:7px">
        <b>E-mail:</b>  <span id="email"></span><br>
          <b>Telephone:</b> <span id="contactNumber"></span><br>
          <b>Order Status:</b> <span id="status"></span><br>
          <b>Profile Name:</b> <span id="profil_type_name">${profileType}</span><br>
          </td>
      </tr>
       <tr>
        <td style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;text-align:left;padding:7px">
          <b>No Of Windows :</b><span id="noWindow"></span> <br>
           
          </td>
        <td style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;text-align:left;padding:7px">
	       <b>No Of Doors :</b><span id="noDoors"></span> <br>	
         </td>
      </tr>
    </tbody>
  </table>
  
	 
	 
	<table id="myTable" class="display nowrap" style="width: 100%;display:none !!important">

	</table>
	
	 	 <table  id="itemTable" style="border-collapse:collapse;width:100%;border-top:1px solid  #0c0c0c;border-left:1px solid  #0c0c0c;margin-bottom:20px">
     
  </table>
  </div>
  </div>
</body>
<script type="text/javascript">
	var profileType = [];
	var orderDetail = {};
	var modelMap = {};
	var itemMap ={};  
	var order_company = ${order_company}[0];
	
	var elements = ["orderId","customerName","customerAddress","orderDate","profile_type_id","contactNumber","noWindow","noDoors","status","quotationAmount","paidAmount","balanceAmount","paymentType","email","createdBy"];
	var item_elements = ["itemId","order","width","height","glass_type_id","cost","model_rate_id","name","id","itemType","orderId"];
	var totalItems = 0;
	$(document).ready(function() {
	
		$("#companyName").html(order_company['name']);
		$("#companyAddress1").html(order_company['address1']);
		$("#companyAddress2").html(order_company['address2']);
		$("#companyPhone").html(order_company['phoneNumber']);
		$("#companyGST").html("GSTIN: " +order_company['gstNumber']);
		$("#companyEmail").html(order_company['email']);
		$("#modeOfTransprot").html(order_company['modeOfTransport']);
		$("#companyState").html("State: " + order_company['stateCode']+"("+order_company['state']+")");
	 
		var initFun =  function(){

			var inputJson = {"invoiceId":invoiceId,"orderId":orderId};
			$.ajax({
				type : "POST",
				url : "/post/find/invoice",
				data : JSON.stringify(inputJson),
				dataType : "json",
				"contentType" : "application/json",
				success : function(data) {
					if (data != null) {
						if (data.status == "SUCCESS") {
							var rec = data.records[0];
							$("#orderInvoiceNo").text(rec.invoice.invoiceNum);
							$("#orderInvoiceDate").text(defaultDateFormat(rec.invoice.invoiceDate));
							$("#customerName").text(rec.order.customerName);
							$("#customerAddress").text(rec.order.customerAddress);
							$("#customerNumber").text(rec.order.contactNumber);
							itemListDisplay(rec.items);
						}
					
					}
				},
				error : function(data) {
					 
				}
			});

		}
		initFun();
		
		

		var defaultDateFormat = function(data) {
									var curr = data.split("T")[0];
									var parsed = curr.split("-");
									return parsed[2] + "/" + parsed[1] + "/"
											+ parsed[0];
								}
		var itemListDisplay = function(order_items) {
			
			 var invoiceAgg = "";
			 var tr_row= ""; 
			 var total_items= 0;
			 var c_gst_total = 0;
			 var s_gst_total = 0;
			 var inv_total = 0;
			for(var i=0;i<order_items.length;i++){
				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
				tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>"+(i+1)+"</td>";
				tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>"+order_items[i]['itemDesc']+"</td>";
				 
				tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>"+order_items[i]['quantity']+"</td>";
				
				tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>"+formatNumber(order_items[i]['price'])+"&nbsp;&nbsp;</td>";
				tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>"+order_items[i]['gstRate']+"&nbsp;%</td>";
				tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>"+formatNumber(order_items[i]['cGstAmount'])+"&nbsp;</td>";
				tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>"+formatNumber(order_items[i]['sGstAmount'])+"&nbsp;</td>";
				tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>"+formatNumber(order_items[i]['excludingGst'])+"&nbsp;</td>";
				tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>"+formatNumber(order_items[i]['total'])+"&nbsp;&nbsp;</td>";
 
				tr_row += "</tr>"; 
				total_items = total_items+ parseInt(order_items[i]['quantity']);
				s_gst_total = s_gst_total + order_items[i]['sGstAmount'];
				c_gst_total = c_gst_total + order_items[i]['cGstAmount'];
				inv_total = inv_total + order_items[i]['total'];
			}
			tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
			tr_row += "<td  colspan='7' style='text-align:center;border-right:1px solid  #0c0c0c;'>&nbsp;</td>";
			tr_row += "</tr>"; 
			tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
			tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'>&nbsp;</td>"; 
			tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'>Totals</td>";
			tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'>"+total_items+"</td>";
			tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'>&nbsp;</td>";
			tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'>Add - CGST</td>";  
			tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;' class='cgstvalue'>&#8377; "+c_gst_total+"&nbsp;&nbsp;</td>";
			tr_row += "</tr>";

			tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
			tr_row += "<td  colspan='4' style='text-align:left;border-right:1px solid  #0c0c0c;'>Our Bank Details</td>";
			//tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'></td>";
			tr_row += "<td  rowspan='5' style='text-align:center;border-right:1px solid  #0c0c0c;'>GST As applicable</td>";
			tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'>Add - SGST</td>"; 
			tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;' class='sgstvalue'>&#8377; "+s_gst_total+"&nbsp;&nbsp;</td>";
			tr_row += "</tr>";
			tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
			tr_row += "<td  colspan='3' style='text-align:center;border-right:1px solid  #0c0c0c;'>Bank</td>";
			tr_row += "<td  style='text-align:left;border-right:1px solid  #0c0c0c;' class='companyBank'>: "+order_company['bankName']+"</td>";
			//tr_row += "<td  rowspan='4' style='text-align:center;border-right:1px solid  #0c0c0c;'>GST As applicable at 18%</td>";
			tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'>Total Tax GST</td>";
		 
			tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;' class='gstvalue'>&#8377; "+ "&nbsp;&nbsp;</td>";
			tr_row += "</tr>";
			tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
			tr_row += "<td  colspan='3' style='text-align:center;border-right:1px solid  #0c0c0c;'>Branch</td>";
			tr_row += "<td  style='text-align:left;border-right:1px solid  #0c0c0c;' class='companyBranch'>: "+order_company['bankBranch']+"</td>";
			//tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'></td>";
			tr_row += "<td  rowspan='3' style='text-align:center;border-right:1px solid  #0c0c0c;'>Total Amount</td>";
			  
			tr_row += "<td  rowspan='3' style='text-align:right;border-right:1px solid  #0c0c0c;' class='totalvalue'>&#8377; "+inv_total+"&nbsp;&nbsp;</td>";
			tr_row += "</tr>";
			tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
			tr_row += "<td  colspan='3' style='text-align:center;border-right:1px solid  #0c0c0c;'>Acct No.</td>";
			tr_row += "<td  style='text-align:left;border-right:1px solid  #0c0c0c;' class='companyAcctNo'>: "+order_company['bankAccount']+"</td>";
			//tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'></td>"; 
			tr_row += "</tr>";
			tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
			tr_row += "<td  colspan='3' style='text-align:center;border-right:1px solid  #0c0c0c;'>IFSC Code</td>";
			tr_row += "<td  style='text-align:left;border-right:1px solid  #0c0c0c;' class='ifsc_code'>: "+order_company['ifscCode']+"</td>";
			//tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'></td>"; 
			tr_row += "</tr>"; 
			$("#invoiceAgg").html(tr_row);

		}
		
		var formatNumber = function(data) {
			return data.toLocaleString('en-IN', {
						maximumFractionDigits : 2,
						style : 'currency',
						currency : 'INR'
					});
		}
		 
	});
</script>
</html>