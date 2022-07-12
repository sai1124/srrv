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

#mockRateDiv tr{
height:30px;
}


#mockRateDiv td{
padding:0px !important;
}
</style>
<script type="text/javascript">
	var orderId = "${orderId}";
	var userName = "${userName}";
</script>
</head>
<body>
	<jsp:directive.include file="Header.jsp" />
	<div style="text-align: center; font-size: 39px;">${type}-Order</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-9">
				<div class="col-sm-3 col-md-4" id="orderIdDiv">
					<div class="form-group">
						<label>Customer Order Id</label> <input type="text" id="orderId"></input>
						<input type="hidden" id="createdBy"></input>
					</div>
				</div>
<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label>Order Date</label> <input type="text" id="orderDate"
							name="orderDate" class="form-control" placeholder="DD/MM/YYYY">
					</div>
				</div>
				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label>Customer Name</label> <input type="text" id="customerName"
							name="customerName" class="form-control"
							placeholder="Customer Name">
					</div>
				</div>
				
				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label>Customer Number</label> <input type="text"
							id="contactNumber" name="contactNumber" class="form-control"
							placeholder="XXX XXX XXXX">
					</div>
				</div>
<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label>Customer Address</label> <input type="text"
							id="customerAddress" name="customerAddress" class="form-control" >
					</div>
				</div>
<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label>Email</label> <input type="text"
							id="email" name="email" class="form-control" >
					</div>
				</div>

				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label>No Of Windows</label> <input type="number" id="noWindow"
							name="noWindow" class="form-control">
					</div>
				</div>


				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label>No Of Doors</label> <input type="number" id="noDoors"
							name="noDoors" size="3" class="form-control">
					</div>
				</div>

				<div class="col-sm-3 col-md-4">
					<div class="form-group">

						<label>Profile Name</label> <br /> <select id="profile_type_id"
							class="form-control"></select>
					</div>
				</div>

				
				<div class="col-sm-3 col-md-4" style="display:none">
					<div class="form-group">
						<label>Order Status</label> <br /> <select id="status"
							class="form-control">
							<option value="NEW">NEW</option>
							<option value="INPROGRESS">INPROGRESS</option>
							<option value="PENDING">PENDING</option>
							<option value="COMPLETED">COMPLETED</option>
						</select>
					</div>
				</div>
				
				
				<div class="col-sm-3 col-md-4" style="display:none">
					<div class="form-group">
						<label>Adv Amount</label> <input type="number" id="paidAmount"
							name="paidAmount" class="form-control">
					</div>
				</div>
				<div class="col-sm-3 col-md-4" style="display:none">
					<div class="form-group">
						<label>Payment Type</label> <br /> <select id="paymentType"
							class="form-control">
							<option value="CASH">CASH</option>
							<option value="CHEQUE">CHEQUE</option>
						</select>
					</div>
				</div>
			</div>

			<div class="col-sm-3 col-md-3" >
				 
				<table id="mockRateDiv"></table>
			</div>
		</div>
	 
	
		<div class="form-group" style="text-align: center">
			<button id="submitBtn" class="btn btn-primary">Generate Order</button> 
		</div>
	</div>
 
