<%@page import="com.entity.Doctor"%>
<%@page import="com.data_access.DoctorDataAccess"%>
<%@page import="com.doctor.servlet.DoctorLogin"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.data_access.AppointmentDataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>

<style type="text/css">

.card{
	position: relative;
    display: flex;
    flex-direction: column;
    min-width: 52px;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
    margin: 30px;
}

.paint-card{
 	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
 }

</style>
</head>

<body>

	<%@include file="navbar.jsp" %>
	
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>
				
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
					
					<%
						AppointmentDataAccess ada = new AppointmentDataAccess(DBConnection.getConn());
					    DoctorDataAccess dda = new DoctorDataAccess(DBConnection.getConn());  //get doctor id from db  to get doctor details
						List<Appointment> list = ada.getAllAppointment();
						
						for(Appointment ap:list)
						{
							Doctor d = dda.getDoctorById(ap.getDoctorId());
						%>
							 <tr>
								<th><%=ap.getFullName() %></th>
								<td><%=ap.getGender() %></td>
								<td><%=ap.getAge() %></td>
								<td><%=ap.getAppointdate() %></td>
								<td><%=ap.getEmail() %></td>
								<td><%=ap.getPhnNo() %></td>
								<td><%=ap.getDiseases() %></td>
								<td><%=d.getFullname() %></td>
								<td><%=ap.getAddress() %></td>
								<td><%=ap.getStatus() %></td>
							</tr>
					
						<%}
					%>
					
					</tbody>
						
				</table>
			</div>
		</div>
	</div>

</body>
</html>