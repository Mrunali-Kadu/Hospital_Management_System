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

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDataAccess dda = new DoctorDataAccess(DBConnection.getConn());
		
		HttpSession session = req.getSession();
		
		if(dda.deleteDoctor(id))
		{
			session.setAttribute("succMsg", "Doctor Delete Successfully");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something went wrong");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
	}

	
	
}
