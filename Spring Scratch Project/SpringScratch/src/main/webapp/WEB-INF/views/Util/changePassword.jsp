<%@page import="com.eoxys.Util.CMD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String divName="content-wrapper";
	String type=request.getAttribute("type").toString();
	String changeUrl,baseUrl;
	if(type.equals("adv")){
		changeUrl = request.getContextPath()+"/advertisers/myProfile/post?";
		baseUrl = request.getContextPath()+"/advertisers/myProfile";
	}else{
		changeUrl = request.getContextPath()+"/deviceOwners/myProfile/post?";
		baseUrl = request.getContextPath()+"/deviceOwners/myProfile";
	}
%>
<script>document.title = 'Change Password';</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div></div>
	<div class="row" style="padding-top: 100px">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default displaystyledefault">
			<div style="border: 5px solid #3c8dbc;">
				<div id="content-wrapper">
					<div id="content-wrapper">
						<div class="panel-heading">
							<h1>
								<center>
									<u>Change Password</u>
								</center>
							</h1>
						</div>
						<div class="panel-body ">
							<form id="login-form" role="form" method="POST">
								<fieldset>
									<div class="form-group has-feedback">
										<input class="form-control" placeholder="Old Password"
											name="old_pwd" id="old_pwd" type="text" autofocus>
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="New Password"
											name="password" id="password" type="password" value="">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Retype Password"
											name="retype_pwd" type="password" value="">
									</div>
									<div class="col-lg-12 col-lg-offset-1" style="padding-bottom: 15px">
										<!-- Change this to a button or input when using this as a form -->
										<button type="submit" id="saveBtn"
											class="btn btn-lg btn-info btn-lg"><i class="fa fa-save"></i> Confirm</button>&nbsp;
											
										<button type="reset" id="cancelBtn" class="btn btn-lg"
											onClick="javascript:getAjaxHtml('<%=divName%>', '<%=baseUrl%>');"><i class="fa fa-close"></i> Cancel</button>
										<%-- <input type="submit" value="Register"
											onclick="javascript:submitForm('login-form','<%=regUrl%>');"
											class="btn btn-lg btn-info btn-lg" /> --%>
									</div>
								</fieldset>
							</form>
							<div align="center" style="padding-bottom: 10px">
								<label onclick="pswd_req()"
									class="btn btn-xs btn-primary btn-xs"><i class="fa fa-list"></i> Password  
									requirements</label>
							</div>
							<div id="passMessage" hidden align="justify"
								style="padding-bottom: 15px">
								<ol>
									<li>Minimum 7 characters</li>
									<li>Cannot contain your email address or name</li>
									<li>Must include at least three of these four types:
										lowercase letters, uppercase letters, digits, symbols</li>
								</ol>
							</div>
							<div id="respDiv" align="center"></div>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$()
			.ready(
					function() {
						$.validator.addMethod('goodpassword', function(value,
								element) {
							var classes = 0;
							var lower = new RegExp("[a-z]");
							if (lower.test(value)) {
								classes++;
							}
							var upper = new RegExp("[A-Z]");
							if (upper.test(value)) {
								classes++;
							}
							var digits = new RegExp("[0-9]");
							if (digits.test(value)) {
								classes++;
							}
							var others = new RegExp("[^A-Za-z0-9]");
							if (others.test(value)) {
								classes++;
							}
							return classes >= 3;
						}, 'Please see password requirements');
						jQuery.validator.addMethod("notEqualTo", function(value, element, param) {
							 return this.optional(element) || value != $(param).val();
							 }, "This has to be different...")
						// Selecting the form and defining validation method
						$("#login-form")
								.validate(
										{
											// Passing the object with custom rules
											rules : {
												old_pwd : {
													required : true,
												},
												password : {
													required : true,
													// Setting minimum and maximum lengths of a password
													minlength : 7,
													'goodpassword' : true,
													notEqualTo:'#old_pwd'
												},
												retype_pwd : {
													required : true,
													equalTo : "#password"
												}
											},
											// Setting error messages for the fields
											messages : {
												old_pwd : {
													required : "Enter your current Password"
												},
												password : {
													required : "Enter your new password",
													minlength : "Minimum password length is 7",
													notEqualTo: "Your current password and new password should be different"
												},
												retype_pwd : {
													required : "Retype the Password",
													equalTo : "Password missmatch"
												}
											},
											// Setting submit handler for the form
											submitHandler : function(form) {
												submitFormAllValues(form,'<%=changeUrl + "cmd=" + CMD.CHANGEPASSWORD%>');
			}
		});
	});
</script>
</html>