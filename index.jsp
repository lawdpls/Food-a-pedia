<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Food-a-pedia</title>
    <% String ac=(String)session.getAttribute("regi");%>
  	
    	
	</head>
	<body>
	<% if(ac=="true") out.print("Not valid!"); %>
	<% session.setAttribute("regi","false");%>
	<form action="Login.jsp" method="post">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name"/>
		<input type="submit" value="Login">
	</form>
	
	
	


    
  
  </body>
</html>