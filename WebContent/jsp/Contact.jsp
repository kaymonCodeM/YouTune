<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link 
 	rel="stylesheet" 
 	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
    integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" 
    crossorigin="anonymous">
    
<title>Contact</title>
</head>
<body>
<!-- NavBar -->
<jsp:include page="/jsp/TopNav.jsp" flush="true" />

<!-- start of container -->
<div class="container p-5">
	<!-- Column 1 row 1 -->
	<div class="row text-center my-5">
		<div class="col-12 mb-5">
			<h3>Welcome to the contact page.</h3>
		</div>
	</div>
	
<div class="row">
	<!-- Column 1 row 2 -->
	<div class="col-lg-6 col-sm-12 mb-5">
		<div class="row flex-column align-items-center">
			<div class="col-6 d-flex flex-column align-items-center">
			
				<!-- icon -->
				<h1><i class="fas fa-location-arrow text-secondary"></i></h1>
				
				<!-- address -->
				<ul class="list-group">
					<li class="list-group-item border-0">1000 Galvin Road South</li>
					<li class="list-group-item border-0">Bellevue, Nebraska 68005</li>
				</ul>
				
			</div>
		</div>
	</div>
	
	<!-- Column 2 row 2-->
	<div class="col-lg-6 col-sm-12 mb-5">
		<div class="row flex-column align-items-center">
			<div class="col-6 d-flex flex-column align-items-center">
				
				<!-- icon -->
				<h1><i class="fas fa-phone text-secondary"></i></h1>
					
				<!-- Contact List -->
				<ul class="list-group">
					<li class="list-group-item border-0">Direct: 555.555.5555</li>
					<li class="list-group-item border-0">Toll-free: 1.800.555.5555</li>
					<li class="list-group-item border-0">Fax: 555.555.5555</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- end of the row -->
</div>
<!-- end of container -->

<!-- Bootstrap JavaScript  -->
<jsp:include page="/jsp/ScriptFooter.jsp" flush="true" />
</body>
</html>