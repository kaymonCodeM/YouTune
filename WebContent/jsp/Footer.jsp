<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.Calendar"%>

<% 
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String appName = "YouTunes";
	String courseName = "CSD 460";
%>
<footer class="text-muted py-5">
	<div class="container">
		<p class="float-end mb-1">
			<a href="#">Back to top</a>
		</p>
		<p>
			&copy; <%=year%> - <%=courseName%> (<%=appName%>) | <a href="https://github.com/kaymonCodeM/YouTunes" target="_blank">Kaymon McCain</a>
		</p>
	</div>
</footer>