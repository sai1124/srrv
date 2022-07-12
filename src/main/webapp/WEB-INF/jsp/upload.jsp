<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Create Profile</title>
<jsp:directive.include file="ScriptTags.jsp" />
</head>
<body>
<jsp:directive.include file="Header.jsp" />

	<div class="container">
	<form id="inputForm"  name="inputForm">
		<div class="row" style="text-align: center">
			 
				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label id="parentLabel">Select Profile</label>  
					</div>
				</div>
			 <div class="col-sm-3 col-md-4">
					<div class="form-group">
						  <select class="form-control"
							id="parentId" name="parentId"></select>
					</div>
				</div>
		</div>
		<div class="row" style="text-align: center">
			 
				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label id="uploadFilelabel"></label> <span id="sampleFile" class="fa fa-info-circle"  title="click to download sample file."></span>
					</div>
				</div> 
				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						 <input type="file"  class="form-control"
							id="filename" name="filename" ></input>
					</div>
				</div> 
		</div>
		</form>
		<div class="form-group" style="text-align: center">
			<button id="submitBtn" class="btn btn-primary">Create
				Profile</button>
		</div>
	</div>
</body>
<script type="text/javascript">
var parentList = ${parentList};
var parentId= ${parentId}+"";
var serviceType = "${serviceType}";
var fieldName = "";
var uploadName= "";
var uploadType = "";
var sampleFileUrl="";
$(document).ready(function() {
	$("#"+serviceType+"Id").addClass("active");
	if(serviceType.toUpperCase()=="modelRate".toUpperCase()){
	fieldName = "Profile Type";
	uploadName= "Model Rate";
	uploadType = "modelRate";
	sampleFileUrl ="/sample/model_rate.csv";
	}else if(serviceType.toUpperCase()=="ProductMaster".toUpperCase() ){
		fieldName = "Product Type";
		uploadName= "Product Master";
		uploadType = "ProductMaster";
		sampleFileUrl ="/sample/product_master.csv";
	}
	window.location.title = "Upload "+uploadName;
	$("title").html("Upload "+uploadName);
	$("#uploadFilelabel").html( "Upload "+uploadName );
	$("#parentLabel").html(fieldName);
	$("#parentId").append($('<option value="">Select One</option>'));
	for(var i=0;i<parentList.length;i++){
		
		$("#parentId").append($('<option></option>').val(parentList[i].id).html(parentList[i].name));
		 
	} 
	if(parentId)
	$("#parentId").val(parentId);
	$("#submitBtn").on('click',function(){
		if($("#parentId").val()!="" && $('#filename')[0].files[0] != undefined){
			 var formData = new FormData();
			formData.append('file', $('#filename')[0].files[0]);
			formData.append('to',uploadType);
			formData.append('parentId',$("#parentId").val());
			$.ajax({
				type : "POST",
				url : "/post/convert/Object",
				data : formData, 
				  processData: false,
				    contentType: false,
				success : function(data) {
					if (data != null) {
						if (data.status == "FAILURE") {
							alert("failure -->" + data.message);
						} else {
								 alert("SUCCESS");
								 window.location.href="/home";
						}
					}
				},
				error : function(data) {
					alert(alert);
				}
			});
		}else{
			if($("#parentId").val()=="")
			alert("Please provide "+fieldName);
			if( $('#filename')[0].files[0] == undefined)
				alert("Please provide file" +uploadName);
		}
		


	});	
	$("#sampleFile").on('click',function(){
		window.open(sampleFileUrl,"_blank");
	});
});

</script>
</html>