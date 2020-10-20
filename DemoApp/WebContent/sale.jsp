<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*"%>
     <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SALE</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
<div id="outer">
	<nav class="navbar navbar-expand-md navbar-dark bg-info">
    <a href="#" style="text-decoration:none;"" class="navbar-brand">TOMATTO BILLING SYSTEM</a>
    <div class="form-inline ml-auto">
            
            <a href="logout.jsp"><button type="submit" class="btn btn-danger">Logout</button></a>
        </div>
    
</nav>
		<br>
				<nav class="navbar navbar-expand-md navbar-dark bg-info">
    
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav">
            <a href="market1.jsp" class="nav-item nav-link active">HOME</a>
       </div></div>
</nav>
<div class="text-primary mt-4">
<% 
response.setHeader("cache-control", "no-cache , no-store, must-revalidate");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}
try 
{
	int bill_no=0;
	Class.forName("org.postgresql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/market", "postgres", "rizz");
	Statement st = conn.createStatement();
	ResultSet rs=st.executeQuery("SELECT bill_no FROM sale");
	while(rs.next())
		bill_no=rs.getInt("bill_no");
	bill_no=bill_no+1;
	out.println("BILL NUMBER::::::"+bill_no);
	
}
catch(Exception e)
{
	out.println(e);
}
%>
</div>
<form action="Sale" method="post">
<table>
	<tr><td>PARTY CODE::</td><td><input type="text" name="party_code"></td></tr>
	<tr><td>PARTY NAME::</td><td><input type="text" name="party_name"></td></tr>
	<tr><td>ADDRESS::</td><td><input type="text" name="paddress"></td></tr>
	<tr><td>PHONE NUMBER::</td><td><input type="tel" name="pcontact"></td></tr>
	<tr><td>VEHICLE OWNER::</td><td><input type="text" name="vehicle_owner"></td></tr>
	<tr><td>VEHICLE RENT::</td><td><input type="text" name="rent"></td></tr>
	<tr><td>VEHICLE NUMBER::</td><td><input type="text" name="pvehicle_no"></td></tr>
	<tr><td>CURRENT LOCATION::</td><td><input type="text" name="current_location"></td></tr>
</table>	
	<br>
    <br>
    <table border="1">
    <tr>
    <th>ITEM SHORT NAME</th>
    <th>ITEM NAME</th>
    <th>CARRET TYPE</th>
    <th>TOTAL CARRET</th>
    <th>SALE RATE</th>
    <th>ADVANCE</th>
    <th>PAYMENT</th>
    </tr>
      </tr>
    <tr>
    <th><input type="text" name="short_name" size="15"></th>
    <th><select name="item_name"> <option>select item name</option>
    <option>item1</option><option>item2</option><option>item3</option></select></th>
    <th><select name="carret_type"><option>select carret type</option><option>carret1</option><option>carret2</option><option>carret3</option></select></th>
    <th><input type="text" name="total_carret" size="15"></th>
    <th><input type="text" name="sale_rate" size="15"></th>
    <th><input type="text" name="advance" size="15"></th>
    <th><select name="payment"><option>Select payment type</option><option>paid</option><option>unpaid</option></select></th>
    </tr>
      </tr>
</table>  
    
    <br>

<input  type ="reset" name="reset" value=".....RESET....." class="btn btn-warning">  <br>  

<center>
 

<input  type ="submit" name="INSERT DATA" value=".....SAVE..GO....." class="btn btn-success mb-4">
</center>  
</form>
</div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>