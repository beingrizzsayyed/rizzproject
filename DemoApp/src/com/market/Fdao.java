package com.market;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Fdao
{
	String url="jdbc:postgresql://localhost:5432/market";
	String use="postgres";
	String passdb="rizz";
	String sql="select * from farmer_info where farmer_code=? and cust=? ";
	public boolean check(int farmer_code,String user)
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection(url,use,passdb);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, farmer_code);
			ps.setString(2, user);
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
