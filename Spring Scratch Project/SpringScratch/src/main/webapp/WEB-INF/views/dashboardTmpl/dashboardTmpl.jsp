<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title><tiles:insertAttribute name="title" /></title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/title.ico" />
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<!-- Bootstrap 3.3.4 -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<!-- switch style -->
<link
	href="${pageContext.request.contextPath}/resources/plugins/switch/css/bootstrap-switch.min.css"
	rel="stylesheet" type="text/css" />
	
	<!-- Bootstrap time Picker -->
    <link href="${pageContext.request.contextPath}/resources/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
<!-- Bootstrap Date picker 3 -->
<link
	href="${pageContext.request.contextPath}/resources/plugins/datepicker/datepicker3.css"
	rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link
	href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
<link
	href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />


<!-- Theme style -->
<link href="${pageContext.request.contextPath}/resources/css/common.css"
	rel="stylesheet" type="text/css" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->
		<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.1.4 -->
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"
		type="text/javascript"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>

		 <script src="${pageContext.request.contextPath}/resources/plugins/validator/jquery.validate.min.js" type="text/javascript"></script>


	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/resources/dist/js/app.min.js"
		type="text/javascript"></script>
		<!--slim sroll(fixed)  -->
			<script
		src="${pageContext.request.contextPath}/resources/plugins/slimScroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<!-- Optionally, you can add Slimscroll and FastClick plugins.
          Both of these plugins are recommended to enhance the
          user experience. Slimscroll is required when using the
          fixed layout. -->
	<!-- Bootstrap date picker 3.3.4 -->
	<script
		src="${pageContext.request.contextPath}/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- Bootstrap switch picker 3.3.4 -->
	<%-- <script
		src="${pageContext.request.contextPath}/resources/plugins/switch/js/bootstrap-switch.js"></script> --%>
</head>
 <body class="skin-purple fixed">
	<div class="wrapper">
		<div>
			<tiles:insertAttribute name="header" />
		</div>

		<div>
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="content-wrapper">
			<div id="content-wrapper">
				<tiles:insertAttribute name="body" />
			</div>
		</div>

		<div>
			<tiles:insertAttribute name="footer" />
		</div>
		</div>
<div class="modal" id="loader" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y:hidden;text-align:center">
			<img src="${pageContext.request.contextPath}/resources/images/loader6.gif" width="100px" height="100px" style="margin-top:20%"/>
</div>		
		
</body>
</html>