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



</head>
<body>

<%	
	String head="";
	String input=(String)request.getParameter("input");
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
				+"order by price;";
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
			%></td><% 
		}
		%></tr><% 
	}
%></table>
	

</body>
</html>