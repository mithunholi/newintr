<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%    String msg=(String) request.getAttribute("msg");
System.out.println("msg="+msg);
    String signurl=request.getContextPath()+"/post";
    
    //String msgType=(String) request.getAttribute("type");
    

%>
    
 
 <div class="col-md-2">  </div> 
<div class="col-md-6">
   
	  <h3 style="text-align:center">REGISTRATION</h3>
	  <form id="myForm1" role="form">
	  <div class="col-sm-12" style="border:1px solid black;box-shadow:1px 1px 1px 1px;">
	   <div class="row" style="margin-top: 29px;">
         <div class="col-md-4"style="float:left"><label>First Name *</label></div>
	     <div class="col-md-1"style="float:left"><label>:</label></div>
	     <div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-user"></i></span>
                      <input id="firstname" type="text" class="form-control" name="firstname"  placeholder="Enter your firstname">                                        
                  </div>  
                  <span id="error_msg"></span> 
	     </div>
       </div><br>
       <div class="row">
         <div class="col-md-4"style="float:left"><label>Last Name *</label></div>
	     <div class="col-md-1"style="float:left"><label>:</label></div>
	     <div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-user"></i></span>
                      <input id="lastname" type="text" class="form-control" name="lastname"  placeholder="Enter your lastname">                                        
                  </div>
                  <span id="error_msg"></span>    
	     </div>
       </div><br>
        <div class="row">
         <div class="col-md-4"style="float:left"><label>Middle Name</label></div>
	     <div class="col-md-1"style="float:left"><label>:</label></div>
	     <div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-user"></i></span>
                      <input id="middlename" type="text" class="form-control" name="middlename"  placeholder="Enter your middlename">                                        
                  </div>   
                  <span id="error_msg"></span> 
	     </div>
       </div><br>
	<div class="row">
    <div class="col-md-4"style="float:left"><label>Date Of Birth</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                      <input id="dob" type="date" class="form-control" name="dob" placeholder="Enter your dob">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div><br>
	<div class="row">
    <div class="col-md-4"style="float:left"><label>Date Of Joining</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                      <input id="doj" type="date" class="form-control" name="doj" placeholder="Enter your Dote Of Joining">                                        
                  </div>
                  <span id="error_msg"></span>    
	</div>
   </div><br>
  
  
 <div class="row">
    <div class="col-md-4"style="float:left"><label>Employee Id</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-"></i></span>
                      <input id="empployee" type="text" class="form-control" name="empployee" placeholder="Enter your empployee Id">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div>
   <br>
