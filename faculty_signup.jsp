<%@page import="java.math.BigInteger"%>
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
<title>Sign UP</title>
</head>
<body class="bg-dark">
	<%
	try {
		String name=request.getParameter("name");
		String facultyid=request.getParameter("facultyid");
		int year=Integer.parseInt(request.getParameter("year"));
		String branch=session.getAttribute("branch").toString();
		String subject=request.getParameter("subject");
		long phno=Long.parseLong(request.getParameter("phno"));
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		//Insert into database...
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "Password@007");
		Statement statement=con.createStatement();
		statement.executeUpdate("insert into faculty values('"+name+"','"+facultyid+"',"+year+",'"+branch+"','"+subject+"',"+phno+",'"+email+"','"+password+"')");
		%>
		<section class="py-2">
				<div class="container">
					<div class="row  d-flex align-item-center justify-content-center">
						<div class="col-md-8">
							<h2 class="text-light text-center text-capitalize">New Faculty of <%=session.getAttribute("branch") %> branch registered successfully!!!</h2>
							<br> <br>
							<a href="/fs_project/HOD.jsp#signup"><h5 class="text-light font-bold font-italic py-2 text-center">Click here to get back</h5></a>
						</div>
					</div>
					<div class="row d-flex align-item-center justify-content-center">
						<div class="col-md-8">
							<table class="table text-dark table-striped table-light text-center">
								<tr><td>Title</td><td>Details Entered</td></tr>
								<tr><td>Name</td><td><%=request.getParameter("name")  %></td></tr>
								<tr><td>Faculty ID</td><td><%=request.getParameter("facultyid")  %></td></tr>
								<tr><td>Year</td><td><%= request.getParameter("year") %></td></tr>
								<tr><td>Branch</td><td><%=session.getAttribute("branch") %></td></tr>
								<tr><td>Subject</td><td><%=request.getParameter("subject") %></td></tr>
								<tr><td>Email</td><td><%=request.getParameter("email") %></td></tr>
								<tr><td>Phone No.</td><td><%=request.getParameter("phno") %></td></tr>
								<tr><td>Password</td><td>Not visible due to security reasons.</td></tr>
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