<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UNPAID SALE</title>
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
				
<div style="height:300px; overflow:auto" class="mt-4 mb-4">
<% 
response.setHeader("cache-control", "no-cache , no-store, must-revalidate");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}
%>			
<%
try
{
	String url="jdbc:postgresql://localhost:5432/market";
	String username="postgres";
	String pass="rizz";
	PreparedStatement ps1,ps2;
	ResultSet rs=null;
	Class.forName("org.postgresql.Driver");
	Connection conn=DriverManager.getConnection(url,username,pass);
	Statement st= conn.createStatement();
	rs=st.executeQuery("select * from sale where payment='unpaid' ");
    out.println("<table border=10>");
    out.println("<tr> ");
    out.println("<td>BILL NUMBER</td>");
    out.println("<td>SHORT NAME</td>");
    out.println("<td>ITEM NAME</td>");
    out.println("<td>CARRET TYPE</td>");
    out.println("<td>SALE RATE </td>");
    out.println("<td>TOTAL CARRET </td>");
    out.println("<td> AMMOUNT</td>");
    out.println("<td>ADVANCE</td>");
    out.println("<td>PAYMENT </td>");
    out.println("<td>DATE </td>");
    out.println("</tr>");
	while(rs.next())
	{
		out.println("<tr>");
		
		out.println("<td>"+rs.getInt(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("<td>"+rs.getInt(5)+"</td>");
		out.println("<td>"+rs.getInt(6)+"</td>");
		out.println("<td>"+rs.getInt(7)+"</td>");
		out.println("<td>"+rs.getInt(8)+"</td>");
		out.println("<td>"+rs.getString(9)+"</td>");
		out.println("<td>"+rs.getString(10)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	conn.close();
}
catch(Exception e)
{
   System.out.println(e);
}
%>
</div>
</div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>