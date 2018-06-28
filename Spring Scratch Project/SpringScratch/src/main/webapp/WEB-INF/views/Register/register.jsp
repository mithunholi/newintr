<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	System.out.println("now in regAd111.jsp");
%>
<%
	String logUrl = request.getContextPath() + "/login";
	String regUrl = request.getContextPath() + "/register";
%>


<div class="panel-body" style="padding-bottom: 40px">
	<form id="login-form" role="form" method="POST" action="<%=regUrl%>">
		<div
			class="col-sm-8 col-sm-offset-2 glass alert alert-info displaystyledefault">
			<h1 align="center"
				style="padding-bottom: 20px; padding-top: 50px; color: #5bc0de">Congratualations!</h1>
			<h4 align="center" style="padding-bottom: 15px">Your BumperGlass
				Account has been created.</h4>
			<p align="justify" style="text-align: center">We have sent
				confirmation link to your email. Press Continue to start using your
				account.</p>
			<div class="col text-center"
				style="padding-top: 10px; padding-bottom: 50px">
				<a href="<%=logUrl%>" style="text-align: center"
					class="btn btn-lg btn-info btn-lg">Continue</a>
			</div>
		</div>
	</form>
	<div id="respDiv"></div>
</div>