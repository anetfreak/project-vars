<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>AppleStore! - Payment</title>

<%@include file="../includes.jsp" %>

<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.min.js"></script>
<script type="text/javascript"> $(document).ready(function(){ $("#subForm").validate(); }); </script>
<script src="http://jquery.bassistance.de/validate/additional-methods.js"></script>
<script type="text/javascript">

/* 
 * Replace this function with credit card validate function and call it in document.ready function before onClick
   function checkPasswordMatch(){
    var password = $("#passwordInput").val();
    var rePassword = $("#reEnterPasswordInput").val();
	
    if (password != rePassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else{
        $("#divCheckPasswordMatch").html("");  
    }
}  */

$(document).ready(function () {
	// use this line to validate credit card number
	//$("#reEnterPasswordInput").keyup(checkPasswordMatch());
   
   $('#signup').click(function(event) {
	   
	   var result = true; 
	   
		$.ajax({
			url : "signup.htm",
		    type: "POST",
		    data : "result=" + result,
		    success:function(data, textStatus, jqXHR){
		    	window.location.href="viewProjects.htm";
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
	<%@include file=".././layout/header.jsp" %>
	
	
	<div id="container" style="padding-top: 40px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2">
						<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
					</ul>
				</div>
					<div class="tab-content">
						<div class="tab-pane active" id="NewUserSignUp">
								<table cellpadding="5px">
								<!--Body content-->
								<tr>
  									<h2>Please enter your card details</h2>
								</tr>
								<tr>
									<td><h5>Credit Card Number</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="creditCard" class="required" placeholder="16 Digits">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Expiration Date</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="expiry" class="required" placeholder="MM/YY">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Card Code</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="cardCode" class="required" placeholder="3 digit code">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td></td>
									<td></td>
									<td><div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-default" id="signup" value="Pay"/>
								</div></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	

	<%@include file=".././layout/footer.jsp" %>

</body>
</html>