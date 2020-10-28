package com.market;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Alogout")
public class Alogout extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	
	{
		HttpSession session_a = request.getSession();
		session_a.removeAttribute("username");
		session_a.invalidate();
		
		response.sendRedirect("admin.jsp");
	}


}
