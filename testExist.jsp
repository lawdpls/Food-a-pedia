<%@page import="javax.management.modelmbean.RequiredModelMBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="ss.SelectName"  %>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
	<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    <% 
    	Class.forName("com.mysql.jdbc.Driver");
    	String url="jdbc:mysql://localhost/Chinook?user=root&password=Ma19921013";
   	 	Connection conn=DriverManager.getConnection(url);
	Statement s=conn.createStatement();
  		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String acc=(String)request.getParameter("account");
 	SelectName sn=new SelectName(acc);
 	if(sn.contain()){
 		session.setAttribute("register", "true");
		response.sendRedirect("register.jsp");
	}else{
		
		String sql="insert into Customer(CustomerAccount,FirstName,LastName,address,City,State, Country, PostalCode,phone,Email) values ( '"+request.getParameter("account")+"','"+request.getParameter("fir")+"','"+request.getParameter("la")+"','"+request.getParameter("add")+"','"+request.getParameter("city")+"', '"+request.getParameter("state")+"', '"+request.getParameter("count")+"', '"+request.getParameter("poscode")+"', '"+request.getParameter("phone")+"','"+request.getParameter("email")+"')";
		//PreparedStatement p = (PreparedStatement) conn.prepareStatement(sql);
		out.print(sql);
		s.executeUpdate(sql);
		/*p.setString(1, request.getParameter("account"));
		p.setString(2, request.getParameter("fir"));
		p.setString(3, request.getParameter("la"));
		p.setString(4, request.getParameter("add"));
		p.setString(5, request.getParameter("city"));
		p.setString(6, request.getParameter("state"));
		p.setString(7, request.getParameter("count"));
		p.setString(8, request.getParameter("postcode"));
		p.setString(9, request.getParameter("phone"));
		p.setString(10, request.getParameter("email"));
		p.executeUpdate(); */
		session.setAttribute("name",acc);
		response.sendRedirect("Login.jsp");
	}
	%>
</body>
</html>