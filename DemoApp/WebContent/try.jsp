<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try 
{
	int id=0;
	String fn="rizwan";
	String a="m";
	Class.forName("org.postgresql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/market", "postgres", "rizz");
	Statement st = conn.createStatement();
	ResultSet rs=st.executeQuery("SELECT id FROM yoyo");
	while(rs.next())
	 id=rs.getInt("id");
	 id=id+1;
	out.println("ID IS::::::"+id);
	st.executeUpdate("insert into yoyo values("+id+",'"+fn+"','"+a+"')");
	out.println("Data is inserted successfully");
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>