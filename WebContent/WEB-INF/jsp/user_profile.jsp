<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - User Profile</title>

<%@include file="includes.jsp"%>


<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>
</head>
<body>
	<%@include file="./layout/header.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#updateinformation').click(function(event) {
				$('#UserProfile').css('display', 'none');
				$('#UpdateProfile').css('display', 'block');

			});
		});
	</script>

	<div id="container" style="padding-top: 40px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
					</ul>
				</div>

				<div class="tab-content" id="UserProfile">
					<div class="tab-pane active">
						<table>
							<!--Body content-->
							<tr>
								<h3>User information </h3>
							</tr>
							<tr>
								<td><h2 class="label label-primary">First Name</h2></td>
								<td></td>
								<td><div class="col-sm-10">
										<p class="form-control-static" id="firstNameInput">NameFromDB</p>
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Last Name</h2></td>
								<td></td>
								<td><div class="col-sm-10">
										<p class="form-control-static" id="lastNameInput">NameFromDB</p>
									</div>
								</td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Email</h2></td>
								<td></td>
								<td><div class="col-sm-10">
										<p class="form-control-static" id="emailInput">EmailFromDB</p>
									</div>
								</td>
							</tr>

							<tr></tr>
							<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td><div class="btn-group">
										<input type="submit" class="btn" id="updateinformation" value="Update Information"/>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="tab-content" id="UpdateProfile" style="display: none;">
					<div class="tab-pane active">
						<table>
							<!--Body content-->
							<tr>
								<h3>Update your information here!</h3>
							</tr>
							<tr>
								<td><h2 class="label label-primary">First Name</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="Email" id="FirstName" class="form-control"
											placeholder="First Name">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Last Name</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="Email" id="LastName" class="form-control"
											placeholder="Last Name">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Email</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="Email" id="EmailId" class="form-control"
											placeholder="Email Id">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Password</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="password" id="passwordInput" class="form-control"
											placeholder="Password">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Re-enter Password</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="password" id="reEnterPasswordInput"
											class="form-control" placeholder="Re-enter Password">
									</div></td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td><div class="btn-group">
										<input type="submit" class="btn"  value="Update Profile"/>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>


		</div>
	</div>


	<div id="footer"></div>

</body>
</html>








