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
  	<style>
  	div{
  		margin-top:10%;
  		margin-left:40%;
 
  	}
  	body{
  	background-image:url("http://www.pepessb.com/img/hero/home.jpg");
  	background-size: 100%;}

  	h1{
  		margin-top:100px;
  	}
  	</style>
  	<script language="javascript">
  		function showPage(){
  			location.href = 'register.jsp';
  		}
  	</script>
    	
	</head>
	<h1 align="center">FOOD-A-PEDIA</h1>
	<body  >
	
	<% if(ac=="true") out.print("Not valid!"); %>
	<% session.setAttribute("regi","false");%>
	<div>
	<form action="Login.jsp" method="post">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name"/>
		<button type="button" onclick="showPage()">Register</button>
		<input type="submit" value="Login">
	</form>
	</div>
	
	
	


    
  
  </body>
</html>