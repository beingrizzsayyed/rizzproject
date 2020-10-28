<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PURCHASE DETAILS</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script type="text/javascript">
function printDiv() 
{

  var divToPrint=document.getElementById('DivIdToPrint');

  var newWin=window.open('','Print-Window');

  newWin.document.open();

  newWin.document.write('<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');

  newWin.document.close();

  setTimeout(function(){newWin.close();},10);

}
</script>
</head>
<body>
<div id="outer">
	<nav class="navbar navbar-expand-md navbar-dark bg-info">
    <a href="#" style="text-decoration:none;"" class="navbar-brand">TOMATTO BILLING SYSTEM</a>
    <div class="form-inline ml-auto">
            
            <a href="logout.jsp"><button type="submit" class="btn btn-danger">Logout</button></a>
        </div>
    
</nav>
		</div>
	<br><br>
	<nav class="navbar navbar-expand-md navbar-dark bg-info">
    
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav">
            <a href="market1.jsp" class="nav-item nav-link active">HOME</a>
            <a href="purchase.jsp" class="nav-item nav-link active">NEW</a>
       </div></div>
</nav>
		<br class="clear" />
		
<% 
response.setHeader("cache-control", "no-cache , no-store, must-revalidate");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}
out.println(request.getAttribute("c"));
%>
		<center>
		<div id='DivIdToPrint'>
	<h4>PURCHASE BILL</h4>
	
	
<%
out.println("<table>");
out.println("<tr><td>LABLE NUMBER</td><td>::</td>"); out.println("<td>"+request.getAttribute("lable_no")+"</td></tr>");
out.println("<tr><td>ITEM CODE</td><td>::</td>"); out.println("<td>"+request.getAttribute("item_code")+"</td></tr>");
out.println("<tr><td>ITEM NAME</td><td>::</td>"); out.println("<td>"+request.getAttribute("item_name")+"</td></tr>");
out.println("<tr><td>QUANTITY</td><td>::</td>"); out.println("<td>"+request.getAttribute("quantity")+"</td></tr>");
out.println("<tr><td>SALE RATE</td><td>::</td>"); out.println("<td>"+request.getAttribute("sale_rate")+"</td></tr>");
out.println("<tr><td>TOTAL AMMOUNT</td><td>::</td>"); out.println("<td>"+request.getAttribute("tm")+"</td></tr>");
out.println("<tr><td>FRIEGHT</td><td>::</td>"); out.println("<td>"+request.getAttribute("cf")+"</td></tr>");
out.println("<tr><td>GRAND TOTAL</td><td>::</td>"); out.println("<td>"+request.getAttribute("gt")+"</td></tr>");
out.println("<tr><td>PAYMENT</td><td>::</td>"); out.println("<td>"+request.getAttribute("payment")+"</td></tr>");
out.println("</table>");
%>
</div>
<br>
<input type='button' id='btn' value='Print' onclick='printDiv();' class="btn btn-success mb-4">
</center>
</div>
</body>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>