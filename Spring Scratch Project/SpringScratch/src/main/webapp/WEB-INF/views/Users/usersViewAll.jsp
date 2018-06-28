<%@page import="com.eoxys.Model.BOUserRole"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eoxys.Model.BOUsers"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.eoxys.Util.CMD"%>
<%
System.out.println("UserViewAll ");
	if(request.getAttribute("usersList")!=null){
		
	List<BOUsers> usersList = (List<BOUsers> ) request.getAttribute("usersList");
	List<BOUserRole> userRole = new ArrayList<BOUserRole>();
	if(request.getAttribute("userRole")!=null){
		userRole = (List<BOUserRole> ) request.getAttribute("userRole");
	}
	int curRole=0;
	if(request.getAttribute("role")!=null){
		curRole = Integer.parseInt(request.getAttribute("role").toString());
	}
	if(request.getSession().getAttribute("role")!=null){
		curRole = Integer.parseInt(request.getSession().getAttribute("role").toString());
	}
	System.out.println("curRole "+curRole);
	for(int i=0;i<userRole.size();i++){
		BOUserRole role = userRole.get(i);
		System.out.println("Role "+role.getRole_value());
	}
	
    System.out.println("usersList="+usersList.size());
/*     String usersType=request.getAttribute("usersType").toString(); */
    /* System.out.println("userstype="+usersType); */
    String divName="content-wrapper"; 
    String changePwd= request.getContextPath() + "/users/changePwd?";
    String activeStatus= request.getContextPath() + "/users/changeActiveSt?";
    String baseUrl;
    String baseUrlSearch;
    baseUrl=request.getContextPath()+"/users?";
	baseUrlSearch=request.getContextPath()+"/users/search?";
	String pageTitle="";
    String roleBaseUrl=request.getContextPath()+"/users/rolePost?";
    String actUrl=request.getContextPath()+"/users/act?";
    System.out.println("baseurl="+baseUrl);
	request.setAttribute("baseurl", baseUrl);
	System.out.println("baseurlnext="+baseUrl);
	String verify = request.getAttribute("userListVerify").toString();
	String searchEn=request.getAttribute("searchEn").toString();
	
	for(int i=0;i<userRole.size();i++){
		BOUserRole role = userRole.get(i);
		if(curRole == role.getId()){
			pageTitle=role.getRole_value();
			System.out.println("pageTitle "+pageTitle);
		}
	}
	
	System.out.println("finish");
	
%>
<script>document.title = 'Users Of Our Website';</script>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row"
					style="display: table; width: 90%; table-layout: fixed;">
					<div class="col-lg-4">
						<form id="search-form" class="navbar-form form-group" role="form">
							<div class="form-group btn-group fl fl-topLT fl-left">
								<div class="btn-group">
									<input type="text" name="searchKey" id="searchKey"
										<%if(!verify.equals("else")) {%> value="<%=verify%>" <%}%>
										class="form-control" placeholder="Search">
								</div>
								<div class="btn-group">
									<button type="button" class="btn btn-default" id="searchBtn"
										onClick="javascript:submitFormAllValuesHtmlResp(form,'<%=baseUrlSearch+"&role="+curRole%>','<%=divName%>')">
										<i class="fa fa-search"></i> Search
									</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-lg-6" id="focus">
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
							Result <b><%=start+1%></b> - <b><%=end%></b> of <b><%=totrecs%></b>
						</h5>
						<%
							} }
						%>
					</div>
					<div class="col-lg-4 col-sm-4">
						<!-- /.Drop down -->
						<div class="dropdown fl fl-topLT" style="right: 245;">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="true">
								<i class="fa fa-list-ul"></i>
								<%=pageTitle+" Users List"%>
								<span class="caret"></span>
							</button>
							<%
								if(userRole.size()>0){
							%>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
								<%
									for(int i=0;i<userRole.size();i++){
										BOUserRole role = userRole.get(i);
										
								%>
								<li>
									<div class="row">
										<div class="col-sm-8">
											<a
												href="javascript:getAjaxHtml('content-wrapper','<%=baseUrl %>page=1&role=<%= role.getId()%>');">
												<span><%= role.getRole_value() %></span> </a>
										</div>
										<div class="col-sm-4">
											<a
												href="javascript:getAjaxHtmlModal('myModalUserRole','<%=roleBaseUrl+"cmd="+CMD.EDITIND+"&recId="+role.getId()%>');"><i
												class="fa fa-pencil-square-o"></i></a> <a
												onclick="if(confirmDeleteNew('<%=role.getRole_value() %>')===true){ javascript:getAjaxJson('<%=divName%>', '<%=roleBaseUrl + "cmd=" + CMD.DELETE + "&recId="+role.getId()+"&role="+curRole%>');}"><i
												class="fa fa-trash-o"></i></a>
										</div>
									</div>
								</li>
								
								<%
									}
								%>
								<li>
									<div class="row">
										<div class="col-sm-8">
											<a
												href="javascript:getAjaxHtmlModal('myModalUserRole','<%=roleBaseUrl+"cmd="+CMD.ADDIND %>&role1=');">
												<span>Add New</span></a>
										</div>
										<div class="col-sm-4">
											<a
												href="javascript:getAjaxHtmlModal('myModalUserRole','<%=roleBaseUrl+"cmd="+CMD.ADDIND %>&role1=');"><i
												class="fa fa-plus-square-o"></i></a>
											<%-- <a
												href="javascript:getAjaxHtml('content-wrapper','${pageContext.request.contextPath}/employees?page=1&role1=');"><i class="fa fa-trash-o"></i></a> --%>
										</div>
									</div>
								</li>
							</ul>
							<%
								}else {
							%>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
								<li>
									<div class="row">
										<div class="col-sm-8">
											<a
												href="javascript:getAjaxHtmlModal('myModalUserRole','<%=roleBaseUrl+"cmd="+CMD.ADDIND %>&role1=');">Add
												New</a>
										</div>
										<div class="col-sm-4">
											<a
												href="javascript:getAjaxHtmlModal('myModalUserRole','<%=roleBaseUrl+"cmd="+CMD.ADDIND %>&role1=');"><i
												class="fa fa-plus-square-o"></i></a>
											<%-- <a
												href="javascript:getAjaxHtml('content-wrapper','${pageContext.request.contextPath}/employees?page=1&role1=');"><i class="fa fa-trash-o"></i></a> --%>
										</div>
									</div>
								</li>
							</ul>
							<%
								}
							%>
						</div>
					</div>
					<div class="col-lg-2" style="padding-bottom: 35px;">
						<%-- 	<%if(usersType.equals("1")){%> --%>
						<a class="btn btn-info fl fl-topLT fl-right"
							onClick="javascript:getAjaxHtml('<%=divName%>', '<%=actUrl + "cmd=" + CMD.ADDIND+"&role="+curRole%>');">
							<i class="fa fa-user-plus"></i> Add New Users
						</a>

						<%-- 	<%} %> --%>

					</div>
				</div>
			</div>
			<h4><%= pageTitle%></h4>

			<!--panel body -->
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th><input type="checkbox" name="checkBoxAll"></th>
								<th>Sno</th>
								<th>User UID</th>
								<th>Username</th>
								<th style="text-align: center">Password</th>
								<!-- <th style="text-align: center">Valid Status</th> -->
								<!-- <th>Register status</th> -->
								<th style="text-align: center">Active Status</th>
								<th style="text-align: center">Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (usersList.size()<=0) {
							%>
							<tr class="odd gradeX">
								<td colspan="10">
									<h1 style="text-align: center">No Records Found</h1>
								</td>
							</tr>
							<%
								} else {
																																																	;
																																																	String style;
																																																	int rcnt = 1;
																																																	BOUsers user;
																																																	for (int i = 0; i < usersList.size(); i++) {
																																																		if (i % 2 == 0) {
																																																			style = "odd gradeX";
																																																		} else {
																																																			style = "even gradeX";
																																																		}
																																																		user = usersList.get(i);
							%>
							<tr class=<%=style%>>
								<td><input type="checkbox" name="checkBox[<%=i+1%>]">
								</td>
								<td><%=(i+1)%></td>
								<td><%=user.getUser_uid()%></td>
								<td><%=user.getUserName()%></td>
								<td style="text-align: center">
									<%
										if(user.getPassword()==null ||user.getPassword().equals("")){
									%> <a data-toggle="modal" href="#changePwd-<%=user.getId()%>"
									class="btn btn-xs btn-warning"><i class="fa fa-plus-square"></i>
										Assign Password</a> <%
 	}else{
 %> <a data-toggle="modal" href="#changePwd-<%=user.getId()%>"
									class="btn btn-xs btn-info"><i class="fa fa-edit"></i>
										Change Password</a> <%
 	}
 %> <!-- //model -->
									<div class="modal" id="changePwd-<%=user.getId()%>"
										data-backdrop="static">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">×</button>
													<%
														if(user.getPassword()==null ||user.getPassword().equals("")){
													%>
													<h5 class="modal-title">Assign Password</h5>
													<%
														}else{
													%>
													<h5 class="modal-title">Change Password</h5>
													<%
														}
													%>
												</div>
												<div class="container"></div>
												<form id="pwdForm-<%=user.getId()%>" role="form"
													method="POST">
													<div class="modal-body">
														<input type="text" class="form-control"
															placeholder="Password" name="pwd" id="pwd" value="" /> <input
															type="hidden" name="id" id="id" value="<%=user.getId()%>" />
													</div>
													<div align="center">
														<label onclick="pswd_req<%=user.getId()%>()"
															class="btn btn-xs btn-primary btn-xs"><i
															class="fa fa-list"></i> Password requirements</label>
													</div>
													<div id="passMessage<%=user.getId()%>" hidden
														align="justify" Style="padding: 15px 30px 0px 0px">
														<ol>
															<li>Minimum 7 characters</li>
															<li>Cannot contain your email address or name</li>
															<li>Must include at least three of these four types:
																lowercase letters, uppercase letters, digits, symbols</li>
														</ol>
													</div>
													<div class="modal-footer">
														<div class="row">
															<div class="col-md-1"></div>
															<div class="col-md-5">
																<button type="submit" class="btn btn-primary btn-block">
																	<i class="fa fa-check"></i> Confirm
																</button>
															</div>
															<div class="col-md-5">
																<a href="#" data-dismiss="modal"
																	class="btn btn-default btn-block"><i
																	class="fa fa-close"></i> Cancel</a>
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div> <script>
									/* pwd req */
									function pswd_req<%=user.getId()%>()
									{
										var div= document.getElementById('passMessage<%=user.getId()%>');
										if(div.hidden){
											console.log("if");
											document.getElementById("passMessage<%=user.getId()%>").hidden= false;
										}else{
											console.log("else");
											document.getElementById("passMessage<%=user.getId()%>").hidden= true;
										}
									}
									/* form validate */
									$('#pwdForm-<%=user.getId()%>').validate({
										rules: {
								            pwd: {
								            	required : true,
												// Setting minimum and maximum lengths of a password
												minlength : 7,
												'goodpassword': true,
								            }
										},
								            messages: {
								                pwd: {
								                    required: "Enter Password"
								                }
								            },
										submitHandler: function(form) {
								            console.log("no error");
								            submitFormAllValues(form,'<%=changePwd%>','<%=divName%>');
								            $('#changePwd-<%=user.getId()%>').modal('toggle');
								        }
								    });
									</script>
								</td>
							<%-- 	<%
									String validSts=user.getValidation_sts();
								%>
								<td style="text-align: center" class="center">
									<%
										if(validSts.equals("1")) {
									%><span class="label" style="line-height: 3"><i
										class="fa fa-unlock-alt"
										style="color: #00a65a; font-size: 18px"></i></span> <%
 	}else{
 %> <span class="label" style="line-height: 3"><i
										class="fa fa-lock" style="color: #d73925; font-size: 18px"></i></span>
									<%
										}
									%>
								</td> --%>

								<%-- <%
									String registerSts=user.getRegistration_sts();
								%>
								<td style="text-align: center" class="center">
									<%
										if(registerSts.equals("1")) {
									%><span class="label label-success" style="line-height:3">Active</span>
									<%
										}else{
									%> <span class="label label-danger" style="line-height:3">Inactive</span>
									<%
										}
									%>
								</td> --%>

								<%
									String activeSts=user.getActivation_sts();
								%>
								<td class="center"
									style="text-align: midddle; float: none; width: 30%">
									<%
										if(user.getActivation_sts().equals("1")){
									%>
									<div
										class="btn-group btn-group-justified btn-<%=user.getId()%>"
										role="group" data-toggle="buttons" aria-label="...">
										<div class="btn-group" role="group">
											<label class="btn btn-xs btn-flat btn-primary "
												name="<%=user.getId()%>" id="1">ACTIVE</label>
										</div>
										<div class="btn-group" role="group">
											<label class="btn btn-xs btn-flat btn-default"
												name="<%=user.getId()%>" id="0">INACTIVE</label>
										</div>
									</div> <%--  	<div class="btn-group btn-toggle btn-<%=user.getId()%>" data-toggle="buttons">
									<label class="btn btn-xs btn-flat btn-primary " name="<%=user.getId()%>" id="1"> ACTIVE
									</label> <label class="btn btn-xs btn-flat btn-default" name="<%=user.getId()%>" id="0">
										INACTIVE
									</label>
								</div> --%> <script>
											$('.btn-<%=user.getId()%>').click(function() {
												$(this).find('.btn').toggleClass('active');

												if ($(this).find('.btn-primary').size() > 0) {
													$(this).find('.btn').toggleClass('btn-primary');
												}
												$(this).find('.btn').toggleClass('btn-default');
												console.log(($('[name="<%=user.getId()%>"].btn-primary').attr('id')=="1"));
												if($('[name="<%=user.getId()%>"].btn-primary').attr('id')=="1"){
													submitFormWithJson('act','<%=activeStatus  + "val=1 &recid="+user.getId()%>');
												}else{
													submitFormWithJson('act','<%=activeStatus  + "val=0 &recid="+user.getId()%>');
												}
												
											});
								</script> <%
 	}else{
 %>
									<div
										class="btn-group btn-group-justified btn-<%=user.getId()%>"
										role="group" data-toggle="buttons" aria-label="...">
										<div class="btn-group" role="group">
											<label class="btn btn-xs btn-flat btn-default "
												name="<%=user.getId()%>" id="1">ACTIVE</label>
										</div>
										<div class="btn-group" role="group">
											<label class="btn btn-xs btn-flat btn-primary"
												name="<%=user.getId()%>" id="0">INACTIVE</label>
										</div>
									</div> <script>
								$('.btn-<%=user.getId()%>').click(function() {
									$(this).find('.btn').toggleClass('active');

									if ($(this).find('.btn-primary').size() > 0) {
										$(this).find('.btn').toggleClass('btn-primary');
									}
									$(this).find('.btn').toggleClass('btn-default');
									console.log(($('[name="<%=user.getId()%>"].btn-primary').attr('id')=="1"));
									if($('[name="<%=user.getId()%>"].btn-primary').attr('id')=="1"){
										submitFormWithJson('act','<%=activeStatus  + "val=1 &recid="+user.getId()%>');
									}else{
										submitFormWithJson('act','<%=activeStatus  + "val=0 &recid="+user.getId()%>');
									}
									
								});
								</script> <%
 	}
 %>
								</td>
								<td style="text-align: center; float: none; width: 10%">
									<%
										if(!(user.getPassword()==null ||user.getPassword().equals(""))){
									%> <%-- <a class="btn btn-xs" data-toggle="tooltip" title="View"
									onClick="javascript:getAjaxHtml('<%=divName%>', '<%=actUrl + "cmd=" + CMD.VIEWIND + "&recid="+user.getId()%>');
                                                    this.disabled = true;">
										<i class="fa fa-eye threeDviewBtn" style="color: #00a65a"></i>
								</a> --%> <%
 	}
 %> <a class="btn btn-xs" data-toggle="tooltip" title="Remove"
									onClick="if(confirmDeleteNew('<%=user.getUser_uid()%>')===true){ javascript:getAjaxJson('<%=divName%>', '<%=actUrl + "cmd=" + CMD.DELETE + "&recid="+user.getId()+"&role="+curRole%>');}">
										<i class="fa fa-trash threeDviewBtn" style="color: #d73925"></i>
								</a>
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
			<!-- panel footer -->
			<div class="panel-footer">
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-8">
						<%@ include file="/WEB-INF/views/Util/showPageNav.jsp"%>
						<script>
						$(document).ready(function() {
							console.log('form validate');
							$.validator.addMethod('goodpassword',
							        function(value, element) {
							            var classes = 0;
							            var lower = new RegExp("[a-z]");
							            if (lower.test(value)) { classes++; }
							            var upper = new RegExp("[A-Z]");
							            if (upper.test(value)) { classes++; }
							            var digits = new RegExp("[0-9]");
							            if (digits.test(value)) { classes++; }
							            var others = new RegExp("[^A-Za-z0-9]");
							            if (others.test(value)) { classes++; }
							            return classes >= 3;
							        },
							        'Please see password requirements');
						});
       			function loadPage(pno){
       				var search=<%=searchEn%>;
       				console.log(search);
       				if(search=='1'){
    	   				var ser=$('#search-form input[name=searchKey]').val(); 
    	   				console.log('ser='+ser); 
    	   				getAjaxHtml('<%=div%>', '<%=baseUrlSearch%>page='+pno+'&searchKey='+ser);
       				}else{
       					getAjaxHtml('<%=div%>', '<%=baseurl%>page=' + pno);
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
<div class="modal fade" id="myModalUserRole" role="dialog" data-dismiss="modal" data-target="#myModalUserRole">
	<div class="modal-dialog"></div>
</div>
<script>
$(document).ready(function() {
	$('#search-term-form').removeAttr('hidden');
	$('#srch-term').val(document.getElementById('searchKey').value);
    $('#srch-term').focus();
	  $(window).keydown(function(event){
		  var key=false;
	    if( (event.keyCode == 13) && (key == false) ) {
	      event.preventDefault();
	      $('#searchKey').val(document.getElementById('srch-term').value);
	      $( "#searchBtn" ).click();
	      return false;
	    }
	  });
});
</script>
<%
	}
%>
<!--focus top  -->

