<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css" /> --%> 
  <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
 <script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/validator/jquery.validate.min.js"
	type="text/javascript"></script>

<title>
<tiles:insertAttribute name="title" ignore="true" />
</title>
</head>
<body>




		<div><tiles:insertAttribute name="header" /></div>
		<%-- <div style="float:left;padding:10px;width:15%;"><tiles:insertAttribute name="menu" /></div> --%>
		<div>
		<tiles:insertAttribute name="body" /></div>
		<div class="clearfix"></div>
    	<div style="clear:both"><tiles:insertAttribute name="footer" /></div>

</body>
</html>
