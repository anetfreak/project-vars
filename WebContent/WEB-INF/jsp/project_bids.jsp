<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - Bids for Project</title>

<%@include file="/WEB-INF/jsp/includes.jsp" %>

<script type="text/javascript">
	
$(document).ready(function () {
   
//    $('#submit').click(function(event) {
// 	   var bidIdinput = $("input:radio[name=bidRadio]:checked").val();
// 		//params to be displayed here are not handled - projName,Desc,etc	  
// 		$.ajax({
// 			url : "selectBid/" + bidIdinput + ".htm",
// 		    type: "GET",
// 		    success:function(data, textStatus, jqXHR){
// 		    	window.location.href="viewProjects.htm";
// 		    },
// 		    error: function(jqXHR, textStatus, errorThrown){
// 		    	alert("Could not process request.. " + errorThrown);
// 		    }
// 		});
//    });
});
	
	
</script>

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
					
				</div>
				<div>
					<div class="tab-content">
						<c:choose>
						<c:when test="${bids ne null}">
						<div class="tab-pane active" id="ShowAllBids">
							<div id="bids">
								<table class="table table-striped table-bordered">
									<tr>
										<th>Bid ID</th>
										<th>Project ID</th>
										<th>Tester ID</th>
										<th>Bid Description</th>
										<th>Amount</th>
									</tr>
									<c:forEach var="b" items="${bids}">
										<tr>
										<td><a href="/project-vars/bids/selectBid/${b.id}.htm"><input name="bidRadio" id="bidRadio" type="radio" class="required" value="${b.id}"></a></td>
										<td><a href="/project-vars/project/devp_project/${b.projectId}.htm">${b.projectId}</a></td>
										<td>${b.tester}</td>
										<td>${b.description}</td>
										<td>$${b.amount}</td>
									</tr>
									</c:forEach>
											<tr>
											</tr>
											<tr>
											</tr>
											<tr>
												<td></td>
												<td></td>

												<td>
													<div class="col-sm-offset-2 col-sm-10">
														<input type="submit" class="btn btn-default" id="submit"
															value="Submit" />
													</div>

												</td>

											</tr>
										</table>
							</div>
						</div>
						</c:when>
						<c:otherwise>
							<div class="tab-pane active" id="ShowAllBids">
								<p>Sorry, no bids found for this project..</p>
							</div>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<% } %>
	</div>

		<%@include file="/WEB-INF/jsp/layout/footer.jsp" %>

</body>
</html>
