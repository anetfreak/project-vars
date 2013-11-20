<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
$(document).ready(function(){
	$('#submitProject').click(function(event) {
		//Validate email
			var projectTitle = $('#ProjectTitleInput').val();
			var domain = $('#DomainInput').val();
			var description = $('#DescriptionInput').val();
			
			$.ajax({
				url : "projectowner_home.htm",
			    type: "POST",
			    data : "projectTitle=" + projectTitle + "&domain=" + domain + "&description="+ description,
			    success:function(data, textStatus, jqXHR){
			    	window.location.href="hello.htm";
			    },
			    error: function(jqXHR, textStatus, errorThrown){
			    	alert("Could not process request.. " + errorThrown);
			    }
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
	<%@include file="/WEB-INF/jsp/includes.jsp" %>
	<%@include file="/WEB-INF/jsp/layout/header.jsp" %>

	<div id="container" style="padding: 50px 0px 70px 0px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2" style="margin: 0px 20px 0px 20px;">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
						<li class="nav-header">Project Options</li>
						<li class="active"><a href="#ViewMyProjects" data-toggle="tab">View My Projects</a></li>
						<li><a href="#PostNewProject" data-toggle="tab">Post new Project</a></li>
					</ul>
				</div>
				<div>
					<div class="tab-content">
						<div class="tab-pane" id="PostNewProject">
							<table>
								<!--Body content-->
								<tr>
									<td><h2 class="label label-primary">Project Title</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="ProjectTitleInput"
												class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Domain</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="DomainInput" class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Description</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="DescriptionInput" class="form-control">
										</div></td>
								</tr>
								<tr>
									<td></td>
									<td><div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-default"
												id="submitProject">Submit</button>
										</div></td>
								</tr>
							</table>

						</div>
						<div class="tab-pane active" id="ViewMyProjects">
							<div id="projects">
								<table class="table table-striped table-bordered">
									<tr>
										<th>ID</th>
										<th>Project Title</th>
										<th>Description</th>
										<th>Domain</th>
									</tr>
									<c:forEach var="p" items="${projects}">
										<tr>
										<td>${p.project_id}</td>
										<td>${p.title}</td>
										<td>${p.description}</td>
										<td>${p.domain}</td>
									</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/jsp/layout/footer.jsp" %>
</body>
</html>