<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <% 
   		String name=(String)request.getParameter("name");
		String act=(String)request.getParameter("action");
   	 	session.setAttribute("userName",name);
   	 	
   		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Page</title>
</head>
<body>

	<div>
		<p align="right">User Name:<%=name %><p>
	</div>


	<br>
<hr>
	<br>
	<form action="Search.jsp" method="post">
		<select name="select">
		<option value="res">Restaurant</option>
		<option value="ing">Ingredient</option>
		<option value="dis">Dish</option>
		<option value="genre">Genre</option>
		</select>
		<input type="text" name="input" id="input">
		<!--  <table>
		<tr><td><label for="res">Restaurant Name:</label></td>
		<td><input type="text" id="res" name="res"></td></tr>
		<tr><td><label for="dish">Dish Name:</label></td>
		<td><input type="text" id="dish" name="dish"></td></tr>
		<tr><td><label for="ing">Ingredient Name:</label></td>
		<td><input type="text" id="ing" name="ing"></td></tr>
		<tr><td><label for="genre">Genre Name:</label></td>
		<td><input type="text" id="genre" name="genre"><br></td></tr>
		</table>-->
		<input type="submit" value="search">
	</form>

</body>
</html>