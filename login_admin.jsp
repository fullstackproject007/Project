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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!--Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Acme&display=swap" rel="stylesheet">
    <title>Login Page</title>
    <style>
      .height{
        min-height: 73vh;
      }
    </style>
</head>
<body>
	<div class="container-fluid py-3 bg-dark">
      <div class="row d-flex justify-content-center">
        <div class="col-md-8">
          <h1 class="display-4 text-light text-center text-capitalize">STUDENT NATION<small><strong>   admin Login</strong></small></h1>
        </div>
      </div>
    </div>
    <!--container end-->
    <!--Login Form-->
    <section class="bg-light py-3">
      <div class="container-fluid mt-4 text-dark">
        <div class="row height d-flex justify-content-center align-items-center mt-2">
          <div class="col-lg-5 col-md-6 px-4">
            <form action="verifylogin.jsp" method="post">
              <div class="form-group">
                  <label for="username"><strong>Username</strong></label>
                  <input type="text" name="adminusername" class="form-control" placeholder="Username">
              </div>
              <div class="form-group">
                <label for="adminpassword"><strong>Password</strong></label>
                  <input type="password" name="adminpassword" placeholder="P@ssword" class="form-control">
              </div>
              <button class="btn btn-success btn-block btn-sm text-light pt-3 mt-4" type="submit"><h4>Login</h4></button>
              <%
              
			if(session.getAttribute("error")!=null || session.getAttribute("error")=="Wrong Credentials Entered!"){
				%>
				<div class="alert alert-danger alert-dismissable fade show mt-4" role="alert" id="loginfailed">
                    <button class="btn close" data-dismiss="alert" type="button"><span>&times;</span></button>
                    <strong class="text-dark text-capitalize text">Wrong Credentials entered </strong><span class="text-dark text-capitalize text">Please enter again.</span> 
                </div>
				<% 	
				session.removeAttribute("error");
				session.invalidate();
			}
			  %>
            </form>
          </div>
        </div>    
      </div>
    </section>
	<!-- End of login form -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>