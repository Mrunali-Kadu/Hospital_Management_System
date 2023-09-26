package com.data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDataAccess {

	private Connection conn;
	
	public UserDataAccess(Connection conn)
	{
		super();
		this.conn = conn;
	}
	
	public boolean register(User u)
	{
		boolean f = false;
		
		try {
			String query = "insert into user(full_name,email,password) values(?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			
			int i = pstmt.executeUpdate();
			
			if(i == 1)
			{
				f = true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User login(String em,String pswd)
	{
		User u = null;
		
		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, em);
			pstmt.setString(2, pswd);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return u;
	}
	
	//method to check password
	public boolean checkOldPassword(int userid,String oldPassword)
	{
		boolean f = false;
		
		try {
			
			String query = "select * from user where id=? and password=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userid);
			pstmt.setString(2, oldPassword);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				f = true;
			}
		}
		catch (Exception e) {
		
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	//method to change password
		public boolean changePassword(int userid,String newPassword)
		{
			boolean f = false;
			
			try {
				
				String query = "update user set password = ? where id=?";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setString(1, newPassword);
				pstmt.setInt(2, userid);
				
				
				int i = pstmt.executeUpdate();
				
				if(i == 1)
				{
					f = true;
				}
			}
			catch (Exception e) {
			
				e.printStackTrace();
			}
			
			return f;
			
		}
}
