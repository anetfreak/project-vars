<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VARS</title>
<script type="text/javascript" src="js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/vars.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap-responsive.min.css">
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.min.js"></script>
<script type="text/javascript"> $(document).ready(function(){ $("#subForm").validate(); }); </script>
<script src="http://jquery.bassistance.de/validate/additional-methods.js"></script>
<script type="text/javascript">
	
$(document).ready(function () {
   
   $('#submit').click(function(event) {
	   var projectTitle = $('#projectTitle').val();
	   var proposal = $('#proposal').val();
	   var proposalDescription = $('#proposalDescription').val();
		//params to be displayed here are not handled - projName,Desc,etc	  
	   
		$.ajax({
			url : "tester_proposal.htm",
		    type: "POST",
		    data : "projectTitle=" + projectTitle + "&proposal=" + proposal + "&proposalDescription=" + proposalDescription,
		    success:function(data, textStatus, jqXHR){
		    	window.location.href="hello.htm";
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
	<div id="header">
		<div class="navbar">
			<div class="navbar-inner">
				<a class="brand" href="#"><span style="color: black;">MakeItUsable!</span></a>
				<ul class="nav">
					<li><a href="hello.htm">Home</a></li>
					<li class="divider-vertical"></li>
					<li><a href="#">Link</a></li>
					<li class="divider-vertical"></li>
					<li><a href="#">Link</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="container" style="padding-top: 40px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">

					</ul>
				</div>
				<div>
					<div class="tab-content">
						<div class="tab-pane active" id="testerproposal">
							<table>
								<!--Body content-->
								<tr>
									<h2>
										<u>Tester Proposal</u>
									</h2>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Project Title</h2></td>
									<td></td>
									<td><div class="input-group">
											<input class="input-xlarge" id="projectTitle" disabled="disabled" type="text"
												disabled>
										</div></td>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Domain</h2></td>
									<td></td>
									<td><div class="input-group">

											<input class="input-xlarge" id="disabledInput" type="text"
												disabled>
										</div></td>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Description</h2></td>
									<td></td>
									<td><div class="input-group">
											<input class="input-xlarge" id="disabledInput" type="text"
												disabled>
										</div></td>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Developers Name</h2></td>
									<td></td>
									<td><div class="input-group">
											<input class="input-xlarge" id="disabledInput" type="text"
												disabled>
										</div></td>
								</tr>
								<tr>
									<td><h2 class="label label-primary">Proposal</h2></td>
									<td></td>
									<td>
										<div class="input-prepend input-append">
											<span class="add-on">$</span> <input class="required"
												id="proposal" type="text"
												placeholder="Amount in USD">
										</div>
									</td>
								</tr>
								<tr>
									<td><h2>
											<span class="label label-primary">Proposal Description</span>
										</h2></td>
									<td></td>
									<td><textarea rows="4" class="required" id="proposalDescription" placeholder="Description regarding proposal "></textarea></td>
								</tr>
								<tr> </tr>
								<tr> </tr>
								
								<tr>
									<td></td>
									<td></td>
									
									<td >
										<div class="btn-group">
										 
											<button type="submit" id="submit" class="btn" >Submit</button>
											
										</div>

									</td>

								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>