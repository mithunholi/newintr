<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%--  <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> --%>
 <%-- <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet"> --%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
       <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
     <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/plugins/flag/assets/docs.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/plugins/flag/css/flag-icon.css" rel="stylesheet">
     <!-- common styles -->
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
 <script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
<script
	src="${pageContext.request.contextPath}/resources/plugins/validator/jquery.validate.min.js"
	type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>
	 
		<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap-modal.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	
</head>
<body style="overflow-x: hidden;">
<tiles:insertAttribute name="header" > </tiles:insertAttribute> 
  <div id="content-wrapper"><tiles:insertAttribute name="body" />
    </div>
    <div class="clearfix"></div>
    <tiles:insertAttribute name="footer" />
    		    	<div class="modal" id="loader" data-backdrop="static">
	
</div>

</body>
</html>