</body>
<script type="text/javascript">
	var profileType = ${profileType};
	var orderDetail = {};
	var profileTypeMap = {};
	var itemMap ={};
	var elements = ["orderId","customerName","customerAddress","orderDate","profile_type_id","contactNumber","noWindow","noDoors","status","quotationAmount","paidAmount","balanceAmount","paymentType","email","createdBy"];
	var item_elements = ["itemId","order","width","height","glassType","cost","model_rate_id","name","id"];
	var totalItems = 0;
	var elementDesc = {"customerName":"Customer Name",
			"customerAddress":"Customer Address",
			"profile_type_id":"Profile Name",
			"contactNumber":"Contact Number",
			"noWindow":"No of Windows",
			"noDoors":"No of Doors" 
};
	$(document).ready(function() {
		$("#addorderId").addClass("active");
		if (orderId == "") {
			$("#orderIdDiv").hide();
		}
		
		$("#profile_type_id").append($('<option value="">Select One</option>'));
		for(var i=0;i<profileType.length;i++){
			$("#profile_type_id").append($('<option></option>').val(profileType[i].id).html(profileType[i].name));
			profileTypeMap[profileType[i]["id"]] = profileType[i];
		} 
		
		$("#orderDate").datepicker({
			dateFormat : 'dd/mm/yy',//check change
			changeMonth : true,
			changeYear : true
		});

		$("#clearBtn").on('click', function() {
			for(var i=0;i<elements.length;i++){
				var element = "#"+elements[i];
				$(element).val(orderDetail[elements[i]]);
			}

		});
 			
			$("#profile_type_id").on("change",function(){
				try{
					var models = profileTypeMap[$("#profile_type_id").val()].models;
					 console.log(models);
					 $("#mockRateDiv").empty();
					 
					 var tableContent =("<thead><tr>   <th colspan=2>Model Rate Info(Rs)</th></tr> <tr><th>Name</th><th>Rate</th></tr></thead><tbody>");
					 $.each(models,function(index,model){
						 tableContent =tableContent+("<tr><td ><div style='    width: 150px;'>"+model.name+"</div></td><td  ><input type='number' style='    width: 70px;' size='4' data-name='"+model.name+"' value='"+model.rate+"'></input></td></tr>");
					 });
					 tableContent =tableContent+"</tbody>";
					 $("#mockRateDiv").append(tableContent);
					 var table;
					 if ( $.fn.dataTable.isDataTable( '#mockRateDiv' ) ) {
						    table = $('#mockRateDiv').DataTable();
						}
						else {
						    table = $('#mockRateDiv').DataTable( {
						    	"paging":   false,
						        "ordering": false,
						        "info":     false,
						        "bFilter": false,
						        "columns": [
							        { "width": "70%" },
							        { "width": "30%" }
							        ]
						    } );
						}
					 table.DataTable( {
					        "paging":   false,
					        "ordering": false,
					        "info":     false,
					        "bFilter": false,
					        "columns": [
						        { "width": "70%" },
						        { "width": "30%" }
						        ]
					  } );					
				}catch(e){}
				
				
			});
 		$("#orderId").attr("disabled",true); 
		$("#orderDate").datepicker("disable");
 		$("#orderDate").datepicker("setDate",new Date());
 		console.log("ready!");
		$("#submitBtn").on('click', function() {
			var orderDetail = {};
			 

			for(var i=0;i<elements.length;i++){
				var element = "#"+elements[i];
				orderDetail[elements[i]] = $(element).val();
				if( $(element).val() =="" && elementDesc[elements[i]] !=null){
				alert(elementDesc[elements[i]]+" is empty");
				return true;
				}
			}
			
			
			 var models = [];
			 var modelIds = $("#mockRateDiv input");
			 
			 for( var i =0 ;i<modelIds.length;i++){
				 var model ={};
				 model["name"]= modelIds[i].dataset.name;
				 model["rate"]= modelIds[i].value;
				 if(modelIds[i].value ==""){
						alert(modelIds[i].dataset.name+" is empty");
						return true;
				}
				 models.push(model);
			 }
			orderDetail["profileType"]= {"name":$("#profile_type_id option:selected").text(),"models":models};
			orderDetail["createdBy"] =userName;	
			orderDetail["quotationAmount"] = 0;
			console.log(orderDetail);
			orderDetail.quotationAmount =  0;
			orderDetail.modifiedBy = userName; 
			console.log(orderDetail);
 		$.ajax({
				type : "POST",
				url : "/post/create/Order",
				data : JSON.stringify(orderDetail),
				dataType : "json",
				"contentType" : "application/json",
				success : function(data) {
					if (data != null) {
						if (data.status == "FAILURE") {
							alert("failure -->" + data.message);
						} else {
 							orderDetail=data.records[0];
 							window.location.href = ("/editorder?orderId="+orderDetail.orderId);
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