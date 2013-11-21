<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
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
						<li class="nav-header">Tester Options</li>
						<li class="active"><a href="#ShowNewProjects"
							data-toggle="tab">Show New Projects</a></li>
						<li><a href="#ViewMyProjects" data-toggle="tab">View My Projects</a></li>
					</ul>
				</div>
				<div>
					<div class="tab-content">
						<div class="tab-pane active" id="ShowNewProjects">
						<c:choose>
								<c:when test="${projects eq null}">
									<div id="projects">
										<table class="table table-striped table-bordered">
											<tr>
												<th>ID</th>
												<th>Project Title</th>
												<th>Description</th>
												<th>Domain</th>
												<th>Developer ID</th>
											</tr>
											<c:forEach var="p" items="${projects}">
												<tr>
												<td><a href="/project-vars/project/view_project${p.project_id}.htm">${p.project_id}</a></td>
												<td><a href="/project-vars/project/${p.title}.htm">${p.title}</a></td>
												<td>${p.description}</td>
												<td>${p.domain}</td>
												<td>${p.developer_id}</td>
											</tr>
											</c:forEach>
										</table>
									</div>
								</c:when>
								<c:otherwise>
									<div id="projects">
										<h5>Sorry, no projects found under you name.. Start by posting a project <a href="#PostNewProject" data-toggle="tab">here</a></h5>
									</div>
								</c:otherwise>
							</c:choose>
							<div id="project">
								${project2.title }, ${project2.domain}, ${project2.description}						
							</div>
						</div>
						
						<div class="tab-pane" id="ViewMyProjects">
						...
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="footer"></div>

</body>
</html>