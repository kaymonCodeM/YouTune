<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>New Artist</title>
</head>
<body>

<!-- NavBar -->
<jsp:include page="/jsp/TopNav.jsp" flush="true" />

<div class="container p-5">
	<h2 class="text-center">New Artist Form</h2>
	<form action="/youtunes/shop/MusicServlet" method="post">
		<input type="hidden" name="action" value="create_artist" />
					
		<div class="mb-4">
			<label for="firstName" class="form-label fs-4">First name</label>
			<input type="text" class="form-control" id="firstName" name="firstName" />
		</div>
					
		<div class="mb-4">
			<label for="lastName" class="form-label fs-4">Last name</label>
			<input type="text" class="form-control" id="lastName" name="lastName" />
		</div>
					
		<button type="submit" class="btn btn-primary float-end">Save</button>
	</form>
</div>

<!-- Bootstrap JavaScript  -->
<jsp:include page="/jsp/ScriptFooter.jsp" flush="true" />
</body>
</html>