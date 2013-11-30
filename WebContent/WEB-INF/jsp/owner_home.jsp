<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - Project Owner</title>

<script type="text/javascript" src="js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css"
	href="css/vars.css">
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#submitProject')
								.click(
										function(event) {

											var projectTitle = $(
													'#ProjectTitleInput').val();
											var domain = $('#DomainInput')
													.val();
											var description = $(
													'#DescriptionInput').val();
											var projectURL = $(
											'#ProjectURLInput').val();
											var minBudget = $(
											'#MiniBudgetInput').val();
											var maxBudget = $(
											'#MaxBudgetInput').val();
											var projectSkills = $(
											'#ProjectSkillsInput').val();
											var projectUsers = $(
											'#ProjectUsersInput').val();

											$
													.ajax({
														url : "project.htm",
														type : "POST",
														data : "projectTitle="
																+ projectTitle
																+ "&domain="
																+ domain
																+ "&description="
																+ description
																+ "&projectURL="
																+ projectURL
																+ "&minBudget="
																+ minBudget
																+ "&maxBudget="
																+ maxBudget
																+ "&projectSkills="
																+ projectSkills
																+ "&projectUsers="
																+ projectUsers,
																
														success : function(
																data,
																textStatus,
																jqXHR) {
															window.location.href = "viewProjects.htm";
														},
														error : function(jqXHR,
																textStatus,
																errorThrown) {
															alert("Could not process request.. "
																	+ errorThrown);
														}
													});
										});
					});
	
</script>

<%@include file="/WEB-INF/jsp/includes.jsp"%>

<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>
</head>
<body>

	<%@include file="/WEB-INF/jsp/layout/header.jsp"%>

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
						<li class="nav-header">Project Options</li>
						<li class="active"><a href="#ViewMyProjects"
							data-toggle="tab">View My Projects</a></li>
						<li><a href="#PostNewProject" data-toggle="tab">Post new
								Project</a></li>
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
											<textarea rows="4" class="required" id="DescriptionInput" placeholder="Project Description "></textarea>
										</div></td>
										
										
										
										
								</tr>
								<tr>
									<td><h2 class="label label-primary">Project URL</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="url" id="ProjectURLInput" class="form-control"
												placeholder="Enter your Website URl">
										</div></td>
								</tr>
								
								<tr>
									<td><h2 class="label label-primary">Budget</h2></td>
									<td></td>
									<td><div class="input-prepend input-append">
											<span class="add-on">$</span> 
											<input id="MiniBudgetInput" type="text" size="25"
												placeholder="Minimum Amount in USD">
										</div> To
						
										
										<div class="input-prepend input-append">
											<span class="add-on">$</span> <input 
												id="MaxBudgetInput" type="text" placeholder="Maximum Amount in USD"> </div></td>
								</tr>
								
								<tr>
									<td><h2 class="label label-primary">Project Skills</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="ProjectSkillsInput"
												class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Project Users</h2></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="ProjectUsersInput"
												class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><div class="col-sm-offset-2 col-sm-10">
											<input type="submit" class="btn btn-primary"
												id="submitProject" value="Submit" />
										</div></td>
								</tr>
							</table>

						</div>
						<div class="tab-pane active" id="ViewMyProjects">
							<c:choose>
								<c:when test="${projects ne null}">
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
													<td><a
														href="/project-vars/project/devp_project/${p.project_id}.htm">${p.project_id}</a></td>
													<td>${p.title}</a></td>
													<td>${p.description}</td>
													<td>${p.domain}</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</c:when>
								<c:otherwise>
									<div id="projects">
										<p>
											Sorry, no projects found under you name.. Start by posting a
											project <a href="#PostNewProject" data-toggle="tab">here</a>
										</p>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>

	<%@include file="/WEB-INF/jsp/layout/footer.jsp"%>
</body>
</html>
