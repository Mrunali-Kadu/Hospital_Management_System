<%@page import="com.data_access.DoctorDataAccess" %>
<%@page import="com.entity.Doctor" %>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.data_access.SpecialistDataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 
 
 .btn{
  width:80px;
  margin: 1px
 }
 
 
</style>

<body>

	<%@include file = "navbar.jsp" %>
		<div class="container-fluid p-3">
			<div class="row">
			
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						
						<c:if test="${ not empty errorMsg }">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
						</c:if>
						<c:if test="${ not empty succMsg }">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<form action="../addDoctor" method="post">
							<div class="mb-3">    <!-- mb-3: bottom to 3 margin -->
								<label class="form-label">Full Name</label><input type="text" 
									required name="fullname" class="form-control">
							</div>
							
							<div class="mb-3">   
								<label class="form-label">DOB</label><input type="date" 
									required name="dob" class="form-control">
							</div>
							
							<div class="mb-3">   
								<label class="form-label">Qualification</label><input required 
									name="qualification" class="form-control">
							</div>
							
							<div class="mb-3">   
								<label class="form-label">Specialist</label> <select name="spec" 
									required class="form-control" >
									<option>--select--</option>
									
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
								<label class="form-label">Email</label><input type="text" 
									required name="email" class="form-control">
							</div>
							
							<div class="mb-3">  
								<label class="form-label">Mob No</label><input type="text" 
									required name="mobno" class="form-control">
							</div>
							<div class="mb-3">  
								<label class="form-label">Password</label><input  required 
									name="password" type="password" class="form-control">
							</div>
							
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
						
					</div>
				</div>
			</div>
		
		
			
			</div>
		</div>

</body>
</html>