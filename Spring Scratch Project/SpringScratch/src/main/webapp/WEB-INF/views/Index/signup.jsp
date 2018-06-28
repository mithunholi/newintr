<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	System.out.println("now signup.jsp");
%>
<%
	String msg = (String) request.getAttribute("msg");
	System.out.println("msg=" + msg);
	String logUrl = request.getContextPath() + "/login";
	String regUrl = request.getContextPath() + "/register";
%>
<script>
	document.getElementById('iregister').className = 'active';
</script>
<section>
<div class="row" style="padding-bottom:40px">
<div class="col-md-offset-4 col-md-4 col-sm-6">
	<div class="panel-heading" id="focus">
		<h2  class="panel-title" style="text-align:center;font-size:30px">
			<b>Register</b>
		</h2>
	</div>
						<div class="panel-body">
							<form id="login-form" role="form" method="POST">
							<fieldset class="glass alert alert-info displaystyledefault">
									<div class="form-group has-feedback">
									<div class="input-group" id="Userspan">
										<input class="input-group form-control" placeholder="Email" name="email"
											type="text" autofocus>
										<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
										</div>
									</div>
									<div class="form-group">
									<div class="input-group" id="Pwdspan">
										<input class="form-control" placeholder="Password"
											name="password" id="password" type="password" value="">
											<span class="input-group-addon"><i class="fa fa-key"></i></span>	
											</div>
									</div>
									<div class="form-group">
									<div class="input-group">
										<input class="form-control" placeholder="Confirm Password"
											name="confirm_pwd" type="password" value="">
											<span class="input-group-addon"><i class="fa fa-refresh"></i></span>
											</div>
									</div>
									<div class="form-group">
										<input id="accept_terms" type="checkbox" name="accept_terms"
											placeholder="">&nbsp; I accept the <a
											id="accept_terms_link" href="http://www.qt.io/terms-conditions/">service terms.</a>
									</div>
									<div class="col" style="padding-bottom: 10px">
										<!-- Change this to a button or input when using this as a form -->
										<button type="submit" class="btn btn-lg btn-info btn-block"><i class="fa fa-plus-square"></i> Register
										</button>
									</div>
								</fieldset>
							</form>
							<div id="respDiv" align="center">
							
							</div>
							<div align="center">
							<label onclick="pswd_req()" class="btn btn-xs btn-primary btn-xs" ><i class="fa fa-list"></i> Password requirements</label>
										</div>
										<div id="passMessage" class="glass alert alert-info" align="justify" style="margin:20px" hidden>
								<ol>
									<li>Minimum 7 characters</li>
									<li>Cannot contain your email address or name</li>
									<li>Must include at least three of these four types:
										lowercase letters, uppercase letters, digits, symbols</li>
								</ol>
							</div>
						</div>
						</div>
					</div>
</section>
<section id="bottom">
        <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Company</h3>
                        <ul>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">We are hiring</a></li>
                            <li><a href="#">Meet the team</a></li>
                            <li><a href="#">Copyright</a></li>
                            <li><a href="#">Terms of use</a></li>
                            <li><a href="#">Privacy policy</a></li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>    
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Support</h3>
                        <ul>
                            <li><a href="#">Faq</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Forum</a></li>
                            <li><a href="#">Documentation</a></li>
                            <li><a href="#">Refund policy</a></li>
                            <li><a href="#">Ticket system</a></li>
                            <li><a href="#">Billing system</a></li>
                        </ul>
                    </div>    
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Developers</h3>
                        <ul>
                            <li><a href="#">Developers 1</a></li>
                            <li><a href="#">Developers 2</a></li>
                            <li><a href="#">Developers 3</a></li>
                            <li><a href="#">Developers 4</a></li>
                            <li><a href="#">Developers 5</a></li>
                            <li><a href="#">Developers 6</a></li>
                            <li><a href="#">Developers 7</a></li>
                        </ul>
                    </div>    
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Our Partners</h3>
                        <ul>
                            <li><a href="#">Partners 1</a></li>
                            <li><a href="#">Partners 2</a></li>
                            <li><a href="#">Partners 3</a></li>
                            <li><a href="#">Partners 4</a></li>
                            <li><a href="#">Partners 5</a></li>
                            <li><a href="#">Partners 6</a></li>
                            <li><a href="#">Partners 7</a></li>
                        </ul>
                    </div>    
                </div><!--/.col-md-3-->
            </div>
        </div>
    </section><!--/#bottom-->
<script>
	$().ready(function() {
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
				email : {
					required : true,
					// Setting email pattern for email input
					email : true
				},
				password : {
					required : true,
					// Setting minimum and maximum lengths of a password
					minlength : 7,
					'goodpassword': true,
				},
				accept_terms: {'terms_accepted': true}
			},
			errorPlacement: function(error, element) {
				console.log(error);
				console.log(element.attr("name"));
				if(element.attr("name")== "email"){
				     error.insertAfter( $('#Userspan') );
				}else if(element.attr("name")== "password"){
					error.insertAfter( $('#Pwdspan') );
				}else if(element.attr("name") == "accept_terms") {
			      error.insertAfter( $('#accept_terms_link') );
			    } else {
			      error.insertAfter(element);
			    }
			  },
			// Setting error messages for the fields
			messages : {
				password : {
					required : "Enter your password",
					minlength : "Minimum password length is 7",
				},
				email : {
					required : "Enter you email"
				}
			},
			// Setting submit handler for the form
			submitHandler : function(form) {
				submitFormAllValues(form,'<%=regUrl%>');
			}
		});
	});
</script>