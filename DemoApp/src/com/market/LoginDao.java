package com.market;

import java.io.*;
import java.sql.*;
public class LoginDao 
{

	String url="jdbc:postgresql://ec2-34-232-24-202.compute-1.amazonaws.com:5432/d57qi02s5sp7ku";
	String username="gbnmqdweltoxlt";
	String passdb="2ba8cf73627ddd6dc4896c09741005ea101fde5c9313f846e11250b767bc08be";
	String sql="select * from customer where username=? and pass=?";
	public boolean check(String uname,String pass)
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection(url,username,passdb);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				return true;
			}
			
		
		}
		catch(Exception e)
		{
			
		}
		return false;
	}
}
