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
<!doctype html>
<html lang="en">

    <head>
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
        <title>HOD Module</title>
        <style type="text/css">
			body{
			    font-family: 'Acme', sans-serif;
			}
			.height{
			    min-height: 80vh;
			}
			.height-70{
			    min-height: 70vh;
			}
			.height-50{
			    min-height: 50vh;
			}
			#headingsignup{
			    margin-left: 95px;
			}
			.text{
			    font-size: x-large;
			}
			#signupcard{
			    background-color: #955251;
			}
            #updatesubcard
            {
                background-color: rgb(21, 34, 49);
                margin-top:100px;   
            }
            #updatecard{
                background-color: #517695;
            }
			#signuphead{
			    color: #516995;
			}
			#updatehead{
			    color: #5d5195;
			}
			#signupheadtext{
			    font-size: x-large;
			}
			#updateheadtext{
			    font-size: x-large;
			}
			#info{
			    background-color: whitesmoke;
			}
			#infohead1{
			    font-size: larger;
			}
			#infohead2{
			    font-size: larger;
			}
            #map{
                background-color: #98d4b1;
            }
			#signup{
			    background: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.9));
			    background-color: #DFCFBE;
			}
			#update{
			    background-color: #98B4D4;
			}
			#footer{
			    background: linear-gradient(rgba(0, 0, 0, 0.26), rgba(0,0,0,0.2));
			}
        </style>
 		<script type="text/javascript">
	 		window.onload=function(){
	 		    document.getElementById('signuppasswordalert').style.display='none';
	 		    document.getElementById('signupnoalert').style.display='none';
	 		    document.getElementById('updatepasswordalert1').style.display='none';
	 		}
	 		function facultyvalidate(){
	 		    var pass=document.forms['hodform']['newpassword'].value;
	 		    var newpass=document.forms['hodform']['repassword'].value;
	 		    if(pass===newpass){
	 		        return true;
	 		    }else{
	 		        // alert("New Passwords Do Not Match!");
	 		        document.getElementById('updatepasswordalert1').style.display='block';
	 		        hodform.newpassword.focus();
	 		        return false;
	 		    }
	 		}

	 		function signupvalidate(){
	 		    if(signupform.password.value!==signupform.repassword.value){
	 		        // alert("Passwords Do Not Match!");
	 		        document.getElementById('signuppasswordalert').style.display='block';
	 		       document.getElementById('signupnoalert').style.display='none';
	 		        signupform.password.focus();
	 		        return false;
	 		    }else if((signupform.phno.value).length!==10){
	 		        document.getElementById('signupnoalert').style.display='block';
	 		       document.getElementById('signuppasswordalert').style.display='none';
	 		        // alert('Incorrect Phone No!');
	 		        signupform.phno.focus();
	 		        return false;
	 		    }else if(isNaN(signupform.phno.value)){
	 		        // alert('Incorrect Phone No!');
	 		        document.getElementById('signupnoalert').style.display='block';
	 		       	document.getElementById('signuppasswordalert').style.display='none';
	 		        signupform.phno.focus();
	 		        return false;
	 		    }else{
	 		        return true;
	 		    }
	 		}
 		</script>
 		
      </head>
      
