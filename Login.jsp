<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
    <% 
   		String name=(String)request.getParameter("name");
		String act=(String)request.getParameter("action");
   	 	session.setAttribute("userName",name);
   	 	Class.forName("com.mysql.jdbc.Driver");
 		String url="jdbc:mysql://localhost/Chinook?user=root&password=Ma19921013";
	 	Connection conn=DriverManager.getConnection(url);
	 	Statement s=conn.createStatement(); 
	 	String deli=(String)request.getParameter("selectm");
	 	String sql="select CustomerAccount from Customer;";
	 	ResultSet rs=s.executeQuery(sql);
	 	boolean reg=false;
	 	String name2=(String)session.getAttribute("name");
	 	if(name!=null){
	 		while(rs.next()){
	 			if(name.equals(rs.getString(1))) reg=true;
	 		}
	 		if(!reg){ 
	 			session.setAttribute("regi", "true");
	 			response.sendRedirect("index.jsp"); }
	 	}else{
	 		name=name2;
	 	}
   	 	
   		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Page</title>
<style>

.se{
	margin-left:40%;
	font-size:20px;
}
body{
  	background-image:url("http://www.pepessb.com/img/hero/home.jpg");
  	background-size: 100%;}
label{
align:center;}
</style>
</head>
<body>

	<div>
		<p align="right">User Name:<%=name %><p>
	</div>


	<br>
<hr>
	<br>
	
	<form action="Search.jsp" method="post">
		<!-- <label for="selectm">Sort by:</label>
		<input type="radio" name="selectm" value="price" checked="checked">price
		<input type="radio" name="selectm" value="rating">rate<br> -->
		
		
		<br><br>
		<label for="rec">Recommendation based on preference (Only available for old user):</label>
		<input type="checkbox" name="rec" value="rec">recommendation<br><br>
		<hr><br>
		<div class="se">
		<select name="select">
		<option value="res">Restaurant</option>
		<option value="ing">Ingredient</option>
		<option value="dis">Dish</option>
		<option value="genre">Genre</option>
		</select>
		<input type="text" name="input" id="input">
		<input type="submit" value="search">
		</div>
		<br><br><br>
		
		
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
		
		
	</form>
	

</body>
</html>