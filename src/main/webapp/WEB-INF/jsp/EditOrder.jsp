<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>EDIT-ORDER</title>
		<jsp:directive.include file="ScriptTags.jsp" />
		<style type="text/css">
			#mockRateDiv tr {
				height: 30px;
			}

			td {
				text-align: center;
			}

			#mockRateDiv td {
				padding: 0px !important;

			}
		</style>
		<script type="text/javascript">
			var orderId = "${orderId}";
			var userName = "${userName}";
		</script>
		<script type="text/javascript">
			var paymentSet = [];

		</script>
	</head>

	<body>
		<jsp:directive.include file="Header.jsp" />
		<div style="text-align: center; font-size: 30px;">EDIT-ORDER</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					&nbsp;
				</div>
				<div class="col-md-6" id="button_section">

					<input type="button" id="generateInvoice" style="float: right;margin-right: 20px;"
						class="btn btn-primary" value="Print Invoice"></input>
					<input type="button" id="modifyInvoice" style="float: right;margin-right: 20px;"
						class="btn btn-primary" value="Create Invoice"></input>
					<input type="button" id="copyOrder" style="float: right;margin-right: 20px;"
						class="btn btn-primary" value="Copy Order"></input>
				</div>
			</div>
		</div>
		<br>
		<div class="container">
			<div class="col-sm-9 col-md-9">
				<div class="col-sm-12 col-md-12">
					<div class="col-sm-4 col-md-4" id="orderIdDiv">
						<div class="form-group1">
							<label>Order Number</label> <input class="form-control" type="text" id="orderNum"
								disabled></input>
							<input type="hidden" id="createdBy"></input>
							<input type="hidden" id="orderId"></input>
							<input type="hidden" id="invoiceId"></input>
							<input type="hidden" id="invoiceNum"></input>
						</div>
					</div>

					<div class="col-sm-4 col-md-4">
						<div class="form-group1">
							<label>Order Date</label> <input type="text" id="orderDate" name="orderDate"
								class="form-control" placeholder="DD/MM/YYYY">
						</div>
					</div>

					<div class="col-sm-4 col-md-4">
						<div class="form-group1">
							<label>Due Date</label> <input type="text" id="dueDate" name="dueDate" class="form-control"
								placeholder="DD/MM/YYYY">
						</div>
					</div>
				</div>

				<div class="col-sm-12 col-md-12">
					<div class="col-sm-4 col-md-4">
						<div class="form-group1">
							<label>Customer Name</label> <input type="text" id="customerName" name="customerName"
								class="form-control" placeholder="Customer Name">
						</div>
					</div>

					<div class="col-sm-4 col-md-4">
						<div class="form-group1">
							<label>Customer Number</label> <input type="text" id="contactNumber" name="contactNumber"
								class="form-control" placeholder="XXX XXX XXXX">
						</div>
					</div>
					<div class="col-sm-4 col-md-4">
						<div class="form-group1">
							<label>GST Number</label>
							<input type="text" id="gstNumber" name="gstNumber" class="form-control" value="URP">
						</div>
					</div>


					<div class="col-sm-4 col-md-4" style="display: none;">
						<div class="form-group1">
							<label>Email</label> <input type="text" id="email" name="email" class="form-control">
						</div>
					</div>

				</div>
				<div class="col-sm-12 col-md-12">
					<div class="col-sm-4 col-md-4">
						<div class="form-group1">
							<label>Order Status</label> <br /> <select id="status" class="form-control">
								<option value="NO_INVOICE_GENERATED">NO_INVOICE_GENERATED</option>
								<option value="NO_INVOICE_REQUIRED">NO_INVOICE_REQUIRED</option>
								<option value="INVOICE_GENERATED">INVOICE_GENERATED</option>
								<option value="ORDER_NOT_REQUIRED">ORDER_NOT_REQUIRED</option>
							</select>
						</div>
					</div>

					<div class="col-sm-4 col-md-4">
						<div class="form-group1">
							<label>Order Amount</label> <br /> <input type="number" min="0" id="orderAmount"
								name="orderAmount" class="form-control">
						</div>
					</div>
					<div class="col-sm-4 col-md-4">

						<label>Received Amount</label> <input type="number" min="0" id="amountReceived"
							name="amountReceived" class="form-control" disabled="disabled">

					</div>
					<div class="col-sm-4 col-md-4">
						<div class="form-group1">
							<label>Balance Amount</label> <br /> <input type="number" min="0" id="balanceAmount"
								name="balanceAmount" class="form-control" disabled="disabled">
						</div>
					</div>
					<div class="col-sm-4 col-md-4">
						<div class="form-group1">
							<label>Invoice Amount</label> <br />
							<input type="number" min="0" id="invoiceAmount" name="invoiceAmount" class="form-control"
								disabled="disabled">
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-12">
					<div class="col-sm-4 col-md-4">
						&nbsp;
					</div>
				</div>
			</div>
			<div class="col-sm-3 col-md-3">
				<div class="form-group1">
					<label>Customer Address</label> <textarea id="customerAddress" name="customerAddress"
						class="form-control" style="width: 300px; height: 120px;"></textarea>
				</div>
			</div>
			<br>
		</div>


		<div class="form-group1" style="text-align: center">
			<button id="submitBtn" class="btn btn-primary">submit</button>

			<button id="addPayment" class="btn btn-primary">Add Payment</button>
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
								<label>Payment Date </label> <br /> <input id="paymentDate"
									class="form-control"></input>
							</div>
						</div>
						<div class="col-sm-3 col-md-4">
							<div class="form-group1">
								<label>Payment Type </label> <br /> <select id="paymentType" class="form-control">

									<option value="CASH" selected>CASH</option>
									<option value="ONLINE">ONLINE</option>
									<option value="CHEQUE">CHEQUE</option>
									<option value="OTHERS">OTHERS</option>
								</select>
							</div>
						</div>
						<div class="col-sm-3 col-md-4">
							<div class="form-group1">
								<label>Payment Ref</label> <br /> <input type="text" id="reference" name="reference"
									class="form-control" autocomplete="no-password"></input>
								<input type="hidden" id="paymentId"></input>
							</div>
						</div>

						<div class="col-sm-3 col-md-4">
							<div class="form-group1">
								<label>Amount </label> <br /> <input type="number" min="0" id="paymentAmount"
									name="total" class="form-control"></input>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button value="Save" class="btn btn-primary" id="submitPaymentPopup">Save</button> <input
						type="button" value="Cancel" class="btn btn-secondary" id="cancelPaymentPopup">
				</div>
			</div>
		</div>
		<br />
		<br />
		<div class="col-sm-12 col-md-12 col-12 col-lg-12">
			<table id="paymentsTable" class="table table-striped table-bordered" style="width: 100%">

			</table>
		</div>
	</body>
	<script type="text/javascript">
		var orderDetail = {};
		$(document).ready(function () {

			$("#orderDate").datepicker({
				dateFormat: 'dd/mm/yy',//check change
				changeMonth: true,
				changeYear: true
			});
			$("#dueDate").datepicker({
				dateFormat: 'dd/mm/yy',//check change
				changeMonth: true,
				changeYear: true
			});

			$.ajax({
				type: "POST",
				url: "/customer/" + orderId + "/find",
				data: JSON.stringify({}),
				dataType: "json",
				"contentType": "application/json",
				success: function (data) {
					if (data != null) {
						if (data.status == "FAILURE") {
							alert("failure -->" + data.message);
						} else {
							orderDetail = data.records[0];
							console.log(orderDetail);
							$("#orderId").val(orderDetail.orderId);
							$("#orderDate").val(orderDetail.orderDate);
							$("#orderNum").val(orderDetail.orderNum);
							$("#dueDate").val(orderDetail.dueDate);
							$("#customerName").val(orderDetail.customerName);
							$("#contactNumber").val(orderDetail.contactNumber);
							$("#customerAddress").val(orderDetail.customerAddress);
							$("#customerAddress").val(orderDetail.customerAddress);
							$("#email").val(orderDetail.email);
							$("#amountReceived").val(orderDetail.amountReceived);
							$("#orderAmount").val(orderDetail.orderAmount);
							$("#balanceAmount").val(orderDetail.balanceAmount);

							$("#status").val(orderDetail.status);
							$("#invoiceAmount").val(orderDetail.invoiceAmount);
							$("#gstNumber").val(orderDetail.gstNumber);
							$("#invoiceId").val(orderDetail.invoiceId);
							$("#invoiceNum").val(orderDetail.invoiceNum);
							if (orderDetail.invoiceId == null) {
								$("#generateInvoice").hide();
							} else {
								$("#modifyInvoice").val("Modify Invoice");
								$("#status").val("INVOICE_GENERATED");
							}
							fetchPayments();
						}
					}
				},
				error: function (data) {
					alert(data);
				}
			});
			$("#status").change(function (e) {
				console.log(this.value);
				if (this.value == "NO_INVOICE_REQUIRED") {
					$("#button_section").hide();
				} else {
					$("#button_section").show();
				}
			});
			$("#submitBtn").on('click', function () {
				//orderDetail = {};
				orderDetail.orderId = $("#orderId").val();
				orderDetail.orderDate = $("#orderDate").val();
				orderDetail.orderNum = $("#orderNum").val();
				orderDetail.dueDate = $("#dueDate").val();
				orderDetail.customerName = $("#customerName").val().toUpperCase();
				orderDetail.contactNumber = $("#contactNumber").val();
				orderDetail.customerAddress = $("#customerAddress").val().toUpperCase();
				orderDetail.email = $("#email").val();
				orderDetail.gstNumber = $("#gstNumber").val();
				orderDetail.orderAmount = $("#orderAmount").val();
				orderDetail.balanceAmount = parseInt(orderDetail.orderAmount) - parseInt(orderDetail.amountReceived);
				orderDetail.status = ($("#status").val() == null || $("#status").val() == "") ? "NO_INVOICE_GENERATED" : $("#status").val();

				orderDetail.modifiedBy = userName;
				$("#balanceAmount").val(orderDetail.balanceAmount);
				if (orderDetail.balanceAmount < 0) {
					alert("Advance amount is greater than Bill amount");
				} else {
					$.ajax({
						type: "POST",
						url: "/customer/order/update",
						data: JSON.stringify(orderDetail),
						dataType: "json",
						"contentType": "application/json",
						beforeSend: function () {
							//$("#submitBtn").removeClass("btn-primary");
							$("#submitBtn").attr("disabled", true);
							$("#submitBtn").html("In Progress  <i class='fa fa-spinner fa-spin'></i>");
						},
						success: function (data) {
							$("#submitBtn").attr("disabled", false);
							$("#submitBtn").html("Submit");
							if (data != null) {
								if (data.status == "FAILURE") {
									alert("failure -->" + data.message);
								} else {
									orderDetail = data.records[0];
									window.location.reload();
								}
							}
						},
						error: function (data) {
							$("#submitBtn").attr("disabled", false);
							$("#submitBtn").html("Submit");
							alert(data);
						}
					});
				}

			});


			$("#generateInvoice").on("click", function () {
				window.open("/GenerateInvoice?orderId=" + orderId, "_blank");
			});

			$("#modifyInvoice").on("click", function () {
				window.location.href = ("/Invoice?orderId=" + orderId);
			});


			$("#copyOrder").on("click", function () {
				$("#copyOrder").attr("disabled", true);
				$("#copyOrder").html("In Progress  <i class='fa fa-spinner fa-spin'></i>");
				var req = { "orderId": orderId, "createdBy": userName };
				$.ajax({
					type: "POST",
					url: "/customer/copy/order",
					data: JSON.stringify(req),
					dataType: "json",
					"contentType": "application/json",
					success: function (data) {
						if (data != null) {
							if (data.status == "FAILURE") {
								alert("failure -->" + data.message);
							} else {
								window.location.href = ("/editorder?orderId=" + data.records[0].orderId);
							}
						}
					},
					error: function (data) {
						alert(alert);
					}
				});
			});
			var fetchPayments = function () {
				var req = { "orderId": orderId };
				$.ajax({
					type: "POST",
					url: "/post/fetchAll/payments",
					data: JSON.stringify(req),
					dataType: "json",
					"contentType": "application/json",
					success: function (data) {
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
					error: function (data) {
						alert(alert);
					}
				});
			};

			var setPaymentData = function () {
				$('#paymentsTable').DataTable({
					"paging": false,
					"ordering": false,
					"info": false,
					"bFilter": false,
					data: paymentSet,
					columns: payments_columns
				});

				$('#paymentsTable tbody').on('click', '.edit-payment-row', function () {
					var table = $('#paymentsTable').DataTable();
					var data = table.row(this.parentElement.parentElement).data();
					setPaymentsPopUpData(data);
				});

				$('#paymentsTable tbody').on('click', '.delete-payment-row', function () {
					var table = $('#paymentsTable').DataTable();
					var data = table.row(this.parentElement.parentElement).data();
					if (confirm("Are you sure you want to delete this payment?")) {
						$.ajax({
							type: "POST",
							url: "/post/delete/payment/" + data.paymentId,
							data: JSON.stringify({}),
							dataType: "json",
							"contentType": "application/json",
							success: function (data) {
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
							error: function (data) {
								alert(alert);
							}
						});
					} else {
						return false;
					}
				});
			}

			var setPaymentsPopUpData = function (data) {
				$("#paymentType").val(data.paymentType);
				$("#paymentDate").val(defaultDateFormat(data.date));
				$("#reference").val(data.reference);
				$("#paymentId").val(data.paymentId);
				$("#paymentAmount").val(data.amount);
				$("#paymentPopUp").modal('show');
			};
			$("#paymentDate").datepicker({
				dateFormat: 'dd/mm/yy',//check change
				changeMonth: true,
				changeYear: true
			});
			$("#paymentDate").attr("autocomplete", "off");
			var defaultDateFormat = function (data) {
				var curr = data.split("T")[0];
				var parsed = curr.split("-");
				return parsed[2] + "/" + parsed[1] + "/"
					+ parsed[0];
			}
			$("#submitPaymentPopup").on('click', function () {
				var paymentRec = {};
				var totalPayment = 0;
				if ($("#reference").val() != ""
					&& $("#reference").val().length > 0) {
					paymentRec = {
						"paymentId": $("#paymentId").val(),
						"reference": $("#reference").val().toUpperCase(),
						"orderId": orderId,
						"amount": $("#paymentAmount").val(),
						"paymentType": $("#paymentType").val(),
						"userName": userName,
						"date": $("#paymentDate").val()
					};
				} else {
					alert("Please Enter Entry details");
					return false;
				}

				if (paymentSet != null) {
					for (var i = 0; i < paymentSet.length; i++) {
						if (paymentRec.paymentId != paymentSet[i].paymentId) {
							totalPayment = totalPayment + parseInt(paymentSet[i].amount);
						}
					}

				}
				totalPayment = totalPayment + parseInt(paymentRec.amount);
				if (totalPayment > orderDetail.orderAmount) {
					alert("Order amount is less than total payments.");
				} else {
					$.ajax({
						type: "POST",
						url: "/post/save/payment",
						beforeSend: function () {
							//$("#submitBtn").removeClass("btn-primary");
							$("#submitPaymentPopup").attr("disabled", true);
							$("#submitPaymentPopup").html("In Progress  <i class='fa fa-spinner fa-spin'></i>");
						},
						data: JSON.stringify(paymentRec),
						dataType: "json",
						"contentType": "application/json",
						success: function (data) {
							if (data != null) {
								if (data.status == "FAILURE") {
									alert("failure -->" + data.message);
								} else {
									window.location.reload();
								}
							}
						},
						error: function (data) {
							alert(alert);
						}
					});
				}

			});
			$("#cancelPaymentPopup,#closePaymentsPopup").on("click", function () {
				clearPaymentPopUp();
				$("#paymentPopUp").modal("hide");
			});
			var clearPaymentPopUp = function () {
				$("#paymentType").val('CASH');
				$("#reference").val('');
				$("#paymentId").val('');
				$("#paymentAmount").val('');
				$("#submitPaymentPopup").attr("disabled", false);
				$("#submitPaymentPopup").html("Save");
			}


			var defaultDateFormat = function (data) {
				var curr = data.split("T")[0];
				var parsed = curr.split("-");
				return parsed[2] + "/" + parsed[1] + "/"
					+ parsed[0];
			}

			$("#addPayment").on("click", function () {
				clearPaymentPopUp();
				$('#paymentDate').datepicker('setDate', 'today');
				$("#paymentPopUp").modal("show");
			});
			var payments_columns = [
				{
					title: "S No",
					data: "paymentId",
					visible: false
				},
				{
					title: "Date",
					className: "text-center word-wrap-text",
					data: "date",
					render: function (data, type, row) {
						return defaultDateFormat(data);
					}
				},
				{
					title: "Payment Type",
					"data": "paymentType"
				},
				{
					title: "Payment Reference",
					data: "reference"
				},
				{
					title: "Amount",
					className: "text-center",
					data: "amount",
					render: function (data, type, row) {
						return data.toLocaleString('en-IN', {
							maximumFractionDigits: 2,
							style: 'currency',
							currency: 'INR'
						});
					}
				},
				{
					title: "Action",
					"render": function (url, type, full) {
						return '<img class="edit-payment-row" style="cursor:pointer" src="../images/edit.png"/> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<img class="delete-payment-row" src="../images/trash.png"/> ';
					}
				}];

		});
	</script>

	</html>