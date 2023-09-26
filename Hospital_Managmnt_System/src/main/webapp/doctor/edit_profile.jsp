<%@page import="com.data_access.DoctorDataAccess" %>
<%@page import="com.entity.Doctor" %>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.data_access.SpecialistDataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
	
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					
					<c:if test = "${not empty succMsg}">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test = "${not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
						</c:if>
						
					<div class="card-body">
						<form action="../doctorChangePassword" method="post">
							<div class="mb-3">          <!-- margin-bottom 3 -->
								<label>Enter New Password</label><input type="text"
								name="newPassword" class="form-control" required/>
							</div>
							
							<div class="mb-3">
								<label>Enter Old Password</label><input type="text"
								name="oldPassword" class="form-control" required/>
							</div>
							
							<input type="hidden" value="${doctObj.id}" name="uid">
							
							<button class="btn btn-success col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3">Edit Profile</p>
					
					<c:if test = "${not empty succMsgd}">
							<p class="text-center text-success fs-3">${succMsgd}</p>
							<c:remove var="succMsgd" scope="session"/>
						</c:if>
						
						<c:if test = "${not empty errorMsgd}">
							<p class="text-center text-danger fs-5">${errorMsgd}</p>
							<c:remove var="errorMsgd" scope="session"/>
						</c:if>
						
					
					<div class="card-body">
					
					<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">    <!-- mb-3: bottom to 3 margin -->
								<label class="form-label">Full Name</label><input type="text" 
									required name="fullname" class="form-control" value="${doctObj.fullname}">
							</div>
							
							<div class="mb-3">   
								<label class="form-label">DOB</label><input type="date" 
									required name="dob" class="form-control" value="${doctObj.dob }">
							</div>
							
							<div class="mb-3">   
								<label class="form-label">Qualification</label><input required 
									name="qualification" class="form-control" value="${doctObj.qualification }">
							</div>
							
							<div class="mb-3">   
								<label class="form-label">Specialist</label> <select name="spec" 
									required class="form-control" >
									<option>${doctObj.specialist}</option>
									
									<!-- create dynamic options/list of doctors -->
									<% SpecialistDataAccess sda = new SpecialistDataAccess(DBConnection.getConn());
									List<Specialist> list = sda.getAllSpecialist();
									for(Specialist s : list)
									{
										%>
										<option><%= s.getSpecialistName() %></option>
										<% 
									}
									%>
									
									</select>
							</div>
							
							<div class="mb-3">  
								<label class="form-label">Email</label><input type="text" readonly
									required name="email" class="form-control" value="${doctObj.email}">
							</div>
							
							<div class="mb-3">  
								<label class="form-label">Mob No</label><input type="text" 
									required name="mobno" class="form-control" value="${doctObj.mobNo}">
							</div>
							
							<!-- id is used to check which doctor is login and with this doctor id we upadte details -->
							<input type="hidden" name="id" value="${doctObj.id }">
							
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	

</body>
</html>