package com.market;

import java.io.IOException;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	
	{
		
		String uname= request.getParameter("uname");
		String pass= request.getParameter("pass");
		try
		{
			String url="jdbc:postgresql://ec2-34-232-24-202.compute-1.amazonaws.com:5432/d57qi02s5sp7ku";
			String username="gbnmqdweltoxlt";
			String passdb="2ba8cf73627ddd6dc4896c09741005ea101fde5c9313f846e11250b767bc08be";
			String sql="select * from customer where username=? and pass=?";
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection(url,username,passdb);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
				{
					HttpSession session = request.getSession();
					session.setAttribute("username", uname);
					response.sendRedirect("market1.jsp");
				}
			else
				{
					ServletContext sct= this.getServletContext();
					RequestDispatcher rd = sct.getRequestDispatcher("/login.jsp");
					request.setAttribute("Error","Sorry! Username or Password Error. Plz Enter Correct Detail ");
					rd.forward(request, response);
			        
				}
		}
		catch(Exception e)
		{
			
		}
	}

	


}
