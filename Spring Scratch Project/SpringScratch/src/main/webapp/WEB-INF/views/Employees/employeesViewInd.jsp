<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.eoxys.Util.CMD"%>
<%@page import="com.eoxys.Util.QUERY"%>
<%@page import="com.eoxys.Model.Employees"%>
<%@page import="com.eoxys.Util.AppUrl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 

    Employees employee = (Employees) request.getAttribute("employee"); 
    //String submitUrl= (String) request.getAttribute("submitUrl");
    System.out.println("employee="+employee.getName());
    String divName="content-wrapper"; 
    String baseUrl=request.getContextPath()+"/employees";
    String actUrl=request.getContextPath()+"/employees/act?";
    DateFormat dateFormat = new SimpleDateFormat("EEE MMM-dd yyyy");
    DateFormat dobFormat = new SimpleDateFormat("dd-MM-yyyy");
    AppUrl appUrl=(AppUrl)request.getAttribute("appUrl"); 
	String imgUrl=appUrl.getBaseUrl()+appUrl.getMediaUrl()+employee.getUrl();
%>

<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
			<a href="javascript:getAjaxHtml('<%=divName%>', '<%=baseUrl%>');" >Employees</a> 
                        &nbsp;<span class="divider"><i class="fa fa-chevron-circle-right"></i></span>&nbsp; 
                        Detail
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
            
                                    <div class="row" style="padding-left:15px">
<div class="col-xs-12 col-sm-offset-3 col-sm-6 paddingT-10 text-center" style="position: relative;">
<img src="/Sensor_Server/resources/images/banner.png" width="300px">
 <span style="position: absolute;left: 240px;top: 45px;color: #fff;"><b class="threedViewBtn">Employee</b></span>
</div>
</div>
            <div class="row" style="padding-left:15px">
            <div class="col-xs-12 col-sm-offset-3 col-sm-6 paddingT-10 paddingB-10 box-shadow" style=" z-index: 4;background-color:whitesmoke;border-left:5px solid #EC5061">				
<div class="col-xs-4 col-sm-4 text-center">
            <img src="<%=imgUrl%>" alt="" class="header-avatar img-rounded img-circle img-responsive">
        </div>
        <div class="col-xs-8 col-sm-8">
            <blockquote style="border-left:5px solid #d2d6de;text-shadow:1px 1px 1px #BCBCBC">
								<p class="text-success"><%=employee.getName()%> 
								 <span style="color:#777">&nbsp; 
								<<label class="label label-default"><%=employee.getDesig()%></label> 
								 </span>
								</p>
								<%
									String sex = "Female";
									if (employee.getSex().equals("0")) {
										sex = "Male";
									}
								%>
								<small><cite><%=sex%>, <%=employee.getAge()%> years </cite></small> 
							<%-- 	<small><cite title="Source Title1"><%=pat.getState()%>, <%=pat.getCountry()%>  <i class="glyphicon glyphicon-map-marker"></i></cite></small> --%>
            </blockquote>
            <p> <i class="fa fa-phone-square"></i> <%=employee.getPhone()%>
                <br> <i class="fa fa-envelope"></i> <%=employee.getEmail()%>
                <br> <span class="text-info"><i class="glyphicon glyphicon-map-marker"></i> <%=employee.getAddress_line1()%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=employee.getAddress_line2()%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=employee.getState()%>-<%=employee.getZip()%>.</span></p>
        </div>
                          <table class="table table-striped">
                        <tbody>
                        <%  String style="odd gradeX";
                               int rcnt = 1;
                        %>
                            <tr class=<%=style%>>
                                <td><b> Joined From :</b></td>
                                <td> <%=dateFormat.format(employee.getCreated_at())%> </td>
                            	<td><b> Last Modified :</b></td>
                                <td> <%=dateFormat.format(employee.getUpdated_at())%> </td>
                            </tr>
                        </tbody>
                    </table>
        </div>
            
            
            
            
            
            </div>
            
            
            
            
            
            
            
<%--             <div class="row">
        <!--     <div class="col-sm-4"><img style="padding-top:20" id="div" src=""/></div> -->
            </div>
                <div class="table-responsive ">
                    <table class="table table-striped col-sm-7">
           <!--              <thead>
                            <tr>
                                <th class="col-sm-2">Fields</th>
                                <th class="col-sm-5">Details</th>
                            </tr>
                        </thead> -->
                        <tbody>
                        <%  String style="odd gradeX";
                               int rcnt = 1;
                        %>
                       		<!-- <tr class=<%=style%>>
                                <td> User UId </td>
                                <td> <=employee.getUser_uid()%> </td>
                         	</tr> -->
                         
                            <tr>
                             <td class="text-center" style="vertical-align:middle" rowspan="1"><img style="padding-top:20;width:200" id="div" src=""/></td>
                            <td rowspan="2">
                            <h1><%=employee.getName()%> <small>(<%=employee.getDesignationValue()%>)</small></h1>
                            <%String sex="Female";
                                if(employee.getSex().equals("0")){
                                	sex="Male";
                                }%>
                            <h3><%=sex%>, <%=employee.getAge()%> <small>Years</small></h3>
                            <h3><%=employee.getState()%>, <%=employee.getCountry()%></h3>
                            <h3><i class="fa fa-phone-square"></i> <small><%=employee.getPhone()%></small></h3>
                             <h3><i class="fa fa-envelope"></i> <small><%=employee.getEmail()%></small></h3>
                             <h3><i class="fa  fa-map-marker"></i> <small><%=employee.getAddress_line1()%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=employee.getAddress_line2()%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=employee.getState()%>-<%=employee.getZip()%>.</small></h3>
                            
                            </td></tr>
                            <tr>
                            <td class="text-center"><h4><small>Designation :<b> <%=employee.getDesignationValue()%></b></small></h4></td>
                            </tr>
                            <tr><td colspan="4"><legend>Status Details</legend></td></tr>
                            <tr class=<%=style%>>
                                <td><b>Joined From :</b></td>
                                <td><%=dateFormat.format(employee.getCreated_at())%></td>
                            </tr>
                            <tr class=<%=style%>>
                                <td><b>Last Modified :</b></td>
                                <td> <%=dateFormat.format(employee.getUpdated_at())%> </td>
                            </tr>
                        </tbody>
                    </table>
                </div> --%>
                <div class="col-sm-offset-2 col-sm-10">
                	<button type="submit" id="saveBtn" class="btn btn-primary fl fl-topLD fl-right-2" onClick="javascript:getAjaxHtml('<%=divName%>', '<%=actUrl +"cmd=" + CMD.EDITIND + "&recid="+employee.getId()%>');">
                                                <i class="fa fa-edit"></i> Edit</button>
			    	<button class="btn fl fl-topLD fl-right" id="cancelBtn" onclick="javascript:window.history.back();"><i class="fa fa-chevron-circle-left"></i> Back</button>
                 </div>     
            </div>
        </div>
    </div>
</div>   
<script>
$('#div').attr('src','<%=imgUrl%>');
/* scroll */
$(window).scroll(function(e){ 
	  if ($(this).scrollTop() > 20){ 
	    $('#saveBtn').css({'top': '60'});
	    $('#cancelBtn').css({'top': '60'});
	  }
	  if ($(this).scrollTop() < 20)
	  {
	    $('#saveBtn').css({'top': '100'});
	    $('#cancelBtn').css({'top': '100'});
	  }
	});
/* scroll top */
$(window).scrollTop(0);
</script>  