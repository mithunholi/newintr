



  <style>
  .ev1{
 background-color:#ffffff;
 height: 600px;
 
  }
  .ev2{
  height:100%;
  margin-top:10px;
  margin-bottom:10px;
  border-radius:10px;
  background-color:#e6e6e6;
  border:2px solid #0099cc;
  }
   .ev3{
  font-size:30px;
  text-align:center;
  }
  .ev4{
  border:1px solid #0099cc;
  }
  .ev5{
  font-size:23px;
  }
  .ev6{
  font-size:18px;
  }
  .ev7{
  height:300px;
  float:left;
  }
   .ev8{
   height:300px;
   float:left;
  }
  </style>
  </head>
<div class="col-sm-12">
  <div class="col-md-12 ev1">
  <div class="row">
  <div class="col-md-2"></div>
   <div class="col-md-8 ev2">
	<div class="row">
	<div class="col-md-12 ev3"><b>Monthly Events List</b></div>
	</div>
	<div class="col-md-12 ev4"></div>
	<br>
	<div id="month">
	<div class="row">
	<div class="col-md-2 ev6"></div>
	<div class="col-md-10"></div>	
	</div>
	<div class="col-md-2 ev7"></div>
	<div class="col-md-10 ev8"></div>
	</div>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<ul class="pagination">
    <li><a href="javascript:ajaxCall('month1.jsp');">1</a></li>
    <li><a href="javascript:ajaxCall('month2.html');">2</a></li>
    <li><a href="javascript:ajaxCall('month3.html');">3</a></li>
    <li><a href="javascript:ajaxCall('month4.html');">4</a></li>
    <li><a href="javascript:ajaxCall('month5.html');">5</a></li>
	<li><a href="javascript:ajaxCall('month6.html');">6</a></li>
    <li><a href="javascript:ajaxCall('month7.html');">7</a></li>
    <li><a href="javascript:ajaxCall('month8.html');">8</a></li>
    <li><a href="javascript:ajaxCall('month9.html');">9</a></li>
    <li><a href="javascript:ajaxCall('month10.html');">10</a></li>
	<li><a href="javascript:ajaxCall('month11.html');">11</a></li>
    <li><a href="javascript:ajaxCall('month12.html');">12</a></li>
  </ul>
  </div>
  <div class="col-2"></div>
  </div>
  </div>
   <div class="col-md-2"></div>
  </div>
  </div>
  <script>
   function ajaxCall(url){
   
  $.ajax({
     url:url, 
     type:"POST",
   
     success: function (response) {
      console.log('hai');
   $('#content-wrapper').html(response);
    
   
     },
     error: function(xhr, ajaxOptions, thrownError){
    
     },
     timeout : 15000
   });
  
  }
$(document).ready(function() {
//to active default page without clicking link
ajaxCall('month6.html');
$('#newdiv').append('<div id="month"></div>');

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
