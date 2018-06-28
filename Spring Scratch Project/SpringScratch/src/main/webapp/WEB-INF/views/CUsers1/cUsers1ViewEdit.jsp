
<%@page import="com.eoxys.Util.CMD"%>
<%@page import="com.eoxys.Util.QUERY"%>
<%@page import="com.eoxys.Model.BOUsers"%>
<%@page import="com.eoxys.Model.BOUserRole"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 

BOUsers user = (BOUsers) request.getAttribute("user"); 
String userRole = request.getAttribute("userRole").toString();
System.out.println("userRole="+userRole);
    //String submitUrl= (String) request.getAttribute("submitUrl");
    String divName="content-wrapper"; 
    String changePwd= request.getContextPath() + "/users/changePwd?";
    String activeStatus= request.getContextPath() + "/users/changeActiveSt?";
    String role="users";
	if(user.getUser_role_uid().equals("1")){
		role= "users";
		System.out.println("Role="+role);
	}else if(user.getUser_role_uid().equals("2")){
		role="advertisers";
		System.out.println("Role="+role);
	}else if(user.getUser_role_uid().equals("3")|| user.getUser_role_uid().equals("4")){
		role="deviceOwners";
		System.out.println("Role="+role);
	}
	String baseUrl = request.getContextPath() + "/"+role;
	String actUrl = request.getContextPath() + "/"+role+"/act?";
    String postUrl=request.getContextPath()+"/"+role+"/post?";
%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel-default">
			<div class="panel-heading">
				<a href="javascript:getAjaxHtml('<%=divName%>', '<%=baseUrl%>');"><%=role %></a>
				<span class="divider">/</span> Detail
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			</br></br>
			<div class="panel displaystyle-fullborder">
				<form id="edit-form" class="form-horizontal" role="form">
				<div class="form-group"
							style="padding-top: 10px; padding-bottom: 10px">
							<label for="acc_type"
								class="col-sm-4 col-sm-offset-2 control-label"control-label">
								Activation Status</label>
							<div class="col-sm-4" id="act">
							<% if(user.getActivation_sts().equals("1")){ %>
							 	<div class="btn-group btn-toggle" data-toggle="buttons" style="display: inline";>
									<label class="btn btn-flat btn-primary" name="options" id="1"> <input
										type="radio" name="options" id="yes" value="1"> ACTIVE
									</label> <label class="btn btn-flat btn-default" name="options" id="0"> <input
										type="radio" name="options" id="no" value="2">
										INACTIVE
									</label>
								</div>
								<input type="hidden" id="active_status" value="<%=user.getActivation_sts()%>"/>
								<%}else{ %>
								<div class="btn-group btn-toggle" data-toggle="buttons" style="display: inline";>
									<label class="btn btn-flat btn-default" name="options" id="1"> <input
										type="radio" name="options" id="yes" value="1"> ACTIVE
									</label> <label class="btn btn-flat btn-primary" name="options" id="0"> <input
										type="radio" name="options" id="no" value="0">
										INACTIVE
									</label>
								</div>
								<input type="hidden" id="active_status" value="<%=user.getActivation_sts()%>"/>
								<%} %>
							</div>
						</div>
				</form>
					<div class="row" style="padding-top: 10px; padding-bottom: 10px">
					<div class="col-sm-3 col-sm-offset-5">
							<a data-toggle="modal" href="#changePwd" class="btn btn-info"><i class="fa fa-edit"></i> Change Password</a>
							</div>
							</div>
							<div class="col-sm-offset-4 col-sm-4" id="respDiv" style="padding:10px 0px 10px 75px"></div>
							</br></br>
			</div>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="changePwd" data-backdrop="static">
	<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h5 class="modal-title">Change Password</h5>
       </div><div class="container"></div>
       <form id="pwdForm" role="form" method="POST">
        <div class="modal-body">
         <input type="text" class="form-control" placeholder="Password" name="pwd" id="pwd" value=""/> 
         <input type="hidden" name="id" id="id" value="<%=user.getId()%>"/>
        </div>
        	<div align="center">
							<label onclick="pswd_req()" class="btn btn-xs btn-primary btn-xs" ><i class="fa fa-list"></i> Password requirements</label>
										</div>
										<div id="passMessage" hidden align="justify" Style="padding:15px 30px 0px 0px">
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
    <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-check"></i> Confirm</button></div>
  <div class="col-md-5">
    <a href="#" data-dismiss="modal" class="btn btn-default btn-block"><i class="fa fa-close"></i> Cancel</a></div>
          </div>
        </div>
        </form>
      </div>
    </div>
</div>
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
	$('#pwdForm').validate({
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
            $('#changePwd').modal('toggle');
        }
    });
});
	$('.btn-toggle').click(function() {
		$(this).find('.btn').toggleClass('active');

		if ($(this).find('.btn-primary').size() > 0) {
			$(this).find('.btn').toggleClass('btn-primary');
		}
		if ($(this).find('.btn-danger').size() > 0) {
			$(this).find('.btn').toggleClass('btn-danger');
		}
		if ($(this).find('.btn-success').size() > 0) {
			$(this).find('.btn').toggleClass('btn-success');
		}
		if ($(this).find('.btn-info').size() > 0) {
			$(this).find('.btn').toggleClass('btn-info');
		}
		$(this).find('.btn').toggleClass('btn-default');
		console.log(($('[name="options"].btn-primary').attr('id')=="1"));
		var activeSt=$("#act");
		console.log(activeSt);
		if($('[name="options"].btn-primary').attr('id')=="1"){
			submitFormWithJson('act','<%=activeStatus  + "val=1 &recid="+user.getId()%>');
		}else{
			submitFormWithJson('act','<%=activeStatus  + "val=0 &recid="+user.getId()%>');
		}
		
	});
</script>