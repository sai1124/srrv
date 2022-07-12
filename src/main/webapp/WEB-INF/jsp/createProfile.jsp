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
		<div class="row" style="text-align: center">
			<div class="col-sm-12 col-md-12">
				<div class="col-sm-3 col-md-4">
					<div class="form-group">
						<label>Add Unique Name</label> <input type="text"
							id="profile_name"></input>
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
$(document).ready(function() {
	$("#createprofileid").addClass("active");
	$("#submitBtn").on('click',function(){
		if($.trim($("#profile_name").val())!=""){
			var profileType = {"name":$.trim($("#profile_name").val()),"defaultValue":"Y"}
			$.ajax({
				type : "POST",
				url : "/post/add/profiles",
				data : JSON.stringify([profileType]),
				dataType : "json",
				"contentType" : "application/json",
				success : function(data) {
					if (data != null) {
						if (data.status == "FAILURE") {
							alert("failure -->" + data.message);
						} else {
								 alert("SUCCESS");
								 window.location.href="/upload?serviceType=modelRate&parentId="+data[0].id;
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