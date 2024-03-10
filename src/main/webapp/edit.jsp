<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	try {
		String id = (String)session.getAttribute("s_id");
		String name = (String)session.getAttribute("s_name");
		String loc = (String)session.getAttribute("s_loc");
		String new_name = request.getParameter("new_name");
		String new_loc = request.getParameter("new_loc");
		String operation = request.getParameter("operationButton");
		session.setAttribute("s_operation",operation);
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
		if (new_name == name || new_name.trim().isEmpty() || new_loc == null || new_loc.trim().isEmpty()) {
			response.sendRedirect("operation.jsp");
		} else {
			
			if (operation.equals("edit")) {
				PreparedStatement pstmt = con.prepareCall("UPDATE INFO.STUDENT SET name=?, place=? WHERE ID=?;");
				pstmt.setString(1, new_name);
				pstmt.setString(2, new_loc);
				pstmt.setString(3, id);
				pstmt.executeUpdate();
				session.setAttribute("edit", "success");
				response.sendRedirect("edit-status.jsp");
			}
		}
	}
	catch (Exception e) {
		System.out.println(e);
	}
	%>
</body>
</html>