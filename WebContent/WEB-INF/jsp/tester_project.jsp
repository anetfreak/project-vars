<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - Project Details</title>

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
		<div id="container" style="padding-top: 40px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2">
						<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
					</ul>
				</div>
					<div class="tab-content">
						<div class="tab-pane active" id="Project">
							<table>
								<!--Body content-->
								<tr>
  									<h2><u>Project Details</u></h2>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Project Title</h2></td>
									<td></td>
									<td><div class="col-sm-10">
    									  <p class="form-control-static" id="titleInput">${project.title }</p>
  										  </div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Description</h2></td>
									<td></td>
									<td><div class="col-sm-10">
    									  <p class="form-control-static" id="descriptionInput">${project.description }</p>
  										  </div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Domain</h2></td>
									<td></td>
									<td><div class="col-sm-10">
    									  <p class="form-control-static" id="descriptionInput">${project.domain }</p>
  										  </div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Tester Name</h2></td>
									<td></td>
									<td><div class="col-sm-10">
    									  <p class="form-control-static" id="NameInput">${project.tester_id}</p>
  										  </div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Tester's Suggestions</h2></td>
									<td></td>
									<td><textarea id="resultsInput" disabled="disabled" class="proposalDescription-Input" rows="3">DataFromDB</textarea>
									</td>
								</tr>
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Bids</h2></td>
									<td></td>
									<td><a href="/project-vars/project/bids/${project.project_id}.htm">Bid this project!</a></td>
								</tr>
								<tr></tr>
								<tr></tr>
								<tr>
									<td></td>
									<td></td>
									<td><div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-default" id="submit" value="Update Profile"/>
								</div></td>
								</tr>
							</table>
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