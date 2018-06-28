<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%    String msg=(String) request.getAttribute("msg");
    System.out.println("msg="+msg);
    String logUrl=request.getContextPath()+"/Registration/signup";
    String checkUrl=request.getContextPath()+"/registrationprocess";
    String lndexurl=request.getContextPath()+"/Weblogin/login";
    //String msgType=(String) request.getAttribute("type");
    

%>
<div class="col-md-12">
  <p style="float:right;margin-bottom:0px"><a href="javascript:ajaxCalling('navex.html')"><u>back to edit</u></a></p>
       <div class="col-md-12 content">
	    <p class="headline"><b>Registration</b></p>
	 <br>
	  <div class="cal-md-12">
	  <form id="myForm" role="form">
	   <div class="row">
         <div class="col-md-4"style="float:left"><label>Name</label></div>
	     <div class="col-md-1"style="float:left"><label>:</label></div>
	     <div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                      <input id="name" type="text" class="form-control" name="name"  placeholder="Enter your name"onblur="onFunction2(name)"autofocus>                                        
                  </div>   
	     </div>
       </div>
	   <div id="field6"style="height:25px;color:red;margin-left:200px;"></div>
	<div class="row">
    <div class="col-md-4"style="float:left"><label>Position</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                      <input id="position" type="text" class="form-control" name="position" placeholder="Enter your position"onblur="onFunction2(name)">                                        
                  </div>   
	</div>
   </div>
   <div id="field7"style="height:25px;color:red;margin-left:200px;"></div>
    <div class="row">
    <div class="col-md-4"style="float:left"><label>Date Of Joining</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                      <input id="date" type="date" class="form-control" name="date" placeholder="Date of joining"onblur="onFunction2(name)">                                        
                  </div>   
	</div>
   </div>
   <div id="field8"style="height:25px;color:red;margin-left:200px;"></div>
  <div class="row">
    <div class="col-md-4"style="float:left"><label>Mail Id</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><strong>@</strong></span>
                      <input id="mail" type="email" class="form-control" name="mail" placeholder="Enter your email"onblur="onFunction2(name)">                                        
                  </div>   
	</div>
   </div>
 <div id="field9"style="height:25px;color:red;margin-left:200px;"></div>
  <div class="row">
    <div class="col-md-4"style="float:left"><label>Intra User Id</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                      <input id="demo" type="email" class="form-control" name="namer" placeholder="username or email"onblur="onFunction2(name)">                                        
                  </div>   
	</div>
   </div>
  <div id="field10"style="height:25px;color:red;margin-left:200px;"></div>
 <div class="row">
    <div class="col-md-4"style="float:left"><label>Create Password</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                      <input id="intrapassword" type="password" class="form-control" name="password" placeholder="password"onblur="onFunction2(name)">                                        
                  </div>   
	</div>
   </div>
 <div id="field11"style="height:25px;color:red;margin-left:200px;"></div>
  <div class="row">
    <div class="col-md-4"style="float:left"><label>Confirm Password</label></div>
	<div class="col-md-1"style="float:left"><label>:</label></div>
	<div class="col-md-7"style="float:left">
	              <div class="input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                      <input id="confirmpass" type="password" class="form-control" name="confirmpass" placeholder="confirm password"onblur="onFunction2(name)">                                        
                  </div>   
	</div>
   </div>
   <div id="field12"style="height:25px;color:red;margin-left:200px;"></div>
  <div class="row">
  
          <div class="form-group"style="margin-left:100px;float:left">
              <button type="button"id="field123" class="btn btn-primary"onclick="onRegisterFunc()"> Register</button>
		 </div>
  
          <div class="form-group"style="margin-left:100px;float:left">
               <button type="submit" class="btn btn-primary"> Cancel </button>
		 </div>
	
   </div>
   <div class="col-md-6"id="print"style="height:200px;"></div>
	</form>
	</div>
	</div>
	</div>
	<script>
	var elementError = false;
 function onFunction2(name){

  //user name initiated//
        if(name == "name"){
		 var user = document.getElementById("name");
		      if(user.value == ""){
	              document.getElementById("field6").innerHTML = " * Please enter your name";
	         elementError = true;
	          }else if (!/^[a-zA-Z]*$/g.test(user.value)){
			  elementError = true;
	              document.getElementById("field6").innerHTML = " * Numbers not allowed";
	          }else{
	             document.getElementById("field6").innerHTML = "";
	        }
        }
//Position initiated//		
		if(name == "position"){
		 var user = document.getElementById("position");
		      if(user.value == ""){
	              document.getElementById("field7").innerHTML = " * Please enter your position";
				  elementError = true;
	          }else if (!/^[a-zA-Z]*$/g.test(user.value)){
			  elementError = true;
	              document.getElementById("field7").innerHTML = " * Numbers not allowed";
	          }else{
	             document.getElementById("field7").innerHTML = "";
	        }
        }
//D.O.Joining initiated//		
		if(name == "date"){
		 var user = document.getElementById("date");
		      if(user.value == ""){
	              document.getElementById("field8").innerHTML = " * Please enter your joining date";
				  elementError = true;
	          }else{
	             document.getElementById("field8").innerHTML = "";
	        }
        }
//mail id initiated//	
		if(name == "mail"){
		var user = document.getElementById("mail");
		     if(user.value == ""){
			 elementError = true;
	              document.getElementById("field9").innerHTML = " * Please enter your mail Id";
	         }
			 else if(!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(user.value)) {
			 elementError = true;
	               document.getElementById("field9").innerHTML = " * Please enter valid mail Id";
	         }else{
	               document.getElementById("field9").innerHTML ="";
	        }
		}
//Intra Id initiated//		
		if(name == "namer"){
		var user = document.getElementById("demo");
		     if(user.value == ""){
			 elementError = true;
	              document.getElementById("field10").innerHTML = " * Please enter your Intra username";
	         }else{
	               document.getElementById("field10").innerHTML ="";
	        }
		}
//Password initiated//			  
	     if(name == "password"){
		      var user = document.getElementById("intrapassword");
		    if(user.value == ""){
			 elementError = true;
	              document.getElementById("field11").innerHTML = " * Please enter your password";
	        }else{
		         document.getElementById("field11").innerHTML ="";
			  }
		 }
//confirm password initiated//		
         if(name == "confirmpass"){
		  var user = document.getElementById("confirmpass");
		    if(user.value == ""){
			 elementError = true;
	              document.getElementById("field12").innerHTML = " * Please enter your password";
	        }else{
		         document.getElementById("field12").innerHTML ="";
			  }
			  }
		return elementError;
}
var text = "";
function onRegisterFunc() {
   console.log("onRegisterFunc inside");
	    var x = document.forms["myForm"];
		var error = false; 
		elementError = false;
        text="";
	    var i = 0; 
		 for (i = 0; i < x.length ;i++) {
			error = onFunction2(x.elements[i].name);
			console.log("Name ="+x.elements[i].name+" i = "+i);
		 }
if(!error){
	 for (i = 0; i < x.length ;i++) { 
			 text += x.elements[i].value + "<br>"; 
			 }
			 
	 } 
        document.getElementById("print").innerHTML = text; 
	}

</script>