<div class="row">
    <div class="col-md-4"style="float:left"><label>Blood Group</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-"></i></span>
                      <input id="bloodgrp" type="text" class="form-control" name=bloodgrp placeholder="Enter your Blood Group">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div><br>

    <div class="row">
    <div class="col-md-4"style="float:left"><label>Email Id</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><strong>@</strong></span>
                      <input id="gmail" type="text" class="form-control" name="gmail" placeholder="Enter your gmail OR yahoo mail id">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div><br>

    <div class="row">
    <div class="col-md-4"style="float:left"><label>Eoxys Mail Id</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><strong>@</strong></span>
                      <input id="eoxysmail" type="text" class="form-control" name="eoxysmail" placeholder="Enter your eoxysmail">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div><br>

    <div class="row">
    <div class="col-md-4"style="float:left"><label>Skype Mail Id</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><strong>@</strong></span>
                      <input id="skypemail" type="text" class="form-control" name="skypemail" placeholder="Enter your skypemail">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div><br>
  
 <!-- <div id="field11"style="height:25px;color:red;margin-left:200px;"></div> -->
  <div class="row">
    <div class="col-md-4"style="float:left"><label>Phone number</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class=" fa fa-mobile"></i></span>
                      <input id="phone" type="number" class="form-control" name="phone" placeholder="Phone number">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div><br>
  <!--  <div id="field12"style="height:25px;color:red;margin-left:200px;"></div> -->
  <div class="row">
    <div class="col-md-4"style="float:left"><label>Landline number</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class=" fa fa-phone"></i></span>
                      <input id="landline" type="number" class="form-control" name="landline" placeholder="Landline number">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div><br>

 <div class="row">
    <div class="col-md-4"style="float:left"><label>Permanent Address</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                      <input id="permanentaddress" type="text" class="form-control" name="permanentaddress" placeholder="Enter your Parmanent Address">                                        
                  </div>   
                  <span id="error_msg"></span>  
	</div>
   </div><br>

  <div class="row">
    <div class="col-md-4"style="float:left"><label>Local Address</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                      <input id="localaddress" type="text" class="form-control" name="localaddress" placeholder="Enter your Local Address">                                        
                  </div> 
                  <span id="error_msg"></span>   
	</div>
   </div><br>
  
  <div class="row">
    <div class="col-md-4"style="float:left"><label>Passport Number</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                      <input id="passport_no" type="number" class="form-control" name="passport_no" placeholder="Enter your Passport Number">                                        
                  </div> 
                  <span id="error_msg"></span>   
	</div>
   </div><br>
   
   <!--  <div id="field16"style="height:25px;color:red;margin-left:200px;"></div> -->
  <div class="row">
    <div class="col-md-4"style="float:left"><label>Pancard Number</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                      <input id="pancard_no" type="number" class="form-control" name=pancard_no placeholder="Enter your Pancard Number">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div><br>
   

  
  <div class="row">
    <div class="col-md-4"style="float:left"><label>Education Qualification</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-table"></i></span>
                      <input id="education" type="text" class="form-control" name="education" placeholder="Enter your Education qualification">                                        
                  </div>   
                  <span id="error_msg"></span> 
	</div>
   </div><br>
 
 
 
  <div class="row" style="margin-bottom:10px;">
  
          <div class="col-sm-offset-3 col-sm-3">
              <button type="submit"id="field123" class="btn btn-primary"> Register</button>
		 </div>
  
          <div class="col-sm-3">
               <button type="button" class="btn btn-primary"> Cancel </button>
		 </div>
	
   </div>
  </div>
	</form>
	<div class="col-sm-12">
			<span id="respDiv"></span></div>
	
	</div>

	
	<script>
	$("#myForm1").validate({
	    
        // Specify the validation rules
        rules: {
		
            firstname: "required",
            lastname: "required",
            doj: "required",
           
            dob: "required",
            parmanentaddress: "required",
            localaddress: "required",
           /*  passport_no: "required",
            pancard_no: "required", */
            bloodgrp: "required",
            empployee: "required",
            education: "required",
            phone: "required",
            /* landline: "required", */
        },
        gmail:{
        	required : true,
			// Setting email pattern for email input
			email : true
        },
        
        eoxysmail:{
        	required : true,
			// Setting email pattern for email input
			email : true
        },
       
        skypemail:{
        	required : true,
			// Setting email pattern for email input
			email : true
        },
      
       
        // Specify the validation error messages
        messages: {
        	firstname: "Please enter your  firstname",
        	lastname:"Please enter your  lastname",
        	doj:"Please enter your  doj",
        	gmail:"Please enter your  gmail",
        	eoxysmail:"Please enter your  eoxysmail",
        	skypemail:"Please enter your  skypemail",
        	dob:"Enter your  dob",
        	parmanentaddress:"Please enter your  parmanentaddress",
        	localaddress:"Please enter your  localaddress",
        	/* passport_no:"Please enter your  passport_no",
        	pancard_no:"Please enter your  pancard_no", */
        	bloodgrp:"Please enter your  bloodgrp",
        	empployee:"Please enter your  empployeeId",
        	education:"Please enter your  education",
        	phone:"Please enter your  phone number",
        	/* landline:"Please enter your  landline number", */
        },
	
  
      errorPlacement:function(error,element){
	 $(element).parent().next('span').html(error);
	 },
	 submitHandler : function(form) {
			console.log("enterrrrrrrrrr");
			
			submitFormAllValues(form,'<%=signurl%>');
		}
		 
	   
    });

  
	
 </script>