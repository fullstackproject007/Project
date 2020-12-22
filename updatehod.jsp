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
	<title>Update Hod</title>
</head>
<body class="bg-dark">
	<%
	try {
		String id=request.getParameter("hodid");
		String newpass=request.getParameter("newpassword");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "Password@007");
		
		//to get old password
		PreparedStatement ps=con.prepareStatement("select password from hod where hodid=?");
		ps.setString(1,id);
		ResultSet rs = ps.executeQuery();
		rs.next();
		String oldadminpass=rs.getString(1); //from database
		String old=request.getParameter("password");
		//out.println(old+"\n"+oldadminpass);
		
		if(!oldadminpass.equals(old)){
			%>
			<section class="py-2">
				<div class="container">
					<div class="row  d-flex align-item-center justify-content-center">
						<div class="col-md-8">
							<h3 class="text-light text-center text-capitalize display-4">Old Hod Password Does Not Match, please enter again!!!</h3>
							<br> <br>
							<a href="/fs_project/admin.jsp#update"><h5 class="text-light font-bold font-italic py-2 text-center">Click here to get back</h5></a>
						</div>
					</div>
				</div>
			</section>
			<%
		}else{
			ps=con.prepareStatement("update hod set password=? where hodid=?");
			ps.setString(1, newpass);
			ps.setString(2, id);
			int i=ps.executeUpdate();
			if(i>0){
				%>
			<section class="py-2">
				<div class="container">
					<div class="row  d-flex align-item-center justify-content-center">
						<div class="col-md-8">
							<h4 class="display-4 text-light text-center text-capitalize">hod password updated!!!</h4>
							<br> <br>
							<a href="/fs_project/admin.jsp#update"><h5 class="text-light font-bold font-italic py-2 text-center">Click here to get back</h5></a>
						</div>
					</div>
				</div>
			</section>
				<%	
			}
		}
		con.close();
	}catch (ClassNotFoundException e) {
		e.printStackTrace();
		out.print(e);
	} catch (SQLException e) {
		e.printStackTrace();
		out.print(e);
	}
	%>
</body>
</html>