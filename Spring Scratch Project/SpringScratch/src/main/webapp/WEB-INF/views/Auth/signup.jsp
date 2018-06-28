<%@page import="com.eoxys.Util.EncDecPassword"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	System.out.println("now signup.jsp");
%>

<%
	System.out.println("now in logreg.jsp");
	boolean loggedIn = false;
	String goToUrl = "";
	System.out.println("Logged In " + request.getAttribute("logged_in")
			+ "," + request.getAttribute("goto"));
	if (request.getAttribute("logged_in") != null) {
		loggedIn = request.getAttribute("logged_in").equals("true")
				? true
				: false;
		System.out.println("logfsdsdgfdgf " + loggedIn);
	}
	if (request.getAttribute("goto") != null) {
		goToUrl = EncDecPassword.decBase64(request.getAttribute("goto")
				.toString());
		System.out.println("logfsdsdgfdgf " + loggedIn);
	}
	System.out.println("logfsdf " + loggedIn);

	String logUrl = request.getContextPath() + "/checklogin";
	String regUrl = request.getContextPath() + "/register";
	String emailUrl = request.getContextPath() + "/email?";
	String click = (String) request.getAttribute("click");
	String msg = "new_user";
	System.out.println("mnb" + click);
	if (click != null && click.equals("active")) {
		System.out.println("mnbs");
		msg = request.getParameter("msg");
	}
	System.out.println("mnb");

	/* Cookie[] cookies = request.getCookies();
	System.out.println("mnb");
	int login_attempt=0;
	for(Cookie cook : cookies){
		System.out.println("fsdhdg "+cook.getName());
		if(cook.getName().equals("login_attempt")){
			
			try{
				//login_attempt=Integer.parseInt(cook.getValue().toString().toString());
			}catch(Exception e){
				
			}
		}
	}
	System.out.println("Cookieswd login attempt "+login_attempt); */
%>
<!-- <script>
	document.getElementById('iregister').className = 'active';
</script> -->

