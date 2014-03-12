<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>AppleStore! - Product Details</title>

<%@include file="/WEB-INF/jsp/includes.jsp" %>
<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>

<script type="text/javascript">
	
$(document).ready(function () {
   
   $('#submitResponse').click(function(event) {
	   var productId = $('#productId').val();	  
	   console.log("product ID:"+ productId );
		$.ajax({
			url : "/project-vars/tester_project.htm",
		    type: "POST",
		    data : "productId=" +productId,
		    success:function(data, textStatus, jqXHR){
		    	window.location.href="/project-vars/viewProjects.htm";
		    },
		    error: function(jqXHR, textStatus, errorThrown){
		    	alert("Could not process request.. " + errorThrown);
		    }
		});
   });
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
		<div id="container" style="padding-top: 40px;">
		<input type="hidden" id="productId" name="productId" value="${product.id}" />
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2">
						<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
					</ul>
				</div>
					<div class="tab-content">
						<div class="tab-pane active" id="Product">
							<table cellpadding="5px">
								<!--Body content-->
								<tr>
  									<td><h2>Product Details</h2></td>
								</tr>
								<tr>
									<td><h5>Product Name</h5></td>
									<td></td>
									<td><div class="col-sm-10">
    									  <p class="form-control-static" id="productName">${product.name}</p>
  										  </div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Catalog ID</h5></td>
									<td></td>
									<td><div class="col-sm-10">
    									  <p class="form-control-static" id="catalogId">${product.catalogId}</p>
  										  </div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Description</h5></td>
									<td></td>
									<td><div class="col-sm-10">
    									  <p class="form-control-static" id="description">${product.description }</p>
  										  </div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Price</h5></td>
									<td></td>
									<td><div class="col-sm-10">
    									  <p class="form-control-static" id="price">${product.price}</p>
  										  </div></td>
								</tr>
								<tr></tr>
								<tr></tr>
								<tr>
									<td></td>
									<td></td>
									<td><div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-default" id="submitResponse" value="Add To Cart"/>
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