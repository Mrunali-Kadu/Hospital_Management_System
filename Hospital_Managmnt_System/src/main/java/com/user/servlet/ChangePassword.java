package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.data_access.UserDataAccess;
import com.db.DBConnection;

@WebServlet("/userChangePassword")
public class ChangePassword  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//get id of that user which is login
		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		UserDataAccess uda = new UserDataAccess(DBConnection.getConn());
		HttpSession session = req.getSession();
		
		if(uda.checkOldPassword(uid, oldPassword))
		{
			if(uda.changePassword(uid, newPassword))
			{
				session.setAttribute("succMsg","Password Change Successfully");
				resp.sendRedirect("change_password.jsp");
			}
			else
			{
				session.setAttribute("errorMsg","Something Went Wrong");
				resp.sendRedirect("change_password.jsp");
			}
		}
		else
		{
			session.setAttribute("errorMsg","Old Password Incorrect");
			resp.sendRedirect("change_password.jsp");
		}
		
	}

	
}
