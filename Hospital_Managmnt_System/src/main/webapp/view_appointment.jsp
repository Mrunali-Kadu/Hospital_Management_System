<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.data_access.DoctorDataAccess"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.data_access.AppointmentDataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored = "false"  %> <!-- it is true by default -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <%@include file="component/allcss.jsp" %>

</head>

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
 
 .backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

img{
	width:100%;
	height:100%;
	margin:10px;
}

.btn-sm{
    padding: .25rem .5rem;
    font-size: .875rem;
    border-radius: .2rem;
    margin: -90px;
}
 

</style>

<body>

<!-- if user not login in appointment page redirect to user login page  -->
	<c:if test="${empty userObj }">
	<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="component/navbar.jsp" %>
	
	<div class="container backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
						List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							
							<tbody>
							
							<%
								User user = (User) session.getAttribute("userObj");
								AppointmentDataAccess ada = new AppointmentDataAccess(DBConnection.getConn());
								DoctorDataAccess dda = new DoctorDataAccess(DBConnection.getConn());
								List<Appointment> list = ada.getAllAppointmentByLoginUser(user.getId());
							
									for(Appointment ap : list)
									{
										//with doctor id we get doctor details
										Doctor d = dda.getDoctorById(ap.getDoctorId());
										%>
											<tr>
												<th><%=ap.getFullName() %></td>
												<td><%=ap.getGender() %></td>
												<td><%=ap.getAge() %></td>
												<td><%=ap.getAppointdate() %></td>
												<td><%=ap.getDiseases() %></td>
												<td><%=d.getFullname() %><td>
												<td>
													<% 
														if("Pending".equals(ap.getStatus()))
														{%>
															<a href="#" class="btn btn-sm btn-warning">Pending</a>
														<%}
														else
														{%>
															
														<%}
													
													%>
												</td>
											</tr>
						
										
										<%
									}
							%>
							
									</tbody>
							
						</table>
					</div>
				</div>
			</div>
			
			<div class="col-md-3 p-3">
				<img alt="" src="img/doct4.png">
			</div>
		</div>
	</div>
</body>
</html>