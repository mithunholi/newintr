<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<p style="float:right;margin-bottom:0px"><a href="login.html"><u>back to login page</u></a></p>
	<div class="col-md-12 conte">
		   <div class="row">
		     <div class="col-md-3"></div>
			 <div class="col-md-6"style="margin-top:50px">
			  <p><b>Enter Your Mail Id</b></p>
		       <form id="loginform" class="form-horizontal" role="form">                                   
                  <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                      <input id="login-username" type="email" class="form-control" name="mail" placeholder="username or email"onblur="onFunction1(name)">                                                            
				  </div>    
				 <p id="field3"style="height:25px;color:red"></p>
                  <div class="input-group"style="display:none">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                      <input id="login-password" type="password" class="form-control" name="password" placeholder="password"onblur="onFunction1(name)">                    
				 </div>
				 <p id="field4"style="height:25px;color:red;display:none"></p>
				   <div class="input-group"style="display:none">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                      <input id="login-password1" type="password" class="form-control" name="password1" placeholder="password"onblur="onFunction1(name)">                   
				  </div>
				  <div id="field5"style="height:25px;color:red;display:none"></div> 
				  <div class="form-group">
                     <button type="submit" class="btn btn-primary">
                        Submit
                     </button>
			      </div>
			   </form>
     	     </div>	   
             <div class="col-md-3"></div>			 
           </div>
    </div>	
<script>
function onFunction1(name){
  if(name == "mail"){
		 var user = document.getElementById("login-username");
		      if(user.value == ""){
	              document.getElementById("field3").innerHTML = " * Please enter your name";
				  elementError = true;
	          }else if (!/^[a-zA-Z]*$/g.test(user.value)){
			  elementError = true;
	              document.getElementById("field3").innerHTML = " * Numbers not allowed";
	          }else{
	             document.getElementById("field3").innerHTML = "";
	        }
        }
            if(name == "password"){
		var user = document.getElementById("login-password");
		    if(user.value == ""){
			elementError = true;
	              document.getElementById("field4").innerHTML = " * Please enter your password";
	        }else if(! /^[A-Za-z]\w{7,14}$/.test(pass.value)) {
			elementError = true;
	              document.getElementById("field4").innerHTML = " * Please use valid password";
		    }else{
		         document.getElementById("field4").innerHTML ="";
			  }
			  }
			   if(name == "password1"){
		var user = document.getElementById("login-password1");
		    if(user.value == ""){
			elementError = true;
	              document.getElementById("field5").innerHTML = " * Please enter your password";
	        }else if(! /^[A-Za-z]\w{7,14}$/.test(pass.value)) {
			elementError = true;
	              document.getElementById("field5").innerHTML = " * Please use valid password";
		    }else{
		         document.getElementById("field5").innerHTML ="";
			  }
			  }

   }
</script>