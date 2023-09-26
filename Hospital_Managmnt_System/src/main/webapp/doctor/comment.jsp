<%@page import="com.entity.Appointment"%>
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
 
 .backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/hospital.jpg");
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
 

</style>


<body>

	<c:if test="${empty doctObj }">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="navbar.jsp" %>
	
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	
	<div class="container p-3">
		<div class="row">
			
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>
						
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							AppointmentDataAccess ada = new AppointmentDataAccess(DBConnection.getConn());
							
							Appointment ap = ada.getAppointmentById(id);
						
						%>
						
						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<label>Patient Name</label><input type="text" readonly value="<%=ap.getFullName() %>"
								class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Age</label><input type="text" readonly value="<%=ap.getAge() %>"
								class="form-control">
							</div>
							
							<div class="col-md-6">
								<br> <label>Mob No</label><input type="text" readonly value="<%=ap.getPhnNo() %>"
								class="form-control">
							</div>
							
							<div class="col-md-6">
								<br> <label>Diseases</label><input type="text" readonly value="<%=ap.getDiseases() %>"
								class="form-control">
							</div>
							
							<div class="col-md-6">
								<br> <label>Comment</label>
								<textarea required name="comm" class="form-control" row="3"
								cols=""></textarea>
							</div>
							
							<input type="hidden" name="id" value="<%=ap.getId()%>"> 
							
							<input type="hidden" name="did" value="<%=ap.getDoctorId()%>">
								
								<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
							
								
								
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>