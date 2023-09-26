package com.admin.servlet;

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


@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
try {
			
			String fullname = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			String password = req.getParameter("password");
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			Doctor d = new Doctor(id,fullname, dob, qualification, spec, email, mobno, password);
			
			DoctorDataAccess dda = new DoctorDataAccess(DBConnection.getConn());
			
			HttpSession session = req.getSession();
			
			if(dda.updateDoctor(d))
			{
				session.setAttribute("succMsg", "Doctor Update Successfully");
				resp.sendRedirect("admin/view_doctor.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Something went wrong");
				resp.sendRedirect("admin/view_doctor.jsp");
			}
			
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}
	}


	}

	
