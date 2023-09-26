package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.data_access.DoctorDataAccess;
import com.db.DBConnection;
import com.entity.Doctor;

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
					
					String fullname = req.getParameter("fullname");
					String dob = req.getParameter("dob");
					String qualification = req.getParameter("qualification");
					String spec = req.getParameter("spec");
					String email = req.getParameter("email");
					String mobno = req.getParameter("mobno");
				
					
					int id = Integer.parseInt(req.getParameter("id"));
					
					Doctor d = new Doctor(id,fullname, dob, qualification, spec, email, mobno,"");
					
					DoctorDataAccess dda = new DoctorDataAccess(DBConnection.getConn());
					
					HttpSession session = req.getSession();
					
					if(dda.editDoctorProfile(d))
					{
						//override the values in edit doctor page
						Doctor updateDoctor = dda.getDoctorById(id);
						session.setAttribute("succMsgd", "Doctor Update Successfully");
						session.setAttribute("doctObj", updateDoctor);
						resp.sendRedirect("doctor/edit_profile.jsp");
						
					}
					else
					{
						session.setAttribute("errorMsgd", "Something went wrong");
						resp.sendRedirect("doctor/edit_profile.jsp");
					}
					
				} 
				catch (Exception e) {
					
					e.printStackTrace();
				}
			}



	
}
