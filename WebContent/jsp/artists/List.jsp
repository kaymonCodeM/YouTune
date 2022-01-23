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

<title>List of Artists</title>
</head>
<body>

<!-- NavBar -->
<jsp:include page="/jsp/TopNav.jsp" flush="true" />


<div class="container p-5">
	
<h2 class="text-center">Artist List</h2>
<br />
		
<p class="text-center">
	<a href="/youtunes/jsp/artists/New.jsp" class="btn btn-outline-secondary text-center w-50">New Artist</a>
</p>
		
		
<table class="table">
<thead>
	<tr>
		<th>ArtistId</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Functions</th>
	</tr>
</thead>
			
			<%
				List<Artist> artists = artistDao.list(); 
				Iterator<Artist> iterator = artists.iterator();
				while (iterator.hasNext())
				{
					Artist artist = (Artist)iterator.next();
					
					// build HTML content from artist list
					%>
						<tr>
							<td><%=artist.getArtistId()%></td>
							<td><%=artist.getFirstName()%></td>
							<td><%=artist.getLastName()%></td>
							<td>
								<a href="/youtunes/jsp/artists/Details.jsp?artistId=<%=artist.getArtistId()%>" class="link">Edit</a> |
								<a href="/youtunes/shop/MusicServlet?action=delete_artist&artistId=<%=artist.getArtistId() %>" class="link">Delete</a>
							</td>
						</tr>
				<% } %>
		</table>
	</div>

<!-- Bootstrap JavaScript  -->
<jsp:include page="/jsp/ScriptFooter.jsp" flush="true" />

</body>
</html>