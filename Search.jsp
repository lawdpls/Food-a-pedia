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
   	 	String name=(String)session.getAttribute("userName");
   	 	 		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result</title>
<style>


body{
  	background-image:url("http://www.pepessb.com/img/hero/home.jpg");
  	background-size: 100%;}

</style>


</head>
<body>

<%	
	String head="";
	String input=(String)request.getParameter("input");
	session.setAttribute("dishname", input);
	String cat=(String)request.getParameter("select");
	String rec=(String)request.getParameter("rec");
	ResultSet rs=null;
	String sql="";
	String sel=(String)request.getParameter("selectm");

	if(cat.equals("res")){
		sql="Select * from Restaurant where Name='"+input+"'";
		head="RESTAURANT";
	}else if(cat.equals("ing")){
		sql="select Restaurant.Name as RestaurantName, Dish.Name as DishName,Offer.Price "
				+"from Restaurant,Dish,Offer "
				+"where Restaurant.R_Id=Offer.R_Id and Offer.Dish_Id=Dish.Dish_Id and Dish.Dish_Id in ( "
				+"select Dish.Dish_Id from Dish,Ingredient,Cuisine where Dish.Dish_Id=Cuisine.Dish_Id and Cuisine.Ingredient_Id=Ingredient.Ingredient_Id and Ingredient.Name='"
				+input+"') "
				+"order by Price;";
		head="RESTAURANT_NAME&DISH_NAME&PRICE";
	}else if(cat.equals("genre")){
		sql= "select Res.Name as RestaurantName, D.Name as DishName,O.Price as Price,AVG(ra.CustomerRate) as Rating " 
				+"from Restaurant Res, Offer O, Dish D, Rating ra "
				+"where O.Dish_Id = D.Dish_Id and Res.R_Id = O.R_Id and D.Genre = '"+input+"'and O.Dish_Id = ra.Dish_Id and O.R_Id = ra.R_Id "
				+"group by DishName, RestaurantName,Price "
				+"order by Rating desc;";
		head="RESTAURANT_NAME&DISHES&RAATING";
	}else if(cat.equals("dis")&&rec==null){
		head="RESTAURANT NAME & RATING";
		sql="select re.name, AVG(ra.CustomerRate) as Rating from Restaurant re, Rating ra, Dish d where d.Name='"+input
				+" 'and d.Dish_Id=ra.Dish_Id and ra.R_Id=re.R_Id group by re.name order by Rating desc;";
		
	}else if(cat.equals("dis")&&rec!=null){
		session.setAttribute("dish",input);
		response.sendRedirect("response.jsp");
		return;
	}
	
	
	
	%><div><h1><%=head %></h1><table border="1px"><% 
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
			%></td><% 
		}
		%></tr><% 
	}
%>
</table></div>
<br><br>
<%


if(cat.equals("res")){
	String sql2="select D.Name , O.Price, AVG(ra.CustomerRate) as Rating " + 
			"from Dish D, Restaurant Res, Offer O, Rating ra "+
			"where Res.Name = '"+input+"' and O.R_Id = Res.R_Id and O.Dish_Id = D.Dish_Id "+ 
			"and O.Dish_Id = ra.Dish_Id and O.R_Id = ra.R_Id "+
			"group by D.Name, Res.Name "+
			"order by Rating desc;";
	Connection conn2=DriverManager.getConnection(url);
	Statement s2=conn2.createStatement();
	ResultSet rs2=s2.executeQuery(sql2);
	%><table border="1px" style="margin-top:20px"><tr><th>DISH_NAME</th><th>PRICE</th><th>RATING</th></tr><%
	while(rs2.next()){
		%><tr><% 
		for(int j=1;j<4;j++){ 
			%><td><%
			out.print(rs2.getString(j));
			%></td><% 
		}
		%></tr><% 
	}
	%></table><%
	
}

if(cat.equals("dis")){
	String sql3="select i.name from Dish d, Cuisine c, Ingredient i where d.name='"+input+"' and d.Dish_Id = c.Dish_Id and c.Ingredient_Id = i.Ingredient_Id;";
	Statement s3=conn.createStatement();
	ResultSet rs3=s3.executeQuery(sql3);
	%><table border="1px" style="margin-top:20px"><tr><td>INGREDIENT_NAME</td></tr><% 
	while(rs3.next()){
		%><tr><td><% out.print(rs3.getString(1));
		%></td></tr><%
	}
	%></table><%
}	



%>
	

</body>
</html>