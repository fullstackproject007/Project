<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--font awesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <!--Google fonts if any-->
        <link href="https://fonts.googleapis.com/css2?family=Acme&display=swap" rel="stylesheet">
		<!--css custom if any-->
        <link rel="stylesheet" href="adminsheet.css">
        <style type="text/css">
        	.height{
        		min-height: 15vh;
        	}	
        	.height-tab{
        		min-height: 70vh;
        	}
        </style>
<title>List Hod</title>
</head>
<body class="bg-light">
	<%
     	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
     	if(session.getAttribute("username")==null || session.getAttribute("password")==null){
     		session.removeAttribute("username");
     		session.removeAttribute("password");
     		response.sendRedirect("login_admin.jsp");
     	}
     %>
	<%
	try {
		//Get hod list from hod table in mysql and display it...
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "Password@007");
		PreparedStatement ps=con.prepareStatement("select id,name,year,branch,subject,phno,email from faculty;");
		ResultSet rs = ps.executeQuery();
		%>
		<section>
				<div class="container-fluid">
					<div class="row height d-flex bg-dark align-items-center justify-content-center">
						<div class="col-md-8 text-center">
							<h2 class="display-4 text-light text-capitalize">-- List of Faculty details --</h2>
						</div>
					</div>
					<div class="row height-tab d-flex align-items-center justify-content-center py-3 mt-4">
						<div class="col-md-10">
							<a href="/fs_project/admin.jsp#info"><h5 class="text-dark font-bold font-italic py-2 text-center">Click here to get back</h5></a>
							<table class="table text-dark table-striped table-light text-center">
							<tr> <td>Faculty ID</td><td>Name</td><td>Year</td><td>Branch</td><td>Subject</td><td>Phone No.</td><td>Email</td> </tr>
							<%
							while(rs.next()){
								%><tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td></tr><% 
							}
							%>
							</table>
						</div>
					</div>
				</div>
			</section>
		
		<% 
		con.close();
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		out.print(e);
	} catch (SQLException e) {
		e.printStackTrace();
		out.print(e);
	}
	
	%>
</body>
</html>