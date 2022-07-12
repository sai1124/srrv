<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Create</title>
<jsp:directive.include file="ScriptTags.jsp" />
</head>
<body>
<jsp:directive.include file="Header.jsp" />
	<div class="container">
		<div class="row" style="text-align: center">
			<div class="col-sm-12 col-md-12">
				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label id="fieldNameLabel">Add Unique Name</label> <input type="text"
							id="parentName"></input>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group" style="text-align: center">
			<button id="submitBtn" class="btn btn-primary">Create
				Profile</button>
		</div>
	</div>
</body>
<script type="text/javascript">
var serviceType = "${serviceType}";
var serviceUrl = "";
$(document).ready(function() {
	$("#"+serviceType+"parentId").addClass("active");
	if(serviceType.toUpperCase()=="profileType".toUpperCase()){
		fieldName = "Profile Type"; 
		serviceUrl = "/post/add/profile"
		}else if(serviceType.toUpperCase()=="productType".toUpperCase() ){
			fieldName = "Product Type"; 
			serviceUrl = "/post/add/product_type";
		}
	$("title").html("Add "+fieldName);
	$("#fieldNameLabel").html(fieldName+" : ");
	$("#submitBtn").html("Create "+fieldName);
	$("#submitBtn").on('click',function(){
		if($.trim($("#parentName").val())!=""){
			var childInput = {"name":$.trim($("#parentName").val()),"defaultValue":"Y"}
			$.ajax({
				type : "POST",
				url : serviceUrl,
				data : JSON.stringify(childInput),
				dataType : "json",
				"contentType" : "application/json",
				success : function(data) {
					if (data != null) {
						if (data.status == "FAILURE") {
							alert("failure -->" + data.message);
						} else {
								 alert("SUCCESS");
								 window.location.reload();
						}
					}
				},
				error : function(data) {
					alert(alert);
				}
			});
		}else{
			alert("Please provide profile name");
		}
		


	});	
});

</script>
</html>