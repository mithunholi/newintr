<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%    String msg=(String) request.getAttribute("msg");
System.out.println("msg="+msg);
    String logUrl=request.getContextPath()+"/Weblogin/login";
    String checkUrl=request.getContextPath()+"/checklogin";
    String lndexurl=request.getContextPath()+"/Weblogin/index";
    //String msgType=(String) request.getAttribute("type");
    

%>

  <body>
<div class="col-md-12">
  <div class="row">
    <div class="col-md-3"></div>
	 <div class="col-md-6 content">
	    <div class="col-md-12">
		     <div class="row">
		       <div class="col-md-12 imgdiv" >
			     <a href="login.jsp"><img src="${pageContext.request.contextPath}/resources/images/eoxys_logo11.png"></img></a>
               </div>           	  
             </div>			   
		   </div>
	    <div id="forg"class="col-md-12 bor">	      
		   <div class="col-md-12 headline">
		     <p> 
			   <b><span style="font-size:18px">Sign in With Your</span></b>
			   <br>
			   <b><span style="font-size:30px">Eoxys Account</span></b>
		    </p>
		   </div>
		   <div class="row">
		     <div class="col-md-3"></div>
			 <div class="col-md-6">
		       <form id="myForm" class="form-horizontal" role="form">                                   
                  <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                      <input id="username" type="text" class="form-control" name="username" placeholder="Enter username" autofocus/>                                        
                  </div>
                  <div id="field1"style="height:25px;color:red"></div>				  
                  <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                      <input id="password" type="password" class="form-control" name="password" placeholder="password" >
                  </div>
                 
				  <div id="field2"style="height:25px;color:red"></div>
				  <div class="form-group"style="margin-left:2px;"> <input type="checkbox"name="stay"> Remember Me </div>				 				  
				  <div class="form-group"style="margin-left:100px;">
                  <button type="submit" class="btn btn-lg btn-primary btn-block">Login<i class="fa fa-sign-in"></i></button>
					</div>
					<div style="text-align:center"><a href="javascript:ajaxCalling('${pageContext.request.contextPath}/resources/register/forget.html')"><u>forget your password</u>?</a></div>		     
			   </form>
             </div>				   
             <div class="col-md-3"></div>			 
           </div>                       				
			 <div class="col-md-3">
			</div>
			<div class="col-sm-12">
			<span id="respDiv"></span></div>
			   </div>
			    
			 </div>		  		
	  <div class="col-md-3"></div>
	</div>
 </div>
 
  <script>
 function ajaxCalling(url){
   
  $.ajax({
     url:url, 
     type:"GET",
   
     success: function (response) {
      console.log('hai');
   $('#forg').html(response);
    
   
     },
     error: function(xhr, ajaxOptions, thrownError){
    
     },
     timeout : 15000
   });
  
  }
/* $(document).ready(function() {
//to active default page without clicking link
}); */
  <%--  $('#submit').click(function(){
	 alert("clicked");
	 submitFormAllValues(form,'<%=lndexurl%>');
	 });  --%>
 $().ready(function() {
			// Selecting the form and defining validation method
			$("#myForm").validate({
				// Passing the object with custom rules
				rules : {
					// login - is the name of an input in the form
					username : {
						required : true,
						// Setting email pattern for email input
						email : true
					},
					password : {
						required : true,
					// Setting minimum and maximum lengths of a password
					}
				},
				
				// Setting error messages for the fields
				messages : {
					password : {
						required : "Enter your password"
					},
					username : {
						required : "Enter your email"
					}
				},
				// Setting submit handler for the form
				submitHandler : function(form) {
					console.log("enterrrrrrrrrr");
					/* if($("#remember").prop('checked')){
						$("#remember").val("1");
					}else{
						$("#remember").val("0");
					} */
					submitFormAllValues(form,'<%=lndexurl%>');
				}
			});
		}); 
 
 </script>
 </body>