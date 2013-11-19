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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript" src="http://platform.linkedin.com/in.js">
  api_key: 75wgepnpou4y46
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#login').click(function(event) {
			//Validate email
			if(validEmail()) {
				var email = $('#email').val();
				var password = $('#password').val();
				$.ajax({
					url : "login.htm",
				    type: "POST",
				    data : "email=" + email + "&password=" + password,
				    success:function(data, textStatus, jqXHR){
				    	window.location.href="hello.htm";
				    },
				    error: function(jqXHR, textStatus, errorThrown){
				    	alert("Could not process request.. " + errorThrown);
				    }
				});
			}
		});
		
		var validEmail = function() {
			var email = $('#email');
			var EMAIL_PATTERN = /^([a-zA-Z0-9_\-\.]+([+])?[a-zA-Z0-9_\-\.]+)@((\[[0-2]{1}[0-5]{1}[0-5]{1}\.[0-2]{1}[0-5]{1}[0-5]{1}\.[0-2]{1}[0-5]{1}[0-5]{1}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-2]{1}[0-5]{1}[0-5]{1})(\]?)$/;
			var result = false;

			// show error if field is empty or invalid email is entered
			if(email.val() == null || email.val().trim() == '') {
				alert('Please enter your email.');
			} else if(!EMAIL_PATTERN.test(email.val())) {
				alert('Email is not in a valid format.');
				email.val('');
			} else {
				result = true;
			}
			return result;
			
		};
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


	<div id="container" style="padding-top: 40px;" align="center">
		<div class="container-fluid">
			<div class="row-fluid">

					<table>
						<tr>
							<h2>
								<u>Login to your account</u>
							</h2>
						</tr>
						<tr>

							<td><label for="inputEmail3" class="col-sm-2 control-label">Email</label></td>
							<td><div class="col-sm-10">
									<input type="email" class="form-control" id="email"
										placeholder="Your registered email">

								</div></td>
						</tr>

						<td><label for="inputPassword3"
							class="col-sm-2 control-label">Password</label></td>
						<td><div class="col-sm-10">
								<input type="password" class="form-control" id="password"
									placeholder="Password">
							</div></td>

						<tr>

						</tr>


						<tr>

							<td></td>

							<td><div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default" id="login">Login</button>
								</div></td>
						</tr>
					</table>
			</div>
		</div>
	</div>
	
	<script type="IN/Login">
		Hello, <?js= firstName ?> <?js= lastName ?>.
	</script>

	<div id="footer"></div>



</body>
</html>