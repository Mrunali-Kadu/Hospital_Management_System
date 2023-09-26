package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.data_access.SpecialistDataAccess;
import com.db.DBConnection;
import com.entity.User;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String specName = req.getParameter("specName");
		SpecialistDataAccess sda = new SpecialistDataAccess(DBConnection.getConn());
		boolean f = sda.addSpecialist(specName);
		
		HttpSession session = req.getSession();
		
		if(f)
		{
			session.setAttribute("succMsg", "Specialist added");
			resp.sendRedirect("admin/index.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something went wrong");
			resp.sendRedirect("admin/index.jsp");
		}
		
	}

	
}
