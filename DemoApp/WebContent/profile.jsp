<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> USER PROFILE</title>
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
				
<div  class="mt-4">
<% 
response.setHeader("cache-control", "no-cache , no-store, must-revalidate");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}
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
	rs=st.executeQuery("select name,buisness_name,address,username,mail_id,contact from customer where username='"+session.getAttribute("username")+"' ");
	while(rs.next())
	{
	 out.println("<table>");
	    out.println("<tr><td>NAME::</td><td>"+rs.getString(1)+"</td></tr>");
	    out.println("<tr> <td>BUISNESS NAME::</td><td>"+rs.getString(2)+"</td></tr>");
	    out.println("<tr> <td>ADDRESS::</td><td>"+rs.getString(3)+"</td></tr>");
	    out.println("<tr> <td>USERNAME::</td><td>"+rs.getString(4)+"</td></tr>");
	    out.println("<tr> <td>MAIL ID::</td><td>"+rs.getString(5)+"</td></tr>");
	    out.println("<tr> <td>CONTACT::</td><td>"+rs.getString(6)+"</td></tr>");
	    out.println("</table>");
	}
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