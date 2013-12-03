<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>MakeItUsable! - Home</title>
		<%@include file="includes.jsp" %>
		<script src="snowstorm.js" type="text/javascript"></script>
		
		<script type="text/javascript">

snowStorm.flakesMaxActive = 100;    // show more snow on screen at once
snowStorm.useTwinkleEffect = true; // let the snow flicker in and out of view
snowStorm.followMouse = true;
snowStorm.freezeOnBlur = true;
snowStorm.snowStick = true;
</script>

</head>
<body>
	
	<%@include file="./layout/header.jsp" %>
	<div id="container" style="margin: 0px 0px 70px 0px; max-height:100%; overflow-y:hidden;">
	    <div class="hero-unit" style="padding: 0px; font-size: 35px; color: #fff; text-shadow: 0 1px 1px rgba(0,0,0,.4);">
			<img src="images/rt-masthead.jpg"/>
			<div style="width: auto; line-height: 40px; top: 6em; left: 4em; position: absolute; z-index: 10; margin: 0px 0px 0px 40px;">
				<p style="font-size: 45px;">Welcome to MakeItUsable!</p>
			</div>
		</div>
		
		
<!-- 		<div style="padding: 150px 20px 70px 50px;"> -->
<!-- 			<h1 style="font-family: Calibri; font-style: italic;">Welcome to MakeItUsable!</h1> -->
<!-- 			<p>A superb platform where developer groups and usability testers interact..</p> -->
<!-- 			<a href="/project-vars/about.htm" class="btn btn-large btn-success">Know More</a> -->
<!-- 		</div> -->
	</div>

	<%@include file="./layout/footer.jsp" %>
</body>
</html>