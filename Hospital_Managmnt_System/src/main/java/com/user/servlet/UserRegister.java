package com.user.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;

import com.data_access.UserDataAccess;
import com.db.DBConnection;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.*;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	
		try {
			String name = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			User u = new User(name,email,password);
			
			UserDataAccess uda = new UserDataAccess(DBConnection.getConn());
			
			HttpSession session = req.getSession(); 
			
			boolean f = uda.register(u);
			
			if(f)
			{
				session.setAttribute("sucMsg", "Register Successfully");
				resp.sendRedirect("signup.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Something wrong on Server");
				resp.sendRedirect("signup.jsp");
				
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
