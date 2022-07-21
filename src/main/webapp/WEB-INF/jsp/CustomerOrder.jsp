<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${type}-Order</title>
<jsp:directive.include file="ScriptTags.jsp" />
<style type="text/css">
.header {
	text-align: center;
	background-color: grey;
	color: white;
	font-weight: bold;
}

th {
	text-align: center;
	background-color: grey;
	color: white;
	font-weight: bold;
}

#mockRateDiv tr {
	height: 30px;
}

#mockRateDiv td {
	padding: 0px !important;
}
</style>
<script type="text/javascript">
	var orderId = "${orderId}";
	var userName = "${userName}";
</script>
</head>
<body>
	<jsp:directive.include file="Header.jsp" />
	<div style="text-align: center; font-size: 39px;text-transform: uppercase;">${type}-Order</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-md-3 col-lg-3">
			</div>
			<div class="col-sm-6 col-md-6 col-lg-6">
				<div class="col-sm-6 col-md-6" id="orderIdDiv" style="display: none;">
					<div class="form-group">
						<label>Customer Order Id</label> <input type="text" id="orderId"></input>
						<input type="hidden" id="createdBy"></input>
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="form-group">
						<label>Order Date</label> <input type="text" id="orderDate"
							name="orderDate" class="form-control" placeholder="DD/MM/YYYY">
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="form-group">
						<label>Due Date</label> <input type="text" id="dueDate"
							name="dueDate" class="form-control" placeholder="DD/MM/YYYY" autocomplete="off">
					</div>
				</div>
				<div class=" col-sm-6 col-md-6">
					<div class="form-group">
						<label>Customer Name</label> <input type="text" id="customerName"
							name="customerName" class="form-control" autocomplete="off"
							placeholder="Customer Name">
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="form-group">
						<label>Customer Number</label> <input type="tel"
							id="contactNumber" name="contactNumber" max="10" maxlength="10"
							min="10" class="form-control" placeholder="XXX XXX XXXX" autocomplete="off">
					</div>
				</div>
				
				<div class="col-sm-12 col-md-12">
					<div class="form-group">
						<label>Customer Address</label> <textarea  
							id="customerAddress" name="customerAddress" class="form-control" value="">
							</textarea>
					</div>
				</div>
				
				<div class="col-sm-6 col-md-6" style="display:none">
					<div class="form-group">
						<label>Email</label> <input type="text" id="email" name="email"
							class="form-control">
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="form-group">
						<label>Order Amount</label> <input type="number" id="orderAmount"
							name="orderAmount" class="form-control">
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="form-group">
						<label>Adv Amount</label> <input type="number" id="advanceAmount"
							name="advanceAmount" class="form-control"/>
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="form-group">
						<label>GST Number</label> <br />
						<input type="text" id="gstNumber"
							name="gstNumber" class="form-control" value="URP"/>
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="form-group">
						<label>Payment Type</label> <br /> <select id="paymentType"
							class="form-control">
							<option value="CASH">CASH</option>
							<option value="CHEQUE">CHEQUE</option>
							<option value="ONLINE">ONLINE</option>
						</select>
					</div>
				</div>
				<div class="col-sm-6 col-md-6" style="display: none">
					<div class="form-group">
						<label>Order Status</label> <br /> <select id="status"
							class="form-control">
							<option value="NO_INVOICE_GENERATED">NO_INVOICE_GENERATED</option>
							<option value="NO_INVOICE_REQUIRED">NO_INVOICE_REQUIRED</option>
							<option value="INVOICE_GENERATED">INVOICE_GENERATED</option>
							<option value="ORDER_NOT_REQUIRED">ORDER_NOT_REQUIRED</option>
						</select>
					</div>
				</div>

			</div>
		
		<div class="col-sm-3 col-md-3 col-lg-3">
			</div>
		</div>


		<div class="form-group" style="text-align: center">
			<button id="submitBtn" class="btn btn-primary">Generate
				Order</button>
				
		</div>
	</div>

