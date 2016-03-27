<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
	<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    <% 
    	Class.forName("com.mysql.jdbc.Driver");
    	String url="jdbc:mysql://localhost/Chinook?user=root&password=Ma19921013";
   	 	Connection conn=DriverManager.getConnection(url);
		String act=(String)request.getParameter("action");
   	 	Statement s=conn.createStatement(); 
   		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result</title>



</head>
<body>

<%	
	String head="";
	String input=(String)request.getParameter("input");
	String cat=(String)request.getParameter("select");
	ResultSet rs=null;
	String sql="";
	if(cat.equals("res")){
		sql="Select * from Restaurant where Name='"+input+"'";
		head="RESTAURANT";
	}else if(cat.equals("ing")){
		sql="select Dish.Name from Dish,Ingredient,Cuisine where Dish.Dish_Id=Cuisine.Dish_Id and Cuisine.Ingredient_Id=Ingredient.Ingredient_Id and Ingredient.Name='"
				+input+"'";
		head="DISHES";
	}else if(cat.equals("genre")){
		sql="select Name from Dish where genre='"+input+"'";
		head="DISHES";
	}else{
		%>
		
		<%@include file="response.jsp" %>
		<% 
	}
	%><h1><%=head %></h1><table border="1px"><% 
	rs=s.executeQuery(sql);
	int i=rs.getMetaData().getColumnCount();
	%><tr><% 
	for(int j=1;j<i+1;j++){
		%><th><%=rs.getMetaData().getColumnName(j) %>
		</th> <%	
	} %> </tr> <% 
	while(rs.next()){
		%><tr><% 
		for(int j=1;j<i+1;j++){ 
			%><td><% 
			out.print(rs.getString(j));
			%><td><% 
		}
		%><tr><% 
	}
%></table>
	


</body>
</html>