<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tax Invoice</title>
<jsp:directive.include file="ScriptTags.jsp" />
<script src="/js/payment.js" type="text/javascript"></script>
<script src="/js/invoice.js" type="text/javascript"></script>
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
						<label>Manual Override</label> <br /> <input type="checkbox"  id="manual"  name="manual"  />
					</div>
				</div>

				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Invoice Date</label> <input type="text" id="invoiceDate"
							name="invoiceDate" class="form-control" placeholder="DD/MM/YYYY">
					</div>
				</div>

				<div class="col-sm-3 col-md-3" style="display:none;">
					<div class="form-group1">
						<label>Due Date</label> <input type="text" id="dueDate"
							name="dueDate" class="form-control" placeholder="DD/MM/YYYY">
					</div>
				</div>



				<div class="col-sm-3 col-md-3" style="display: none;">
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
						<label>C GST Amount</label> <br /> <input type="number" min="0"
							id="invCGSTAmt" name="invCGSTAmt" class="form-control"/>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>S GST Amount</label> <br /> <input type="number" min="0"
							id="invSGSTAmt" name="invSGSTAmt" class="form-control" />
					</div>
				</div>
				
				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>GST Rounding Amt</label> <br /> <input type="number" 
							id="gstRoundingAmt" name="gstRoundingAmt" class="form-control"/>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>GST Amt</label> <br /> <input type="number" min="0"
							id="gstAmt" name="gstAmt" class="form-control"/>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Items Total Amt</label> <br /> <input type="number" min="0"
							id="amountExcludingTax" name="amountExcludingTax" class="form-control"/>
					</div>
				</div>
				 
				<div class="col-sm-3 col-md-3" style="display: none;">
					<div class="form-group1">
						<label>Advance Amount</label> <input type="number" min="0"
							id="advanceAmount" name="advanceAmount" class="form-control"/>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Total Invoice Amount</label> <br /> <input type="number" min="0"
							id="totalAmount" name="totalAmount" class="form-control"/>
					</div>
				</div>
				<div class="col-sm-3 col-md-3" style="display: none;">
					<div class="form-group1">
						<label>Balance Amount</label> <br /> <input type="number" min="0"
							id="balanceAmount" name="balanceAmount" class="form-control"/>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Transport Mode</label> <br /> <input type="text" id="transMode" class="form-control"/>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						<label>Vehicle No</label> <br /> <input type="text" id="transNumber" class="form-control"/>
					</div>
				</div>
				
				<div class="col-sm-3 col-md-4">
					<div class="form-group1">
						<label>&nbsp;</label> <br>
&nbsp;
					</div>
				</div>
<div class="col-sm-3 col-md-4">
					<div class="form-group1">
						<label>&nbsp;</label> <br>
&nbsp;
					</div>
				</div>
<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						  &nbsp;  

					</div>
				</div>
				</div>
<div class="col-sm-3 col-md-3">
					<div class="form-group1">
						  &nbsp;  

					</div>
				</div>
				<div class="col-sm-6 col-md-6" style="text-align: center;">
					<div class="form-group1">
						<label>&nbsp;</label> <br> <input type="button" id="submitHeader"
							value="Generate Invoice" class="btn btn-primary" /> &nbsp; <button id="addEntry"
							style="display:none;" class="btn btn-primary" />Add Inv Entry</button> &nbsp;  

					</div>
				</div>
			</div>

		</div>
		<br>
	</div>
	<div class="col-sm-12 col-md-12 col-12 col-lg-12">
		<table id="myTable" class="table table-striped table-bordered"
			style="width: 100%">

		</table>
	</div>

	<div class="col-sm-1 col-md-1"></div>
	 

	<div id="addItem" class="modal">
		<div class="modal-content" style="width: 50%; left: 27%;">
			<div class="modal-header">
				<span class="close" id="closeWindowPopup">&times;</span>
				<h2>Invoice Entry</h2>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-6 col-md-6">
						<div class="form-group1">
							<label>Entry Desc</label> <br /> <textarea 
								id="itemDesc" name="itemDesc" class="form-control" style="width: 270px;height: 150px"></textarea> <input
								type="hidden" id="itemId"></input>
						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>HSN/SAC</label> <br /> <input type="text" value="39252000"
								id="hsn" name="hsn" class="form-control"></input>  
						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Quantity </label>(Sft / Unit) <input type="number" id="quantity"
								name="quantity" class="form-control"></input>

						</div>
					</div>
					<div class="col-sm-3 col-md-4">
						<div class="form-group1">
							<label>Price </label>(Sft / Unit) <input type="number" id="price" name="price"
								class="form-control"></input>

						</div>
					</div>
					<div class="col-sm-3 col-md-4" style="display:none">
						<div class="form-group1">
							<label>GST % </label> <br /> <select id="gstRate"
								class="form-control">
								<option value=0>0%</option>
								<option value=5>5%</option>
								<option value=12>12%</option>
								<option value=18 selected>18%</option>
							</select>
						</div>
					</div>
					<div class="col-sm-3 col-md-4" style="display: none;">
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
</html>