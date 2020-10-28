<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN LOGIN</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
<div id="outer">
 <nav class="navbar navbar-expand-md navbar-dark bg-info">
    <a href="#" style="text-decoration:none;"" class="navbar-brand">TOMATTO BILLING SYSTEM</a> 
</nav>	
		
		<div id="banner">
				
				<img src="images/tomatto.jpg" style="width:100%; height: 300px;"  />
			
			</div>
	<div id="box">	
	<form action="Admin" method ="post"  class="mt-4">
	<% 
					if(request.getAttribute("Error")!=null)
					{
					out.print("<font size='4' color='red' m>");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
	
	if(request.getAttribute("done")!=null)
	{
	out.print("<font size='4' color='green' m>");
	out.print(request.getAttribute("done"));
	out.print("</font>");
	}
	%>
<table align=center class="mt-2">		
<tr><td>USERNAME::<input type="text" name="uname" size="100" class="mb-4"></td><td></td></tr>
<tr><td>PASSWORD::<input type="password" name="pass" size="100" class="mb-4" ><td></td></td></tr>
</table>
<center><button type="submit" class="mb-4 btn btn-success">LOGIN</button>
<p class="text-warning mb-4">ADMIN LOGIN SECTION</p></center>
</form>
<br class="mb-4">
</div>
</div>		
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>