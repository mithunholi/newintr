<%-- <%@page import="com.eoxys.Controller.EmployeesController.RoleSet"%> --%>
<%@page import="com.eoxys.Model.Employees"%>
<%-- <%@page import="com.eoxys.Model.Desig"%> --%>
<%@page import="java.util.List"%>
<%@page import="com.eoxys.Util.AppUrl"%>
<%@page import="com.eoxys.Util.Common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.eoxys.Util.CMD"%>
<%
	String role1 = null;
/* if(request.getSession().getAttribute("role1")!=null)
	 role1 = request.getSession().getAttribute("role1").toString(); */
System.out.println("EmpViewAll "+request.getAttribute("att"));
    List<Employees> empList = (List<Employees> ) request.getAttribute("empList");
    /* List<Desig> desigList = (List<Desig> ) request.getAttribute("desigList"); */
    System.out.println("1 "+empList.size());
    System.out.println("empList="+empList.size());
    String divName="content-wrapper"; 
    String baseUrl=request.getContextPath()+"/employees";
    String actUrl=request.getContextPath()+"/employees/act?";
    String baseUrlSearch=request.getContextPath()+"/employees/search";
    System.out.println("baseurl="+baseUrl);
	request.setAttribute("baseurl", baseUrl);
	System.out.println("baseurlnext="+baseUrl);
	String searchEn=request.getAttribute("searchEn").toString();
	System.out.println("2");
	String verify = request.getAttribute("empListVerify").toString();
	System.out.println("3");
	System.out.println("verifffffffffffffffffy="+verify);
    AppUrl appUrl=(AppUrl)request.getAttribute("appUrl"); 
    System.out.println("4");
	String imgUrl=appUrl.getBaseUrl()+appUrl.getMediaUrl();
	System.out.println("html Start");
	/* String titleVal = "ALL Employees";
	String roleStr = RoleSet.roles.valueOf("ALL").toString();
	if(role1 == RoleSet.roles.valueOf("DOC").toString()){
		titleVal = "Doctors";		
		roleStr = RoleSet.roles.valueOf("DOC").toString();
	}else if (role1 == RoleSet.roles.valueOf("DEO").toString()){
		titleVal = "Data Entry Operators";
		roleStr = RoleSet.roles.valueOf("DEO").toString();
	}else if (role1 == RoleSet.roles.valueOf("Nurse").toString()){
		titleVal = "Nurses";
		roleStr = RoleSet.roles.valueOf("Nurse").toString();
	}else if (role1 == RoleSet.roles.valueOf("Attender").toString()){
		titleVal = "Attenders";
		roleStr = RoleSet.roles.valueOf("Attender").toString();
	} */
