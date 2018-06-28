<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String h1=request.getAttribute("h1").toString();
    String h2=request.getAttribute("h2").toString();
    String h3=request.getAttribute("h3").toString();
	String logUrl = request.getContextPath() + "/login";
%>
<script>
	document.getElementById('ilogin').className = 'active';
</script>	
						<div class="panel-body" style="padding-bottom:40px">
								<div class="col-sm-8 col-sm-offset-2 glass alert alert-info displaystyledefault">
									<h1 align="center" style="padding-bottom: 20px;padding-top:50px;color:#5bc0de">Forgot Password</h1>
									<h4 align="center" style="padding-bottom: 15px">
										<%=h2 %></h4>
									<p align="justify" style="text-align:center"><%=h3 %></p>
									<div class="col text-center" style="padding-top:10px;padding-bottom:50px">
									<a href="<%=logUrl%>" style="text-align:center" class="btn btn-lg btn-info btn-lg"><%=h1 %></a>
								</div>
								</div>
							<div id="respDiv"></div>
						</div>