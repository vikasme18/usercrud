<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="display.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>

	<%	
		try {
			
			String id = request.getParameter("s_id"); 
			String name = request.getParameter("s_name");
			String loc = request.getParameter("s_loc");
			String button = request.getParameter("buttonClick");
			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
			
			if (button.equals("register")) {
				if (id == null || id.trim().isEmpty() || name == null || name.trim().isEmpty() || loc == null || loc.trim().isEmpty()) {
					session.setAttribute("register", "empty");
					response.sendRedirect("register-status.jsp");
					
				}
				else {
					PreparedStatement check = con.prepareCall("SELECT * FROM INFO.STUDENT WHERE id = ?");
			        check.setString(1, id);
			
			        ResultSet resultSet = check.executeQuery();
			
			        if (resultSet.next()) {
			            // Data already exists, handle it accordingly
			            session.setAttribute("register", "duplicate");
			            response.sendRedirect("register-status.jsp");
			        } else {
						PreparedStatement pstmt = con.prepareCall("INSERT INTO INFO.STUDENT VALUES (?,?,?)");
						pstmt.setString(1, id);
						pstmt.setString(2, name);
						pstmt.setString(3, loc);
						pstmt.executeUpdate();
						session.setAttribute("register", "success");
						response.sendRedirect("register-status.jsp");
					}
				}
			}
			else if (button.equals("login")) {
				if (id != null) {
						PreparedStatement pstmt = con.prepareCall("SELECT * FROM INFO.STUDENT WHERE ID = ?");
						pstmt.setString(1, id);
						ResultSet rs = pstmt.executeQuery();
						if (rs.next()) {
							String temp_id = rs.getString(1);
							String  temp_name = rs.getString(2);
							String temp_loc = rs.getString(3);
								// System.out.println(temp_id + " " + temp_name + " " + temp_loc);
								session.setAttribute("s_id", temp_id);
								session.setAttribute("s_name", temp_name);
								session.setAttribute("s_loc", temp_loc);
					
					%>	
						<div id="detail-cont">
							<form action="operation.jsp" method="post">
								
								<div id="inner-cont">
									<p><%= temp_id + " "%></p>
									<span>|</span>
									<p><%= temp_name + " " %></p>
									<span>|</span>
									<p><%= temp_loc + " " %></p>
									<div>
										<button name="operationButton" value="edit">Edit</button>
										<button name="operationButton" value="delete">Delete</button>
									</div>
								</div>
							</form>
						</div>
					<%	}
					else {
						response.sendRedirect("home.jsp");
					}
				}
				else {
					response.sendRedirect("home.jsp");
				}
			}
		} catch (Exception e){
			System.out.println(e);
		}
		%>
		
</body>
</html>