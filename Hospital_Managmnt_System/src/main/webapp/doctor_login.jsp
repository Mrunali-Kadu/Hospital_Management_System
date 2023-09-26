<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Login Page</title>
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

</style>

<body>
	<%@include file="component/navbar.jsp" %>
	
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">   <!-- offset used for center -->
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Login</p>
						
						<c:if test = "${not empty succMsg}">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test = "${not empty errorMsg}">
							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
						</c:if>
						
						
						<form action="doctorLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label>
								<input required name="email" type="email" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Password</label>
								<input required name="password" type="password" class="form-control">
							</div>
							
							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>