%>
<script>document.title = 'Sensor Server (Employees-List)';</script>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row paddingT-10 paddingB-10">
					<div class="col-lg-4">
						<form id="search-form" class="navbar-form" role="form">
							<div class="form-group btn-group fl fl-topLT fl-left">
								<div class="btn-group">
									<input type="text" name="searchKey" id="searchKey"
										<%if(!verify.equals("else")) {%> value="<%=verify%>" <%}%>
										class="form-control" placeholder="Search">
								</div>
								<div class="btn-group">
									<button type="button" class="btn btn-primary btn-flat"
										id="searchBtn"
										onClick="javascript:submitFormAllValuesHtmlResp(form,'<%=baseUrlSearch%>?page=1','<%=divName%>')">
										<i class="fa fa-search"></i> Search
									</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-lg-4" id="focus">
						<%
						System.out.println("MNB1");
							if(!verify.equals("else")){ 
								System.out.println("MNB2");
						                	int start = (Integer) request.getAttribute("start");
						                	String end = request.getAttribute("end").toString();
						                	String totrecs = request.getAttribute("totrecs").toString();
						%>
						<h3 style="margin: 2px">
							Search Result for : "<%=verify%>
							"
						</h3>
						<%
							if(totrecs.equals("0")){
						%>
						<h5>
							Result <b><%=totrecs%></b>
						</h5>
						<%
							}else {
						%>
						<h5>
							Result <b><%=start+1%></b> to <b><%=end%></b> of <b><%=totrecs%></b>
						</h5>
						<%
							} }
							System.out.println("MNB3");
						%>
					</div>
					<div class="col-lg-4">
						<!-- /.Drop down -->
						<%-- <div class="dropdown fl fl-topLT" style="right:245;">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
 <i class="fa fa-list-ul"></i> <%=titleVal+" List" %>
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li  ><a href="javascript:getAjaxHtml('content-wrapper','${pageContext.request.contextPath}/employees?page=1&role1=<%=RoleSet.roles.valueOf("ALL").toString()%>');">ALL Employees</a></li>
    <li><a href="javascript:getAjaxHtml('content-wrapper','${pageContext.request.contextPath}/employees?page=1&role1=<%=RoleSet.roles.valueOf("DOC").toString()%>');">Doctors</a></li>
    <li><a href="javascript:getAjaxHtml('content-wrapper','${pageContext.request.contextPath}/employees?page=1&role1=<%=RoleSet.roles.valueOf("DEO").toString()%>');">Data Entry Operators</a></li>
        <li><a href="javascript:getAjaxHtml('content-wrapper','${pageContext.request.contextPath}/employees?page=1&role1=<%=RoleSet.roles.valueOf("Nurse").toString()%>');">Nurses</a></li>
    <li><a href="javascript:getAjaxHtml('content-wrapper','${pageContext.request.contextPath}/employees?page=1&role1=<%=RoleSet.roles.valueOf("Attender").toString()%>');">Attenders</a></li>
  </ul>
