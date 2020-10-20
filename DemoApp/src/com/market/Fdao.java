package com.market;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Fdao
{
	String url="jdbc:postgresql://localhost:5432/market";
	String user="postgres";
	String passdb="rizz";
	String sql="select * from farmer_info where farmer_code=? ";
	public boolean check(int farmer_code)
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection(url,user,passdb);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, farmer_code);
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
