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
				<div id="UserProfile" style="margin: 0px 0px 10px 30px;">
				<div><h3>User Profile </h3></div>
				<div class="row-fluid"> 
				<c:choose>
				<c:when test="${user.isTester}">
					<div class="span2" style="-webkit-box-shadow: 3px 0px 5px #888888; -moz-box-shadow: 3px 0px 5px #888888; box-shadow: 3px 0px 5px #888888; padding-left: 30px; margin-top:15px;">
						<h5> Rating </h5>
						<div id="rating-stars" style="margin-top:10px;">
							<input name="star5" type="radio" class="star {split:2}" disabled="disabled"/>
							<input name="star5" type="radio" class="star {split:2}" disabled="disabled"/>
							<input name="star5" type="radio" class="star {split:2}" disabled="disabled"/>
							<input name="star5" type="radio" class="star {split:2}" disabled="disabled"/>
							<input name="star5" type="radio" class="star {split:2}" disabled="disabled"/>
							<input name="star5" type="radio" class="star {split:2}" disabled="disabled"/>
							<input name="star5" type="radio" class="star {split:2}" checked="checked" disabled="disabled"/>
							<input name="star5" type="radio" class="star {split:2}" disabled="disabled"/>
							<input name="star5" type="radio" class="star {split:2}" disabled="disabled"/>
							<input name="star5" type="radio" class="star {split:2}" disabled="disabled"/>
						</div>
						<div id="rating" style="margin-left: 100px;"><h5>${tester.averageRating}</h5></div>
					</div>
				</c:when>
				</c:choose>
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
								<td><span style="margin-left: 10px;">${user.userName}</span></td>
							</tr>

							<tr></tr>
							<tr>
		 						<td><h5>LinkedIn URL</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;"><a href="${user.linkedInUrl}" target="_blank">${user.linkedInUrl}</a></span></td>
							</tr>
							
							<c:choose>
								<c:when test="${user.isTester}">
								<tr></tr>
								<tr>
									<td><h5>Rating</h5></td>
									<td></td>
									<td><span style="margin-left: 10px;">${tester.averageRating}</span></td>
								</tr>
								</c:when>
							</c:choose>
							
							
							<tr></tr>
							
							<tr>
								<td><h5>Role</h5></td>
								<td></td>
								<c:choose>
									<c:when test="${user.isTester}">
										<td><span style="margin-left: 10px;">Tester</span></td>
									</c:when>
									<c:otherwise>
										<td><span style="margin-left: 10px;">Developer Group / Project Owner</span></td>
									</c:otherwise>
								</c:choose>
							</tr>
							
							<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td>
								</td>
							</tr>
						</table>
					</div>
					</div>
					<div class="row-fluid">
						<div class="btn-group" style="margin-top: 20px;">
								<input type="submit" class="btn" id="updateinformation" value="Update Information"/>
						</div>
					</div>
					<div class="row-fluid"  style="margin-top: 20px;">
					<c:choose>
								<c:when test="${ratings ne null}">
									<div id="projects">
										<table class="table table-striped table-bordered">
											<tr>
												<th>Project Owner</th>
												<th>Rating</th>
												<th>Date</th>
											</tr>
											<c:forEach var="p" items="${ratings}">
												<tr>
													<td>${p.developerName}</td>
													<td>${p.rating}</td>
													<td>${p.date}</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</c:when>
							</c:choose>
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
