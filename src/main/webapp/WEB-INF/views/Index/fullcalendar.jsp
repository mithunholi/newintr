
<!-- <!DOCTYPE html>
<html>

<head>
 <title>Yearly Calendar</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<style> -->
<style>
#cal {  
    font: 13px/1.5 "Helvetica Neue", Helvatica, Arial, san-serif; 
    display:table; 
}
 #cal .header { 
cursor:default; 
    background: #CC3300; 
    height: 34px; 
    position: relative; 
    color:#fff; 
    -webkit-border-top-left-radius: 5px; 
    -webkit-border-top-right-radius: 5px; 
    -moz-border-radius-topleft: 5px; 
    -moz-border-radius-topright: 5px; 
    border-top-left-radius: 5px; 
    border-top-right-radius: 5px; 
    font-weight:bold; 
    text-shadow:0px -1px 0 #87260C; 
    text-transform: uppercase; 
} 
#cal .header span { 
    display:inline-block; 
    line-height:34px; 
}
#cal .header .hook { 
    width: 9px; 
    height: 28px; 
    position: absolute; 
    bottom:60%; 
    border-radius:10px; 
    background:#ececec; 
    box-shadow:0px -1px 2px rgba(0, 0, 0, 0.65 );  
} 
.right.hook { 
    right:15%; 
} 
.left.hook { 
    left: 15%; 
}
#cal .header .button { 
    width:24px; 
    text-align:center; 
    position:absolute; 
} 
#cal .header .left.button { 
    left:0;  
    border-top-left-radius: 5px; 
    border-right:1px solid #ae2a0c; 
} 
#cal .header .right.button { 
    right:0; 
    top:0; 
    border-left:1px solid #ae2a0c; 
    border-top-right-radius: 5px; 
}  
#cal .header .month-year { 
    letter-spacing: 1px; 
    width: 100%; 
    text-align: center; 
}
#cal table { 
    background:#fff; 
    border-collapse:collapse; 
} 
#cal td { 
    color:#2b2b2b; 
    width:30px; 
    height:30px; 
    line-height:30px; 
    text-align:center; 
    border:1px solid #e6e6e6; 
    cursor:default; 
} 
#cal #days td { 
    height:26px; 
    line-height: 26px; 
    font-size:90%; 
    color:#9e9e9e; 
} 
#cal #days td:not(:last-child) { 
    border-right:1px solid #fff; 
}
#cal #cal-frame td:not(.nil):hover { 
    text-shadow: #6C1A07 0px -1px; 
    background:#d0e1e1;  
}
#cal #cal-frame td span { 
    font-size:80%; 
    position:relative; 
} 
#cal #cal-frame td span:first-child { 
    bottom:5px; 
} 
#cal #cal-frame td span:last-child { 
    top:5px; 
}
#cal #cal-frame table.curr { 
    float:left;      
} 
#cal #cal-frame table.temp { 
    position:absolute; 
}
.leave{
  background-color:#ff0000;
   }
.leave1 { 
  background-color:#339966;
 }
.sund {
background-color:gray;
 } 
.cal1{
background-color:#e6e6e6;
 padding:20px;
 }
 .cal2{
 margin-top:20px;
 }
 .top{
 text-align:center;
 border:1px solid black;
 font-size:20px;
 padding-top:5px;
 }
 .aus{
 background-color:blue;
 color:white;
 cursor:pointer;
 }
 .aus :hover{
 background-color:red;
 }
 
</style>
</head> 
<body>
<div class="col-md-12 cal1">
<div class="row">
<div class="col-md-8">
<div class="row cal2">
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> Jan 2017 </span> 
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
        <tr><td class="aus"style="color:white"title="New years day">1</td><td class="aus"style="color:white"title="New year's Holiday">2</td><td>3</td><td>4</td><td>5</td> <td>6</td><td>7</td></tr>
		<tr><td class="sund">8</td><td>9</td><td>10</td><td>11</td><td>12</td> <td>13</td><td class="leave">14</td></tr>
		<tr><td class="sund">15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td><td>21</td></tr>
		<tr><td class="sund">22</td><td>23</td><td>24</td><td>25</td><td class="leave"title="Australia day">26</td><td>27</td><td>28</td></tr>
		<tr><td class="sund">29</td><td>30</td><td>31</td><td class="nil"></td><td class="nil"><td class="nil"></td><td class="nil"></td></tr>
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>		
		
    </tbody> 
</table>
 
</div> 
</div>
</div> 
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> Feb 2017 </span> 
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
        <tr><td class="nil"></td><td class="nil"><td class="nil"></td><td>1</td><td>2</td><td>3</td><td>4</td></tr>
		<tr><td class="sund">5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td></tr>
		<tr><td class="sund">12</td> <td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td></tr>
		<tr><td class="sund">19</td><td>20</td><td>21</td><td>22</td><td>23</td><td class="leave1">24</td><td>25</td></tr>
		<tr><td class="sund">26</td><td>27</td><td>28</td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>		
		
    </tbody> 
