<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="ss.DishRating" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
 <%
 	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost/Chinook?user=root&password=Ma19921013";
 	Connection conn=DriverManager.getConnection(url);
 	Statement s=conn.createStatement(); 
 	String name=(String)session.getAttribute("userName");
 	String dish=(String)session.getAttribute("dish");
 	String sql1="Select Customer_Id from Customer where CustomerAccount='"+name+"'";
 	String sql2="select Dish_Id from Dish where Name='"+dish+"'";
 	ResultSet rs1=s.executeQuery(sql1);
 	int dishid=0;
 	int cutid=0;
 	while(rs1.next()){
 		cutid=rs1.getInt(1);
 	}
 	
 	ResultSet rs2=s.executeQuery(sql2);
 	while(rs2.next()){
 		dishid=rs2.getInt(1);
 	}
 	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Relation</title>
<style>

  	
body{
  	background-image:url("http://www.pepessb.com/img/hero/home.jpg");
  	background-size: 100%;}

</style>
</head>
<body>

<div>
<h1>Search by Recommendation</h1>
<table border="1px"><tr><th>RESTAURAN_NAME</th><th>RATING</th></tr>
<%  
	String input=(String)session.getAttribute("dishname");
	DishRating dr=new DishRating(cutid,dishid); 
	HashMap<String,Double> rate=dr.getTable();
	Set<String> keys = rate.keySet();
	Iterator<String> iterator = keys.iterator();
	while (iterator.hasNext()) {
	    String key = (String)iterator.next();
	    %><tr><td><%=key %></td><% 
	    Double rating = rate.get(key);
	    %><td><%=rating %></td></tr><% 
	}
	
	String sql3="select i.name from Dish d, Cuisine c, Ingredient i where d.name='"+input+"' and d.Dish_Id = c.Dish_Id and c.Ingredient_Id = i.Ingredient_Id;";
	Statement s3=conn.createStatement();
	ResultSet rs3=s3.executeQuery(sql3);
	%><table border="1px" style="margin-top:20px"><tr><td>INGREDIENT_NAME</td></tr><% 
	while(rs3.next()){
		%><tr><td><% out.print(rs3.getString(1));
		%></td></tr><%
	}
	%></table><%

	
%>
</table>
</div>
</body>

</html>