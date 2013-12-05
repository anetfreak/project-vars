<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - View Project</title>

<%@include file="includes.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
// 			$('#bids').click(function(event) {
// 				var projectId = $('#projectId').val();
// 				$.ajax({
// 					url : "/project-vars/project/bids/" + projectId + ".htm",
// 				    type: "GET",
// // 				    success:function(data, textStatus, jqXHR){
// // 				    	//window.location.href="project_bids.htm";
// // 				    },
// 				    error: function(jqXHR, textStatus, errorThrown){
// 				    	alert("Could not process request.. " + errorThrown);
// 				    }
// 				});
// 			});
			
		});
	</script>

</head>

<body>
	<%@include file="./layout/header.jsp"%>

	<div id="container" style="padding-top: 40px;">
	
	<% if(session.getAttribute("user") == null) { %>
		<div class="container-fluid">
			<div class="row-fluid"><p>Please <a href="login.htm">login</a> to view this page.</p></div>
		</div>
	<% } else { %>
	
		<div class="container-fluid">
			<div class="row-fluid">
				<input type="hidden" id="projectId" name="projectId" value="${project.project_id}"/>
				<div class="tab-content" id="projectDetails">
					<div class="tab-pane active">
						<table>
							<!--Body content-->
							<tr>
								<h3>Project Details </h3>
							</tr>
							<tr>
								<td><h2 class="label label-primary">Project Name</h2></td>
								<td></td>
								<td><span>${project.title}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Project Description</h2></td>
								<td></td>
								<td><span>${project.description}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Project Domain</h2></td>
								<td></td>
								<td><span>${project.domain}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Developer</h2></td>
								<td></td>
								<td><span>${project.developer_id}</span></td>
							</tr>

							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Tester</h2></td>
								<td></td>
								<td><span>${project.tester_id}</span></td>
							</tr>
							
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Result</h2></td>
								<td></td>
								<td><span>${project.results}</span></td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td><div class="btn-group">
										<a href="/project-vars/bids/${project.project_id}.htm" class="btn btn-primary" id="bids">View All Bids</a>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

		</div>
		<% } %>
	</div>

<%@include file="./layout/footer.jsp"%>

</body>
</html>








