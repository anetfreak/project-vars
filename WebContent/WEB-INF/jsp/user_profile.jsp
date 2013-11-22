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
			$('#updateinformation').click(function(event) {
				$('#UserProfile').css('display', 'none');
				$('#UpdateProfile').css('display', 'block');

			});
			
			$("#reEnterPasswordInput").keyup(checkPasswordMatch());
			 $('#updateprofilebtn').click(function(event) {
				  var fname = $('#First_Name').val();
				   var lname = $('#Last_Name').val();
				   var email = $('#Email_Id').val();
				   var password = $('#passwordInput').val();
				 //  var reenterpassword = $('#reEnterPasswordInput').val();
				   
				   $.ajax({
						url : "user_profile.htm",
					    type: "POST",
					    data : "First_Name=" + fname + "&Last_Name=" + lname + "&Email_Id=" + email + "&passwordInput=" + password + "&reEnterPasswordInput=" +reenterpassword,
					    success:function(data, textStatus, jqXHR){
					    	window.location.href="hello.htm";
					    },
					    error: function(jqXHR, textStatus, errorThrown){
					    	alert("Could not process request.. " + errorThrown);
					    }
			 });
			});
			 
		});

		function checkPasswordMatch() {
			//var checkPasswordMatch = function() {
			var password = $("#passwordInput").val();
			var rePassword = $("#reEnterPasswordInput").val();
	
			if (password != rePassword)
				$("#divCheckPasswordMatch").html("Passwords do not match!");
			else {
				$("#divCheckPasswordMatch").html("Passwords match.");
			}
		}
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
								<c:choose>
									<c:when test="${user.isTester}">
										<td><span>${user.tester.firstName}</span></td>
									</c:when>
									<c:otherwise>
										<td><span>${user.developer.firstName}</span></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Last Name</h2></td>
								<td></td>
								<c:choose>
									<c:when test="${user.isTester}">
										<td><span>${user.tester.lastName}</span></td>
									</c:when>
									<c:otherwise>
										<td><span>${user.developer.lastName}</span></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Email</h2></td>
								<td></td>
								<td><span>${user.userName}</span></td>
							</tr>

							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">LinkedIn URL</h2></td>
								<td></td>
								<c:choose>
									<c:when test="${user.isTester}">
										<td><span><a href="${user.tester.linkedInUrl}">${user.tester.linkedInUrl}</a></span></td>
									</c:when>
									<c:otherwise>
										<td><span><a href="${user.developer.linkedInUrl}">${user.developer.linkedInUrl}</a></span></td>
									</c:otherwise>
								</c:choose>
							</tr>
							
							<c:choose>
								<c:when test="${user.isTester}">
								<tr></tr>
								<tr>
									<td><h2 class="label label-primary">Rating</h2></td>
									<td></td>
									<td><span>3.25</span></td>
								</tr>
								</c:when>
							</c:choose>
							
							
							<tr></tr>
							
							<tr>
								<td><h2 class="label label-primary">Role</h2></td>
								<td></td>
								<c:choose>
									<c:when test="${user.isTester}">
										<td><span>Tester</span></td>
									</c:when>
									<c:otherwise>
										<td><span>Developer Group / Project Owner</span></td>
									</c:otherwise>
								</c:choose>
							</tr>
							
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
										<input type="Email" id="First_Name" class="form-control"
											placeholder="First Name">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Last Name</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="Email" id="Last_Name" class="form-control"
											placeholder="Last Name">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Email</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="Email" id="Email_Id" class="form-control"
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
											class="required" placeholder="Re-enter Password" onChange="checkPasswordMatch();">
									</div></td>
									<td>
									<div class="registrationFormAlert" id="divCheckPasswordMatch"></div>
									</td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td><div class="btn-group">
										<input type="submit" class="btn" id="updateprofilebtn"  value="Update Profile"/>
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








