<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - Bids of Project</title>

<%@include file="/WEB-INF/jsp/includes.jsp" %>
<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>
</head>
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

						<div class="tab-pane active" id="ShowAllBids">
							<div id="bids">
								<table class="table table-striped table-bordered">
									<tr>
										<th>Tester ID</th>
										<th>Proposal Description</th>
										<th>Amount</th>
									</tr>
									<c:forEach var="b" items="${bids}">
										<tr>
										<td><a href="/project-vars/project/view_project${b.tester_id}.htm">${b.tester_id}</a></td>
										<td>${b.description}</td>
										<td>${b.amount}</td>
									</tr>
									</c:forEach>
								</table>
							</div>
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
