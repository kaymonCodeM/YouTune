<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="model.Artist" %>
    
<jsp:useBean id="artistDao" scope="application" class="service.JdbcArtistDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>Artist Details</title>
</head>
<body>

<!-- NavBar -->
<jsp:include page="/jsp/TopNav.jsp" flush="true" />

<div class="container p-5">
<h2 class="text-center">Artist Details</h2>

<%
String artistId = request.getParameter("artistId");
Artist artist = artistDao.find(Long.parseLong(artistId)); 

if (artist != null){
%>
<form action="/youtunes/MusicServlet" method="post">

<input type="hidden" name="action" value="update_artist" />
<input type="hidden" name="artistId" value="<%=artist.getArtistId() %>" />
					
<div class="mb-4">
<label for="firstName" class="form-label fs-4">First name</label>
<input type="text" class="form-control" id="firstName" name="firstName" value="<%=artist.getFirstName() %>" />
</div>
					
<div class="mb-4">
<label for="lastName" class="form-label fs-4">Last name</label>
<input type="text" class="form-control" id="lastName" name="lastName" value="<%=artist.getLastName() %>" />
</div>
					
<button type="submit" class="btn btn-primary float-end">Save</button>
</form>

<%} %>

</div>

<!-- Bootstrap JavaScript  -->
<jsp:include page="/jsp/ScriptFooter.jsp" flush="true" />

</body>
</html>