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

@WebServlet("/Dltemp")
public class Dltemp extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int eid=Integer.parseInt(request.getParameter("eid"));
		String message;
		try
		{

			HttpSession session= request.getSession(false);
			String  user=(String)session.getAttribute("username");
			String url="jdbc:postgresql://ec2-34-232-24-202.compute-1.amazonaws.com:5432/d57qi02s5sp7ku";
			String username="gbnmqdweltoxlt";
			String pass="2ba8cf73627ddd6dc4896c09741005ea101fde5c9313f846e11250b767bc08be";
		PreparedStatement ps1,ps2;
		ResultSet rs=null;
		Class.forName("org.postgresql.Driver");
		Connection conn=DriverManager.getConnection(url,username,pass);
		Statement st= conn.createStatement();
		ps1=conn.prepareStatement("delete from employee where e_id ="+eid+" and cust='"+user+"' ");
		ps1.executeUpdate();
		conn.close();
		message= "DELETE SUCCESSFULL YOU CAN CHECK IN TABLES";
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