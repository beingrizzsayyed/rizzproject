<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HIII LOGOUT HERE</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
<% 
response.setHeader("cache-control", "no-cache , no-store, must-revalidate");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}
%>
<div id="outer">
 		<nav class="navbar navbar-expand-md navbar-dark bg-info">
    <a href="#" style="text-decoration:none;"" class="navbar-brand">TOMATTO BILLING SYSTEM</a>
    
</nav>
		<div id="banner">
				
				<img src="images/tomatto.jpg" style="width:100%; height: 300px;"  />
			
			</div>
	<nav class="navbar navbar-expand-md navbar-dark bg-info">
    <a href="#" style="text-decoration:none;"" class="text-danger">DO YOU WANT TO LOGOUT</a>
   
    
</nav>
		
	<form action="Logout" method ="post">
<table align=center>		
<tr><td colspan="2"><input type="submit" name="logout" value="LOGOUT" class="btn btn-danger mt-6 mb-6"><br></td></tr>
</table>
</form>
		
</div>		
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>