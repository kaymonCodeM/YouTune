<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Artist"%>

<jsp:useBean id="artistDao" scope="application" class="service.JdbcArtistDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>New Album</title>
</head>
<body>

<!-- NavBar -->
<jsp:include page="/jsp/TopNav.jsp" flush="true" />

<div class="container">
<div class="form p-5">

<form action="/youtunes/MusicServlet" method="post">

<input type="hidden" name="action" value="create_album" />
					
<div class="mb-4">
<label for="title" class="form-label fs-4">Album title</label>
<input type="text" class="form-control" id="title" name="title" />
</div>
					
<div class="mb-4">
<label for="price" class="form-label fs-4">Price</label>
<input type="text" class="form-control" id="price" name="price" />
</div>
		
<div class="mb-4">
<label for="img" class="form-label fs-4">Image URL</label>
<input type="text" class="form-control" id="img_url" name="img_url" />
</div>
		
<div class="mb-4">
<label for="genre" class="form-label fs-4">Genre</label>
<select class="form-select" id="genre" name="genre">
<option value="0" selected>--Select--</option>
<option value="Classical">Classical</option>
<option value="Jazz">Jazz</option>
<option value="Blues">Blues</option>
<option value="Rock">Rock</option>
</select>
</div>

<!-- Checks to see if genre is selected when submitting -->
<%String genreErrorMessage = (String) request.getSession().getAttribute("genreErrorMessage");
if(genreErrorMessage != null){%>

<div class="alert alert-danger" role="alert"><%=genreErrorMessage%></div>
<%} %>

<div class="mb-4">
<label for="artist" class="form-label fs-4">Artist</label>

<select class="form-select" id="artist" name="artist">
<option value="0" selected>--Select--</option>
				
<%
List<Artist> artists = artistDao.list();
Iterator<Artist> iterator = artists.iterator();
		
while (iterator.hasNext()){
Artist artist = (Artist)iterator.next();
					
%>
<option value="<%=artist.getArtistId()%>"><%=artist.getLastName()%>, <%=artist.getFirstName()%></option>
<% } //closing wile loop%>
</select>

</div>

<!-- Checks to see if artist is selected when submitting -->
<%String artistErrorMessage = (String) request.getSession().getAttribute("artistErrorMessage");
if(artistErrorMessage != null){%>

<div class="alert alert-danger" role="alert"><%=artistErrorMessage%></div>
<%} %>
		
					
<button id="btnSubmit" type="submit" class="btn btn-primary float-end">Save</button>
</form>

</div>
</div>

<!-- Bootstrap JavaScript  -->
<jsp:include page="/jsp/ScriptFooter.jsp" flush="true" />

</body>
</html>