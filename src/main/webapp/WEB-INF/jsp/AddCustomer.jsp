<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer</title>
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/js/jquery/jquery-3.5.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/home"><img src="images/logo.png"
					style="height: 3rem; width: 10rem;" alt=""></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Home</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Order <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Add Order</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Find Order</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Customer <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="/AddCustomer">Add Customer</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="/SearchCustomer">Find Customer</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Stock <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Add New</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Find Stock</a></li>
						</ul></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div style="text-align: center; font-size: 39px;">Add Customer</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label>Customer Name</label> <input type="text" id="customer_name"
						name="customer_name" class="form-control" placeholder="Customer Name">
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label>Customer Contact</label> <input type="text"
						id="contactNumber" name="contactNumber" class="form-control"
						placeholder="Customer Contact">
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label>Customer Address</label> <input type="text" id="address"
						name="address" class="form-control" placeholder="Customer Address">
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label>Customer Email</label> <input type="email" id="email"
						name="email" class="form-control" placeholder="Customer Email">
				</div>
			</div>
		</div>
		<div class="form-group" style="text-align: center">
			<button id="submit_customer" class="btn btn-primary">Submit</button>
		</div>
	</div>
</body>
<script type="text/javascript">
$( document ).ready(function() {
    console.log( "ready!" );
    $("#submit_customer").on('click',function(){
    	var inputJson = {};
    	inputJson.name=$("#customer_name").val();
    	inputJson.contactNumber=$("#contactNumber").val();
    	inputJson.address=$("#address").val();
    	inputJson.email = $("#email").val();
    	
    	
    	$.ajax({
    		  type: "POST",
    		  url: "/post/customer/add",
    		  data: JSON.stringify(inputJson),
    		  dataType: "json",
    		  "contentType":"application/json",
    		  success: function(data){
    			 if(data != null) {
    				 if(data.status=="FAILURE"){
    					 alert("failure -->"+data.message);
    				 }else{
    					 alert("success -->"+data.error);
    					 window.location.reload();
    				 }
    			 }
    		  } ,
    		  error :function(data){
    			  alert(alert);
    		  }
    		});
    	
    	
    });
});


</script>
</html> --%>