<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REPORT</title>

		<link rel="stylesheet" type="text/css" href="style.css" />
		<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body >
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
            <a href="showpur.jsp" class="nav-item nav-link">PURCHASE DATA</a>
             <a href="showsale.jsp" class="nav-item nav-link">SALE DATA</a>
              <a href="account.jsp" class="nav-item nav-link">ACCOUNT</a>
                
        </div>
    </div>
</nav>
 
 <div class="row">

	<div class="col-lg-4">
	</div>
	
	<div class="col-lg-4 card mt-4 mb-4 bg-success shadow">
			
			<B>Notice</B>
			<marquee direction="up" width="300px" truespeed="truespeed" onmouseover="stop()" onmouseout="start()" style="color: red;">
			FOR MORE DETAIL CONTACT::
			</marquee>
			
	</div>
	
	<div class="col-lg-4">
	
	</div>	
</div>
</div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>