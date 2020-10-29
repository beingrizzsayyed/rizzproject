package com.market;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class Register extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,NumberFormatException,IOException
	{
		
		try
		{
			response.setContentType("text/html");
			
			String name =request.getParameter("name");
			String bname =request.getParameter("bname");
			String add =request.getParameter("address");
			String uname =request.getParameter("uname");
			String pass =request.getParameter("pass");
			String mail =request.getParameter("mail");
			String contact =request.getParameter("contact");
			
		
			String url="jdbc:postgresql://ec2-34-232-24-202.compute-1.amazonaws.com:5432/d57qi02s5sp7ku";
			String username="gbnmqdweltoxlt";
			String passdb="2ba8cf73627ddd6dc4896c09741005ea101fde5c9313f846e11250b767bc08be";
		
		Class.forName("org.postgresql.Driver");
	    Connection conn=DriverManager.getConnection(url,username,passdb);
	    String sql="select * from customer where username=?";
	    PreparedStatement ps1=conn.prepareStatement(sql);
		ps1.setString(1, uname);
		ResultSet rs=ps1.executeQuery();
		if(rs.next())
		{
			ServletContext sct= this.getServletContext();
		    RequestDispatcher rd = sct.getRequestDispatcher("/register.jsp");
		    request.setAttribute("Error","Sorry! Username already exist. Plz choose another username");
			rd.forward(request, response);
		}
		else
		{
	    PreparedStatement ps=conn.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
	    ps.setString(1,name);
	    ps.setString(2,bname);
	    ps.setString(3,add);
	    ps.setString(4,uname);
	    ps.setString(5,pass);
	    ps.setString(6,mail);
	    ps.setString(7,contact);
	    ps.executeLargeUpdate();
	    ServletContext sct= this.getServletContext();
		RequestDispatcher rd = sct.getRequestDispatcher("/login.jsp");
		request.setAttribute("done","register successful");
		rd.forward(request, response);
		}
	}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
}
