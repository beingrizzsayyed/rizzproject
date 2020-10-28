package com.market;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Rdao
{

	String url="jdbc:postgresql://ec2-34-232-24-202.compute-1.amazonaws.com:5432/d57qi02s5sp7ku";
	String username="gbnmqdweltoxlt";
	String passdb="2ba8cf73627ddd6dc4896c09741005ea101fde5c9313f846e11250b767bc08be";
	String sql="select * from customer where username=?";
	public boolean check(String uname)
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection(url,username,passdb);
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
