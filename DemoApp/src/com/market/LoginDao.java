package com.market;

import java.io.*;
import java.sql.*;
public class LoginDao 
{

	String url="jdbc:postgresql://localhost:5432/market";
	String user="postgres";
	String passdb="rizz";
	String sql="select * from customer where username=? and pass=?";
	public boolean check(String uname,String pass)
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection(url,user,passdb);
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
