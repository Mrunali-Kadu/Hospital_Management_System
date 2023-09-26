package com.data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDataAccess {

	private Connection conn;

	public AppointmentDataAccess() {
		// TODO Auto-generated constructor stub
	}
	
	public AppointmentDataAccess(Connection conn) {
		this.conn = conn;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public boolean addAppointment(Appointment ap)
	{
		boolean f = false;
		
		try {
			String query = "insert into appointment(user_id,fullname,gender,age,appoint_date,email,phno,diseases,doctor_id,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, ap.getUserId());
			pstmt.setString(2, ap.getFullName());
			pstmt.setString(3, ap.getGender());
			pstmt.setString(4, ap.getAge());
			pstmt.setString(5, ap.getAppointdate());
			pstmt.setString(6, ap.getEmail());
			pstmt.setString(7, ap.getPhnNo());
			pstmt.setString(8, ap.getDiseases());
			pstmt.setInt(9, ap.getDoctorId());
			pstmt.setString(10, ap.getAddress());
			pstmt.setString(11, ap.getStatus());
			
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
	
	
	//show the list of Appointment in the View Appointment page
	public List<Appointment> getAllAppointmentByLoginUser(int userId)
	{
		List<Appointment> list = new ArrayList<Appointment>();
		
		Appointment ap = null;
		
		try {
			
			String query = "select * from appointment where user_id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userId);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointdate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhnNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
				
				
				
			}
		} 
		catch (Exception e)
		{
			
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	//method to get appointment from doctor
	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId)
	{
		List<Appointment> list = new ArrayList<Appointment>();
		
		Appointment ap = null;
		
		try {
			
			String query = "select * from appointment where doctor_id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, doctorId);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointdate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhnNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
				
				
				
			}
		} 
		catch (Exception e)
		{
			
			e.printStackTrace();
		}
		return list;
		
	}
	
	//method to get appointment with appointment id to get particular user details
	public Appointment getAppointmentById(int id)
	{
		
		Appointment ap = null;
		
		try {
			
			String query = "select * from appointment where id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointdate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhnNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
				
			}
		} 
		catch (Exception e)
		{
			
			e.printStackTrace();
		}
		return ap;
		
	}
	
	//method to store data of patient after clicking comment
	
	public boolean updateComment(int id,int doctId,String comm)
	{
		boolean f = false;
		
		try {
			
			String query = "update appointment set status=? where id=? and doctor_id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, comm);
			pstmt.setInt(2, id);
			pstmt.setInt(3, doctId);
			
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
	
	
	//method to show the list of patients which took appointment in admin page
	public List<Appointment> getAllAppointment()
	{
		List<Appointment> list = new ArrayList<Appointment>();
		
		Appointment ap = null;
		
		try {
			
			String query = "select * from appointment order by id desc";
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointdate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhnNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
				
				
				
			}
		} 
		catch (Exception e)
		{
			
			e.printStackTrace();
		}
		return list;
		
	}

}
