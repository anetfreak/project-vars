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

	<div id="footer"></div>

</body>
</html>