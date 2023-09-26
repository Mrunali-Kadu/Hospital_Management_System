<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.data_access.DoctorDataAccess"%>
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
	
	<%@include file="navbar.jsp" %>
	
	<p class="text-center fs-3">Doctor Dashboard</p>
	
	<%
	//session used to which doctor is login and acc. to that show the count
	Doctor d = (Doctor)session.getAttribute("doctObj");
		//count of  total appointment of doctor
		DoctorDataAccess dda = new DoctorDataAccess(DBConnection.getConn());
		
	%>
	
		<div class="container p-5">
			<div class="row">
				<div class="col-md-4 offset-md-2">
					<div class="card paint-card">
						<div class="card-body text-center text-success">
							<i class="fas fa-user-md fa-3x"></i><br>
							<p class="fs-4 text-center">
							Doctor</p><%=dda.countDoctor() %>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="card paint-card">
						<div class="card-body text-center text-success">
							<i class="fa-solid fa-calendar-check fa-3x"></i><br>
							<p class="fs-4 text-center">
							Total Appointment</p><%=dda.countAppointmentByDoctorId(d.getId()) %>
						</div>
					</div>
				</div>
				
			</div>
		</div>

</body>
</html>