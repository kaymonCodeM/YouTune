<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>About Us</title>
</head>
<body>

<!-- NavBar -->
<jsp:include page="/jsp/TopNav.jsp" flush="true" />

<div class="container py-5">
	<div class="row">
	<div class="row my-5">
		<div class="col-12">
			<h3 class="text-center">Wolfgang Amadeus Mozart</h3>
		</div>
	</div>
	
	<br />
	<div class="row d-flex flex-column align-items-center">
		<div class="col-8">
		<div class="row">
			<div class="col-lg-4 col-sm-12 mb-3">
					<img src="/youtunes/images/youtunes-about.png" width="100%"/>
			</div>
		
			<div class="col-lg-8 col-sm-12 mb-3">
				<p>
        		An Austrian composer of the Classical period, Wolfgang Amadeus Mozart is widely recognized as one of the greatest composers of Western music.
       			He is the only composer to write and excel in all of the musical genres of his time.
        		Rumored to have had the ability to play music at age three and to write music at age five, Mozart began his career as a child prodigy.
        		Notable compositions include The Marriage of Figaro, Elvira Madigan, and Clarinet Quintet in A Major, K 581. 
       			<em class="apa-reference"><a href="https://www.britannica.com/list/10-classical-music-composers-to-know" target="_blank">Source</a></em>
      			</p>
			</div>
		</div>
		</div>
	</div>
	</div>

</div>

<!-- Bootstrap JavaScript  -->
<jsp:include page="/jsp/ScriptFooter.jsp" flush="true" />

</body>
</html>