<script type="text/javascript">
var paymentSet = [];
var payments_columns = [
	{
		title : "S No",
		data : "paymentId",
		visible : false
	},
	{
		title : "Date",
		className : "text-center word-wrap-text",
		data : "date",
		render : function(data, type, row) {
			return defaultDateFormat(data);
		}
	},
	{
		title : "Payment Type",
		"data" :"paymentType"
	},
	{
		title : "Payment Reference",
		data : "reference"
	},
	{
		title : "Amount",
		className : "text-center",
		data : "amount",
		render : function(data, type, row) {
			return data.toLocaleString('en-IN', {
				maximumFractionDigits : 2,
				style : 'currency',
				currency : 'INR'
			});
		}
	}, 
	{
		title : "Action",
		"render" : function(url, type, full) {
			return '<img class="edit-payment-row" style="cursor:pointer" src="../images/edit.png"/> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<img class="delete-payment-row" src="../images/trash.png"/> ';
		}
	} ];

</script>
</body>
<script type="text/javascript">
	var orderDetail = {};
	var itemMap = {};
	var elements = [ "orderId", "customerName", "customerAddress", "orderDate", "dueDate",
			"contactNumber", "status", "advanceAmount", "orderAmount",
			"balanceAmount", "paymentType", "email", "createdBy","gstNumber" ];
	 
	var elementDesc = {
		"customerName" : "Customer Name",
		"customerAddress" : "Customer Address",
		"dueDate":"Due Date",
		"contactNumber" : "Contact Number",
		"gstNumber" : "GST Number"
	};
	$(document)
			.ready(
					function() {
						$("#addorderId").addClass("active");
						if (orderId == "") {
							$("#orderIdDiv").hide();
						}

						$("#orderDate").datepicker({
							dateFormat : 'dd/mm/yy',//check change
							changeMonth : true,
							changeYear : true
						});
						$("#dueDate").datepicker({
							dateFormat : 'dd/mm/yy',//check change
							changeMonth : true,
							changeYear : true
						});
						$("#dueDate").attr("autocomplete", "off");
						$("#orderDate").attr("autocomplete", "off");
						
						$("#customerName").attr("autocomplete", "new-password");
						$("#customerAddress").attr("autocomplete", "new-password");
						$("#contactNumber").attr("autocomplete", "new-password"); 
						$("#customerAddress").val("");
						$("#gstNumber").attr("autocomplete", "new-password");
						$("#clearBtn").on('click', function() {
							for (var i = 0; i < elements.length; i++) {
								var element = "#" + elements[i];
								$(element).val(orderDetail[elements[i]]);
							}

						});
						
						

						$("#orderId").attr("disabled", true);
						//$("#orderDate").datepicker("disable");
						$("#orderDate").datepicker("setDate", new Date());
						console.log("ready!");
						$("#submitBtn")
								.on(
										'click',
										function() {
											var orderDetail = {};

											for (var i = 0; i < elements.length; i++) {
												var element = "#" + elements[i];
												orderDetail[elements[i]] = $(
														element).val();
												if ($(element).val() == ""
														&& elementDesc[elements[i]] != null) {
													alert(elementDesc[elements[i]]
															+ " is empty");
													return true;
												}
											}

											orderDetail["createdBy"] = userName;
											orderDetail["customerName"]= $("#customerName").val().toUpperCase(); 
											orderDetail["customerAddress"]= $("#customerAddress").val().toUpperCase(); 
											console.log(orderDetail);
											$
													.ajax({
														type : "POST",
														url : "/customer/create/order",
														data : JSON.stringify(orderDetail),
														beforeSend: function() {
															//$("#submitBtn").removeClass("btn-primary");
															$("#submitBtn").attr("disabled",true);
															$("#submitBtn").html("In Progress  <i class='fa fa-spinner fa-spin'></i>");
														}, 
														dataType : "json",
														"contentType" : "application/json",
														success : function(data) {
															if (data != null) {
																if (data.status == "FAILURE") {
																	alert("failure -->"
																			+ data.message);
																} else {
																	orderDetail = data.records[0];
																	window.location.href = "/editorder?orderId=" + orderDetail.orderId;
																}
															}
														},
														error : function(data) {
															alert(alert);
														}
													});

										});
					});
	
	
</script>
</html>