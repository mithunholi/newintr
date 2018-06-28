<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.eoxys.Util.CMD"%>
<%@page import="com.eoxys.Util.QUERY"%>
<%@page import="com.eoxys.Model.Employees"%>
<%-- <%@page import="com.eoxys.Model.BOUsers"%> --%>
<%@page import="java.util.List"%>
<%
	String divName = "content-wrapper";
	String baseUrl=request.getContextPath()+"/users";
	String actUrl = request.getContextPath() + "/users/act?";
	String postUrl = request.getContextPath() + "/users/post?";
	String searchUrl = request.getContextPath() + "/users/searchEmp?";
	request.setAttribute("baseurl", searchUrl);
	System.out.println("baseurl="+searchUrl);
	String verify = request.getAttribute("empListVerify").toString();
	String searchEn=request.getAttribute("searchEn").toString();
	List<Employees> empList = (List<Employees>) request.getAttribute("empList");
	int curRole =0;
	System.out.println("Role ============= " +request.getAttribute("role"));
	if(request.getAttribute("role")!=null){
		curRole = Integer.parseInt(request.getAttribute("role").toString());	
	}
	if(request.getSession().getAttribute("role")!=null){
		curRole = Integer.parseInt(request.getSession().getAttribute("role").toString());
	}
	System.out.println("empList=" + empList.size());
%>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row">
					<legend style="margin-left: 15px">ADD NEW USERS</legend>
					<div class="col-lg-4">
						<form id="search-form" class="navbar-form" role="form">
							<div class="form-group">
								<input type="text" name="searchKey" id="searchKey"
									<%if(!verify.equals("else")) {%> value="<%=verify%>" <%}%>
									class="form-control" placeholder="Search">
								<button type="button" class="btn btn-default" id="searchBtn"
									onClick="javascript:submitFormAllValuesHtmlResp(form,'<%=searchUrl+"&role="+curRole%>','<%=divName%>')">
									<i class="fa fa-search"></i> Search
								</button>
							</div>
						</form>
					</div>
					<div class="col-lg-5">
						<%
							if(!verify.equals("else")){ 
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
						%>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-body">
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th><input type="checkbox" name="checkBoxAll"></th>
							<th>Sno</th>
							<!-- 	<th>UserID</th> -->
							<th>Name</th>
							<th>Designation</th>
							<th>Email</th>
							<th>Contact</th>
							<th style="text-align: center">Actions</th>
						</tr>
					</thead>
					<tbody>


						<%
							if (empList.size() <= 0) {
						%>
						<tr class="odd gradeX">
							<td colspan="8">
								<h1 style="text-align: center">No Records Found</h1>
							</td>
						</tr>
						<%
							} else {
										;
										String style;
										int rcnt = 1;
										Employees emp;
										for (int i = 0; i < empList.size(); i++) {
											if (i % 2 == 0) {
												style = "odd gradeX";
											} else {
												style = "even gradeX";
											}
											emp = empList.get(i);
						%>
						<tr class=<%=style%>>
							<td><input type="checkbox" name="checkBox[<%=i + 1%>]">
							</td>
							<td><%=(i + 1)%></td>
							<%-- <td><%=emp.getUser_uid()%></td> --%>
							<td><%=emp.getName()%></td>
							<td><%=emp.getDesig()%></td>
							<td><%=emp.getEmail()%></td>
							<td><%=emp.getPhone()%></td>
							<td style="text-align: center">
								<%-- <%
									if(emp.getUser_status()==0){
								%> --%> <a
								class="btn btn-xs btn-success"
								onClick="javascript:getAjaxJson('<%=divName%>', '<%=postUrl + "cmd=" + CMD.ADDIND + "&role="+curRole+"&recId="+ emp.getId()%>');">
									<i class="fa fa-user-plus"></i> Add
							</a><%--  <%
 	}else{
 %> <a class="btn btn-xs btn-danger"
								onClick="javascript:getAjaxJson('<%=divName%>', '<%=postUrl + "cmd=" + CMD.DELETE + "&recid="+ emp.getId()%>');">
									<i class="fa fa-user-times"></i> Remove
							</a> <%
 	}
 %> --%>
							</td>
						</tr>
						<%
							}
									}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="panel-footer">
			<div class="row">
				<div class="col-lg-1"></div>
				<div class="col-lg-8">
					<%@ include file="/WEB-INF/views/Util/showPageNav.jsp"%>
					<script>
       			function loadPage(pno){
       				var search=<%=searchEn%>;
       				if(search=='1'){
    	   				var ser=$('#search-form input[name=searchKey]').val(); 
    	   				console.log('ser='+ser); 
    	   				getAjaxHtml('<%=div%>', '<%=baseurl%>?page='+pno+'&searchKey='+ser);
       				}else{
       					getAjaxHtml('<%=div%>', '<%=actUrl +"cmd="+CMD.ADDIND%>&page='+ pno);
							}
						}
					</script>
				</div>
				<div class="col-lg-3 fl fl-center" id="respDiv" hidden></div>
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
				if ($("#searchKey").is(':focus')) {
					alert($("#searchKey").is(':focus'));
					$("#searchBtn").click();
				}
				return false;
			}
		});
	});
</script>