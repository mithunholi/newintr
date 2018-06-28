 <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
 
 <div id="header" style="bacground-color:rgb(14,180,147);"> 

 <nav class="whiteBg"> 
   <div class="container-fluid">
    <div class="navbar-header">
     <%--  <a class="navbar-brand" href="index.jsp"><img class="image" src="${pageContext.request.contextPath}/resources/images/eoxys_logo11.png"></img></a> --%>
    <a class="navbar-brand" href="../Controller/check"><img class="image" src="${pageContext.request.contextPath}/resources/images/eoxys_logo11.png" style="    margin-top: -4px !important;"></img></a> 
    </div>
    <div class="keys">
     <a class="but1" href="javascript:$('.but1 > button').toggleClass('active');ajaxCaller('${pageContext.request.contextPath}/applyleave')"><button type="button" id="buton" class="btn btn-black">Apply Leave</button></a></li>
     <a href="javascript:ajaxCaller('${pageContext.request.contextPath}/policy');"><button type="button" class="btn btn-black ">Policy</button></a></li>
     <a href="javascript:ajaxCaller('${pageContext.request.contextPath}/fullcalendar');"><button type="button" class="btn btn-black ">Holiday Info</button></a></li>
     <a href="javascript:ajaxCaller('${pageContext.request.contextPath}/newsletter');"><button type="button" class="btn btn-black ">Newsletter</button></a> </li>
	 <a href="javascript:ajaxCaller('${pageContext.request.contextPath}/monthlyevent');"><button type="button" class="btn btn-black ">Monthly Events</button></a> </li>
	
	</div>
	
 	
	<ul class="nav navbar-nav navbar-right">
	 <a href="javascript:ajaxCaller('${pageContext.request.contextPath}/adduser');"><button type="button" class="btn btn-primary" style="margin-top: 25px;">ADDNEWUSER<i class="fa fa-sign-in"></i></button></a> </li>
      <li><a href="javascript:ajaxCaller('${pageContext.request.contextPath}/signupnew');"><span class="fa fa-user" style="margin-top: 19px;"></span> Sign Up</a></li>
    </ul>
	
  </div> 
 </nav>
 </div>