<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

   --%>
  <style>
 
  .page{
background-color:white;
 height:100%;
  }
.contentt{
margin-top:2px;
border-radius:10px;
 border:2px solid #0099cc; 
}  
  .headline{
  font-size:30px;
  text-align:center;
   margin-top:20px;
   border-bottom:2px solid #0099cc; 
  }
  
  
  </style>
  </head>
<div class="col-sm-12 ">
  <div class="col-md-12 page">
	
	  <div class="col-md-12 contentt">
	  <div class="col-md-12 headline"><b>Newsletter</b></div>
	  <br>
	  <div class="col-md-12"></div>
	  <br><br>
	   <ul class="pager body" style="margin-top: 38px;">
   <%--  <li><a href="javascript:ajaxCaller('${pageContext.request.contextPath}/news1');">Previous</a></li>
    <li><a href="javascript:ajaxCaller('${pageContext.request.contextPath}/news2');">Next</a></li>
  --%> 
   <li><a href="javascript:ajaxCall('${pageContext.request.contextPath}/news1');">Previous</a></li>
    <li><a href="javascript:ajaxCall('${pageContext.request.contextPath}/news2');">Next</a></li>
 
  </ul>
	  <div class="col-md-12" id="slide"> </div>
	</div>
</div>
<script>
   function ajaxCall(url){
   
  $.ajax({
     url:url, 
     type:"POST",
   
     success: function (response) {
      console.log('hai');
   $('#slide').html(response);
    
   
     },
     error: function(xhr, ajaxOptions, thrownError){
    
     },
     timeout : 15000
   });
  
  }
$(document).ready(function() {
//to active default page without clicking link
ajaxCall('news1');
$('#newdiv').append('<div id="slide"></div>');
/* $('#newdiv').append('<div id="slide"></div>'); */

 /*only one href we can create here
 $('#new').click(function(e){
 $('#link').click();//<a href="first11.html" id="link">it call default home page
  
   $.ajax({
     url:"first11.html", 
     type:"GET",
   
     success: function (response) {
      console.log('hai');
   $('#div1').html(response);
    
   
     },
     error: function(xhr, ajaxOptions, thrownError){
    
     },
     timeout : 15000
   });

 }); */
 
});
</script>
</div>