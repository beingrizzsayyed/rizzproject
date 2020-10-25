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
import javax.servlet.http.HttpSession;


@WebServlet("/Modf")
public class Modf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int l=Integer.parseInt(request.getParameter("lable"));
		String n=request.getParameter("payment");
		String message;
		try
		{

			HttpSession session= request.getSession(false);
			String  user=(String)session.getAttribute("username");
		String url="jdbc:postgresql://localhost:5432/market";
		String username="postgres";
		String pass="rizz";
		PreparedStatement ps1,ps2;
		ResultSet rs=null;
		Class.forName("org.postgresql.Driver");
		Connection conn=DriverManager.getConnection(url,username,pass);
		Statement st= conn.createStatement();
		ps1=conn.prepareStatement("update purchase set payment = '"+n+"' where lable_no = "+l+" and cust='"+user+"'");
		ps1.executeUpdate();
		conn.close();
		message= "UPDATE SUCCESSFULL YOU CAN CHECK IN TABLES";
		ServletContext sct= this.getServletContext();
	    RequestDispatcher rd = sct.getRequestDispatcher("/updone.jsp");
	    request.setAttribute("message",message);
		rd.forward(request, response);
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}