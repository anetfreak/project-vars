<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>Welcome to VARS!</title>
	<script type="text/javascript" src="<spring:url value="/js/bootstrap/bootstrap.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<spring:url value="/css/bootstrap/bootstrap.css"/>">
	<link rel="stylesheet" type="text/css" href="<spring:url value="/css/bootstrap/bootstrap.min.css"/>">
	<link rel="stylesheet" type="text/css" href="<spring:url value="/css/bootstrap/bootstrap-responsive.css"/>">
	<link rel="stylesheet" type="text/css" href="<spring:url value="/css/bootstrap/bootstrap-responsive.min.css"/>">
	
	<script type="text/javascript" src="<spring:url value="/js/bootstrap/bootstrap.js"/>"></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript">
// 		$(document).ready(function(){
// 			$('#createUser').click(function(event) {
// 				$.ajax({
// 					url : "showUser.htm",
// 				    type: "GET",
// 				    success:function(data, textStatus, jqXHR){
// 				    },
// 				    error: function(jqXHR, textStatus, errorThrown){
// 				    	alert("Could not add to cart.. " + errorThrown);
// 				    }
// 				});
// 			});
// 		});
	
	</script>
	
</head>
<body>

Welcome to a basic Spring Application, ${hello}!

<div>
	<a href="showUser.htm" class="btn btn-primary" id="createUser">Create User</a>
</div>

</body>
</html>