<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>register here</title>
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
<% 
				if(request.getAttribute("Error")!=null)
				{
				out.print("<font size='4' color='red' m>");
				out.print(request.getAttribute("Error"));
				out.print("</font>");
				}
%>
<form method="post" action="Register" class="mt-4">
					<table>
					<tr><td style="color:navy;"><B>	FILL THE INFO</B></td></tr>
					<tr><td>ENTER NAME::</td><td><input type="text" name="name"></td></tr>
					<tr><td>ENTER BUISNESS NAME::</td><td><input type="text" name="bname"></td></tr>
					<tr><td>ENTER ADDRESS::</td><td><input type="text" name="address"></td></tr>
					<tr><td>ENTER USERNAME::</td><td><input type="text" name="uname"></td></tr>
					<tr><td>ENTER PASSWORD::</td><td><input type="password" name="pass"></td></tr>
					<tr><td>MAIL ID::</td><td><input type="email" name="mail"></td></tr>
					<tr><td>CONTACT::</td><td><input type="text" name="contact"></td></tr>
					<tr><td></td><td><input type="submit" name="sign up" value="SIGN UP" class="btn btn-success mb-4"></td></tr>
					</table>
					</form>		

</div>
</div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>