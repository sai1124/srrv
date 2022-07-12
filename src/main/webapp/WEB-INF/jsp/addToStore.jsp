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

.grid-container {
	display: grid;
	grid-template-columns: auto auto;
	padding: 10px;
}

.grid-item {
	background-color: rgba(255, 255, 255, 0.8);
	border: 1px solid rgba(0, 0, 0, 0.8);
	padding: 20px;
	text-align: center;
	width: 100%;
}

@media print {
	footer {
		page-break-before: always;
	}
}
</style>
<script type="text/javascript"> 
	var userName = "${userName}";
</script>
</head>
<body>
<jsp:directive.include file="Header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-md-6">
				<div class="form-group">

					<label>Product Type</label> <br /> <select id="productTypeId"
						class="form-control"></select>
				</div>
			</div>
			<div class="col-sm-3 col-md-6">
				<div class="form-group">

					<label>Product Name</label> <br /> <select id="productMasterId"
						class="form-control"></select>
				</div>
			</div>
			<div class="col-sm-3 col-md-6">
				<div class="form-group">
					<label>Order Date</label> <input type="text" id="orderDate"
						name="orderDate" class="form-control" placeholder="DD/MM/YYYY">
				</div>
			</div>
			<div class="col-sm-3 col-md-6">
				<div class="form-group">
					<label>No of QTY</label> <input type="number" id="quantity"
						name="quantity" class="form-control">
				</div>
			</div>
		</div>
	</div>
	<div class="form-group" style="text-align: center">
			<button id="submitBtn" class="btn btn-primary">Submit</button> 
		</div>
</body>
<script type="text/javascript">

$("#addToStoreId").addClass("active");

	var productTypes = ${productTypes};
	var productMaps = {};
	var elements = ["quantity","orderDate","productTypeId","productMasterId"];
	var elementDesc = {"quantity":"No of QTY",
			"orderDate":"Order Date",
			"productTypeId":"Product Type",
			"productMasterId":"Product Name"  
};
	$(document).ready(function() {
		$("#productTypeId").append($('<option value="">Select One</option>'));
		 $.each(productTypes,function(index,productType){
			 productMaps[productType["id"]] = productType["masters"];
			 $("#productTypeId").append($('<option></option>').val(productType.id).html(productType.name));
		 });
		 
		 $("#productTypeId").on('change',function(){
			var productTypeVal =  $("#productTypeId").val();
			console.log(productTypeVal);
			$("#productMasterId").empty();
			$("#productMasterId").append($('<option value="">Select One</option>'));
			if(productTypeVal !=""){
				var masters = productMaps[productTypeVal];
				console.log(masters);
				 $.each(masters,function(index,master){
					 $("#productMasterId").append($('<option></option>').val(master.id).html(master.codeDesc+" - "+master.code));
				 });
			}
		 });
		 
		 $("#orderDate").datepicker({
				dateFormat : 'dd/mm/yy',//check change
				changeMonth : true,
				changeYear : true
			});
		console.log("productTypes" + productTypes);
		
 		$("#orderDate").datepicker("setDate",new Date());
 		console.log("ready!");
		$("#submitBtn").on('click', function() {
			var orderDetail = {};
			 

			for(var i=0;i<elements.length;i++){
				var element = "#"+elements[i];
				orderDetail[elements[i]]= $(element).val();	
				if( $(element).val() =="" && elementDesc[elements[i]] !=null){
				alert(elementDesc[elements[i]]+" is empty");
				return true;
				}
			} 
			
		  	orderDetail["createdBy"] =userName;	
		  	console.log(orderDetail);
 		  $.ajax({
				type : "POST",
				url : "/post/create/StockIn",
				data : JSON.stringify(orderDetail),
				dataType : "json",
				"contentType" : "application/json",
				success : function(data) {
					if (data != null) {
						if (data.status == "FAILURE") {
							alert("failure -->" + data.message);
						} else {
							alert("success -->" + data.message);
							window.location.reload()
						}
					}
				},
				error : function(data) {
					alert(data);
				}
			}); 
 
		}); 
	});
</script>
</html>