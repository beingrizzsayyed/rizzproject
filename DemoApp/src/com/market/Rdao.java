package com.market;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Rdao
{

	String url="jdbc:postgresql://localhost:5432/market";
	String user="postgres";
	String passdb="rizz";
	String sql="select * from customer where username=?";
	public boolean check(String uname)
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection(url,user,passdb);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, uname);
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
