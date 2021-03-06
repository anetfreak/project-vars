<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apple Store! - Shopping Cart</title>

<%@include file="/WEB-INF/jsp/includes.jsp" %>
</head>
<body>

	<div id="container" style="padding: 50px 0px 70px 0px;">
		<%-- <%	// session check code - un-comment later
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
		%> --%>
		<div class="container-fluid">
			<div class="row-fluid">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="iphones"
					style="background-color: ghostwhite;">
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Description</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${cart}">
							<tr>
								<td>${c.name}</td>
								<td>${c.description}</td>
								<td>${c.price}</td>
							</tr>
						</c:forEach>
						<tr></tr>
						<tr></tr>
						<tr>
							<th>Grand Total</th>
							<th></th>
							<th>(Total here)</th>
							<th></th>
						</tr>
						<tr>
							<td></td>
							<td></td>

							<td>
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-default" id="submit"
										value="Proceed to Payment" />
								</div>

							</td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<%-- 	<% } %> //remove comment after adding session script --%>
	</div>

</body>
</html>