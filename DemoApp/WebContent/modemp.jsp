<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD OR DELETE EMPLOYEE INFORMATION</title>
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
				
<div id="box">

<form action="Addemp" method="post">
					<table>
					<tr><td colspan=2 style="color:navy;"><B> ADD EMPLOYEE INFORMATION</B></td></tr>
					<tr><td>EMPLOYEE ID::	</td><td><input type="text" name="eid" size="30"></td></tr>
					<tr><td>EMPLOYEE NAME::	</td><td><input type="text" name="name" size="30"></td></tr>
					<tr><td>DESIGNATION::	</td><td><input type="text" name="desg" size="30"></td></tr>
					<tr><td>SALARY::	</td><td><input type="text" name="sal" size="30"></td></tr>
					<tr><td colspan=2><input type="submit" name="add" value="ADD" class="btn btn-success"></td></tr>
					</table>
					</form>		
					<br><br>
<form action="Dltemp" method="post">
					<table>
					<tr><td colspan=2 style="color:navy;"><B>DELETE EMPLOYEE INFORMATION</B></td></tr>
					<tr><td>  EMPLOYEE ID::	</td><td><input type="text" name="eid" size="30"></td></tr>
					<tr><td colspan=2><input type="submit" name="delete" value="DELETE" class="btn btn-success"></td></tr>
					</table>
					</form>	
					<br><br>
<form action="Updemp" method="post">
					<table>
					<tr><td colspan=2 style="color:navy;"><B>UPDATE IMPLOYEE SALARY</B></td></tr>
					<tr><td>EMPLOYEE ID::	</td><td><input type="text" name="eid" size="30"></td></tr>
					<tr><td>NEW SALARY:: </td><td><input type="text" name="nsal" size="30"></td></tr>
					<tr><td colspan=2><input type="submit" name="update" value="UPDATE" class="btn btn-success"></td></tr>
					</table>
					</form>		
					<br><br>					
					



</div></div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>