</table>
 
</div> 
</div>
</div>
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> March 2017 </span> 
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
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td>1</td><td>2</td><td>3</td><td>4</td></tr>
		<tr><td class="sund">5</td> <td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td></tr>
		<tr><td class="sund">12</td><td class="aus"style="color:white"title="Labour day">13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td></tr>
		<tr><td class="sund">19</td><td>20</td><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td></tr>
		<tr><td class="sund">26</td><td>27</td><td>28</td><td class="leave1">29</td><td>30</td><td>31</td></td><td class="nil"></td></tr>
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>		
		
    </tbody> 
</table>
 
</div> 
</div>
</div>
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> April 2017 </span> 
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
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td>1</td></tr>
		<tr><td class="sund">2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td></tr>
		<tr><td class="sund">9</td><td>10</td><td>11</td><td>12</td><td>13</td><td class="leave1"title="Good Friday">14</td><td class="aus"style="color:white"title="Easter Saturday">15</td></tr>
	    <tr><td class="aus"style="color:white"title="Easter sunday">16</td><td class="aus"style="color:white"title="Easter Monday">17</td><td>18</td><td>19</td><td>20</td><td>21</td><td>22</td></tr>
		<tr><td class="sund">23</td><td>24</td><td class="aus"style="color:white"title="Anzac day">25</td><td>26</td><td>27</td><td>28</td><td>29</td></tr>
		<tr><td class="sund">30</td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></tr> 
    </tbody> 
</table>
 
</div> 
</div>
</div>
</div>
<div class="row"style="margin-top:20px">
<div class="col-md-3"> 
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
        <tr><td class="nil"></td><td class="leave1">1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr>
		<tr><td class="sund">7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td></tr>
		<tr><td class="aus"style="color:white"title="Mother's day">14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td></tr>
		<tr><td class="sund">21</td><td>22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td></tr>
		<tr><td class="sund">28</td><td>29</td><td>30</td><td>31</td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>		
		
    </tbody> 
</table>
 
</div> 
</div>
</div> 
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> June 2017 </span> 
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
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td>1</td><td>2</td><td>3</td></tr>
		<tr><td class="sund">4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr>
		<tr><td class="sund">11</td><td class="aus"style="color:white"title="Queen's Birthday">12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td></tr>
		<tr><td class="sund">18</td><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td><td>24</td></tr>
		<tr><td class="sund">25</td><td class="leave">26</td><td>27</td><td>28</td><td>29</td><td>30</td><td class="nil"></td></tr>
	    <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>		

    </tbody> 
</table>
</div> 
</div>
</div>
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> July 2017 </span> 
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
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td>1</td></tr>
		<tr><td class="sund">2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td></tr>
		<tr><td class="sund">9</td><td>10</td><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td></tr>
		<tr><td class="sund">16</td><td>17</td><td>18</td><td>19</td><td>20</td><td>21</td><td>22</td></tr>
		<tr><td class="sund">23</td><td>24</td><td>25</td><td>26</td><td>27</td><td>28</td><td>29</td></tr>
		<tr><td class="sund">30</td><td>31</td></tr> 
    </tbody> 
</table>
</div> 
</div>
</div>
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> Augest 2017 </span> 
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
        <tr><td class="nil"></td><td class="nil"></td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td></tr> 
        <tr><td class="sund">6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td></tr> 
        <tr><td class="sund">13</td><td>14</td><td class="leave">15</td><td>16</td><td>17</td><td>18</td><td>19</td></tr> 
        <tr><td class="sund">20</td><td>21</td><td>22</td><td>23</td><td>24</td><td class="leave">25</td><td>26</td></tr> 
        <tr><td class="sund">27</td><td>28</td><td>29</td><td>30</td><td>31</td><td class="nil"></td><td class="nil"></td></tr>
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>		
		
    </tbody> 
</table>
 
</div> 
</div>
</div>
</div>
<div class="row"style="margin-top:20px">
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> September 2017 </span> 
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
        <tr><td class="nil"><td class="nil"></td><td class="nil"></td><td class="nil"><td class="nil"></td><td>1</td><td class="leave1">2</td></tr>
		<tr><td class="aus"style="color:white"title="Father's day">3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td></tr>
		<tr><td class="sund">10</td><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td></tr>
		<tr><td class="sund">17</td><td>18</td><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td></tr>
	    <tr><td class="sund">24</td><td>25</td><td>26</td><td>27</td><td>28</td><td class="aus"style="color:white"title="Grand Final Eve">29</td><td class="leave1">30</td></tr>
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>		
		
    </tbody> 
