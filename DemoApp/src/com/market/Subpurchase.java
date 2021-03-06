package com.market;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class Subpurchase extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int lable_no = 0,sub_code=0;
		String name=null,address=null,phone_no=null;
		int tm = 0,cf=0,gt=0; 
		int item_code=0,quantity=0,sale_rate=0,frieght=0,carret=0;
		 String item_name=null,payment=null;
		
		      Date date=new Date();
			out.println("<h4 align=\"center\">" +date.toString()+"</h4>");
		try
		{
			HttpSession session= request.getSession(false);
			String  user=(String)session.getAttribute("username");   
			 sub_code =Integer.parseInt(request.getParameter("sub_code"));
		     name =request.getParameter("name");
			address =request.getParameter("address");
			 phone_no =request.getParameter("phone_no");
			
			
			out.println("<br>");out.println("<br>");
			
			
			
			 item_code =Integer.parseInt(request.getParameter("item_code"));
			 item_name =request.getParameter("item_name");
			 quantity =Integer.parseInt(request.getParameter("quantity"));
			 sale_rate =Integer.parseInt(request.getParameter("sale_rate"));
			 frieght =Integer.parseInt(request.getParameter("frieght"));
			 carret =Integer.parseInt(request.getParameter("carret"));
			 payment=request.getParameter("payment");
			 
		    tm=sale_rate*quantity;;
			cf=carret*frieght;
			gt=tm+cf;
			
			
			String url="jdbc:postgresql://ec2-34-232-24-202.compute-1.amazonaws.com:5432/d57qi02s5sp7ku";
			String username="gbnmqdweltoxlt";
			String pass="2ba8cf73627ddd6dc4896c09741005ea101fde5c9313f846e11250b767bc08be";
				PreparedStatement ps1,ps3,ps4;
				ResultSet rs=null;
				Class.forName("org.postgresql.Driver");
			    Connection conn=DriverManager.getConnection(url,username,pass);
			    Statement st= conn.createStatement();
			    ResultSet rs1=st.executeQuery("SELECT lable_no FROM purchase where cust='"+user+"'");
				while(rs1.next())
					lable_no=rs1.getInt("lable_no");
				lable_no=lable_no+1;
			    
			    ps1=conn.prepareStatement("insert into sub values(?,?,?,?,?,?)");
			    ps1.setInt(1,lable_no);
			    ps1.setInt(2,sub_code);
			    ps1.setString(3,name);
			    ps1.setString(4,address);
			    ps1.setString(5,phone_no);
			    ps1.setString(6,user);
			    ps1.executeLargeUpdate();
			    
			    ps3=conn.prepareStatement("insert into purchase values(?,?,?,?,?,?,?,?,?,?,?,?)");
			    ps3.setInt(1,lable_no);
			    ps3.setInt(2,item_code);
			    ps3.setString(3,item_name);
			    ps3.setInt(4,quantity);
			    ps3.setInt(5,sale_rate);
			    ps3.setInt(6,frieght);
			    ps3.setInt(7,carret);
			    ps3.setInt(8,tm);
			    ps3.setInt(9,cf);
			    ps3.setInt(10,gt);
			    ps3.setString(11,payment);
			    ps3.setString(12,user);
			    ps3.executeLargeUpdate();
			    
			 
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		ServletContext sct= this.getServletContext();
	    RequestDispatcher rd = sct.getRequestDispatcher("/purchase2.jsp");
	    request.setAttribute("lable_no",lable_no);
		request.setAttribute("item_name",item_name);
		request.setAttribute("item_code",item_code);
		request.setAttribute("quantity",quantity);
		request.setAttribute("sale_rate",sale_rate);
		request.setAttribute("tm",tm);
		request.setAttribute("cf",cf);
		request.setAttribute("gt",gt);
		request.setAttribute("payment",payment);
		rd.forward(request, response);
	}

}