</div> --%>
					</div>
					<div class="col-lg-2">
						<a class="btn btn-info fl fl-topLT fl-right"
							onClick="javascript:getAjaxHtml('<%=divName%>', '<%=actUrl + "cmd=" + CMD.ADDIND%>');">
							<i class="fa fa-user-plus"></i> Add New Employee
						</a>
					</div>
				</div>
			</div>

			<!--panel body -->
			<div class="panel-body">
				<%--  <h1 class="text-center"><legend style="color:#e65c00"><%=titleVal%></legend></h1> --%>
				<div class="table-responsive">
					<table class="table table-striped table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th><input type="checkbox" name="checkBoxAll"></th>
								<th>Sno</th>
								<!--  <th>UserID</th> -->
								<th style="padding-right: 200" class="text-center" colspan="2">Profile</th>
								<th>Contacts</th>
								<!--         <th>Designation</th>
                                <th>Email</th>
                                <th>Contact</th> -->
								<th style="text-align: center">Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
							System.out.println("MNB4 "+empList);
								if (empList.size()<=0) {
							%>
							<tr class="odd gradeX">
								<td colspan="7" align="center">
									<h1>
										<small> No Employees Found</small>
									</h1>
								</td>
							</tr>
							<%
								}else{
									System.out.println("MNB5 "+empList.size());
								
							                                        String style;
							                                        int rcnt = 1;
							                                        Employees emp;
							                                        for(int i=0;i<empList.size();i++){
							                                        	 emp=empList.get(i);
							                                        	if(emp!=null){
							                                            if(i%2==0){ 
							                                                style = "odd gradeX";
							                                            }else{
							                                                style = "even gradeX";
							                                            }
							                                           
							                                            
							%>
							<tr class=<%=style%>>
								<td style="vertical-align: middle"><input type="checkbox"
									name="checkBox[<%=i+1%>]"></td>
								<td style="vertical-align: middle"><%=(i+1)%></td>
								<!-- <td> <=emp.getUser_uid()%> </td> -->
								<td style="vertical-align: middle">
									<div id="div1" class="img-circle"
										style="width:75px; height:75px;background-color:black; background:no-repeat; background:url('<%=imgUrl+emp.getThumb_url()%>'); background-size:cover;background-position:center;margin-left:20%;box-shadow:1px 1px 1px 1px rgba(0, 0, 0, 0.05), 1px 1px 1px 1px rgba(0, 0, 0, 0.09)">
									</div> <%--  <img src="<%=imgUrl+emp.getUrl()%>" width="75"class="img-circle">    --%>
								</td>
								<td style="vertical-align: middle">
									<h4 class="text-success"><%=emp.getName()%>
										<small> <label class="label label-default"><%=emp.getDesig()%></label>
										</small>
									</h4> <%
 	String sex="Female";
                                 if(emp.getSex().equals("0")){
                                 	sex="Male";
                                 }
 %>
									<h5><%=sex%>,
										<%=emp.getAge()%>
										<small>Years</small>
									</h5>
									<h5><%=emp.getState()%>,
										<%=emp.getCountry()%></h5>
								</td>
								<td style="vertical-align: middle">
									<h4>
										<i class="fa fa-phone-square"></i> <small><%=emp.getPhone()%></small>
									</h4>
									<%System.out.println("MNB5.2 "); %>
									<h4>
										<i class="fa fa-envelope"></i> <small><%=emp.getEmail()%></small>
									</h4>
									<%System.out.println("MNB5.2 "); %>
								</td>

								<%--         <td> <%=emp.getDesignationValue() %> </td>
                                            <td> <%=emp.getEmail()%> </td>
                                            <td> <%=emp.getPhone()%> </td> --%>
								<td style="text-align: center; vertical-align: middle"><a
									class="btn btn-success btn-circle box-shadow"
									onClick="javascript:getAjaxHtml('<%=divName%>', '<%=actUrl + "cmd=" + CMD.VIEWIND + "&recid="+emp.getId()%>');
                                                    this.disabled = true;">
										<i class="icon-zoom-in icon-white"></i> View
								</a> <a class="btn btn-info btn-circle box-shadow"
									onClick="javascript:getAjaxHtml('<%=divName%>', '<%=actUrl + "cmd=" + CMD.EDITIND + "&recid="+emp.getId()%>&pageSend='+pageSend);
                                                    this.disabled = true;">
										<i class="icon-edit icon-white"></i> Edit
								</a> <a class="btn btn-danger btn-circle box-shadow"
									onClick=" if(confirmDelete()===true){ javascript:getAjaxJson('<%=divName%>', '<%=actUrl + "cmd=" + CMD.DELETE + "&recid="+emp.getId()%>&pageSend='+pageSend);}">
										<i class="icon-trash icon-white"></i> Delete
								</a></td>
							</tr>
							<%
								}
							                                        }
							                                        }
								System.out.println("MNB6");
							%>
						</tbody>
					</table>
				</div>
			</div>
			<!-- panel footer -->
			<div class="panel-footer">
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<%@ include file="/WEB-INF/views/Util/showPageNav.jsp"%>
						<script>
       			function loadPage(pno){
       				var search=<%=searchEn%>;
       				console.log(search);
       				if(search=='1'){
    	   				var ser=$('#search-form input[name=searchKey]').val(); 
    	   				console.log('ser='+ser); 
    	   				getAjaxHtml('<%=div%>', '<%=baseUrlSearch%>?page='+pno+'&searchKey='+ser);
       				}else{
       					getAjaxHtml('<%=div%>', '<%=baseurl%>?page=' + pno);
								}
							}
						</script>
					</div>
					<div class="col-lg-3 fl fl-center" id="respDiv" hidden></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$(window).keydown(function(event) {
			var key = false;
			if ((event.keyCode == 13) && (key == false)) {
				event.preventDefault();
				console.log("Enter")
				$("#searchBtn").click();
				return false;
			}
		});
		//menuChange(<%=Common.employees%>);
		$(window).scrollTop(0);
	});
</script>


