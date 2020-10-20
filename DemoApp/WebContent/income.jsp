<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ACCOUNT STATEMENT</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body >
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
    <div class="form-inline ml-auto">
            
            <a href="logout.jsp"><button type="submit" class="btn btn-danger">Logout</button></a>
        </div>
    
</nav>
	<div id="banner">
				
				<img src="images/tomatto.jpg" style="width:100%; height: 300px;"  />
			
			</div>
		
		
		<nav class="navbar navbar-expand-md navbar-dark bg-info">
    
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav">
            <a href="market1.jsp" class="nav-item nav-link active">HOME</a>
       </div></div>
</nav>
	
<div class="row mt-4">				
<div style="height:300px; overflow:auto" class="col-lg-7">
<table>
<tr><td  style="color:navy;"><B>PURCHASE AMMOUNT</B></td></tr>
<tr><td><br><br></td></tr>
<tr><td ><form action="pad.jsp" method="post"><input type="submit" name="show" value="PAID PURCHASE AMMOUNT DATA" 
class="btn btn-success"></form></td></tr>
<tr><td><br><br></td></tr>
<tr><td ><form action="upad.jsp" method="post"><input type="submit" name="show" value="UNPAID PURCHASE AMMOUNT DATA" 
class="btn btn-success"></form></td></tr>
<tr><td><br><br></td></tr>
<tr><td  style="color:navy;"><B>SALE AMMOUNT</B></td></tr>
<tr><td><br><br></td></tr>
<tr><td ><form action="sad.jsp" method="post"><input type="submit" name="show" value="PAID SALE AMMOUNT DATA" 
class="btn btn-success"></form></td></tr>
<tr><td><br><br></td></tr>
<tr><td ><form action="usad.jsp" method="post"><input type="submit" name="show" value="UNPAID SALE AMMOUNT DATA" 
class="btn btn-success mb-4"></form></td></tr>				
</table>							
</div>
<div class="col-lg-4 card mt-4 mb-4 bg-success shadow">
			
			<B>Notice</B>
			<marquee direction="up" width="300px" truespeed="truespeed" onmouseover="stop()" onmouseout="start()" style="color: red;">
			YOU CAN SEE PAID AND UNPAID PURCHASE AND SALE DETAILS
			</marquee>
			
	</div>
</div>
</div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>