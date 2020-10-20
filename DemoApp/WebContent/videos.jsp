<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

response.setHeader("cache-control", "no-cache , no-store, must-revalidate");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}
%>

<h1>"SORRY"VIDEOS ARE NOT AVAILABLE NOW PLEASE TRY LATER</h1>

<br>

<form action="Logout" method="post">
<input type="submit" name="logout" value="LOGOUT">

</form>
</body>
</html>