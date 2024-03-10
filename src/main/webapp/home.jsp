<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="home.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>
	
	<section id="main">
		<div id="inner-cont">
			<form action="display.jsp" method="post">
				<h3>Register/Login</h3>
				<!-- <label>ID</label> -->
				<input type="text" name="s_id" placeholder="Student ID" autocomplete="off"><br>
				<!-- <label>Name</label> -->
				<input type="text" name="s_name" placeholder="Student Name" autocomplete="off"><br>
				<!-- <label>Location</label> -->
				<input type="text" name="s_loc" placeholder="Student Location" autocomplete="off"><br>
				<div id="btn-cont">
					<button type="submit" name="buttonClick" value="register">Register</button>
					<button type="submit" name="buttonClick" value="login">Login</button>
				</div>
			</form>
		</div>
		
	</section>
	
</body>
</html>