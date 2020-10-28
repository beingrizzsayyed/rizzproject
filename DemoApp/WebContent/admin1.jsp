<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INFORMATION OF USERS</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
<div id="outer">
<nav class="navbar navbar-expand-md navbar-dark bg-info">
    <a href="#" style="text-decoration:none;"" class="navbar-brand">TOMATTO BILLING SYSTEM</a>
    <div class="form-inline ml-auto">
            
            <form action="Alogout" method="post"><button type="submit" class="btn btn-danger">Logout</button></form>
        </div>
    
</nav>
<div style="height:300px; overflow:auto" class="mt-4 mb-4 ml-4">	
<% 
response.setHeader("cache-control", "no-cache , no-store, must-revalidate");
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("admin.jsp");
}
try
{
	String url="jdbc:postgresql://ec2-34-232-24-202.compute-1.amazonaws.com:5432/d57qi02s5sp7ku";
	String username="gbnmqdweltoxlt";
	String pass="2ba8cf73627ddd6dc4896c09741005ea101fde5c9313f846e11250b767bc08be";
	int c=0;
	PreparedStatement ps1,ps2;
	ResultSet rs=null,rs1=null;
	Class.forName("org.postgresql.Driver");
	Connection conn=DriverManager.getConnection(url,username,pass);
	Statement st= conn.createStatement();
	rs1=st.executeQuery("select count(*) from customer");
	while(rs1.next())
		c=rs1.getInt("count");
	out.println("<table border=3><tr>");
	out.println("<td>TOTAL USER::::::</td><td>"+c );
	out.println("</td></tr></table>");
	rs=st.executeQuery("select * from customer ");
	 out.println("<table border=3><tr>");
	    out.println("<td>NAME</td>");
	    out.println("<td>BUISNESS NAME</td>");
	    out.println(" <td>ADDRESS</td>");
	    out.println(" <td>USERNAME</td>");
	    out.println(" <td>PASSWARD</td>");
	    out.println(" <td>MAIL ID</td>");
	    out.println(" <td>CONTACT</td>");
	    out.println("</tr>");
	
	
	while(rs.next())
	{
	 out.println("<tr>");
	    out.println("<td>"+rs.getString(1)+"</td>");
	    out.println(" <td>"+rs.getString(2)+"</td>");
	    out.println(" <td>"+rs.getString(3)+"</td>");
	    out.println(" <td>"+rs.getString(4)+"</td>");
	    out.println(" <td>"+rs.getString(5)+"</td>");
	    out.println(" <td>"+rs.getString(6)+"</td>");
	    out.println(" <td>"+rs.getString(7)+"</td>");
	    out.println("</tr>");
	}
	out.println("</table>");
}
catch(Exception e)
{
   System.out.println(e);
}
%>
</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>