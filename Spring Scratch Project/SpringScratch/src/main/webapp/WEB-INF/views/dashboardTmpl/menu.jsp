<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.eoxys.Util.Common"%>
<%@page import="java.util.Arrays"%>
<%
	System.out.println("Menu " + request.getAttribute("accessModules"));
	String[] accessMods = null;
	String[] modules = null;
	if (request.getAttribute("accessModules") != null) {
		accessMods = (String[]) request.getAttribute("accessModules");
	}
	if (request.getAttribute("modules") != null) {
		modules = (String[]) request.getAttribute("modules");
	}
	
	/* cookie */
	String roleValue="";
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
 for (Cookie cookie : cookies) {
   if (cookie.getName().equals("roleValue")) {
	   roleValue= cookie.getValue();
   }
 }
}
	/* int[] ind =null;
	 int idx=0;
	 if(accessMods!=null&&accessMods.length>0){
	
	 for(int i=0;i<accessMods.length;i++){
	 System.out.println("ACCEESSS "+accessMods[i]);
	 if(accessMods[i]==null){
	 ind[idx]=i;
	 idx++;
	 }
	 }
	 } */

	 String menu = (String) request.getAttribute("menu");
		String[] paths = { "/dashboard", "/employees"};
		String[] display = { "Dashboard", "Employees"};
	    String[] icons = {"fa fa-tachometer", "fa fa-users"};
		if (accessMods != null && accessMods.length > 0) {

			for (int i = 0; i < accessMods.length; i++) {
				System.out.println("ACCEESSS " + accessMods[i] + "," + i);
				if (accessMods[i] == null) {
					System.out.println("modules " + modules[i]);
					String[] newPaths = new String[paths.length];
					String[] newDisplay = new String[display.length];
					int idx = 0;
					for (int j = 0; j < paths.length; j++) {
						
						if (paths[j] != null && display[j] != null) {
							System.out.println("ACCEESSS " + paths[j] + ","
									+ modules[i] + "," + j + ","
									+ (paths[j].indexOf(modules[i]) > -1));
							if (!(paths[j].indexOf(modules[i]) > -1)) {

								newPaths[idx] = paths[j];
								newDisplay[idx] = display[j];
								idx++;
							}
						}
						System.out.println("forEd " + idx);
					}
					paths = newPaths;
					display = newDisplay;
					/* System.out.println("ACCEESSS ----- "+accessMods[i]);
					String[] newPaths=new String[paths.length];
					String[] newDisplay=new String[display.length];
					int idx=0;
					for(int j=0;j<paths.length;j++){
						System.out.println("ACCEESSS "+paths[j]+","+modules[i]+","+j);
						if(!(paths[j].indexOf(modules[i])>-1)){
							newPaths[idx]=paths[i];
							newDisplay[idx]=paths[i];
							idx++;
						}
						System.out.println("forEd");
					}
					paths = newPaths;
					display=newDisplay; */
				}
			}
		}

	/* String dash = null, emp = null, users = null, pat = null, dev = null, doc = null, patRec = null, sms = null, smsTrigger = null, emgRec = null;
	System.out.println("Menu " + menu);
	if (menu.equals(Common.dashboard)) {
		dash = "active";
	} else if (menu.equals(Common.employees)) {
		emp = "active";
	} else if (menu.equals(Common.users)) {
		users = "active";
	} else if (menu.equals(Common.patients)) {
		pat = "active";
	} else if (menu.equals(Common.doctors)) {
		doc = "active";
	} else if (menu.equals(Common.patientsRecord)) {
		patRec = "active";
	} else if (menu.equals(Common.sms)) {
		sms = "active";
	} else if (menu.equals(Common.smsTrigger)) {
		smsTrigger = "active";
	} else if (menu.equals(Common.emgRecord)) {
		emgRec = "active";
	}
	System.out.println("emgRec=" + Common.emgRecord); */
%>
<aside class="main-sidebar box-shadow">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

		<!-- Sidebar user panel (optional) -->
		<%--  <div class="user-panel">
            <div class="pull-left image">
              <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>Alexander Pierce</p>
              <!-- Status -->
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div> --%>

		<!-- search form (Optional) -->
		<!--   <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search..." />
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form> -->
		<!-- /.search form -->

		<!-- Sidebar Menu -->
		<ul class="sidebar-menu side-adm">
			<li class="header"><h4 class="text-center">
					<b><%=roleValue%></b>
				</h4></li>
			<!-- Optionally, you can add icons to the links -->
			<%
				for (int i = 0; i < paths.length; i++) {
					System.out.println("menu=" + menu);
					System.out.println("Dis " + display[i]);
					if (display[i] != null && paths[i] != null) {
						String active = "";
						if (menu.equals(paths[i].replace("/", ""))) {
							System.out.println("AAAAAAActive->"+menu);
							active = "active";
						}
						System.out.println("Activeeee->"+menu);
			%>
			<li id="<%=paths[i].replace("/", "")%>" class=<%=active%>><a
				href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}<%=paths[i]%>');">
				<i class="<%=icons[i]%>"></i>&nbsp;&nbsp;&nbsp;<span><%=display[i]%></span> </a></li>

			<%
				}
				}
			%>
			<%--              <li id="<%=Common.dashboard%>" class=<%=dash%>><a href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}/dashboard');"><i class="fa fa-pie-chart"></i> <span>Dashboard</span></a></li>
            <li id="<%=Common.employees%>" class=<%=emp%>><a href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}/employees');"><i class="fa  fa-h-square"></i> <span>Employees</span></a></li>
            <li id="<%=Common.users%>" class=<%=users%>><a href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}/users');"><i class="fa  fa-users"></i> <span>Users</span></a></li>
            <li id="<%=Common.patients%>" class=<%=pat%>><a href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}/patients');"><i class="fa fa-wheelchair"></i> <span>Patients</span></a></li> 
            <li id="<%=Common.doctors%>" class=<%=doc%>><a href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}/doctor');"><i class="fa fa-user-md"></i> <span>Doctors</span></a></li>
           <li id="<%=Common.patientsRecord%>" class=<%=patRec%>><a href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}/patRecords');"><i class="fa fa-user-md"></i> <span>Recordings</span></a></li>
           <li id="<%=Common.emgRecord%>" class=<%=emgRec%>><a href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}/emergencyRecords');"><i class="fa fa-user-md"></i> <span>Emergency Recordings</span></a></li>
           <li id="<%=Common.sms%>" class=<%=sms%>><a href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}/sms');"><i class="fa fa-user-md"></i> <span>SMS Gateway</span></a></li>
           <li id="<%=Common.smsTrigger%>" class=<%=smsTrigger%>><a href="javascript:getAjaxMenuHtml('content-wrapper','${pageContext.request.contextPath}/smsTrigger');"><i class="fa fa-user-md"></i> <span>SMS Trigger</span></a></li> --%>
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>