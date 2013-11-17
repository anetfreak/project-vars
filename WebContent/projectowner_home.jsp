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
		<div class="navbar navbar-inverse navbar-static-top">
			<div class="navbar-inner">
				<a class="brand" href="#"><span style="color: white; margin: 0px 10px 0px 10px;">MakeItUsable!</span></a>
				<ul class="nav">
					<li><a href="hello.htm" style="color: white;">Home</a></li>
					<li ><a href="#" style="color: white;">Link</a></li>
					<li><a href="#" style="color: white;">Link</a></li>
				</ul>
				<ul class="nav" style=" float:right;">
					<li><a href="login.htm" style="color: white;">Login</a></li>
					<li><a href="signup.htm" style="color: white;">Sign Up</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="container" style="padding: 20px 0px 70px 0px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
						<li class="nav-header">Project Options</li>
						<li class="active"><a href="#PostNewProject"
							data-toggle="tab">Post new Project</a></li>
						<li><a href="#ViewMyProjects" data-toggle="tab">View My
								Projects</a></li>
					</ul>
				</div>
				<div>
					<div class="tab-content">
						<div class="tab-pane active" id="PostNewProject">
							<table>
								<!--Body content-->
								<tr>
									<td><h2 class="label label-primary">Project Title</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Domain</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Description</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" class="form-control">
										</div></td>
								</tr>
							</table>

						</div>
						<div class="tab-pane" id="ViewMyProjects">...</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="footer">
		<div class="navbar navbar-inverse navbar-fixed-bottom">
			<div class="navbar-inner" style="min-height: 80px;">
					<div style="margin:10px 5px 10px 5px; float:left;"><span style="color: white;">Copyright, MakeItUsable!</span></div>
					<div style="margin:10px 10px 10px 10px; float: right;">
						<a href="#" style="color: white;">About Us</a> <span style="color: white;">|</span> <a href="#" style="color: white;">Contact Us</a>
					</div>
			</div>
		</div>
	</div>

</body>
</html>