 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%    String msg=(String) request.getAttribute("msg");
System.out.println("msg="+msg);
    String addUserUrl=request.getContextPath()+"/users/adduser";
   
    //String msgType=(String) request.getAttribute("type");
    

%>
  <%-- <!-- Bootstrap Core CSS -->
    <link rel="StyleSheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" type="text/css">
    <style type="text/css"></style>
      <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <!--<script type="text/javascript"><%//@include file="../../js/jquery.js"%></script>-->
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <!--<script type="text/javascript"><%//@include file="../../js/bootstrap.min.js"%></script>-->
   <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
   
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
   --%>
<div class="col-md-12">
  <div class="row">
    <div class="col-md-3"></div>
	 <div class="col-md-6 content">
	    
	    <div id="forg"class="col-md-12 bor">	      
		   <div class="col-md-12 headline">
		     
			   <b><span style="font-size:30px">ADDNEWUSER</span></b>
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
                 
               
		 <div id="field3"style="height:25px;color:red"></div>		
		<div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                       <select name="type" class="form-control placeholder">
					<option value=" " disabled selected style="display: none;">Select
						Designation </option>
						<option value="ADM">ADMIN </option>	
                         <option value="CEO">CEO </option>
                         <option value="HR">HR </option>	
                         <option value="USR">USER </option>
                         <option value="MGMT">MANAGEMENT </option>	
                        
						</select>
						</div>
			

				  <div id="field2"style="height:25px;color:red"></div>
								 				  
				  <div class="form-group"style="margin-left:100px;">
                  <button type="submit" class="btn btn-lg btn-primary">ADDUSER<i class="fa fa-sign-in"></i></button>
					</div>
							     
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
 /* function ajaxCalling(url){
   
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
  
  } */
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
					},
					confirmpassword : {
						equalTo: "#password",
					
				}, type: {
	            	required: true   
	            }
				
				},
				// Setting error messages for the fields
				messages : {
					password : {
						required : "Enter your password"
					},
					username : {
						required : "Enter your email"
					},
					/* confirmpassword : {
						required : "Enter your confirmpassword"
					},
					type : {
						required : "Enter your type"
					} */
				},
				// Setting submit handler for the form
				submitHandler : function(form) {
					console.log("enterrrrrrrrrr");
					/* if($("#remember").prop('checked')){
						$("#remember").val("1");
					}else{
						$("#remember").val("0");
					} */
					submitFormAllValues(form,'<%=addUserUrl%>');
				}
			});
		}); 
 
 </script>