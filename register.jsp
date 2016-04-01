<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
	function Test(){
		var acc=document.regis.account.value;
		if(acc!=""){
			return true;
		}else{
			alert("User Account cannot be empty!");
			return false;
		}
	}
</script>
<style>
body{
  	background-image:url("http://www.pepessb.com/img/hero/home.jpg");
  	background-size: 100%;}
 </style>
</head>
<body>
<% 	
	if(session.getAttribute("register")!=null&&session.getAttribute("register").equals("true")){
	
	session.setAttribute("register","false");
	out.print("User alread exist!");
}	
%>
<div>
<form action="testExist.jsp" name="regis" onsubmit="return Test()">
<table><tr><td>User Account</td><td><input type="text" name="account" id="account" maxlength="70"></td>
<tr><td>First Name</td><td><input type="text" name="fir" maxlength="40"></td></tr>
<tr><td>Last Name</td><td><input type="text" name="la" maxlength="20"></td></tr>
<tr><td>Address</td><td><input type="text" name="add" maxlength="70"></td></tr>
<tr><td>City</td><td><input type="text" name="city" maxlength="40"></td></tr>
<tr><td>State</td><td><input type="text" name="state" maxlength="40"></td></tr>
<tr><td>Country</td><td><input type="text" name="count" maxlength="40"></td></tr>
<tr><td>Post Code</td><td><input type="text" name="poscode" maxlength="10"></td></tr>
<tr><td>Phone</td><td><input type="text" name="phone" maxlength="24"></td></tr>
<tr><td>Email</td><td><input type="text" name="email" maxlength="60"></td></tr>

</table>
<input type="submit" value="Register">
</form>
</div>




</body>
</html>