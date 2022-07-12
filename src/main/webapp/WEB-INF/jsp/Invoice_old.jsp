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

.row {
	margin: 0px !important;
}

th {
	text-align: center;
	background-color: grey;
	color: white;
	font-weight: bold;
}

thead>td {
	font-size: 12px;
	border-right: 1px solid #0c0c0c;
	border-bottom: 1px solid #0c0c0c;
	background-color: #efefef;
	font-weight: bold;
	text-align: left;
	padding: 7px;
	color: #222222;
}

#mockRateDiv tr {
	height: 30px;
}

#mockRateDiv td {
	padding: 0px !important;
}

.word-wrap-text {
	word-wrap: break-word;
}
</style>
<script type="text/javascript">
	var orderId = "${orderId}";
	var userName = "${userName}";
</script>
</head>
<body>
	<jsp:directive.include file="Header.jsp" />
	<input type="button" id="generateInvoice" style="float: right;margin-right: 20px;" class="btn btn-primary" value="Print Invoice"></input>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<div class="col-sm-3 col-md-3" id="orderIdDiv">
					<div class="form-group1">
						<label>Invoice Number</label> <input class="form-control"
							type="text" id="invNum"></input> <input type="hidden"
							id="createdBy"></input> <input type="hidden" id="orderId"></input>
						<input type="hidden" id="invoiceId"></input>
					</div>
				</div>

				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Invoice Date</label> <input type="text" id="invoiceDate"
							name="invoiceDate" class="form-control" placeholder="DD/MM/YYYY">
					</div>
				</div>

				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Due Date</label> <input type="text" id="dueDate"
							name="dueDate" class="form-control" placeholder="DD/MM/YYYY">
					</div>
				</div>



				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Payment Status</label> <br /> <select id="status"
							class="form-control">
							<option value="PAYMENT_IN_PROGRESS">PAYMENT_IN_PROGRESS</option>
							<option value="PAYMENT_COMPLETED">PAYMENT_COMPLETED</option>
							<option value="ORDER_COMPLETED">ORDER_COMPLETED</option>
						</select>
					</div>
				</div>


				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Invoice Amt</label> <br /> <input type="text" min="0"
							id="totalAmount" name="totalAmount" class="form-control">
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Advance Amount</label> <input type="text" min="0"
							id="advanceAmount" name="advanceAmount" class="form-control">
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Balance Amt</label> <br /> <input type="text" min="0"
							id="balanceAmount" name="balanceAmount" class="form-control"
							disabled="disabled">
					</div>
				</div>

				<div class="col-sm-3 col-md-4">
					<div class="form-group1">
						<label>&nbsp;</label> <br>

					</div>
				</div>


				<div class="col-sm-6 col-md-6">
					<div class="form-group1">
						<label>&nbsp;</label> <br> <input type="button" id="addEntry"
							value="Add Inv Entry" /> &nbsp; <input type="button"
							id="addPayment" value="Add Payment" /> &nbsp;

					</div>
				</div>
			</div>

		</div>
		<br>
	</div>
	<div class="col-sm-6 col-md-6 col-6 col-lg-6">
		<table id="myTable" class="table table-striped table-bordered"
			style="width: 100%">

		</table>
	</div>

	<div class="col-sm-1 col-md-1"></div>
	<div class="col-sm-6 col-md-6 col-6 col-lg-6">
		<table id="paymentsTable" class="table table-striped table-bordered"
			style="width: 100%">

		</table>
	</div>

	<div id="addItem" class="modal">
		<div class="modal-content" style="width: 50%; left: 27%;">
			<div class="modal-header">
				<span class="close" id="closeWindowPopup">&times;</span>
				<h2>Invoice Entry</h2>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Entry Desc</label> <br /> <input type="text"
								id="itemDesc" name="itemDesc" class="form-control"></input> <input
								type="hidden" id="itemId"></input>
						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Quantity</label> <input type="number" id="quantity"
								name="quantity" class="form-control"></input>

						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Price</label> <input type="number" id="price" name="price"
								class="form-control"></input>

						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>GST % </label> <br /> <select id="gstRate"
								class="form-control">
								<option value=0>0%</option>
								<option value=5>5%</option>
								<option value=12>12%</option>
								<option value=18>18%</option>
							</select>
						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>CGST Amount</label> <br /> <input type="number"
								id="cGstAmount" name="cGstAmount" class="form-control" disabled></input>

						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>SGST Amount</label> <br /> <input type="number"
								id="sGstAmount" name="cGstAmount" class="form-control" disabled></input>

						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>GST Rounding</label> <br /> <input type="number"
								id="gstRounding" name="gstRounding" class="form-control"
								disabled></input>

						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Excluding GST</label> <br /> <input type="number"
								id="excludingGst" name="excludingGst" class="form-control"
								disabled></input>

						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Total </label> <br /> <input type="number" min="0"
								id="total" name="total" class="form-control" disabled></input>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<input type="button" value="Save" class="btn btn-primary"
					id="submitEntryPopup"> <input type="button" value="Cancel"
					class="btn btn-secondary" id="cancelEntryPopup">
			</div>
		</div>
	</div>

	<div id="paymentPopUp" class="modal">
		<div class="modal-content" style="width: 50%; left: 27%;">
			<div class="modal-header">
				<span class="close" id="closePaymentsPopup">&times;</span>
				<h2>Payment Entry</h2>
			</div>
			<div class="modal-body">
				<div class="row">
						<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Payment Type </label> <br /> <select id="paymentType"
								class="form-control">
								<option value="">NONE</option>
								<option value="CASH">CASH</option>
								<option value="ONLINE">ONLINE</option>
								<option value="CHEQUE">CHEQUE</option>
								<option value="OTHERS">OTHERS</option>
							</select>
						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Payment Ref</label> <br /> <input type="text"
								id="reference" name="reference" class="form-control"></input> 
								<input type="hidden" id="paymentId"></input>
						</div>
					</div>
					 
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Amount </label> <br /> <input type="number" min="0"
								id="paymentAmount" name="total" class="form-control"></input>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<input type="button" value="Save" class="btn btn-primary"
					id="submitPaymentPopup"> <input type="button" value="Cancel"
					class="btn btn-secondary" id="cancelPaymentPopup">
			</div>
		</div>
	</div>


