<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="style.css">
<title>Login</title>
</head>
<body id="log">
 <h1>Login page</h1>
 <form method="get" action="FirstServlet">
 <label><span style="color: red">Username:</span><input type="text" name="user" required="true" />
 </label>  
 <br/>
 <br/>
 <br/>
 <label><span style="color: red">Password:</span><input type="password" name="pass" required />
 </label>
 <br/>
 <br/>
 <br/>
 <input id="login" type="submit" value="Login"> 
 </form>
</body>
</html>