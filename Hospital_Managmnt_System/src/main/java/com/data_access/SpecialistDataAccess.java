package com.data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDataAccess {

	private Connection conn;
	
	public SpecialistDataAccess() {
		// TODO Auto-generated constructor stub
	}

	public SpecialistDataAccess(Connection conn) {
		super();
		this.conn = conn;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	public boolean addSpecialist(String spec)
	{
		boolean f = false;
		
		try {
			
			String query = "insert into specialist(spec_name) values(?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, spec);
			
			int i = pstmt.executeUpdate();
			
			if(i == 1)
			{
				f = true;
			}
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	
	//method to show list for doctors
	public List<Specialist> getAllSpecialist()
	{
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;
		
		try {
			
			String query = "select * from specialist";
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				//create object of Specialist class
				s = new Specialist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				list.add(s);   //stored it as object of specialist
			}
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}
		return list;
	}
}
