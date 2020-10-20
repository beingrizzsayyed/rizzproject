<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>farmer INFO</title>
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
	
<div class="row mt-4">				
<div style="height:300px; overflow:auto" class="col-lg-7">					
<%
response.setHeader("cache-control", "no-cache , no-store, must-revalidate");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}

String n=request.getParameter("search");
try{
String url="jdbc:postgresql://localhost:5432/market";
String username="postgres";
String pass="rizz";
PreparedStatement ps1,ps2;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
Connection conn=DriverManager.getConnection(url,username,pass);
Statement st= conn.createStatement();
rs=st.executeQuery("select * from farmer where farmer_name like '%"+n+"%'");
out.println("<html>");
out.println("<body>");
out.println("<table border=10>");
out.println("<tr> ");
out.println("<td>LABLE NUMBER</td>");
out.println("<td>FARMER CODE</td>");
out.println("<td>FARMER NAME</td>");
out.println("<td>ADDRESS</td>");
out.println("<td>PHONE NUMBER</td>");
out.println("<td>DATE</td>");
out.println("</tr>");
while(rs.next())
{
	out.println("<tr>");
	out.println("<td>"+rs.getInt(1)+"</td>");
	out.println("<td>"+rs.getInt(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("<td>"+rs.getString(6)+"</td>");
	out.println("</tr>");
}
out.println("</table></body></html>");
conn.close();
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</div>
<div class="col-lg-4 card mt-4 mb-4 bg-success shadow">
			
			<B>Notice</B>
			<marquee direction="up" width="300px" truespeed="truespeed" onmouseover="stop()" onmouseout="start()" style="color: red;">
			FOR MORE DETAIL CONTACT::
			</marquee>
			
	</div>
</div>
</div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>