<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - Sign Up</title>

<%@include file="includes.jsp" %>

<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.min.js"></script>
<script type="text/javascript"> $(document).ready(function(){ $("#subForm").validate(); }); </script>
<script src="http://jquery.bassistance.de/validate/additional-methods.js"></script>
<script type="text/javascript">
</script>

</head>
<body>
<%@include file="/WEB-INF/jsp/includes.jsp" %>
	<%@include file="/WEB-INF/jsp/layout/header.jsp" %>

<div id="container" style="padding: 50px 0px 70px 0px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2" style="margin: 0px 20px 0px 20px;">
					
				</div>
				<div>
					<div class="tab-content">

						<div class="tab-pane active" id="ShowAllBids">
							<div id="bids">
								<table class="table table-striped table-bordered">
									<tr>
										<th>Tester ID</th>
										<th>Proposal Description</th>
										<th>Amount</th>
									</tr>
									<c:forEach var="p" items="${bids}">
										<tr>
										<td><a href="/project-vars/project/view_project${p.project_id}.htm">${p.project_id}</a></td>
										<td><a href="/project-vars/project/${p.title}.htm">${p.title}</a></td>
										<td>${p.description}</td>
										<td>${p.domain}</td>
									</tr>
									</c:forEach>
								</table>
							</div>
							<div id="project">
								${project2.title }, ${project2.domain}, ${project2.description}						
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/jsp/layout/footer.jsp" %>

</body>
</html>
