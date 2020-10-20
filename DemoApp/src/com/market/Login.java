package com.market;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class Login extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	
	{
		
		String uname= request.getParameter("uname");
		String pass= request.getParameter("pass");
		
		LoginDao dao=new LoginDao();
		if(dao.check(uname, pass))
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

	


}
