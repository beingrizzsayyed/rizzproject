<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SHOW PURCHASE DATA</title>

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
				
<div id="box">
<form action="showtodpur.jsp" method="post" class="mt-4"	>
					<table>
					<tr><td  style="color:navy;"><B>SHOW TODAYS PURCHASE::</B></td><td> </td>
					<td ><input type="submit" name="show" value="SHOW"class="btn btn-success"></td></tr>
					</table>
					</form>		
					<br>
<form action="showdtpur.jsp" method="post">
					<table>
					<tr><td colspan=2 style="color:navy;"><B>SHOW PURCHASE BY DATE</B></td></tr>
					<tr><td>ENTER DATE (note::enter as "yyyy-mm-dd")::</td><td><input type="text" name="date" size="30"></td><td> </td>
					<td><input type="submit" name="show" value="SHOW" class="btn btn-success"></td></tr>
					</table>
					</form>	
					<br>
<form action="showsespur.jsp" method="post">
					<table>
					<tr><td colspan=2 style="color:navy;"><B>SHOW SEASON WISE PURCHASE </B></td></tr>
					<tr><td>ENTER DATE (note::enter as "yyyy-mm-dd")::</td><td><input type="text" name="date" size="30"></td><td><B>to</B></td><td><input type="text" name="date1" size="30"></td>
					<td><input type="submit" name="show" value="SHOW" class="btn btn-success"></td></tr>
					</table>
					</form>	
					<br>					
<form action="showallpur.jsp" method="post" class="mb-4">
					<table>
					<tr><td  style="color:navy;"><B >SHOW ALL PURCHASE DATA::</B><input type="submit" name="show" value="SHOW" class="btn btn-success"></td></tr>
					</table>
					</form>	
</div>					
</div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>