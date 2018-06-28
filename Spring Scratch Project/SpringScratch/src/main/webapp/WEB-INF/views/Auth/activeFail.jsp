<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	System.out.println("now in regAd.jsp");
%>
<%
	String logUrl = request.getContextPath() + "/login";
	String regUrl = request.getContextPath() + "/register";
%>
<script>
	document.getElementById('ilogin').className = 'active';
</script>
<div class="panel-body" style="padding-bottom:100px">
<div class="col-sm-6 col-sm-offset-3 col-xs-12">
	<form id="login-form" role="form" method="POST" action="<%=regUrl%>">
	
		<fieldset>
			<div class="glass alert alert-info displaystyledefault">
				<h1 align="center" style="padding-bottom: 15px;color:#4e4e4e">
					<u>Email Validation Failed !</u>
				</h1>
				<p align="center" style="padding-bottom: 15px">Please go to
					your Email and click the link that we have send.<br>Enter Username to
					resend mail</p>
				<div class="col-sm-10 col-sm-offset-1 input-group">
				<input class="form-control" placeholder="Enter Username(Email)"
					name="email" type="text" value="">
					<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
					</div>
				<div class="row" style="padding-top: 20px">
					<div class="text-center">
						<!-- Change this to a button or input when using this as a form -->
						<a href="<%=logUrl%>" class="btn btn-lg btn-info btn-sm"><i class="fa fa-send"></i> Resend</a>
						<!-- Change this to a button or input when using this as a form -->
						<a href="<%=logUrl%>">Back</a>
					
					</div>
				</div>
			</div>
		</fieldset>
	</form>
	</div>
	<div id="respDiv"></div>
</div>