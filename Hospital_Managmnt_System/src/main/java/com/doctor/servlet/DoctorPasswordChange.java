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

@WebServlet("/doctorChangePassword")
public class DoctorPasswordChange extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//get id of that user which is login
		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		DoctorDataAccess dda = new DoctorDataAccess(DBConnection.getConn());
		HttpSession session = req.getSession();
		
		if(dda.checkOldPassword(uid, oldPassword))
		{
			if(dda.changePassword(uid, newPassword))
			{
				session.setAttribute("succMsg","Password Change Successfully");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
			else
			{
				session.setAttribute("errorMsg","Something Went Wrong");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
		}
		else
		{
			session.setAttribute("errorMsg","Old Password Incorrect");
			resp.sendRedirect("doctor/edit_profile.jsp");
		}
		
	}

	
}
