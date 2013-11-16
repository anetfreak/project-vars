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
<script type="text/javascript">

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
							<table>
								<!--Body content-->
								<tr>
  									<h2><u>Create an account here</u></h2>
								</tr>
								<tr>
									<td><h2 class="label label-primary">First Name</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="firstNameInput" class="form-control" placeholder="First Name">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Last Name</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="lastNameInput" class="form-control" placeholder="Last Name">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Email</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="emailInput" class="form-control" placeholder="Email ID">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Password</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="password" id="passwordInput" class="form-control" placeholder="Password">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Re-enter Password</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="password" id="reEnterPassword" class="form-control" placeholder="Re-enter Password">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">You are a</h2></td>
									<td></td>
									<td><div class="col-lg-6">
   											 <div class="input-group">
      											<span class="input-group-addon">
        											<input id="userType"></jsp:element>' type="radio">
      											</span>
      											<h2 class="label label-primary">Project Owner</h2>
      											
      											<input id="userType" type="radio">
      											</span>
      											<h2 class="label label-primary">Tester</h2>
    										</div><!-- /input-group -->
  										</div><!-- /.col-lg-6 --></td>
								</tr>
								<tr></tr>
								<tr>
									<td></td>
									<td></td>
									<td><div class="btn-group">
  										<button type="submit" class="btn">Submit</button>
									</div></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	

	<div id="footer"></div>

</body>
</html>