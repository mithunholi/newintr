<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="calendar.css" />
  <style>
  .content{
  background-color:#e6e6e6;
  height:500px;
  border-radius:10px;
  padding-left:30px;
  margin-top:10px;
  border:2px solid #0099cc;
  }
  .headline{
  font-size:30px;
  margin-top:20px;
  text-align:center;
  }
  .line{
  border:1px solid #0099cc;
  }
  #policym{
  height:350px;
  margin-right:1px;
  }
  </style>
  </head>
<body>
  
   <div class="col-md-12"style="background-color:#ffffff;height:555px">
   <div class="row">
    <div class="col-md-2"></div>
	<div class="col-md-8 content">
	<div class="row">
	<div class="col-md-12 headline"><b>Policy</b></div>
	</div>
	 <div class="btn-group">
	<a href="javascript:ajaxCallerp('medical.html');"><button type="button" class="btn btn-danger">Medical</button></a>
    <a href="javascript:ajaxCallerp('leave.html');"><button type="button" class="btn btn-danger">Leave</button></a>
    <a href="javascript:ajaxCallerp('workhour.html');"><button type="button" class="btn btn-danger">Workhour</button></a>
  </div>
	<div class="col-md-12 line"></div>
	<br>
	<div class="row">
	 <div class="col-md-12" id="policym">


<marquee direction="down" width="800" height="350" behavior="alternate" style="border:black">
  <marquee behavior="alternate"style="font-size:20px;color:#9900ff">
    Work In progress
  </marquee>
</marquee>
</div>
	 </div>
	  </div>
	   <div class="col-md-2"></div>
	</div>
 </div>
  <script>
  function ajaxCallerp(url){
   
  $.ajax({
     url:url, 
     type:"GET",
   
     success: function (response) {
      console.log('hai');
   $('#policym').html(response);
    
   
     },
     error: function(xhr, ajaxOptions, thrownError){
    
     },
     timeout : 15000
   });
  
  }
$(document).ready(function() {
 
});
</script>
</body>
</html>