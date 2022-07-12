<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>

<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/jquery.dataTables.min.css">
<!-- <link rel="stylesheet" href="/css/editor.dataTables.min.css">
<link rel="stylesheet" href="/css/select.dataTables.min.css"> -->
<link rel="stylesheet" href="/css/jquery-ui.css"> 
<link rel="stylesheet" href="/css/font-awesome.min.css">

<script src="/js/jquery/jquery-3.5.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/js/jquery/jquery.dataTables.min.js"></script>
<script src="/js/jquery/jquery-ui.js"></script>
<style>
/*author:starttemplate*/
/*reference site : starttemplate.com*/
body {
  
  
  -webkit-font-smoothing: antialiased;
  font: normal 14px Roboto,arial,sans-serif;
 }
.row{

background-image:url('images/bg-logo.jpg');
  background-position:center;
  background-size:cover;
}
.container {
    padding-left: 110px;
    padding-right: 110px;
}
::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
    color: #ffffff!important;
    opacity: 1; /* Firefox */
    font-size:18px!important;
}
.form-login {
    background-color: rgba(0,0,0,0.55);
    padding-top: 10px;
    padding-bottom: 20px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 15px;
    border-color:#d2d2d2;
    border-width: 5px;
    color:white;
    box-shadow:0 1px 0 #cfcfcf;
}
.form-control{
    background:transparent!important;
    color:white!important;
    font-size: 18px!important;
}
h1{
    color:white!important;
}
h4 { 
 border:0 solid #fff; 
 border-bottom-width:1px;
 padding-bottom:10px;
 text-align: center;
}

.form-control {
    border-radius: 10px;
}
.text-white{
    color: white!important;
}
.wrapper {
    text-align: center;
}
.footer p{
    font-size: 18px;
}
* {box-sizing: border-box;}

body { 
  margin: 0;
   }

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}
 

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
   
}
</style>
</head>
<body>

<!------ Include the above in your HEAD tag ---------->
<!-- 
<div class="row header">
<div class="col-md-4 col-sm-4"><a href="#" class="logo">CompanyLogo</a></div>
  <div class="col-md-6 col-sm-6">
    <a>Sri RajaRajeswari UPVC Windoor Systems</a>
     
  </div>
</div>
<div class="main row" >
	<div class="col-md-4 col-sm-4">&nbsp;</div>
	<div class="col-md-4 col-sm-4">
		<div class="login-form" style="padding-top:30%">
			<form action="/login" method="post" >
				<div class="form-group">
					<label>User Name</label> <input type="text" class="form-control" name="username"
						placeholder="User Name">
				</div>
				<div class="form-group">
					<label>Password</label> <input type="password" name="password" class="form-control"
						placeholder="Password">
				</div>
				<br/>
				<input name="_csrf" type="hidden" value="${_csrf.getToken()}">
				<div class="form-group" style="text-align: center">
				<button type="submit" class="btn btn-primary">Login</button>
				</div>
				
				
			</form>
		</div>
	</div>
	<div class="col-md-4 col-sm-4">&nbsp;</div>
</div>
-->

<div class="container">
    <div class="row">
    <div class="col-md-8 test">
    </div>
        <div class="col-md-offset-9 col-md-4 text-center">
            <h1 class='text-white'>Unique Login Form</h1>
              <form class="form-login" action="/login" method="post"><br>
                <h4>Secure Login</h4>
                <br></br>
                <input type="text" id="username"  name="username" class="form-control input-sm chat-input" placeholder="username"/>
                <br></br><br></br>
                <input type="password" id="password" name="password" class="form-control input-sm chat-input" placeholder="password"/>
                <br></br><br></br>
                <input name="_csrf" type="hidden" value="${_csrf.getToken()}">
                <div class="wrapper">
                        <span class="group-btn">
                            <button type="submit" class="btn btn-danger btn-md">login <i class="fa fa-sign-in"></i></button>
                        </span>
                </div>
            </form>
        </div>
    </div>
    <br></br><br></br><br></br>
    <!--footer-->
    <div class="footer  text-center">
        <p>© 2020 Login Form. All rights reserved</p>
    </div>
    <!--//footer-->
</div>
</body>
</html> 