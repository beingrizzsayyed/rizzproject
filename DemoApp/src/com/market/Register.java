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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/Register")
public class Register extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,NumberFormatException,IOException
	{
		
		try
		{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			String name =request.getParameter("name");
			String bname =request.getParameter("bname");
			String add =request.getParameter("address");
			String uname =request.getParameter("uname");
			String pass =request.getParameter("pass");
			
		
		String url="jdbc:postgresql://localhost:5432/market";
		String username="postgres";
		String passdb="rizz";
		
		ResultSet rs;
		Class.forName("org.postgresql.Driver");
	    Connection conn=DriverManager.getConnection(url,username,passdb);
	    Statement st= conn.createStatement();
	    PreparedStatement ps=conn.prepareStatement("insert into customer values(?,?,?,?,?)");
	    ps.setString(1,name);
	    ps.setString(2,bname);
	    ps.setString(3,add);
	    ps.setString(4,uname);
	    ps.setString(5,pass);
	    ps.executeLargeUpdate();
	    ServletContext sct= this.getServletContext();
		RequestDispatcher rd = sct.getRequestDispatcher("/login.jsp");
		rd.forward(request, response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
}