<body>
	 <%
     	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
     	if(session.getAttribute("username")==null || session.getAttribute("password")==null){
     		session.removeAttribute("username");
     		session.removeAttribute("password");
     		response.sendRedirect("Hod_login.jsp");
     	}
     %>

    <!--navbar -->
    <nav class="navbar navbar-dark navbar-expand-md bg-dark" id="top">
    	<i class="fas fa-user-circle fa-3x text-light mr-3"></i>
        <a href="#top" class="navbar-brand text-uppercase text-light font-italic"><strong style="font-size: x-large;">Student Nation</strong><small><span class="text-dark">___</span>HOD Module</small></a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarLinks">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarLinks">
            <ul class="navbar-nav ">
                <li class="nav-item"><a class="nav-link text-light" href="#signup">Add Faculty</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="#map">Map Subjects</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="#update">Update Password</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="#info">View Info</a></li> 
                <li class="nav-item"><a class="nav-link text-light" href="#footer">Footer</a></li>
            </ul>
            <a href="logout_hod.jsp"><i class="fas fa fa-sign-out-alt text-light fa-2x ml-2"></i></a>
        </div>
        
    </nav>
    <!-- end of navbar -->
    <!-- Welcome -->
    <section id="aboutus" class="py-1 bg-success">
        <div class="container">
            <!-- title -->
            <div class="row py-2 ">
                <div class="col d-flex align-items-center justify-content-center">
                    <h2 class="text-left text-capitalize text-danger">Welcome!  "<%=session.getAttribute("name") %>"  HOD <%=session.getAttribute("branch") %>   </h2>
                </div>
            </div>
            <!-- end of title -->
        </div>
    </section>
    <!-- end of welcome -->

    <!-- Sign up form -->
    <section id="signup" class="py-3">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1 class="display-4 text-center text-light">
                        <strong class="text-capitalize font-bold" id="signuphead">Sign up Faculty</strong>
                    </h1>
                    <div class="my-1 bg-light"></div>
                    <p class="text-dark text-capitalize my-2 text-center" id="signupheadtext">HOD can Add a new faculty.</p>
                </div>
            </div>
            <!-- form start -->
            <div class="row height-70 d-flex justify-content-center mt-4 py-2">
                <div class="col-lg-6 col-md-8">
                    <!-- card -->
                    <div class="card-body py-2 mb-4" id="signupcard">
                        <div class="card-title mt-3 d-flex">
                            <i class="fas fa-user-plus fa-2x mr-4 fa-align-left"></i>
                            <h4 class="text-center text-capitalize text-light font-italic" id="headingsignup"><p>new faculty sign up!</p></h4>
                        </div>
                        <!-- alert -->
                        <div class="alert alert-warning alert-dismissable fade show" role="alert" id="signuppasswordalert">
                            <button class="btn close" data-dismiss="alert" type="button"><span>&times;</span></button>
                            <strong class="text-dark text-capitalize text">Wrong Password !! </strong><span class="text-dark text-capitalize text">Please enter again.</span> 
                        </div>
                        <div class="alert alert-warning alert-dismissable fade show" role="alert" id="signupnoalert">
                            <button class="btn close" data-dismiss="alert" type="button"><span>&times;</span></button>
                            <strong class="text-dark text-capitalize text">Incorrect Ph No !! </strong><span class="text-dark text-capitalize text">Please enter again.</span> 
                        </div>
                        <!-- end of alert -->
                        <form action="faculty_signup.jsp" name="signupform" method="post" onsubmit="return signupvalidate()">
                            <div class="form-group mt-4">
                                <input type="text" name="name" placeholder="Name" class="form-control" required="required">
                            </div>
                            <div class="form-group mt-4">
                                <input type="text" name="facultyid" placeholder="Faculty Id" class="form-control" required="required">
                            </div>

                            <div class="input-group mt-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Year</span>
                                </div>
                                <input type="text" name="year" placeholder="Enter Year" class="form-control" required="required">
                            </div>
                             <div class="input-group mt-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Subject Taught</span>
                                </div>
                                <input type="text" name="subject" class="form-control" placeholder="Enter Subject" required="required">
                            </div>
                            <div class="input-group mt-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Phone No.</span>
                                </div>
                                <input type="text" name="phno" class="form-control" placeholder="Ph No." required="required">
                            </div>
                            <div class="input-group mt-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Email</span>
                                </div>
                                <input type="email" name="email" class="form-control" placeholder="Email" required="required">
                            </div>
                            <div class="input-group mt-4 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Password</span>
                                </div>
                                <input type="password" name="password" class="form-control" placeholder="Password" required="required">
                            </div>
                            <div class="input-group mt-4 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> Confirm Password</span>
                                </div>
                                <input type="password" name="repassword" class="form-control" placeholder="Confirm Password" required="required">
                                <div class="input-group-append">
                                    <button class="btn btn-primary text-light" type="submit">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end of sign up -->

    <!-- update Password -->
    <section id="update" class="py-3">
        <div class="container">
            <!-- title -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <h1 class="display-3 text-center text-dark">
                        <i class="fas fa-user-edit fa-1x"></i>
                        <strong class="text-capitalize font-bold text-dark" id="updatehead">update password</strong>
                    </h1>
                    <p class="text-dark text-capitalize my-2 text-center" id="updateheadtext">HOD can update password of any faculty.</p>
                </div>
            </div>
            <!-- end of title -->
            <div class="row mt-4 height-70 d-flex align-items-center justify-content-center">
                <div class="col-md-6">
                    <h4 class="font-bold font-italic text-capitalize">
                        <strong>faculty password update</strong>
                    </h4>
                    <!-- alert -->
                    <div class="alert alert-danger alert-dismissable fade show" role="alert" id="updatepasswordalert1">
                        <button class="btn close" data-dismiss="alert" type="button"><span>&times;</span></button>
                        <strong class="text-dark text-capitalize text">Wrong Password !! </strong><span class="text-dark text-capitalize text">Please enter again.</span> 
                    </div>
                    <!-- end of alert -->
                    <div class="card" id="updatecard">
                        <div class="card-body">
                            <form action="faculty_update.jsp" class="mt-3" method="post" name="hodform" onsubmit="return facultyvalidate()">
                                <div class="input-group mt-4">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><span>Faculty Id</span></div>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Type Faculty Id" name="facultyid" required="required">
                                </div>
                                <div class="input-group mt-4">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><span>Old P@ssword</span></div>
                                    </div>
                                    <input type="password" class="form-control" name="password" placeholder="Type old P@ssword" required="required">
                                </div>
                                <div class="input-group mt-4">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><span>New P@ssword</span></div>
                                    </div>
                                    <input type="password" class="form-control" name="newpassword" placeholder="Type New P@ssword" required="required">
                                </div>
                                <div class="input-group mt-4">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><span>Re-Enter P@ssword</span></div>
                                    </div>
                                    <input type="password" class="form-control" name="repassword" placeholder="Re-Enetr P@ssword" required="required">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit">Submit</button>
                                    </div>
                                </div>
        
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end of update password -->

    <!--update subjects-->
    <section id="map" class="py-3">
        <div class="container">
             <!-- title -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <h1 class="display-3 text-center text-dark">
                        <i class="fas fa-user-edit fa-1x"></i>
                        <strong class="text-capitalize font-bold text-dark" id="updatehead">update subject</strong>
                    </h1>
                    <p class="text-dark text-capitalize my-2 text-center" id="updateheadtext">HOD can update faculty's subject.</p>
                </div>
            </div>
            <!-- end of title -->
            <div class="row p-2 my-3 height-70 d-flex justify-content-center align-items-center">
                <div class="col-md-6">
                    <div class="card bg-success" id="subjectcard">
                        <div class="card-body">
                            <form action="HODupdate_subject.jsp" class="mt-3" method="post" name="subform" onsubmit="" >
                                <div class="input-group mt-4">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><span>Faculty ID</span></div>
                                    </div>
                                    <input type="text" class="form-control" name="facultyid" placeholder="Type ID" required="required">
                                </div>
                                <div class="input-group mt-4">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><span>Subject Name</span></div>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Type Subject Name" name="subject" required="required">
                                </div>
                                <button class="btn btn-primary btn-block mt-4" type="submit">Map Subject</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--end of update subjects-->
      

    <!-- view info -->
    <section id="info" class="py-3">
        <div class="container">
            <!-- title -->
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <h1 class="display-3 text-center text-dark">
                        <i class="fas fa-user-friends  fa-1x"></i>
                        <strong class="text-capitalize font-bold ">View Information</strong>
                    </h1>
                    <div class="my-1 bg-dark"></div>
                    <p class="text-dark text-capitalize my-2 text-center" id="infohead1">HOD can view marks Subject wise, department wise and year wise for his branch</p>
                    <br>
                    <p class="text-dark text-capitalize my-1 text-center" id="infohead2">links will generate dynamic web pages ;)</p>
                </div>
            </div>
            <!-- end of title -->
            <div class="row height-50 mt-3 py-2 d-flex justify-content-center">
                <div class="col-md-8 align-self-center">
                    <table class="table table-striped table-secondary text-dark">
                        <tr>
                            <td>Contents</td>
                            <td>Links</td>
                        </tr>
                        <tr>
                            <td>Subject Wise(Current Dept.)</td>
                            <td><form action="HOD_subject_wise.jsp" method="post" name="submarks"><input type="submit" class="btn btn-outline-success text-dark" value="Click Here"></form></td>
                        </tr>
                        <tr>
                            <td>Department Wise(All dept.)</td>
                            <td><form action="HOD_dept_wise.jsp" method="post" name="deptmarks"><input type="submit" class="btn btn-outline-success text-dark" value="Click Here"></form></td>
                        </tr>
                        <tr>
                            <td>Year Wise</td>
                            <td><form action="HOD_year_wise.jsp" method="post" name="yearmarks"><input type="submit" class="btn btn-outline-success text-dark" value="Click Here"></form></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!-- end of view info -->

    <!-- Footer -->
    <section id="footer" class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col text-center text-dark">
                    <h5>@Footer</h5>
                </div>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <h5 class="text-dark font-italic text-capitalize">@2020 student nation admin module. all rights
                        reserved. -student nation corp.</h5>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-6">
                    <div class="d-flex justify-content-around">
                        <a href="#"><i class="fab fa-facebook fa-2x text-primary"></i></a>
                        <a href="#"><i class="fab fa-google fa-2x text-danger"></i></a>
                        <a href="#"><i class="fab fa-twitter fa-2x text-info"></i></a>
                        <a href="#"><i class="fab fa-yahoo fa-2x text-success"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end of footer -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>