<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Album"%>


<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>YouTunes</title>
</head>
<body>

<!-- Album Image References

//Jazz
https://www.pinterest.fr/pin/542894930069405690/
https://www.amazon.com/More-Music-Joey-DeFrancesco/dp/B098JWSL12/

//Classical
https://www.ebay.com/p/26046059595?iid=264581162181
https://okdiario.com/curiosidades/mejores-citas-ludwig-van-beethoven-dia-nacimiento-6591288

//Blues
https://cascadebluesassociation.org/sugaray-rayford-somebody-save-me-forty-below-records/
https://clclt.com/charlotte/cd-review-eric-bibbs-bookers-guitar/Content?oid=2155385

//Rock
https://thevinylfrontierbarry.com/green-day---dookie-lp-marbled-red-vinyl-exex-16478-p.asp
https://www.discogs.com/release/1059924-The-Cranberries-No-Need-To-Argue-The-Complete-Sessions-1994-1995

 -->

<!-- NavBar -->
<jsp:include page="TopNav.jsp" flush="true" />

		<section class="py-5 text-center container">
			<div class="row py-lg-5">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light">YouTunes</h1>
					<p class="lead text-muted">Welcome to YouTunes, your "one stop
						shop" to all of your music needs. Below you will find a list of
						our current selection. To add a new album, click on the "New Music
						Album" button. For artists, select the "Artist" link from the
						top-hand menu pane.</p>
					<p>
						<a href="/youtunes/jsp/albums/New.jsp" class="btn btn-primary my-2">New Music Album</a>
					</p>
				</div>
			</div>
		</section>


<div class="albums">
<div class="container">



<div class ="row">


<!-- Create a list of Albums -->
<jsp:useBean id="albumDao" scope="application" class="service.JdbcAlbumDao" />

<%
List<Album> albums = albumDao.list();
Iterator<Album> iterator = albums.iterator();
while (iterator.hasNext())
{
Album album = (Album)iterator.next();
%>

<div class="col-sm-12 col-md-6 col-lg-3  p-3">
<div class="card">
<img src="<%=album.getImgUrl()%>" height="300" class="card-img-top" />

<div class="card-body">
<p class="card-text">
<span><%=album.getTitle()%></span>
<br />
<small class="text-muted"><em><%=album.getGenre()%></em></small>
</p>
								
<div class="d-flex justify-content-between align-items-center">



<div class="btn-group">

<form action="/youtunes/jsp/albums/Details.jsp" method="post">
<input type="hidden" name="albumId" value="<%=album.getAlbumId()%>" />
<input class="btn btn-sm btn-outline-secondary" type="submit" value="Edit">
</form>

<form action="/youtunes/MusicServlet" method="post">
<input type="hidden" name="albumId" value="<%=album.getAlbumId()%>" />
<input type="hidden" name="action" value="delete_album" />
<input class="btn btn-sm btn-outline-secondary ms-1" type="submit" value="Delete">
</form>

</div>

<small class="text-muted">$<%=album.getPrice()%></small>

</div>

</div>

</div>
</div>

<% } %>
</div>
</div>
</div>



<!-- footer -->
<jsp:include page="Footer.jsp" flush="true" />
	
<!-- Bootstrap JavaScript  -->
<jsp:include page="ScriptFooter.jsp" flush="true" />
</html>