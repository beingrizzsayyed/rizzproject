package com.market;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.util.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Addemp")
public class Addemp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int eid=Integer.parseInt(request.getParameter("eid"));
		String name=request.getParameter("name");
		String desg=request.getParameter("desg");
		String sal=request.getParameter("sal");
		
		
		String message;
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
		ps1=conn.prepareStatement("insert into employee values(?,?,?,?)");
		ps1.setInt(1,eid);
		ps1.setString(2,name);
		ps1.setString(3,desg);
		ps1.setString(4,sal);
		ps1.executeLargeUpdate();
		conn.close();
		message= "EMPLOYEE DATA SUCCESSFULLY ADDED, YOU CAN CHECK IN TABLES";
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