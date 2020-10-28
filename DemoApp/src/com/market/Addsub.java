package com.market;

import java.io.IOException;
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


@WebServlet("/Addsub")
public class Addsub extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		int scode=Integer.parseInt(request.getParameter("scode"));
		String name=request.getParameter("name");
		String add=request.getParameter("add");
		String phone=request.getParameter("phone");
		
		
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
		ps1=conn.prepareStatement("insert into sub_info values(?,?,?,?,?)");
		ps1.setInt(1,scode);
		ps1.setString(2,name);
		ps1.setString(3,add);
		ps1.setString(4,phone);
		ps1.setString(5,user);
		ps1.executeLargeUpdate();
		conn.close();
		message= "SUB-MERCHANT DATA SUCCESSFULLY ADDED, YOU CAN CHECK IN TABLES";
		ServletContext sct= this.getServletContext();
	    RequestDispatcher rd = sct.getRequestDispatcher("/subpurchase.jsp");
	    request.setAttribute("message",message);
		rd.forward(request, response);
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
   

}