</table>
 
</div> 
</div>
</div> 
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> October 2017 </span> 
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
        <tr><td>1</td><td class="leave">2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td></tr>
		<tr><td class="sund">8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td><td>14</td></tr>
		<tr><td class="sund">15</td><td>16</td><td>17</td><td>18</td><td>19</td><td class="leave">20</td><td>21</td></tr>
		<tr><td class="sund">22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td><td>28</td></tr>
		<tr><td class="sund">29</td><td>30</td><td>31</td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>		
		
    </tbody> 
</table>
 
</div> 
</div>
</div>
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> November 2017 </span> 
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
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="leave1">1</td><td>2</td><td>3</td><td>4</td></tr>
		<tr><td class="sund">5</td><td>6</td><td class="aus"style="color:white"title="Melbourne cup day">7</td><td>8</td><td>9</td><td>10</td><td>11</td></tr>
		<tr><td class="sund">12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td></tr>
		<tr><td class="sund">19</td><td>20</td><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td></tr>
		<tr><td class="sund">26</td><td>27</td><td>28</td><td>29</td><td>30</td><td class="nil"></td><td class="nil"></td></tr>
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr>		
    </tbody> 
</table>
 
</div> 
</div>
</div>
<div class="col-md-3"> 
 <div id="cal"> 
    <div class="header"> 
       <span class="left button" id="prev"> &lang; </span> 
       <span class="left hook"></span> 
       <span class="month-year" id="label"> December 2017 </span> 
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
        <tr><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td>1</td><td>2</td></tr>
		<tr><td class="sund">3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td></tr>
		<tr><td class="sund">10</td><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td></tr>
		<tr><td class="sund">17</td><td>18</td><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td></tr>
		<tr><td class="sund">24</td><td class="leave"title="Christmas day">25</td><td class="aus"style="color:white"title="Boxing day">26</td><td>27</td><td>28</td><td>29</td><td>30</td></tr>
		<tr><td class="sund">31</td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td><td class="nil"></td></tr> 
    </tbody> 
</table>
 
</div> 
</div>
</div>

</div>
</div>
<div class="col-md-4"style="height:600px;">
<br>
 <p><marquee><span class="glyphicon glyphicon-star"style="color:red"></span><b>Declared Holidays</b></marquee></p>
 <p><marquee direction = "right"><span class="glyphicon glyphicon-star"style="color:green"></span><b>Restricted Holidays</b></marquee></p>
<p><marquee><span class="glyphicon glyphicon-star"style="color:blue"></span><b>Australia Holidays</b></marquee></p>
 <div class="col-md-12 top"><p>Declared Holidays list 2017</p></div>
<div class="col-md-12">
<div class="row">
<div class="col-md-4"><h5>14-01-2017 :</h5></div>
<div class="col-md-8"><h5>Sankranthi / Pongal</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>26-01-2017 :</h5></div>
<div class="col-md-8"><h5>Republic Day//<span class="glyphicon glyphicon-star"style="color:blue"> </h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>26-06-2017 :</h5></div>
<div class="col-md-8"><h5>Ramzan</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>15-08-2017 :</h5></div>
<div class="col-md-8"><h5>Independence Day</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>25-08-2017 :</h5></div>
<div class="col-md-8"><h5>Ganesha Chaturthi</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>02-10-2017 :</h5></div>
<div class="col-md-8"><h5>Gandhi Jayanthi</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>20-10-2017 :</h5></div>
<div class="col-md-8"><h5>Deepavali</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>25-12-2017 :</h5></div>
<div class="col-md-8"><h5>Christmas//<span class="glyphicon glyphicon-star"style="color:blue"></h5></div>
</div>
<div class="col-md-12 top"><p>Restricted Holidays list 2017</p></div>
<div class="row">
<div class="col-md-4"><h5>24-02-2017 :</h5></div>
<div class="col-md-8"><h5>Maha Shivaratri </h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>29-03-2017 :</h5></div>
<div class="col-md-8"><h5>Ugadi</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>14-04-2017 :</h5></div>
<div class="col-md-8"><h5>Tamil New Year//<span class="glyphicon glyphicon-star"style="color:blue"></h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>01-05-2017 :</h5></div>
<div class="col-md-8"><h5>May Day</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>02-09-2017 :</h5></div>
<div class="col-md-8"><h5>Bakrid</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>30-09-2017 :</h5></div>
<div class="col-md-8"><h5>Dussehra</h5></div>
</div>
<div class="row">
<div class="col-md-4"><h5>01-11-2017 :</h5></div>
<div class="col-md-8"><h5>Kannada Rajyotsava</h5></div>
</div>
 </div>
</div>
</div>
</div>
</body>
</html>
</div>
 </div>
</div>
</div>
</div>
</body>
</html>