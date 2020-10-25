<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*"%>
     <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>purchase</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
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
<div class="text-primary">
<% 
response.setHeader("cache-control", "no-cache , no-store, must-revalidate");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}

try 
{
	String  user=(String)session.getAttribute("username");
	int lable_no=0;
	Class.forName("org.postgresql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/market", "postgres", "rizz");
	Statement st = conn.createStatement();
	ResultSet rs=st.executeQuery("SELECT lable_no FROM purchase where cust='"+user+"'");
	while(rs.next())
		lable_no=rs.getInt("lable_no");
	lable_no=lable_no+1;
	out.println("LABLE NUMBER::::::"+lable_no);
	
}
catch(Exception e)
{
	out.println(e);
}
%>
</div>
<form action="Subpurchase" method="post" class="mt-4">
	<table>
	<tr><td>SUB-MERCHANT CODE::</td><td><input type="text" name="sub_code"></td></tr>
	<tr><td> NAME::</td><td><input type="text" name="name"></td></tr>
	<tr><td>ADDRESS::</td><td><input type="text" name="address"></td></tr>
	<tr><td>PHONE NUMBER::</td><td><input type="tel" name="phone_no"></td></tr>
	</table>
    <br>
    <br>
    <table border="1">
    <tr>
    <th>ITEM CODE</th>
    <th>ITEM NAME</th>
    <th>QUANTITY </th>
    <th>SALE RATE </th>
    <th>FRIEGHT PER CARRET</th>
    <th>CARRET QUANTITY</th>
    <th>PAYMENT</th>
    </tr>
    <tr>
    <th><input type="text" name="item_code" size="15"></th>
    <th><select name="item_name"><option>select item name</option>
    <option>item1</option><option>item2</option><option>item3</option></select></th>
    <th><input type="text" name="quantity" size="15"></th>
    <th><input type="text" name="sale_rate" size="15"></th>
    <th><input type="text" name="frieght" size="15"></th>
    <th><input type="text" name="carret" size="15"> </th>
    <th><select name="payment" ><option>Select payment type</option><option>paid</option><option>unpaid</option></select></th>
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