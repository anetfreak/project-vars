<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>AppleStore! - Admin</title>

<%@include file="/WEB-INF/jsp/includes.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable( {
    	"sDom": "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
    	//,"sPaginationType": "bootstrap"
    });
} );
</script>
<script>
$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );

</script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#AddProduct')
								.click(
										function(event) {

											var productName = $(
											'#ProductName').val();
											var description = $('#Description')
											.val();
											var catalogId = $(
											'#CatalogId').val();
											var price = $(
											'#Price').val();
											var quantity = $(
											'#Quantity').val();

											$
													.ajax({
														url : "project.htm",
														type : "POST",
														data : "productName="
															+ productName
															+ "&description="
															+ description
															+ "&catalogId="
															+ catalogId
															+ "&price="
															+ price
															+ "&quantity="
															+ quantity,
																
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
				<div id="sidebar" class="span2" style="margin: 35px 20px 0px 20px; padding: 20px 0px 50px 0px; background-color: ghostwhite;">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
						<li class="nav-header" style="font-size: 15px;">Admin Privileges</li>
						<li style="font-size: 15px;"><a href="#PostNewProject" data-toggle="tab">Add a new product</a></li>
						
					</ul>
				</div>
				<div>
					<div class="tab-content">
						<div class="tab-pane" id="PostNewProject">
							<table>
							
								<!--Body content-->
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Product Name</h5></td>
									<td></td>
									<td><div>
											<input type="text" id="ProductName" style="width: 310px;" class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Description</h5></td>
									<td></td>
									<td><div>
											<input type="text" style="width: 310px;" id="Description" class="form-control">
										</div></td>
								</tr>
									
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Catalog ID</h5></td>
									<td></td>
									<td><div>
											<input type="text" id="CatalogId" style="width: 310px;"
												class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Price</h5></td>
									<td></td>
									<td><div>
											<input type="text" id="Price" style="width: 310px;"
												class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Quantity</h5></td>
									<td></td>
									<td><div>
											<input type="text" id="Quantity" style="width: 310px;"
												class="form-control">
										</div></td>
								</tr>
								<tr>
								<td></td>
								<td></td>
									<td><div class="col-sm-offset-2 col-sm-10" style="margin-left: 100px ; margin-top: 15px ">
											<input type="submit" class="btn btn-primary"
												id="AddProduct" value="Add Product" />
										</div></td>
								</tr>
							</table>

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
