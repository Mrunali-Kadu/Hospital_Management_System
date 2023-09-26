<%@page import="com.db.DBConnection"%>
<%@page import="com.data_access.DoctorDataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored = "false"  %>            <!-- it is true by default -->
    
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
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 4px solid rgba(0,0,0,.125);
    border-radius: .25rem;
    text-align: justify;
    }
    
 .paint-card{
 	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
 }

</style>
<body>

	<%@include file="navbar.jsp" %>
	
	<c:if test="${empty adminObj }">
	<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>
	
	<div class="container p-5">
	<p class="text-center fs-1" style="text-shadow:0 0 purple;">Admin Dashboard</p>
		<!-- JSTL -->
		<c:if test = "${not empty errorMsg}">
			<p class="text-center text-danger fs-3">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session"/>
		</c:if>
						
		<c:if test = "${not empty succMsg}">
			<div class="text-center text-success fs-3" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session"/>
		</c:if>
		
		<%
			//to get dynamic count of doctor,appointment,user,specialist
			DoctorDataAccess dda = new DoctorDataAccess(DBConnection.getConn());
		%>
		
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i>
						<p class="fs-4 text-center">
						   Doctor <br><%=dda.countDoctor() %>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i>
						<p class="fs-4 text-center">
						   User <br><%=dda.countUser() %>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-calendar-check fa-3x"></i>
						<p class="fs-4 text-center">
						   Total Appointment <br><%=dda.countAppointment() %>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 mt-2 p-2">
			
				<div class="card paint-card" data-bs-toggle="modal"
				data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-calendar-check fa-3x"></i>
						<p class="fs-4 text-center">
						   Add the Specialist <br><%=dda.countSpecialist() %>
						</p>
					</div>
				</div>
			</div>
			
		</div>
	</div>		
	
	
	
	<!-- pop up for specialist in admin page -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        <form action="../addSpecialist" method="post">
        
        <div class="form-group">
			<label>Enter Specialist Name</label>
        	<input type="text" name="specName" class="form-control">
        </div>
        
        <div class="text-center p-3">
        	<button type="submit" class="btn btn-primary">Add</button>
        </div>
        
        </form>
      </div>
      
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>		


</body>
</html>