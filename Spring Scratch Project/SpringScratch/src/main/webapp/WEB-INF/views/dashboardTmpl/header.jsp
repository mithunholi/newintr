<%@page import="javax.servlet.http.Cookie"%>
<%
System.out.println("start");
String userUid="";
String displayName="";
Cookie[] cookies = request.getCookies();

if (cookies != null) {
 for (Cookie cookie : cookies) {
   if (cookie.getName().equals("userUid")) {
	   userUid= cookie.getValue();
   }
 }
}
System.out.println("usr=="+userUid);
%>
<header class="main-header box-shadow">

        <!-- Logo -->
        <a href="#" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>A</b>DM</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><h3><b>SENSOR SERVER</b></h3></span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
          

       
              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i  class="fa fa-user"></i>
                  <!-- The user image in the navbar-->
                  
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs"><%=userUid%></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- The user image in the menu -->
                  <li class="user-header">
                   <img src="${pageContext.request.contextPath}/resources/media/employees/default_profile.png" width="75" class="img-circle">
                  </li>
                  <!-- Menu Body -->
               <li class="user-body text-center" style="background-color:#EEE">
                <p>Admin Name</p>
                  <p>
                      <small>(some content can be added hear)</small>
                    </p>
               </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-primary btn-flat"><i class="fa fa-user"></i> Profile</a>
                    </div>
                    <div class="pull-right">
                     <a class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm"><i class="fa fa-sign-out"></i> Sign Out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
            </ul>
          </div>
        </nav>
      </header>
<div class="modal bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4>Logout <i class="fa fa-lock"></i></h4></div>
      <div class="modal-body"><i class="fa fa-question-circle"></i> Are you sure you want to log-off?</div>
      <div class="modal-footer"><a href="${pageContext.request.contextPath}/logout" class="btn btn-primary btn-block">Logout</a></div>
    </div>
  </div>
</div>
