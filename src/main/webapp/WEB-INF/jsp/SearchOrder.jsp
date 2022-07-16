<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Customer</title>
 <jsp:directive.include file="ScriptTags.jsp" />
</head>
<body>
<jsp:directive.include file="Header.jsp" />
	 <div style="text-align: center; font-size: 39px;">Search Order</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-md-3" style="display: none;">
				<div class="form-group">
					<label>Order Number</label> <input type="text"
						id="order_number" name="order_number"
						class="form-control" placeholder="Order Number">
				</div>
			</div>

			<div class="col-sm-3 col-md-3">
				<div class="form-group">
					<label>Order Date</label> <input type="text" id="order_date_range"
						name="order_date_range" class="form-control" placeholder="DD/MM/YYYY-DD/MM/YYYY">
				</div>
			</div>
			<div class="col-sm-3 col-md-3" style="display: none;">
				<div class="form-group">
					<label>Due Date</label> <input type="text" id="due_date_range"
						name="due_date_range" class="form-control" placeholder="DD/MM/YYYY-DD/MM/YYYY">
				</div>
			</div>

			<div class="col-sm-3 col-md-3" >
				<div class="form-group">
					<label>Order Date last</label> <select id="last_date_range" class="form-control"
						name="last_date_range">
						<option value="ALL">ALL</option>
						<option value=7>7</option>
						<option value=15>15</option>
						<option value=30>30</option>
						<option value=60>60</option>
						</select>
				</div>
			</div>

			<div class="col-sm-3 col-md-3">
				<div class="form-group">
					<label>Customer Number</label> <input type="text"
						id="contact_number" name="contact_number" class="form-control"
						placeholder="XXX XXX XXXX">
				</div>
			</div>

			<div class="col-sm-3 col-md-3">
				<div class="form-group">
					<label>Customer Name</label> <input type="text" id="customer_name"
						name="customer_name" class="form-control"
						placeholder="Customer Name">
				</div>
			</div>
			
			<div class="col-sm-3 col-md-3">
					<div class="form-group">
						<label>Status</label> <br /> <select id="status"
							class="form-control">
							<option value="">ALL</option>
							<option value="NO_INVOICE_GENERATED">NO_INVOICE_GENERATED</option>
							<option value="NO_INVOICE_REQUIRED">NO_INVOICE_REQUIRED</option>
							<option value="INVOICE_GENERATED">INVOICE_GENERATED</option>
							<option value="ORDER_NOT_REQUIRED">ORDER_NOT_REQUIRED</option>
						</select>
					</div>
				</div>
		</div>
		<div class="form-group" style="text-align: center">
			<button id="searchBtn" class="btn btn-primary">Search</button>
			<button id="clearBtn" class="btn btn-secondary">Clear</button>
		</div>
	</div>

	<table id="myTable" class="display nowrap" style="width: 100%">

	</table>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchorderId").addClass("active");
		 
		$("#order_date_range").daterangepicker({
		    opens: 'left',
		      locale: {
		          cancelLabel: 'Clear',
		          format: 'DD/MM/YYYY'
		      }
		  }, function(start, end, label) {
		    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		  });
		 $('#order_date_range').on('cancel.daterangepicker', function(ev, picker) {
		      $(this).val('');
		  });
		
		$("#due_date_range").daterangepicker({
		    opens: 'left',  
		      locale: {
		          cancelLabel: 'Clear'
		      }
		  }, function(start, end, label) {
		    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		  });
		 $('#due_date_range').on('cancel.daterangepicker', function(ev, picker) {
		      $(this).val('');
		  });
		$("#order_date_range").val('');
		 $("#due_date_range").val('');
		 
		$("#clearBtn").on('click',function(){
			 $("#customer_name").val('');
			 $("#contactNumber").val('');
			 $("#order_date_range").val('');
			 $("#due_date_range").val('');
			 $("#customer_order_id").val('');
			 $("#status").val(null);

		});

		var dataSet = [];
		$('#myTable').DataTable({
			dom : "Bfrtip",
			data : [],
			buttons: [
	             'excel' 
	        ],
			columns : [

			{
				title : "Customer Order ID",
				data : "orderId",
				visible:false
			},{
				title : " Status",
				data : "status"
			}, {
				title : "Cust Name",
				data : "customerName"
			}, {
				title : "Cust Number",
				data : "contactNumber"
			}, {
				title : "Order Date",
				data : "orderDate",
				className : "text-center",
				render : function(data, type, row) {
					return defaultDateFormat(data); 
				}
			} , {
				title : "Order Due Date",
				data : "dueDate",
				className : "text-center",
				visible : false,
				render : function(data, type, row) {
					return defaultDateFormat(data); 
				}
			}, {
				title : "Order Amt",
				data : "orderAmount",
				className : "text-right",
				render : function(data, type, row) {
					return formatNumber(data);
				}
			},{
				title : "Bal Amt",
				data : "balanceAmount", 
				className : "text-right",
				render : function(data, type, row) {
					return formatNumber(data);
				}
			},{
				title : "Inv Num",
				data : "invoiceNum",
				className : "text-left" 
			},{
				title : "Inv Amt",
				data : "invoiceAmount",
				className : "text-right",
				render : function(data, type, row) {
					return formatNumber(data);
				}
			},
			{
				title : "Action",
				"render" : function(data, type, row) {
					console.log("row");
					console.log(row);
					var img='<img class="edit-item-row" style="cursor:pointer" src="../images/edit.png" title="Edit Order"/>';
					if(row.invoiceId != null) {
						img= img+' &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<img class="edit-inv-entry" src="../images/info.png" title="Edit Invoice"/> ';
						img= img+' &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<img class="delete-item-row" src="../images/printer.png" title="Print Invoice"/> ';
					}
					return img;
				}
			}
			],
			"rowCallback": function (row, data, index) {
				if (data.status == "NO_INVOICE_GENERATED" || data.status == "NEW") {
					$('td', row).css('background-color', 'yellow');
				}
				else if (data.status == "NO_INVOICE_REQUIRED") {
					$('td', row).css('background-color', 'Orange');
				}
				else if (data.status == "INVOICE_GENERATED") {
					$('td', row).css('background-color', 'lightseagreen');
				}
				else if (data.status == "ORDER_NOT_REQUIRED") {
					$('td', row).css('background-color', 'Red');
				}
			}
		});

		var table = $('#myTable').DataTable();

		/* $('#myTable tbody').on('click', 'tr', function() {
			var data = table.row(this).data();
			window.open("/editorder?orderId="+data.orderId,"_blank");
		}); */
		var defaultDateFormat = function(data) {
			var curr = data.split("T")[0];
			var parsed = curr.split("-");
			return parsed[2] + "/" + parsed[1] + "/"
					+ parsed[0];
		}
		var formatNumber = function(data) {
			var num = 0;
			if(data != null) {
				num = data;
			}
			return num.toLocaleString('en-IN', {
				maximumFractionDigits : 2,
				style : 'currency',
				currency : 'INR'
			});
		}
		
		$("#searchBtn").on('click', function() {

			var inputJson = {};
			
			//inputJson.orderNum = $("#order_number").val()  != '' ? ;
			if($("#customer_name").val() != '') {
				inputJson.customerName = "%"+$("#customer_name").val()+"%";
			}
			
			inputJson.contactNumber = $("#contactNumber").val() != '' ? $("#contactNumber").val() : null;
			//inputJson.orderDate = $("#order_date").val();
			//inputJson.orderId = $("#customer_order_id").val();
			if($("#order_date_range").val() !='') {
				var orderStartDate = $("#order_date_range").val().split(" - ")[0];
				//orderStartDate = orderStartDate.split("/")[1]+"/"+orderStartDate.split("/")[0]+orderStartDate.split("/")[2];
				var orderEndDate = $("#order_date_range").val().split(" - ")[1];
				//orderEndDate = orderEndDate.split("/")[1]+"/"+orderEndDate.split("/")[0]+orderEndDate.split("/")[2];
				inputJson.orderStartDate = orderStartDate;
				inputJson.orderEndDate = orderEndDate;
			}
			if($("#status").val() != '' || $("#status").val() != null) {
				inputJson.status = $("#status").val();
			}
			
			if($("#last_date_range").val()!='ALL') {
				var today = new Date();
				var priorDate = new Date(new Date().setDate(today.getDate() - parseInt($("#last_date_range").val())));
				inputJson.orderEndDate = formatDateStr(today);
				inputJson.orderStartDate = formatDateStr(priorDate);
			}
			table.clear();
			table.draw();
			$.ajax({
				type : "POST",
				url : "/post/find/Order",
				data : JSON.stringify(inputJson),
				dataType : "json",
				"contentType" : "application/json",
				success : function(data) {
					if (data != null) {
						if (data.status == "FAILURE") {
							alert("failure -->" + data.message);
						} else {
							dataSet = data.records != null ? data.records :[];
							table.rows.add(dataSet);
							table.draw();
						}
					}
				},
				error : function(data) {
					alert(alert);
				}
			});

			table = $('#myTable').DataTable();
		}); 

		var formatDateStr = function(today) {
			var yyyy = today.getFullYear();
				let mm = today.getMonth() + 1; // Months start at 0!
				let dd = today.getDate();

				if (dd < 10) dd = '0' + dd;
				if (mm < 10) mm = '0' + mm;

				return dd + '/' + mm + '/' + yyyy;
		}
		$('#myTable tbody').on('click','.edit-item-row',function() {
			var table = $('#myTable').DataTable();
			var data = table.row(this.parentElement.parentElement).data();
			window.location.href ="/editorder?orderId="+data.orderId;
		});

		$('#myTable tbody').on('click','.delete-item-row', function() {
					var table = $('#myTable').DataTable();
					var data = table.row(this.parentElement.parentElement).data(); 
					if(data.invoiceId != null) {
						var url ="/GenerateInvoice?orderId="+data.orderId+"&invoiceId="+data.invoiceId;
						window.open(url,"_blank");
					}else {
						alert("Invoice not created");
					}
		});
		$('#myTable tbody').on('click','.edit-inv-entry', function() {
			var table = $('#myTable').DataTable();
			var data = table.row(this.parentElement.parentElement).data(); 
			if(data.invoiceId != null) {
				window.location.href ="/Invoice?orderId="+data.orderId;	
			}else {
				alert("Invoice not created");
			}
});
		
	});
</script>
</html>