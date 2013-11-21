<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - Tester Home</title>

<%@include file="/WEB-INF/jsp/includes.jsp" %>
<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>
</head>
<body>

	<%@include file="/WEB-INF/jsp/layout/header.jsp" %>
	
	<div id="container" style="padding: 50px 0px 70px 0px;">
		<%
			if (session.getAttribute("user") == null) {
		%>
		<div class="container-fluid">
			<div class="row-fluid">
				<p>
					Please <a href="login.htm">login</a> to view this page.
				</p>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2" style="margin: 0px 20px 0px 20px;">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
						<li class="nav-header">Tester Options</li>
						<li class="active"><a href="#ShowNewProjects"
							data-toggle="tab">Show New Projects</a></li>
						<li><a href="#ViewMyProjects" data-toggle="tab">View My
								Projects</a></li>
					</ul>
				</div>
				<div>
					<div class="tab-content">
						<div class="tab-pane active" id="ShowNewProjects">
							<c:choose>
								<c:when test="${projects ne null}">
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
													<td><a
														href="/project-vars/project/tester_project/${p.project_id}.htm">${p.project_id}</a></td>
													<td>${p.title}</td>
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
										<h5>Sorry, there are no available new projects. Check
											later.</h5>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

						<div class="tab-pane" id="ViewMyProjects">
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
													<td><a
														href="/project-vars/project/tester_project/${p.project_id}.htm">${p.project_id}</a></td>
													<td>${p.title}</td>
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
										<h5>
											Sorry, no projects found under you name.. Start by posting a
											project <a href="#PostNewProject" data-toggle="tab">here</a>
										</h5>
									</div>

								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<% } %>
	</div>

	<%@include file="/WEB-INF/jsp/layout/footer.jsp" %>
</body>
</html>