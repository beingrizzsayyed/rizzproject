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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Sale")
public class Sale extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int bill_no = 0,party_code=0,advance=0;
		String party_name=null,paddress=null,pvehicle_no=null,vehicle_owner=null,pcontact=null,current_location=null;
		int tm = 0,totalc=0,gt=0; 
		 String short_name=null,item_name=null,carret_type=null,payment=null;
		 int sale_rate=0,rent=0,vr=0;
		 
		 Date date=new Date();
			out.println("<h4 align=\"center\">" +date.toString()+"</h4>");
		try
		{
			HttpSession session= request.getSession(false);
			String  user=(String)session.getAttribute("username");   
			 party_code =Integer.parseInt(request.getParameter("party_code"));
		     party_name =request.getParameter("party_name");
			paddress =request.getParameter("paddress");
			 pcontact =request.getParameter("pcontact");
			 current_location =request.getParameter("current_location");
			 vehicle_owner=request.getParameter("vehicle_owner");
			 rent=Integer.parseInt(request.getParameter("rent"));
			 pvehicle_no =request.getParameter("pvehicle_no");
			advance=Integer.parseInt(request.getParameter("advance"));
			
			out.println("<br>");out.println("<br>");
			
			
			 short_name =request.getParameter("short_name");
			 item_name =request.getParameter("item_name");
			 carret_type =request.getParameter("carret_type");
			 sale_rate =Integer.parseInt(request.getParameter("sale_rate"));
			 totalc=Integer.parseInt(request.getParameter("total_carret"));
			 payment=request.getParameter("payment");
			
			
			
		   
			
			 
			
			out.println("<br>");out.println("<br>");
			
			out.println("<br>");out.println("<br>");
			
			
			tm=sale_rate*totalc;
			
			vr=tm-advance;
			gt=vr+rent;
			 
			 String url="jdbc:postgresql://localhost:5432/market";
				String username="postgres";
				String pass="rizz";
				PreparedStatement ps1,ps2,ps3;
				ResultSet rs=null;
				Class.forName("org.postgresql.Driver");
			    Connection conn=DriverManager.getConnection(url,username,pass);
			    Statement st= conn.createStatement();
			    ResultSet rs1=st.executeQuery("SELECT bill_no FROM sale where cust='"+user+"'");
				while(rs1.next())
					bill_no=rs1.getInt("bill_no");
				bill_no=bill_no+1;
			    
			    ps1=conn.prepareStatement("insert into party values(?,?,?,?,?,?,?)");
			    ps1.setInt(1,bill_no);
			    ps1.setInt(2,party_code);
			    ps1.setString(3,party_name);
			    ps1.setString(4,paddress);
			    ps1.setString(5,pcontact);
			    ps1.setString(6,current_location);
			    ps1.setString(7,user);
			    ps1.executeLargeUpdate();
			    
			    
			    ps2=conn.prepareStatement("insert into sale values(?,?,?,?,?,?,?,?,?,?,?)");
			    ps2.setInt(1,bill_no);
			    ps2.setString(2,short_name);
			    ps2.setString(3,item_name);
			    ps2.setString(4,carret_type);
			    ps2.setInt(5,sale_rate);
			    ps2.setInt(6,totalc);
			    ps2.setInt(7,tm);
			    ps2.setInt(8, advance);
			    ps2.setInt(9,gt);
			    ps2.setString(10,payment);
			    ps2.setString(11,user);
			    ps2.executeLargeUpdate();
			
			    Pdao pd=new Pdao();
				if(pd.check(party_code,user))
				{
					System.out.println("do nothing");
				}
				else
				{
					ps3=conn.prepareStatement("insert into party_info values(?,?,?,?,?)");
					ps3.setInt(1,party_code);
				    ps3.setString(2,party_name);
				    ps3.setString(3,paddress);
				    ps3.setString(4,pcontact);
				    ps3.setString(5,user);
				    ps3.executeLargeUpdate();
				}
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		ServletContext sct= this.getServletContext();
	    RequestDispatcher rd = sct.getRequestDispatcher("/sale1.jsp");
	    request.setAttribute("bill_no",bill_no);
		request.setAttribute("item_name",item_name);
		request.setAttribute("short_name",short_name);
		request.setAttribute("carret_type",carret_type);
		request.setAttribute("sale_rate",sale_rate);
		request.setAttribute("tm",tm);
		request.setAttribute("rent",rent);
		request.setAttribute("totalc",totalc);
		request.setAttribute("gt",gt);
		request.setAttribute("payment",payment);
		request.setAttribute("advance",advance);
		rd.forward(request, response);

		
	}

}
