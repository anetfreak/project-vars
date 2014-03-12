<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - User Profile</title>

<%@include file="includes.jsp"%>

<script type="text/javascript">
		$(document).ready(function() { 
			 $('#rate').dataTable( {
			    	"sDom": "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
			    	//,"sPaginationType": "bootstrap"
			 });
			
		});
		
	</script>

</head>

<body>
	<%@include file="./layout/header.jsp"%>

	<div id="container" style="padding-top: 40px">
	
	<% if(session.getAttribute("user") == null) { %>
		<div class="container-fluid">
			<div class="row-fluid"><p>Please <a href="login.htm">login</a> to view this page.</p></div>
		</div>
	<% } else { %>
	
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span2"></div>
				<div id="UserProfile" style="margin: 0px 0px 10px 30px;">
				<div><h3>User Profile </h3></div>
				<div class="row-fluid"> 

					<div class="span8">
						<table>
							<tr>
								<td><h5>First Name</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;">${user.firstName}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h5>Last Name</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;">${user.lastName}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h5>Email</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;">${user.email}</span></td>
							</tr>

							<tr></tr>							
							<tr>
								<td><h5>Address</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;">${user.address}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h5>Mobile</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;">${user.mobile}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h5>Last Login</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;">${user.lastLogin}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
					</div>
					<div class="row-fluid"  style="margin-top: 40px;">
					<c:choose>
								<c:when test="${order ne null}">
									<h3>Previous Orders</h3>
									<div id="projects">
										<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"  id="rate">
											<thead>
											<tr>
												<th>Order ID</th>
												<th>Product ID</th>
												<th>Quantity</th>
												<th>Price</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="o" items="${order}">
												<tr>
													<td>${o.id}</td>
													<td>${o.productId}</td>
													<td>${o.quantity}</td>
													<td>${o.price}</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</c:when>
								<c:otherwise>
								<div id="projects">
									<h5>Sorry, you have not shopped previously. You may wish to shop to see orders.</h5>
								</div>

							</c:otherwise>
							</c:choose>
				</div>
				
				
				</div>
		</div>
		<% } %>
	</div>
</div>
		
<%@include file="./layout/footer.jsp"%>

</body>
</html>
