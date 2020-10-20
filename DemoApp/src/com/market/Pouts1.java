package com.market;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Pouts1
 */
@WebServlet("/Pouts1")
public class Pouts1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		try{
		String url="jdbc:postgresql://localhost:5432/market";
		String username="postgres";
		String pass="rizz";
		PreparedStatement ps1,ps2;
		ResultSet rs=null;
		Class.forName("org.postgresql.Driver");
		Connection conn=DriverManager.getConnection(url,username,pass);
		Statement st= conn.createStatement();
		rs=st.executeQuery("select * from party");
		out.println("<html>");
	    out.println("<body>");
	    out.println("<table border=10>");
	    out.println("<tr> ");
	    out.println("<td>BILL NUMBER</td>");
	    out.println("<td>PARTY CODE</td>");
	    out.println("<td>PARTY NAME</td>");
	    out.println("<td>ADDRESS </td>");
	    out.println("<td>CONTACT </td>");
	    out.println("<td>CURRENT LOCATION </td>");
	    out.println("<td>VEHICLE NUMBER</td>");
	    out.println("<td>SALE TYPE</td>");
	    out.println("<td>ADVANCE</td>");
	    out.println("<td>DATE</td>");
	    out.println("</tr>");
		while(rs.next())
		{
			out.println("<tr>");
			out.println("<td>"+rs.getInt(1)+"</td>");
			out.println("<td>"+rs.getInt(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td>");
			out.println("<td>"+rs.getString(5)+"</td>");
			out.println("<td>"+rs.getString(6)+"</td>");
			out.println("<td>"+rs.getString(7)+"</td>");
			out.println("<td>"+rs.getString(8)+"</td>");
			out.println("<td>"+rs.getInt(9)+"</td>");
			out.println("<td>"+rs.getString(10)+"</td>");
			out.println("</tr>");
		}
		out.println("</table></body></html>");
		conn.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}