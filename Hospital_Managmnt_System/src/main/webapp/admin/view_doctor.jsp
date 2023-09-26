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
			

		
		
		<!-- Show doctor list which is stored -->
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						
						<c:if test="${ not empty errorMsg }">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
						</c:if>
						<c:if test="${ not empty succMsg }">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							
							<tbody>
						    <!-- we run row dynamically till the value -->
							<%
								DoctorDataAccess dda2 = new DoctorDataAccess(DBConnection.getConn());
							    List<Doctor> list1 = dda2.getAllDoctor();
							    
							    for(Doctor d:list1)
							    {
							    	%>
							    		<tr>
							    			<td><%= d.getFullname() %></td>
							    			<td><%= d.getDob() %></td>
							    			<td><%= d.getQualification() %></td>
							    			<td><%= d.getSpecialist() %></td>
							    			<td><%= d.getEmail() %></td>
							    			<td><%= d.getMobNo() %></td>
							    			<td>
							    			<!-- to get doctor details by id -->
							    				<a href="edit_doctor.jsp?id=<%=d.getId()%>" 
							    				class="btn btn-sm btn-primary">Edit</a> 
							    				
							    				<a href="../deleteDoctor?id=<%=d.getId()%>" 
							    				class="btn btn-sm btn-danger">Delete</a></td>
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