<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
 <jsp:directive.include file="ScriptTags.jsp" />
 <style>
 
 
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.hero-image {
  background-image:  url("images/large_bg.jpg");
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
  margin-top
}

.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}

. 
 
 </style>
</head>
<body>
<jsp:directive.include file="Header.jsp" />
 
 <div class="hero-image">
  <div class="hero-text">
    <h1 style="font-size:50px;color:white !important;">SRR-UPVC</h1>
    <p style="color:white !important;">Invetory Home</p>
    <input type="button" id="lunchTo" class="btn btn-primary" value="Launch To Website"></input>
  </div>
</div>
 
</body>
<script type="text/javascript">
$("#homeId").addClass("active");
	$("#lunchTo").on('click',function(){
		window.open("https://srrupvc.com/","_blank");
	});
</script>
</html>