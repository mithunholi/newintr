<%--  <script src="${pageContext.request.contextPath}/resources/js/calendar.js"></script> --%>
 
 
<div class="full"> 
 <div class="row"> 
    <div class="col-md-12 ful">
      <div class="col-md-3 lcontent"> 
        <div class="row calpad">
	       <div id="cal"> 
      <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> May 2017 </span> 
       <span class="right hook"></span> 
       <span class="right button" id="next"> &rang; </span>
 </div> 
    <table id="days"> 
        <td>sun</td> 
        <td>mon</td> 
        <td>tue</td> 
        <td>wed</td> 
        <td>thu</td> 
        <td>fri</td> 
        <td>sat</td>
 
    </table> 
    <div id="cal-frame"> 
         <table class="curr"> 
    <tbody> 
        <tr><td class="nil"></td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr>
		<tr><td class="sun">7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td></tr>
		<tr><td class="sun">14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td></tr>
		<tr><td class="sun">21</td><td>22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td></tr>
		<tr><td class="sun">28</td><td>29</td><td>30</td><td>31</td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr> 
    </tbody> 
</table>
 
    </div> 
</div>
    </div>
<!-- <p style="margin-top:80px;font-size:20px"><b><u>Note:</u></b></p>
<p style="text-indent:45px"><b>for furdher detail's or want to visit Our website just click the link below,</b>
   <br> -->
   <p style="position: fixed; bottom: 50px"><b>Visit us at:</b>
   <br>
   <a href="http://www.eoxys.com"><b>https://www.eoxys.com</b></a>
</p> 	
</div> 
 <div class="col-md-6 mcontent"> 
     <marquee direction="right" style="font-size:20px;"> <b>Welcome To Eoxys Intranet</b></marquee>
	 <br>
	 <div class="col-md-12" style="width:100%">
	 <img align="middle" src="${pageContext.request.contextPath}/resources/images/mmmm1.png" style="height: 348px !important;"></img>
	 </div>
	 <br>
	 <br>
	 <div class="col-md-5">Eoxys Systems India Pvt. Ltd.<br>
        # 1564, 25th Main, 5th B Cross,<br>
		BTM Layout, 2nd Stage,<br>
		Bangalore-560 076.<br>
		Email: info@eoxys.com<br>
	    Phone: +91-8088554088, +91-80-41200425,
	</div>
 </div> 
 <div class="col-md-3 rcontent"> 
 <div class="row r1">
   <div id="rbox2"class="col-md-11"><b class="r2"><u>Upcoming Events</u></b>
    <marquee style="font-size:16px;color:rgba(33, 150, 243, 0.71)"><b> Lattest Updates!!! </b></marquee>
   </div> 
   </div> 
    </div> 
 </div> 
 </div>  
  </div>
 <!-- <div class="col-md-12 foot"data-position="fixed">
           Copyright © 2017 Eoxys Systems India Pvt Ltd.
   </div> -->  
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
 <!-- <script src="calendar.js"></script> -->
 <script>
 
 var cal = CALENDAR();
 
 cal.init();
   function ajaxCaller(url){
   
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
	 var parentHeight = $(".full").parent().height();
	  $(".mcontent").height(parentHeight);
	   $(".lcontent").height(parentHeight);
	    $(".rcontent").height(parentHeight);
	   
//to active default page without clicking link
<!-- ajaxCaller('url'); -->
<!-- $('#full').append('<div class="full"></div>'); -->


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