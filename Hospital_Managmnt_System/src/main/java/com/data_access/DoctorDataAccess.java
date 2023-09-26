package com.data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDataAccess {

	private Connection conn;

	public DoctorDataAccess(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean registerDoctor(Doctor d)
	{
		boolean f = false;
		
		try {
			
			String query = "insert into doctor(full_name,dob,qualification,specialist,email,mobno,password) values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getFullname());
			pstmt.setString(2,d.getDob());
			pstmt.setString(3, d.getQualification());
			pstmt.setString(4, d.getSpecialist());
			pstmt.setString(5, d.getEmail());
			pstmt.setString(6, d.getMobNo());
			pstmt.setString(7, d.getPassword());
			
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
	
	
	
	public List<Doctor> getAllDoctor() {
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;
		try {

			String sql = "select * from doctor order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				d.setPassword(rs.getString(8));
				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	
	//get the doctor by id to edit
	//we want only one doctor ,we pass id because data store in db with unique id and with id we get all details
	public Doctor getDoctorById(int id)
	{
		
		Doctor d = null;
		
		try {
			
			//show doctor list in desc order 
			String query = "select * from doctor where id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				d.setPassword(rs.getString(8));  //we stored all in doctor object
			
				
			}
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return d;                          //return that object
	}
	
	
	//update doctor details by id
	public boolean updateDoctor(Doctor d)
	{
		boolean f = false;
		
		try {
			
			String query = "update doctor set full_name=?,dob=?,qualification=?,specialist=?,email=?,mobno=?,password=? where id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getFullname());
			pstmt.setString(2,d.getDob());
			pstmt.setString(3, d.getQualification());
			pstmt.setString(4, d.getSpecialist());
			pstmt.setString(5, d.getEmail());
			pstmt.setString(6, d.getMobNo());
			pstmt.setString(7, d.getPassword());
			pstmt.setInt(8, d.getId());
			
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
	
	//delete doctor details
	public boolean deleteDoctor(int id)
	{
		boolean f = false;
		
		try {
			
			String query = "delete from doctor where id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			
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
	
	
	//method to login doctor
	public Doctor login(String email,String pswd)
	{
		Doctor d = null;
		
		try {
			
			String query = "select * from doctor where email=? and password=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, pswd);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				d.setPassword(rs.getString(8));
				
			}
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
		return d;
		
	}
	
	
	//method to count of doctors that is stored
	public int countDoctor()
	{
		int i=0;
		
		try {
			
			String query = "select * from doctor";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				i++;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return i;
	}
	
	//method to count Appointment
	public int countAppointment()
	{
		int i=0;
		
		try {
			
			String query = "select * from appointment";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				i++;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	//method to count User
		public int countUser()
		{
			int i=0;
			
			try {
				
				String query = "select * from user";
				PreparedStatement pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					i++;
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return i;
		}
		
		
		//method to count Specialist
		public int countSpecialist()
		{
			int i=0;
			
			try {
				
				String query = "select * from specialist";
				PreparedStatement pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					i++;
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return i;
		}
		
		
		//method to count Appointment By doctor Id in doctor page
		public int countAppointmentByDoctorId(int did)
		{
			int i=0;
			
			try {
				
				String query = "select * from appointment where doctor_id=?";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, did);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					i++;
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return i;
		}


		
		//method to check doctor password
		public boolean checkOldPassword(int userid,String oldPassword)
		{
			boolean f = false;
			
			try {
				
				String query = "select * from doctor where id=? and password=?";
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
		
		//method to change doctor password
			public boolean changePassword(int userid,String newPassword)
			{
				boolean f = false;
				
				try {
					
					String query = "update doctor set password = ? where id=?";
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
			
	
//method to edit doctor profile
			public boolean editDoctorProfile(Doctor d)
			{
				boolean f = false;
				
				try {
					
					String query = "update doctor set full_name=?,dob=?,qualification=?,specialist=?,email=?,mobno=? where id=?";
					PreparedStatement pstmt = conn.prepareStatement(query);
					pstmt.setString(1, d.getFullname());
					pstmt.setString(2,d.getDob());
					pstmt.setString(3, d.getQualification());
					pstmt.setString(4, d.getSpecialist());
					pstmt.setString(5, d.getEmail());
					pstmt.setString(6, d.getMobNo());
					pstmt.setInt(7, d.getId());
					
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
