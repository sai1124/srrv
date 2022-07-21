<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>&nbsp;</title>
		<jsp:directive.include file="ScriptTags.jsp" />
		<style type="text/css">
			@media print {

				*,
				*:before,
				*:after {
					background: transparent !important;
					color: #000 !important; // Black prints faster: h5bp.com/s
					box-shadow: none !important;
					text-shadow: none !important;
				}
			}

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
		</style>
		<script type="text/javascript">
			var invoiceId = "${invoiceId}";
			var orderId = "${orderId}";
			var userName = "${userName}";
		</script>
	</head>

	<body>
		<div class="container" style="margin-top:5%">
			<table id="invoice_header" style="width: 100%;border:1px solid #0c0c0c;">
				<tr>
					<td
						style="width: 20%;border-right:1px solid #0c0c0c;text-align: center;border-top:1px solid #0c0c0c;">
						<img src="images/bg-logo.jpg" style="height: 150px;width: 130px;"></img>
					</td>
					<td style="border-left:1px solid #0c0c0c;text-align: center;">
						<div class="row"
							style="text-align: center; font-size: 20px;margin:0px !important;border-bottom:1px solid #0c0c0c;">
							TAX INVOICE
						</div>
						<div class="row"
							style="text-align: center; font-size: 20px;margin::0px !important;font-weight: bold;font-family: Arial Black;border-bottom:1px solid #0c0c0c;"
							id="companyName">
						</div>
						<div class="row" style="text-align: center; font-size: 16px;" id="companyAddress1"></div>
						<div class="row" style="text-align: center; font-size: 16px;" id="companyAddress2"></div>
						<div class="row" style="text-align: center; font-size: 12px;">
							<div class="col-md-6 col-sm-6">
								Tel No. <span id="companyPhone"
									style="font-weight: bold;font-family: Arial Black;"></span>
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
			<table
				style="width: 100%;border-left:1px solid #0c0c0c;border-right :1px solid #0c0c0c;border-bottom:1px solid #0c0c0c;">
				<tr>

					<td style="border-right:1px solid #0c0c0c;font-weight: bold;background: lightgrey;">
						&nbsp;&nbsp;Customer Name & Address
					</td>
					<td
						style="border-right:1px solid #0c0c0c;width: 10%; inline-size: 150px;background: lightgrey;border-bottom:1px solid #0c0c0c;">
						&nbsp;&nbsp;Invoice No
					</td>
					<td id="orderInvoiceNo"
						style="border-right:1px solid #0c0c0c; inline-size: 150px;font-weight:bold;">
					</td>
				</tr>
				<tr>
					<td style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;text-transform: uppercase;vertical-align:top;"
						rowspan="4">
						<span id="customerName" style="font-weight: bold"></span></br>
						<span id="customerAddress"></span></br>
					</td>

				</tr>

				<tr>
					<td style="border-right:1px solid #0c0c0c; inline-size: 150px; background: lightgrey">
						&nbsp;&nbsp;Invoice Date&nbsp;&nbsp;
					</td>
					<td
						style="border-right:1px solid #0c0c0c; border-top:1px solid #0c0c0c; inline-size: 150px;font-weight:bold;">
						<span id="orderInvoiceDate"></span>
					</td>
				</tr>

				<tr>
					<td style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;background: lightgrey">
						&nbsp;&nbsp;Customer No
					</td>
					<td id="customerNumber"
						style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;font-weight:bold;">

					</td>

				</tr>
				<tr>
					<td
						style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c; inline-size: 150px;background: lightgrey">
						&nbsp;&nbsp;Dispatch By
					</td>
					<td id="dispatchThrough"
						style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c; inline-size: 150px;text-transform: uppercase;font-weight:bold;">

					</td>

				</tr>
				<tr>
					<td style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;text-transform: uppercase;vertical-align:top;">
						<span id="" >Customer GST</span></br>
						<span id="customerGST" style="font-weight: bold"></span></br>
					</td>
					<td
						style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c;border-bottom:1px solid #0c0c0c; inline-size: 150px;background: lightgrey">
						&nbsp;&nbsp;Vehicle No
					</td>
					<td id="vehicleNo"
						style="border-right:1px solid #0c0c0c;border-top:1px solid #0c0c0c; font-weight:bold; inline-size: 150px;text-transform: uppercase;border-bottom:1px solid #0c0c0c;">

					</td>
				</tr>

			</table>

			<table style='width:100%;'>
				<thead>
					<tr style='border-bottom:1px solid  #0c0c0c;'>
						<th style='border-right:1px solid  #0c0c0c;border-left:1px solid  #0c0c0c;font-weight: bold;'>
							S.NO
						</th>
						<th style='border-right:1px solid  #0c0c0c;font-weight: bold;' colspan="3">
							Description of Goods
						</th>
						<th style='border-right:1px solid  #0c0c0c;font-weight: bold;'>
							HSN/SAC
						</th>
						<th style='border-right:1px solid  #0c0c0c;font-weight: bold;'>
							Quantity <br /> (Sft / Unit)
						</th>
						<th style='border-right:1px solid  #0c0c0c;font-weight: bold;'>
							Price <br /> (Sft / Unit)
						</th>

						<th style='border-right:1px solid  #0c0c0c;font-weight: bold;'>
							Total
						</th>
					</tr>
				</thead>
				<tbody id="invoiceAgg">
				</tbody>
			</table>

			<div style="display:none">
				<table
					style="border-collapse:collapse;width:100%;border-top:1px solid  #0c0c0c;border-left:1px solid  #0c0c0c;margin-bottom:20px">
					<thead>
						<tr>
							<td style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;background-color:#efefef;font-weight:bold;text-align:left;padding:7px;color:#222222"
								colspan="2">Order Details</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td
								style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;text-align:left;padding:7px">
								<b>Order ID:</b><span id="orderId"></span> <br>
								<b>Date Added:</b><span id="orderDate"></span><br>
								<b>Payment Method:</b><span id="paymentType"></span><br>
							</td>
							<td
								style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;text-align:left;padding:7px">
								<b>E-mail:</b> <span id="email"></span><br>
								<b>Telephone:</b> <span id="contactNumber"></span><br>
								<b>Order Status:</b> <span id="status"></span><br>
								<b>Profile Name:</b> <span id="profil_type_name">${profileType}</span><br>
							</td>
						</tr>
						<tr>
							<td
								style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;text-align:left;padding:7px">
								<b>No Of Windows :</b><span id="noWindow"></span> <br>

							</td>
							<td
								style="font-size:12px;border-right:1px solid  #0c0c0c;border-bottom:1px solid  #0c0c0c;text-align:left;padding:7px">
								<b>No Of Doors :</b><span id="noDoors"></span> <br>
							</td>
						</tr>
					</tbody>
				</table>



				<table id="myTable" class="display nowrap" style="width: 100%;display:none !!important">

				</table>

				<table id="itemTable"
					style="border-collapse:collapse;width:100%;border-top:1px solid  #0c0c0c;border-left:1px solid  #0c0c0c;margin-bottom:20px">

				</table>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		var profileType = [];
		var orderDetail = {};
		var modelMap = {};
		var itemMap = {};
		var order_company = ${ order_company }[0];



		var a = ['', 'one ', 'two ', 'three ', 'four ', 'five ', 'six ', 'seven ', 'eight ', 'nine ', 'ten ', 'eleven ', 'twelve ', 'thirteen ', 'fourteen ', 'fifteen ', 'sixteen ', 'seventeen ', 'eighteen ', 'nineteen '];
		var b = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
		var elements = ["orderId", "customerName", "customerAddress", "orderDate", "profile_type_id", "contactNumber", "noWindow", "noDoors", "status", "quotationAmount", "paidAmount", "balanceAmount", "paymentType", "email", "createdBy"];
		var item_elements = ["itemId", "order", "width", "height", "glass_type_id", "cost", "model_rate_id", "name", "id", "itemType", "orderId"];
		var totalItems = 0;
		$(document).ready(function () {

			$("#companyName").html(order_company['name']);
			$("#companyAddress1").html(order_company['address1']);
			$("#companyAddress2").html(order_company['address2']);
			$("#companyPhone").html(order_company['phoneNumber']);
			$("#companyGST").html("GSTIN: " + order_company['gstNumber']);
			$("#companyEmail").html(order_company['email']);
			$("#modeOfTransprot").html(order_company['modeOfTransport']);
			$("#companyState").html("State: " + order_company['stateCode'] + "(" + order_company['state'] + ")");

			var initFun = function () {

				var inputJson = { "invoiceId": invoiceId, "orderId": orderId };
				$.ajax({
					type: "POST",
					url: "/post/find/invoice",
					data: JSON.stringify(inputJson),
					dataType: "json",
					"contentType": "application/json",
					success: function (data) {
						if (data != null) {
							if (data.status == "SUCCESS") {
								var rec = data.records[0];
								orderDetail = rec;
								$("#orderInvoiceNo").html("&nbsp;&nbsp;" + rec.invoice.invoiceNum);
								$("#orderInvoiceDate").html("&nbsp;&nbsp;" + defaultDateFormat(rec.invoice.invoiceDate));
								$("#customerName").html(rec.order.customerName);
								$("#customerAddress").html(rec.order.customerAddress);
								$("#customerNumber").html("&nbsp;&nbsp;" + rec.order.contactNumber);
								$("#dispatchThrough").html("&nbsp;&nbsp;" + orderDetail.invoice.transMode);
								$("#vehicleNo").html("&nbsp;&nbsp;" + orderDetail.invoice.transNumber);
								$("#customerGST").html(rec.order.gstNumber);
								$("title").html(rec.invoice.invoiceNum + "-" + rec.order.customerName.toUpperCase());
								itemListDisplay(rec.items);
							}

						}
					},
					error: function (data) {

					}
				});

			}
			initFun();



			var defaultDateFormat = function (data) {
				var curr = data.split("T")[0];
				var parsed = curr.split("-");
				return parsed[2] + "/" + parsed[1] + "/"
					+ parsed[0];
			}
			var itemListDisplay = function (order_items) {

				var invoiceAgg = "";
				var tr_row = "";
				var total_items = 0;
				var c_gst_total = 0;
				var s_gst_total = 0;
				var inv_total = 0;
				for (var i = 0; i < order_items.length; i++) {
					tr_row += "<tr style='border-left:1px solid  #0c0c0c;'>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>" + (i + 1) + "</td>";
					tr_row += "<td style='text-align:left;border-right:1px solid  #0c0c0c;width:300px;' colspan=3>" + order_items[i]['itemDesc'] + "</td>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>" + order_items[i]['hsn'] + "</td>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>" + order_items[i]['quantity'] + "</td>";

					tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>" + formatNumber(order_items[i]['price']) + "&nbsp;&nbsp;</td>";
					tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>" + formatNumber(order_items[i]['total']) + "&nbsp;&nbsp;</td>";

					tr_row += "</tr>";
					tr_row += "<tr style='border-left:1px solid  #0c0c0c;'>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>&nbsp;</td>";
					tr_row += "<td style='text-align:left;border-right:1px solid  #0c0c0c;' colspan=3>&nbsp;</td>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>&nbsp;</td>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>&nbsp;</td>";

					tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>&nbsp;&nbsp;</td>";
					tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>&nbsp;&nbsp;</td>";

					tr_row += "</tr>";
				}

				for (var i = 0; i < 10 - order_items.length; i++) {
					tr_row += "<tr style='border-left:1px solid  #0c0c0c;'>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>&nbsp;</td>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;' colspan=3>&nbsp;</td>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>&nbsp;</td>";
					tr_row += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>&nbsp;</td>";

					tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>&nbsp;&nbsp;</td>";
					tr_row += "<td style='text-align:right;border-right:1px solid  #0c0c0c;'>&nbsp;&nbsp;</td>";

					tr_row += "</tr>";
				}
				total_items = orderDetail.invoice.amountExcludingTax;
				s_gst_total = orderDetail.invoice.sgst_amount;
				c_gst_total = orderDetail.invoice.cgst_amount;
				inv_total = orderDetail.invoice.totalAmount;


				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
				tr_row += "<td  colspan='5' style='text-align:left;border-right:1px solid  #0c0c0c;font-weight:bold;'>Bank Details</td>";

				tr_row += "<td  colspan='2'  style='text-align:right;border-right:1px solid  #0c0c0c;font-weight:bold'>Before TAX &nbsp;&nbsp;</td>";
				tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;' class='cgstvalue'> " + formatNumber(total_items) + "&nbsp;&nbsp;</td>";

				tr_row += "</tr>";
				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
				tr_row += "<td  colspan='5' style='text-align:left;border-right:1px solid  #0c0c0c;font-weight:bold;'>SRI RAJARAJESWARI UPVC WINDOORS SYSTEMS</td>";

				tr_row += "<td  colspan='3' style='text-align:right;border-right:1px solid  #0c0c0c;font-weight:bold'>  &nbsp;&nbsp;</td>";

				tr_row += "</tr>";

				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
				tr_row += "<td  colspan='2' style='text-align:left;border-right:1px solid  #0c0c0c;'>Bank</td>";
				tr_row += "<td  style='text-align:left;border-right:1px solid  #0c0c0c;' class='companyBank' colspan=2> " + order_company['bankName'] + "</td>";
				tr_row += "<td  colspan='2'  style='text-align:right;border-right:1px solid  #0c0c0c;font-weight:bold;'>CGST A/C &nbsp;&nbsp;</td>";
				tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;'>9%</td>";
				tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;' class='cgstvalue'> " + formatNumber(s_gst_total) + "&nbsp;&nbsp;</td>";
				tr_row += "</tr>";

				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";

				tr_row += "<td  colspan='2' style='text-align:left;border-right:1px solid  #0c0c0c;'>Branch</td>";
				tr_row += "<td  style='text-align:left;border-right:1px solid  #0c0c0c;' class='companyBranch' colspan=2> " + order_company['bankBranch'] + "</td>"
				tr_row += "<td  colspan='2'  style='text-align:right;border-right:1px solid  #0c0c0c;font-weight:bold;'>SGST A/C &nbsp;&nbsp;</td>";
				tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;'>9%</td>";
				tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;' class='sgstvalue'> " + formatNumber(s_gst_total) + "&nbsp;&nbsp;</td>";
				tr_row += "</tr>";

				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";

				tr_row += "<td  colspan='2' style='text-align:left;border-right:1px solid  #0c0c0c;' >Acct No.</td>";
				tr_row += "<td  style='text-align:left;border-right:1px solid  #0c0c0c;' class='companyAcctNo' colspan=2> " + order_company['bankAccount'] + "</td>";

				//tr_row += "<td  rowspan='4' style='text-align:center;border-right:1px solid  #0c0c0c;'>GST As applicable at 18%</td>";
				tr_row += "<td  colspan='2' style='text-align:right;border-right:1px solid  #0c0c0c;font-weight:bold'>Rounded off &nbsp;&nbsp;</td>";
				tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;'>(+/-)</td>";
				tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;' class='gstvalue'> " + formatNumber(orderDetail.invoice.gstRounding) + "&nbsp;&nbsp;</td>";
				tr_row += "</tr>";

				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";;

				tr_row += "<td  colspan='2' style='text-align:left;border-right:1px solid  #0c0c0c;'>IFSC</td>";
				tr_row += "<td  style='text-align:left;border-right:1px solid  #0c0c0c;' class='ifsc_code' colspan=2>" + order_company['ifscCode'] + "</td>";
				tr_row += "<td   colspan='2'  style='text-align:right;border-right:1px solid  #0c0c0c;font-weight:bold'>Total Amount &nbsp;&nbsp;</td>";
				tr_row += "<td  style='text-align:right;border-right:1px solid  #0c0c0c;font-weight:bold;'>&nbsp;</td>";

				tr_row += "<td    style='text-align:right;border-right:1px solid  #0c0c0c;font-weight:bold;' class='totalvalue'>" + formatNumber(inv_total) + "&nbsp;&nbsp;</td>";
				tr_row += "</tr>";
				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
				tr_row += "<td colspan='8'  style='text-align:left;border-right:1px solid  #0c0c0c;'>Amount in Words: <br/><span id='amountinwords' style='text-transform:capitalize;'>" + inWords(orderDetail.invoice.totalAmount) + "</span></td>";

				tr_row += "</tr>";
				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
				//tr_row += "<td  style='text-align:center;border-right:1px solid  #0c0c0c;'></td>"; 
				tr_row += "</tr>";
				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
				tr_row += "<td colspan=4 style='text-align:center;border-right:1px solid  #0c0c0c;'> Terms & Conditions Apply</td>";
				tr_row += "<td  colspan=4   style='text-align:center;border-right:1px solid  #0c0c0c; border-botton:0px !important; font-weight:bold;'>SRI RAJARAJESWARI UPVC WINDOORS SYSTEMS</td>";
				tr_row += "</tr>";
				tr_row += "<tr style='border:1px solid  #0c0c0c;'>";
				tr_row += "<td  colspan=4  style='text-align:center;border-right:1px solid  #0c0c0c;'><img src='images/tree.png' style='height:50px'/>*Save Trees*&nbsp; <img src='images/tree.png' style='height:50px'/></td>";
				tr_row += "<td  colspan=4 style='text-align:center;border-right:1px solid  #0c0c0c;'><br/><br/><br/><br/>Authorised Signature</td>";
				tr_row += "</tr>";
				tr_row += "<tr></tr>";
				$("#invoiceAgg").html(tr_row);

			}

			var formatNumber = function (data) {
				return data.toLocaleString('en-IN', {
					maximumFractionDigits: 2,
					style: 'currency',
					currency: 'INR'
				});
			}

			var inWords = function (num) {
				if ((num = num.toString()).length > 9) return 'overflow';
				n = ('000000000' + num).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
				if (!n) return; var str = '';
				str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'crore ' : '';
				str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'lakh ' : '';
				str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'thousand ' : '';
				str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'hundred ' : '';
				str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'only ' : '';
				return str;
			}


		});
	</script>

	</html>