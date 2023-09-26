package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.data_access.DoctorDataAccess;
import com.data_access.UserDataAccess;
import com.db.DBConnection;
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
		
			HttpSession session = req.getSession();
			
			DoctorDataAccess dda = new DoctorDataAccess(DBConnection.getConn());
			Doctor doctor = dda.login(email, password);
			
			if(doctor != null)
			{
				session.setAttribute("doctObj", doctor);
				resp.sendRedirect("doctor/index.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "invalid email and password");
				resp.sendRedirect("doctor_login.jsp");
			}
		
		
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}

	
	
}
