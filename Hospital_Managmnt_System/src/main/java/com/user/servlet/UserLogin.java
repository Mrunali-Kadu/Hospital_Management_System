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
import com.entity.User;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
				String email = req.getParameter("email");
				String password = req.getParameter("password");
			
				HttpSession session = req.getSession();
				
				UserDataAccess uad = new UserDataAccess(DBConnection.getConn());
				User user = uad.login(email, password);
			
				if(user != null)
				{
					session.setAttribute("userObj", user);
					resp.sendRedirect("index.jsp");
				}
				else
				{
					session.setAttribute("errorMsg", "invalid email and password");
					resp.sendRedirect("user_login.jsp");
				}
			
			
			} catch (Exception e) {
				e.printStackTrace();
			
			}
		
	}

	

}
