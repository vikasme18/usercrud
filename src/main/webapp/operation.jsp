<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<link rel="stylesheet" href="operation.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>

	
	
	<%
	try {
		String id = (String)session.getAttribute("s_id");
	%>
	
	<% 
		String operation = request.getParameter("operationButton");
		if (operation != null) {
			session.setAttribute("s_operation",operation);
		}
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
		
		if (session.getAttribute("s_operation").equals("delete")) {
			PreparedStatement pstmt = con.prepareCall("DELETE FROM INFO.STUDENT WHERE ID=?;");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			session.setAttribute("delete", "success");
			response.sendRedirect("delete-status.jsp");
		}
		else if (session.getAttribute("s_operation").equals("edit")) {
		%>
			<section id="main">
				<div id="box-cont">
					<form action="edit.jsp" method="post">
						<h3>Edit Page</h3>
						<!-- <label>Name</label> -->
						<input type="text" name="new_name" placeholder="New Name" autocomplete="off">
						<!-- <label>Location</label> -->
						<input type="text" name="new_loc" placeholder="New Location" autocomplete="off">
						<div id="btn-box">
							<button name="operationButton" value="edit">Submit</button>
							<button type="reset">Clear</button>
						</div>
					</form>
				</div>
			</section>
		<%
			
		}
	}
	catch (Exception e) {
		
		System.out.println(e);
	}
	%>
	
	
</body>
</html>