</body>
<script type="text/javascript">
	var elements = [ "orderId", "customerName", "customerAddress", "orderDate",
			"profile_type_id", "contactNumber", "status", "invoiceAmount",
			"paidAmount", "balanceAmount", "paymentType", "email", "createdBy" ];
	var item_elements = [ "itemId", "itemDesc", "price", "quantity", "total",
			"invoiceId" ];
	var orderDetail = {};
	var totalItems = 0;
	var dataSet = [];
	var itemSet = [];
	var paymentSet = [];
	$(document)
			.ready(
					function() {

						$("#invoiceDate").datepicker({
							dateFormat : 'dd/mm/yy',//check change
							changeMonth : true,
							changeYear : true
						});
						$("#dueDate").datepicker({
							dateFormat : 'dd/mm/yy',//check change
							changeMonth : true,
							changeYear : true
						});

						//$("#customerName").html(order_company['customerName']);

						var item_columns = [
								{
									title : "S No",
									data : "itemId",
									visible : false
								},
								{
									title : "Item Desc",
									className : "text-center word-wrap-text",
									data : "itemDesc"
								},
								{
									title : "Price",
									data : "price",
									className : "text-right",
									render : function(data, type, row) {
										return data.toLocaleString('en-IN', {
											maximumFractionDigits : 2,
											style : 'currency',
											currency : 'INR'
										});
									}
								},
								{
									title : "Quantity",
									className : "text-center",
									data : "quantity"
								},
								{
									title : "Total",
									data : "total",
									className : "text-right",
									render : function(data, type, row) {
										return data.toLocaleString('en-IN', {
											maximumFractionDigits : 2,
											style : 'currency',
											currency : 'INR'
										});
									}
								},
								{
									title : "invoice id",
									data : "invoiceId",
									visible : false
								},
								{
									title : "invoice id",
									data : "gstRate",
									visible : false
								},
								{
									title : "invoice id",
									data : "cGstAmount",
									visible : false
								},
								{
									title : "invoice id",
									data : "sGstAmount",
									visible : false
								},
								{
									title : "invoice id",
									data : "gstRounding",
									visible : false
								},
								{
									title : "invoice id",
									data : "excludingGst",
									visible : false
								},

								{
									title : "Action",
									"render" : function(url, type, full) {
										return '<img class="edit-item-row" style="cursor:pointer" src="../images/edit.png"/> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<img class="delete-item-row" src="../images/trash.png"/> ';
									}
								} ];

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

						orderDetail.orderId = orderId;
						$.ajax({
							type : "POST",
							url : "/post/fetch/inv",
							data : JSON.stringify(orderDetail),
							dataType : "json",
							"contentType" : "application/json",
							success : function(data) {
								if (data != null) {
									if (data.status == "FAILURE") {
										alert("failure -->" + data.message);
									} else {
										console.log(data.records[0]);
										orderDetail = data.records[0];
										setInitData();
									}
								}
							},
							error : function(data) {
								alert(data);
							}
						});
						var setInitData = function() {
							$("#invNum").val(orderDetail.invoiceNum);
							$("#invNum").attr("disabled", true);
							$("#invoiceDate").val(
									defaultDateFormat(orderDetail.invoiceDate));
							$("#dueDate").val(
									defaultDateFormat(orderDetail.dueDate));
							$("#invoiceId").val(orderDetail.invoiceId);
							$("#orderId").val(orderDetail.orderId);
							$("#advanceAmount").val(formatNumber(orderDetail.advanceAmount));
							$("#totalAmount").val(formatNumber(orderDetail.totalAmount));
							$("#advanceAmount").attr("disabled", true);
							$("#balanceAmount").val(formatNumber(orderDetail.balanceAmount));
							$("#status").val(orderDetail.status);
							initItemDetails();
						};
						var formatNumber = function(data) {
							return data.toLocaleString('en-IN', {
										maximumFractionDigits : 2,
										style : 'currency',
										currency : 'INR'
									});
						}
						var initItemDetails = function() {

							fetchItems();
							fetchPayments();
						}
						var fetchPayments = function() {
							var req = {"invoiceId":$("#invoiceId").val()};
							
							$.ajax({
								type : "POST",
								url : "/post/fetchAll/payments",
								data : JSON
										.stringify(req),
								dataType : "json",
								"contentType" : "application/json",
								success : function(data) {
									if (data != null) {
										if (data.status == "FAILURE") {
											alert("failure -->"
													+ data.message);
										} else {
											paymentSet = data.records;
											setPaymentData();
										}
									}
								},
								error : function(data) {
									alert(alert);
								}
							});
							
						}
						
						var setPaymentData = function() {
							 $('#paymentsTable').DataTable({
									"paging" : false,
									"ordering" : false,
									"info" : false,
									"bFilter" : false,
									data : paymentSet,
									columns : payments_columns
								});
							 
								$('#paymentsTable tbody')
								.on(
										'click',
										'.edit-payment-row',
										function() {
											var table = $('#paymentsTable')
													.DataTable();
											var tr = $(this).closest('tr')
											var data = table
													.row(
															this.parentElement.parentElement)
													.data();
											setPaymentsPopUpData(data);
										});
								
						

						$('#paymentsTable tbody')
								.on( 'click', '.delete-payment-row', function() {
											var table = $('#paymentsTable')
													.DataTable();
											var data = table
													.row(this.parentElement.parentElement)
													.data();
											if (confirm("Are you sure you want to delete this payment?")) {

												$.ajax({
															type : "POST",
															url : "/post/delete/payment/"
																	+ data.paymentId,
															data : JSON
																	.stringify({}),
															dataType : "json",
															"contentType" : "application/json",
															success : function(
																	data) {
																if (data != null) {
																	if (data.status == "FAILURE") {
																		alert("failure -->"
																				+ data.message);
																	} else {
																		window.location
																				.reload();
																	}
																}
															},
															error : function(
																	data) {
																alert(alert);
															}
														});
											} else {
												return false;
											}
										});
						 }
						var fetchItems = function() {

							var item = {};
							item.invoiceId = $("#invoiceId").val();

							$
									.ajax({
										type : "POST",
										url : "/post/fetchAll/items",
										data : JSON.stringify(item),
										dataType : "json",
										"contentType" : "application/json",
										success : function(data) {
											if (data != null) {
												if (data.status == "FAILURE") {
													alert("failure -->"
															+ data.message);
												} else {
													console.log(data.records);

													itemSet = data.records;
													setItems();
												}
											}
										},
										error : function(data) {
											alert(data);
										}
									});
						}
						var defaultDateFormat = function(data) {
							var curr = data.split("T")[0];
							var parsed = curr.split("-");
							return parsed[2] + "/" + parsed[1] + "/"
									+ parsed[0];
						}
						var setItems = function() {

							var table = $('#myTable').DataTable({
								"paging" : false,
								"ordering" : false,
								"info" : false,
								"bFilter" : false,
								data : itemSet,
								columns : item_columns
							});

							$('#myTable tbody')
									.on(
											'click',
											'.edit-item-row',
											function() {
												var table = $('#myTable')
														.DataTable();
												var tr = $(this).closest('tr')
												var data = table
														.row(
																this.parentElement.parentElement)
														.data();
												setEntryPopUp(data);
											});

							$('#myTable tbody')
									.on(
											'click',
											'.delete-item-row',
											function() {
												var table = $('#myTable')
														.DataTable();
												var data = table
														.row(
																this.parentElement.parentElement)
														.data();
												if (confirm("Are you sure you want to delete this?")) {

													$
															.ajax({
																type : "POST",
																url : "/post/delete/item/"
																		+ data.itemId,
																data : JSON
																		.stringify({}),
																dataType : "json",
																"contentType" : "application/json",
																success : function(
																		data) {
																	if (data != null) {
																		if (data.status == "FAILURE") {
																			alert("failure -->"
																					+ data.message);
																		} else {
																			window.location
																					.reload();
																		}
																	}
																},
																error : function(
																		data) {
																	alert(alert);
																}
															});
												} else {
													return false;
												}
											});

						};
						$("#addEntry").on("click", function() {
							clearEntryPopUp();
							$("#addItem").modal("show");
						});
						
						
						var setEntryPopUp = function(data) {
							clearEntryPopUp();
							$("#itemId").val(data.itemId);
							$("#itemDesc").val(data.itemDesc);
							$("#quantity").val(data.quantity);
							$("#price").val(data.price);
							$("#total").val(data.total);
							$("#gstRate").val(data.gstRate);
							$("#excludingGst").val(data.excludingGst);
							$("#gstRounding").val(data.gstRounding);
							$("#cGstAmount").val(data.cGstAmount);
							$("#sGstAmount").val(data.sGstAmount);
							$("#addItem").modal("show");
						};
						var clearEntryPopUp = function(data) {
							$("#itemId").val('');
							$("#itemDesc").val('');
							$("#quantity").val('');
							$("#price").val('');
							$("#total").val('');

						};

						$("#cancelEntryPopup,#closeWindowPopup").on("click",
								function() {
									$("#addItem").modal("hide");
								});
						$("#submitEntryPopup")
								.on(
										"click",
										function() {
											var item = {};
											if ($("#itemDesc").val() != ""
													&& $("#itemDesc").val().length > 0) {

												var total = $("#quantity")
														.val()
														* $("#price").val();
												var gst = total
														- (total * (100 / (100 + parseInt($(
																"#gstRate")
																.val()))));
												gst = gst.toFixed(2);
												var flag = (gst * 100) % 2;
												var gstRounding = 0.0;
												if (flag == 1) {
													gstRounding = 0.01;
													gst = (gst * 100 - 1) / 100;
													gst = gst.toFixed(2);
												}
												var sGstAmount = (gst * 100) / 200;
												sGstAmount = sGstAmount
														.toFixed(2);
												var cGstAmount = sGstAmount;
												var excludingGst = total - gst;
												excludingGst = excludingGst
														.toFixed(2);

												item = {
													"invoiceId" : $(
															"#invoiceId").val(),
													"itemDesc" : $("#itemDesc")
															.val(),
													"quantity" : $("#quantity")
															.val(),
													"price" : $("#price").val(),
													"total" : total,
													"itemId" : $("#itemId")
															.val(),
													"gstRate" : $("#gstRate")
															.val(),
													"sGstAmount" : sGstAmount,
													"cGstAmount" : cGstAmount,
													"gstRounding" : gstRounding,
													"excludingGst" : excludingGst,
													"userName" : userName
												};
											} else {
												alert("Please Enter Entry details");
												return false;
											}

											console.log(item);
											$
													.ajax({
														type : "POST",
														url : "/post/add/items",
														data : JSON
																.stringify(item),
														dataType : "json",
														"contentType" : "application/json",
														success : function(data) {
															if (data != null) {
																if (data.status == "FAILURE") {
																	alert("failure -->"
																			+ data.message);
																} else {
																	window.location
																			.reload();
																}
															}
														},
														error : function(data) {
															alert(alert);
														}
													});

										});
						
						$("#addPayment").on("click", function() {
							clearPaymentPopUp();
							$("#paymentPopUp").modal("show");
						});
						$("#cancelPaymentPopup,#closePaymentsPopup").on("click", function() {
							clearPaymentPopUp();
							$("#paymentPopUp").modal("hide");
						});
						var clearPaymentPopUp = function() {
							$("#paymentType").val('');
							$("#reference").val('');
							$("#paymentId").val('');
							$("#paymentAmount").val('');
						}
						
						$("#submitPaymentPopup").on('click', function() {
							var paymentRec = {};
							if ($("#reference").val() != ""
									&& $("#reference").val().length > 0) {
 								paymentRec = {
									"paymentId" : $("#paymentId").val(),
									"reference" : $("#reference").val(),
									"invoiceId" : $("#invoiceId").val(),
									"amount" : $("#paymentAmount").val(),
									"paymentType":$("#paymentType").val(),
									"userName" : userName
								};
							} else {
								alert("Please Enter Entry details");
								return false;
							} 

							console.log(paymentRec);
							$.ajax({
										type : "POST",
										url : "/post/save/payment",
										data : JSON
												.stringify(paymentRec),
										dataType : "json",
										"contentType" : "application/json",
										success : function(data) {
											if (data != null) {
												if (data.status == "FAILURE") {
													alert("failure -->"
															+ data.message);
												} else {
													window.location
															.reload();
												}
											}
										},
										error : function(data) {
											alert(alert);
										}
									});
						});
						var setPaymentsPopUpData = function(data) {
							$("#paymentType").val(data.paymentType);
							$("#reference").val(data.reference);
							$("#paymentId").val(data.paymentId);
							$("#paymentAmount").val(data.amount); 
							$("#paymentPopUp").modal('show');
						}
						
						$("#generateInvoice").on("click",function(){
							var invoiceId = $('#invoiceId').val();
							 window.open("/GenerateInvoice?invoiceId="+invoiceId+"&orderId="+orderId,"_blank");
						}); 
					});
</script>
</html>