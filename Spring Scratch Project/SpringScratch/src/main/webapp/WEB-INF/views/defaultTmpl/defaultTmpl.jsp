<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<title><tiles:insertAttribute name="title" ignore="true" /></title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/css/agency.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<!-- <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css"> -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" class="index">

	<!-- Navigation -->
	<tiles:insertAttribute name="header" />




	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<%-- 	<script
	src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"
	type="text/javascript"></script> --%>
	<!-- jQuery validate -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/validator/jquery.validate.min.js"
	type="text/javascript"></script>
	
	<!-- Custom JS -->
		<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/cbpAnimatedHeader.js"></script>

	<!-- Contact Form JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jqBootstrapValidation.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/contact_me.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/js/agency.js"></script>
	<div class="content-wrapper">
			<div id="content-wrapper">
	<tiles:insertAttribute name="body" />
	</div></div>

	<tiles:insertAttribute name="footer" />
</body>

</html>
