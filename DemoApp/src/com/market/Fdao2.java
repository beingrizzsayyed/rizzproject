package com.market;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Fdao2
{
	String url="jdbc:postgresql://localhost:5432/market";
	String user="postgres";
	String passdb="rizz";
	String sql="select * from sub_info where sub_code=? ";
	public boolean check(int sub_code)
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection(url,user,passdb);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, sub_code);
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
