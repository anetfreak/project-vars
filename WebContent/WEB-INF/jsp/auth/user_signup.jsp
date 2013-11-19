<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>VARS</title>

<script type="text/javascript" src="js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap-responsive.min.css">
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.min.js"></script>

<script type="text/javascript"> $(document).ready(function(){ $("#subForm").validate(); }); </script>
<script src="http://jquery.bassistance.de/validate/additional-methods.js"></script>
<script type="text/javascript">

function checkPasswordMatch(){
//var checkPasswordMatch = function() {
    var password = $("#passwordInput").val();
    var rePassword = $("#reEnterPasswordInput").val();
	
    if (password != rePassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else{
        $("#divCheckPasswordMatch").html("Passwords match.");  
    }
}

$(document).ready(function () {
	result = $("reEnterPasswordInput").keyup(checkPasswordMatch);
   
   $('#signup').click(function(event) {
	   
   		alert('High alert');
	   var fname = $('#firstNameInput').val();
	   var lname = $('#lastNameInput').val();
	   var email = $('#emailInput').val();
	   var password = $('#passwordInput').val();
	   var userType = $('#userTypeInput').val();
	   
		$.ajax({
			url : "signup.htm",
		    type: "POST",
		    data : "fname=" + fname + "&lname=" + lname + "&email=" + email + "&password=" + password + "&userType=" + userType,
		    success:function(data, textStatus, jqXHR){
		    	window.location.href="hello.htm";
		    },
		    error: function(jqXHR, textStatus, errorThrown){
		    	alert("Could not process request.. " + errorThrown);
		    }
		});
	   
   });
});
</script>
<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>
</head>
<body>
	<div id="header">
		<div class="navbar">
			<div class="navbar-inner">
				<a class="brand" href="#"><span style="color: black;">MakeItUsable!</span></a>
				<ul class="nav">
					<li><a href="hello.htm">Home</a></li>
					<li class="divider-vertical"></li>
					<li><a href="#">Link</a></li>
					<li class="divider-vertical"></li>
					<li><a href="#">Link</a></li>
				</ul>
			</div>
		</div>
	</div>
	
				
	<div id="container" style="padding-top: 40px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2">
						<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
					</ul>
				</div>
					<div class="tab-content">
						<div class="tab-pane active" id="NewUserSignUp">
						<form action="" method="post" id="subForm">
							<table>
								<!--Body content-->
								<tr>
  									<h2>Create an account here</h2>
								</tr>
								<tr>
									<td><h2 class="label label-primary">First Name</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="firstNameInput" class="required" placeholder="First Name">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Last Name</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="lastNameInput" class="required" placeholder="Last Name">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Email</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="email" id="emailInput" class="required email" placeholder="Email ID">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Password</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="password" id="passwordInput" name="passwordInput" class="required" placeholder="Password">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Re-enter Password</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="password" id="reEnterPasswordInput" name="reEnterPasswordInput" class="required" placeholder="Re-enter Password" onChange="checkPasswordMatch();">
										</div></td>
									<td><div class="registrationFormAlert" id="divCheckPasswordMatch"></div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">You are a</h2></td>
									<td></td>
									<td><div class="col-lg-6">
   											 <div class="input-group">
      											<span class="input-group-addon">
        											<input name="userTypeInput" id="userTypeInput" type="radio" class="required">
      											</span>
      											<h2 class="label label-primary">Project Owner</h2>
      											
      											<input name="userTypeInput" id="userTypeInput" type="radio" class="required">
      											</span>
      											<h2 class="label label-primary">Tester</h2>
    										</div><!-- /input-group -->
  										</div><!-- /.col-lg-6 --></td>
								</tr>
								<tr></tr>
								<tr>
									<td></td>
									<td></td>
									<td><div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default" id="signup">Sign Up</button>
								</div></td>
								</tr>
							</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	

	<div id="footer"></div>

</body>
</html>