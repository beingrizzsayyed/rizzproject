<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SUB-MERCHANT  OUTSTANDING</title>
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
			
<div id="box" class="mt-4 mb-4">
<form action="vouts0.jsp" method="post" class="mt-4">
<table>
<tr><td>FIND SUB-MERCHANT BY NAME::</td><td><input type="text" name="search" size="30">::<input type="submit" name="find" value="FIND" class="btn btn-success"></td></tr>
</table>
</form>
<br>
<form action="vouts2.jsp" method="post">
<table>
<tr><td>FIND SUB-MERCHANT BY LABLE NUMBER::</td><td><input type="text" name="search" size="30">::<input type="submit" name="find" value="FIND" class="btn btn-success"></td></tr>
</table>
</form>
<br>

<form action="vouts1.jsp" method="post">
SHOW ALL SUB-MERCHANT DATA::<input type="submit" name="show" value="SHOW" class="btn btn-success">
</form>
</div>
</div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>