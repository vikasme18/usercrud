<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Status</title>
    <link rel="stylesheet" href="register.css">
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>

	<%
	String delete = (String)session.getAttribute("delete");
	if (delete.equals("success")) {
	%>
	    <div id="cont">
	        <h1>Record has been deleted successfully 😭</h1>
	        <a href="home.jsp">Go back to home page>>></a>
	    </div>
    <% 
	}
	%>
</body>
</html>