<header>
	<div class="container">
		<div class="intro-text">
			<div class="row">
				<div class="col-sm-9">
					<div class="intro-lead-in">Welcome To Our Eoxys!</div>
					<!-- <div class="intro-heading">It's Nice To Meet You</div> -->
					<!-- <a href="#services" class="page-scroll btn btn-xl">Tell Me More</a> -->
				</div>
				<%
					if (!loggedIn) {
				%>
				<div class="col-sm-3" style="border: 1px solid #FFF">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="section-heading">Login</h2>
						</div>

					</div>
					<form name="login-form" role="form" id="login-form" method="POST">
						<div class="form-group">
							<div class="input-group" id="Userspan">
								<input class="form-control" placeholder="Username"
									name="username" type="text" autofocus> <span
									class="input-group-addon"><i class="fa fa-user"></i></span>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group" id="Pwdspan">
								<input class="form-control" placeholder="Password"
									name="password" id="password" type="password" value=""> <span
									class="input-group-addon"><i class="fa fa-key"></i></span>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group" id="ConfirmPwdspan">
								<input class="form-control" placeholder="Confirm Password"
									name="cPassword" type="password" value=""> <span
									class="input-group-addon"><i class="fa fa-key"></i></span>
							</div>
						</div>
						<div class="form-group">
							<input id="accept_terms" type="checkbox" name="accept_terms"
								placeholder="">&nbsp; I accept the <a
								id="accept_terms_link" href="http://www.qt.io/terms-conditions/">service
								terms.</a>
						</div>
						<div class="col" style="padding-bottom: 10px">
							<!-- Change this to a button or input when using this as a form -->
							<button type="submit" class="btn btn-lg btn-info btn-block">
								<i class="fa fa-plus-square"></i> Register
							</button>
						</div>
						<!-- <div class="checkbox">
							<label> <input name="remember" id="remember"
								type="checkbox" value="0">Remember Me
							</label>
						</div> -->
						<div class="clearfix"></div>
						<!-- <div class="row">
							<div class="col-lg-5 text-center">
								<div class="col">
									Change this to a button or input when using this as a form
									<button type="submit" class="btn btn-lg btn-info btn-block">
										Login <i class="fa fa-sign-in"></i>
									</button>
								</div>
							</div>
							<div class="col-lg-7 quicklinks">
								<ul class="list-inline quicklinks">
									<li><a href="#" style="font-size: 80%">New To Model
											Project</a></li>
									<li><a href="#" style="font-size: 80%">Forget
											password?</a></li>
								</ul>
								                                       <a href="#" class="sm" style="font-size:75%">Terms and Conditions</a><br>
                                                                                <a href="#" class="sm" style="font-size:75%">Privacy Policy</a>
							</div>

						</div> -->
						<!-- <div class="clearfix"></div>
                                <div class="row">
                                     
                                    <div >
                                        <ul class="list-inline quicklinks">
                                            <li><h3 class="col-sm-12 section-subheading text-muted">New To Model Project : </h3><a href="#">Sign Up</a>
                                            </li>
                                        </ul>
                                        <p>New To Model Project : <a href="#" class="sm" style="font-size:75%">Sign Up</a></p>
                                    </div>
                                </div> -->
					</form>
					<div id="respDiv" align="center">
						<i id="iconDiv"></i>
						<%
							if (msg.equals("success")) {
						%>
						<div id="respDiv2" class="alert alert-success"
							style="background-color: rgba(167, 240, 168, 0.61)">
							<i class="fa fa-check-circle"></i> Please Verify Your Email
						</div>
						<%
							} else if (msg.equals("error")) {
						%>
						<div id="respDiv2" class="alert alert-warning"
							style="background-color: rgba(240, 233, 134, 0.63)">
							<i class="fa  fa-warning"></i> Please You First Login
						</div>
						<%
							} else if (msg.equals("auth-error")) {
						%>
						<div id="respDiv2" class="alert alert-danger"
							style="background-color: rgba(197, 45, 47, 0.25)">
							<i class="fa  fa-user-times"></i> Unauthorized: Authorization
							failed
						</div>
						<%
							}
						%>
					</div>

				</div>
				<%
					} else {
				%>
				<div class="col-sm-3" style="border: 1px solid #FFF">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="section-heading">Already Loggedin</h2>
						</div>

					</div>
					<div class="row">
						<div class="col-lg-5 text-center">
							<div class="col">
								<!-- Change this to a button or input when using this as a form -->
								<button onclick="window.location='<%=goToUrl%>'"
									class="btn btn-lg btn-info btn-block">
									Go to App <i class="fa fa-sign-in"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>

			</div>
		</div>
</header>
<script>
function sendEmail(){
	var email=document.getElementById('email').value;
	if(email==null ||email==""){
		alert("Enter Email Address");
		$("#email").css('outline',0).attr('tabindex',-1).focus();
	}else{
	getAjaxHtml('content-wrapper','<%=emailUrl%>recp=' + email);
		}
	}
	$(document).ready(function() {
		console.log("sdfbdfn")
		$('#respDiv2').delay(4000).fadeOut();
	});
	$().ready(function() {
		console.log("dgfbd")
		$.validator.addMethod('goodpassword',
		        function(value, element) {
		            var classes = 0;
		            var lower = new RegExp("[a-z]");
		            if (lower.test(value)) { classes++; }
		            var upper = new RegExp("[A-Z]");
		            if (upper.test(value)) { classes++; }
		            var digits = new RegExp("[0-9]");
		            if (digits.test(value)) { classes++; }
		            var others = new RegExp("[^A-Za-z0-9]");
		            if (others.test(value)) { classes++; }
		            return classes >= 3;
		        },
		        'Please see password requirements');
		$.validator.addMethod('confirmPassword',
		        function(value, element) {
			console.log(value+"=="+$("#password").val());
			 if($("#password").val()==value){
				    return true; 
			 }else{
				 return false;
			 }
		},
		'Password Mismatch.');
		  $.validator.addMethod('terms_accepted',
			        function(value, element) {
			            return element.checked;
			        },
			        'Please accept the service terms.');
		// Selecting the form and defining validation method
		$("#login-form").validate({
			// Passing the object with custom rules
			rules : {
				// login - is the name of an input in the form
				username : {
					required : true,
					// Setting email pattern for email input
					email : true
				},
				password : {
					required : true,
					'goodpassword':true
				// Setting minimum and maximum lengths of a password
				},
				cPassword : {
					required : true,
					'confirmPassword':true
				// Setting minimum and maximum lengths of a password
				},
				accept_terms: {'terms_accepted': true}
			},
			errorPlacement : function(error, element) {
				console.log("fghjj")
				console.log(error);
				console.log(element.attr("name"));
				if (element.attr("name") == "username") {
					error.insertAfter($('#Userspan'));
				} else if (element.attr("name") == "password") {
					error.insertAfter($('#Pwdspan'));
				} else {
					error.insertAfter(element);
				}
			},
			// Setting error messages for the fields
			messages : {
				password : {
					required : "Enter your password"
				},
				username : {
					required : "Enter your email"
				}
			},
			// Setting submit handler for the form
			submitHandler : function(form) {
				console.log("submit");
				
				submitFormAllValues(form, '<%=regUrl%>');
			}
		});
	});
</script>