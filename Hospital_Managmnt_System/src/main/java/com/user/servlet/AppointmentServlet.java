package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.data_access.AppointmentDataAccess;
import com.db.DBConnection;
import com.entity.Appointment;


@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//get input from user from appointment page
		
		int userId = Integer.parseInt(req.getParameter("userid"));
		String fullName = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appointdate = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String phnNo = req.getParameter("phno");
		String diseases = req.getParameter("diseases");
		int doctorId = Integer.parseInt(req.getParameter("doct"));
		String address =  req.getParameter("address");
		
		Appointment ap = new Appointment(userId, fullName, gender, age, appointdate, email, phnNo, diseases, doctorId, address,"Pending");
		
		AppointmentDataAccess ada = new AppointmentDataAccess(DBConnection.getConn());
		
		HttpSession session = req.getSession();
		
		if(ada.addAppointment(ap))
		{
			session.setAttribute("succMsg", "Appointment Successfully");
			resp.sendRedirect("user_appointment.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something went wrong");
			resp.sendRedirect("user_appointment.jsp");
		}
	}

	
}
