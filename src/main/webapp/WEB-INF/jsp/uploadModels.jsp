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
						<label>Select Profile</label>  
					</div>
				</div>
			 <div class="col-sm-3 col-md-4">
					<div class="form-group">
						  <select class="form-control"
							id="profile_type_id" name="profile_type_id"></select>
					</div>
				</div>
		</div>
		<div class="row" style="text-align: center">
			 
				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label>Upload Model Rate</label> <span id="sampleFile" class="fa fa-info-circle"  title="click to download sample file."></span>
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
var profileList = ${profileList};
var profile_type_id= ${profile_type_id}+"";
$(document).ready(function() {
	$("#uploadModelsId").addClass("active");
	$("#profile_type_id").append($('<option value="">Select One</option>'));
	for(var i=0;i<profileList.length;i++){
		
		$("#profile_type_id").append($('<option></option>').val(profileList[i].id).html(profileList[i].name));
		 
	} 
	if(profile_type_id)
	$("#profile_type_id").val(profile_type_id);
	$("#submitBtn").on('click',function(){
		if($("#profile_type_id").val()!="" && $('#filename')[0].files[0] != undefined){
			 var formData = new FormData();
			formData.append('file', $('#filename')[0].files[0]);
			formData.append('to',"modelRate");
			formData.append('parentId',$("#profile_type_id").val());
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
			if($("#profile_type_id").val()=="")
			alert("Please provide profile name");
			if( $('#filename')[0].files[0] == undefined)
				alert("Please provide model rate file");
		}
		


	});	
	$("#sampleFile").on('click',function(){
		window.open("/sample/model_rate.csv","_blank");
	});
});

</script>
</html>