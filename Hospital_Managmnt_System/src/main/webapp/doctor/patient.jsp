<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.data_access.AppointmentDataAccess"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored = "false"  %> <!-- it is true by default -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<%@include file="../component/allcss.jsp" %>
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

</style>

<body>

	<!-- if user wants to login doctor page,redirect to doctor login page -->
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
		
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center text-success">Patient Details</p>
						<c:if test="${not empty errorMsg }">
							<p class="fs-4 text-center text-danger">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session"></c:remove>
						</c:if>
						
						<c:if test="${not empty succMsg }">
							<p class="fs-4 text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session"></c:remove>
						</c:if>
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							
							<tbody>
							
							<%
								//get id from doctor which is login
								Doctor d = (Doctor)session.getAttribute("doctObj");
								AppointmentDataAccess ada = new AppointmentDataAccess(DBConnection.getConn());
								List<Appointment> list = ada.getAllAppointmentByDoctorLogin(d.getId());
								for(Appointment ap : list)
								{
									%>
										<tr>
											<th><%=ap.getFullName() %></th>
											<td><%=ap.getGender() %></td>
											<td><%=ap.getAge() %></td>
											<td><%=ap.getAppointdate() %></td>
											<td><%=ap.getEmail() %></td>
											<td><%=ap.getPhnNo() %></td>
											<td><%=ap.getDiseases() %></td>
											<td><%=ap.getStatus() %></td>
											<td>
											
											<% 
												//check for comment updated or not to disable comment button
												if("Pending".equals(ap.getStatus()))
												{%>
													<a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-success btn-sm">Comment</a>
												<%}
												else
												{%>
							<!-- it is for status to disabled Comment Button except Pending  -->					 
													<a href="#" class="btn btn-success btn-sm disabled">Comment</a>
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
		</div>
	</div>

</body>
</html>