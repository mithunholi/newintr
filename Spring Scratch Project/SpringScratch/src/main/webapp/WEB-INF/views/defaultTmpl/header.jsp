<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%-- <script src="<s:url value="/resources"/>/js/manual1.js"></script> --%>
<%String click=(String) request.getAttribute("click");
System.out.println("click:"+click);
String userUid=null,displayName=null;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
 for (Cookie cookie : cookies) {
   if (cookie.getName().equals("userUid")) {
	   userUid= cookie.getValue();
   }
   if (cookie.getName().equals("displayName")) {
	   displayName= cookie.getValue();
   }
 }
}
%>
 <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Model Project</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                     <li>
                        <a  href="${pageContext.request.contextPath}/login">Login</a>
                    </li>
                     <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/signup">Sign Up</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>