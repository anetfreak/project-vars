<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>AppleStore! - Catalog</title>

<%@include file="/WEB-INF/jsp/includes.jsp" %>
<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#shwNewPrj').dataTable( {
    	"sDom": "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
    });
} );
</script>

<script>
$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );

</script>

</head>
<body>

	<%@include file="/WEB-INF/jsp/layout/header.jsp" %>
	
	<%-- <div id="container" style="padding: 50px 0px 70px 0px;">
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
		%> --%>
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2" style="margin: 35px 20px 0px 20px; padding: 20px 0px 50px 0px; background-color: ghostwhite;">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list"  style="background-color: #f7f5fa;">
						<li class="nav-header" style="font-size: 15px;">Products</li>
						<li class="active" style="font-size: 15px;"><a href="#ShowNewProjects"
							data-toggle="tab">i-Products</a></li>
					</ul>
				</div>
				<div>
					<div class="tab-content">
						<div class="tab-pane active" id="ShowNewProjects">
							<c:choose>
								<c:when test="${product ne null}">
									<div id="projects">
										<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"  id="shwNewPrj" style="background-color: ghostwhite;">
											<thead>
											<tr>
												<th>Product Name</th>
												<th>Description</th>
												<th>Price</th>
												<th>Add To Cart</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="p" items="${product}">
												<tr>
													<td>${p.name}</td>
													<td>${p.description}</td>
													<td>${p.price}</td>
													<td><input type="button" value="Add To Cart"></td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</c:when>
								<c:otherwise>
									<div id="projects">
										<h5>Sorry, there are no available new products now. Check
											later.</h5>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
<%-- 		<% } %> --%>
	

	<%@include file="/WEB-INF/jsp/layout/footer.jsp" %>
</body>
</html>