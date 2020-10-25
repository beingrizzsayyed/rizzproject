<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MODIFY PAYMENTS</title>
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
    <div class="navbar-nav">
            <a href="#" class="nav-item nav-link active mr-5">HII <% out.println(session.getAttribute("username")); %></a>
            <a href="profile.jsp" class="nav-item nav-link active mr-5">PROFILE</a>
            </div>
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

<form action="Modf" method="post">
					<table>
					<tr><td colspan=2 style="color:navy;"><B>	UPDATE PAYMENT OF FARMER</B></td></tr>
					<tr><td>LABLE NUMBER::	</td><td><input type="text" name="lable" size="30"></td></tr>
					<tr><td>  PAYMENT:: </td><td> <select name="payment"><option>Select payment type</option><option>paid</option><option>unpaid</option></select> </td></tr>	
					<tr><td colspan=2><input type="submit" name="update" value="UPDATE" class="btn btn-success"></td></tr>
					</table>
					</form>		
					<br><br>
<form action="Mods" method="post">
					<table>
					<tr><td colspan=2 style="color:navy;"><B>	UPDATE PAYMENT OF SUB-MERCHANT</B></td></tr>
					<tr><td>LABLE NUMBER::	</td><td><input type="text" name="lable" size="30"></td></tr>
					<tr><td> PAYMENT:: </td><td> <select name="payment"><option>Select payment type</option><option>paid</option><option>unpaid</option></select> </td></tr>	
					<tr><td colspan=2><input type="submit" name="update" value="UPDATE" class="btn btn-success"></td></tr>
					</table>
					</form>		
					<br><br>
<form action="Modp" method="post">
					<table>
					<tr><td colspan=2 style="color:navy;"><B>	UPDATE PAYMENT OF PARTY</B></td></tr>
					<tr><td>	 BILL NUMBER::	</td><td><input type="text" name="bill" size="30"></td></tr>
					<tr><td>  PAYMENT:: </td><td> <select name="payment"><option>Select payment type</option><option>paid</option><option>unpaid</option></select> </td></tr>	
					<tr><td colspan=2><input type="submit" name="update" value="UPDATE" class="btn btn-success"></td></tr>
					</table>
					</form>	
					

<br>

</div>

</div></div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>