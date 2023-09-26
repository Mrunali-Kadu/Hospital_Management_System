<%@page import = "com.db.DBConnection" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>
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
	<%@include file="component/navbar.jsp"%>
	
	

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hosp1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hosp2.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hosp4.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container p-3">
		<p class="text-center fs-2">Key Features of our Hospital</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Hospitals do not tolerate physical or verbal aggression
									or abuse towards staff, patients, family members or visitors.
									Another part of keeping patients safe in hospital is making
									sure they get the right treatment and do not pick up
									infections, have falls, take the wrong medication or develop
									pressure sores.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>A safe hospital environment is considered to be an
									environment in which the comfort and safety of both patients
									and medical staff of a health facility is provided. Such an
									environment is created by events of a certain nature: Infection
									safety mode. Ensuring patient hygiene.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Patients identified having a need for personal space, a
									homely welcoming atmosphere, a supportive environment, good
									physical design, access to external areas and provision of
									facilities for recreation and leisure. Responses suggest that
									patient attitudes and perceptions to the built environment of
									hospital.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Reasearch</p>
								<p>health research has high value to society. It can provide
									important information about disease trends and risk factors,
									outcomes of treatment or public health interventions,
									functional abilities, patterns of care, and health care costs
									and use. The different approaches to research provide
									complementary insights.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-3" >
				<img src="img/doct5.jpg" style="width:500px; height:500px; margin-left:-18px; margin-top:112px;  padding:10px; display:block">
			</div>
			
		</div>
	</div>
	
	
	<hr>
		
	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doct1.png" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Susan</p>
						<p class="fs-7" >(CEO and Chairman)</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doct2.jpeg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Steven</p>
						<p class="fs-7" >(Chief Doctor)</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doct3.jpeg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Smitha Goenka</p>
						<p class="fs-7" >(Chief Doctor)</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doct4.png" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Shreya Joshi</p>
						<p class="fs-7" >(Chief Doctor)</p>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<%@include file="component/footer.jsp" %>


</body>
</html>