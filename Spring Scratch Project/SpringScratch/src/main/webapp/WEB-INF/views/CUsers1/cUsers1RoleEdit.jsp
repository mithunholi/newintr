<%-- 
    Document   : usersNew
    Created on : Dec 1, 2014, 5:41:30 PM
    Author     : Prabhakar
--%>


<%@page import="com.eoxys.Model.BOUserModuleAccess"%>
<%@page import="com.eoxys.Util.CMD"%>
<%@page import="com.eoxys.Util.QUERY"%>
<%@page import="com.eoxys.Model.CUserRole"%>
<%-- <%@page import="com.eoxys.Model.Desig"%> --%>
<%@page import="com.eoxys.Util.AppUrl"%>
<%@page import="java.util.List"%>
<%@page import="com.eoxys.Util.DeleteImage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
System.out.println("cusers1RoleEdit");
CUserRole userRole = (CUserRole) request.getAttribute("roleObj");
	System.out.println("usersRoleEdit");
	String[] modules = null;
	List<BOUserModuleAccess>	roleAccessObj=null;
	if (request.getAttribute("moduleArr") != null) {
		modules = (String[]) request.getAttribute("moduleArr");
	}
	if (request.getAttribute("roleAccessObj") != null) {
		roleAccessObj = (List<BOUserModuleAccess>) request.getAttribute("roleAccessObj");
	}
	System.out.println(userRole);
	String divName = "content-wrapper";
	String baseUrl = request.getContextPath() + "/cUsers1";
	String actUrl = request.getContextPath() + "/cUsers1/rolePost/act?";
	String postUrl = request.getContextPath() + "/cUsers1/rolePost?";
	/*     List<Desig> desigList= (List<Desig>) request.getAttribute("designation"); */
	String fileUrl = request.getContextPath()
			+ "/employees/myImages/fileUpload";
	String deleteUrl = request.getContextPath()
			+ "/employees/myImages/delete";
%>

<!-- /.row -->
<div class="row"
	style="width: 500px; margin-left: auto; margin-right: auto;">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4>Add New Role</h4>
				<%-- <a href="javascript:getAjaxHtml('<%=divName%>', '<%=baseUrl%>');">Employees</a>
				<span class="divider">/</span> Detail --%>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form id="add-form" class="form-horizondal" role="form">
					<!-- 	 <button type="submit" id="saveBtn" class="btn btn-primary">Save
								record</button>  -->
					<fieldset>
						<legend>Role Info</legend>
						<div class="row">
							<div class="form-group col-sm-9">
								<label for="role_uid" class=" control-label">Role UID</label>
								<div>
									<input type="text" class="form-control" name="role_uid"
										placeholder="Role UID" value="<%=userRole.getRole_uid() %>">
										
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-9">
								<label for="name" class=" control-label">Role Name </label>
								<div>
									<input type="text" class="form-control" name="name" 
										placeholder="Role Name"  value="<%=userRole.getRole_value() %>">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-sm-12" align="center">
								<!-- 	<button type="button" id="saveBtn" class="btn btn-primary"
										onclick="javascript:saveLoad(this.form);">
										<i class="fa fa-save"></i> Save Role
									</button> -->
									<button type="submit" id="saveBtn" class="btn btn-primary"
										>
										<i class="fa fa-save"></i> Save Role
									</button> 
									<button type="reset" id="cancelBtn" class="btn"
										onClick="javascript:backLoad();">Back</button>
									<button type="reset" id="backBtn" data-dismiss="modal"
										class="btn">Cancel</button>
								</div>
							</div>
						</div>

					</fieldset>
					<fieldset>
						<legend>Role Access</legend>
						<div class="row">
							<div class="col-lg-3">
								<label for="role_uid" class=" control-label">Module Name</label>
							</div>

							<div class="col-lg-8" align="center">
								<label for="role_uid" class=" control-label">Access
									(RWD)</label>
							</div>
						</div>
			

			<%
			String mods="";
				for (int i = 0; i < modules.length; i++) {
					 mods+=modules[i]+",";
					 System.out.println("mods "+mods+","+roleAccessObj.size());
						String r="",w="",d="";
					 if(roleAccessObj!=null){
						 
						for(int j=0;j<roleAccessObj.size();j++){
							System.out.println("Access "+j);
							BOUserModuleAccess boM=roleAccessObj.get(j);
							System.out.println("Access "+i+","+boM.getModule_id());
							if(boM.getModule_id()==i){
								
								char[] roleAccArr = boM.getAccess().toCharArray();
								System.out.println("sdfvbsdk");
								if(roleAccArr[0]=='1'){
									r="checked";
								}
								System.out.println("sdfvbsdk");
								if(roleAccArr[1]=='1'){
									w="checked";
								}
								System.out.println("sdfvbsdk");
								if(roleAccArr[2]=='1'){
									d="checked";
								}
								System.out.println("sdfvbsdk");
							}
						}
						System.out.println("sdfvbsdk "+r+","+w+","+d);
					 }
			%>
			<div class="row cusTab" >
				<div class=" checkbox col-lg-3 " style="border:1px solid #000">
					<label for="role_uid" class=" control-label"><%=modules[i]%></label>
				</div>

				<div class="col-lg-8 " style="border:1px solid #000">
					<div class="row cusTab">
						<div class="checkbox col-lg-4 " >
							<label><input type="checkbox" name="<%=modules[i] %>" value="0" <%=r %>>Read</label>
						</div>
						<div class="checkbox col-lg-4 "  >
							<label><input type="checkbox" name="<%=modules[i] %>" value="1" <%=w %>>Write</label>
						</div>
						<div class="checkbox col-lg-4 "  >
							<label><input type="checkbox" name="<%=modules[i] %>" value="2" <%=d %>>Delete</label>
						</div>
					</div>

				</div>
			</div>
			<%
				}
			%>
			<input type="hidden" name="modules" id="modules" value="<%=mods %>"/>
			</fieldset>
					<div class="clrSpace"></div>
				</form>
				<div class="col-lg-3 fl fl-center" id="respDiv" hidden></div>

			</div>
		</div>
	</div>
</div>
<!-- bootstrap time picker -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/iCheck/icheck.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/timepicker/bootstrap-timepicker.js"
	type="text/javascript"></script>
<script>  
function backLoad(){
	console.log("mnb")
	$('#myModalUserRole').modal('hide');
	setTimeout(function(){
		getAjaxHtml('<%=divName%>', '<%=baseUrl%>');
	},1000);
}
function saveLoad(frm){
	
	console.log("mnb")
	console.log(frm)
	frm.submit();
	//$('#myModalUserRole').modal('hide');
	//setTimeout(function(){
	//	
	//},1000);
}
$(document).ready(function() {
	console.log('form validate');
	$('#add-form').validate({ // initialize the plugin
        rules: {
            name: {
                required: true
            },
            role_uid: {
                required: true
            }
        },
        errorPlacement: function(error, element) {
			if(element.attr("name")== "sex"){
			     error.insertAfter( $('#sexDiv'));
			}else {
		      error.insertAfter(element);
		    }
        },
        messages: {
            name: {
                required: "Enter name"
            },
            role_uid: {
                required: "Enter Role UID"
            }
        },
        submitHandler: function(form) {
        	/* if($("#female").prop("checked")){
        		alert($("#female").prop("checked"));
				$('#url').val("/employees/female-profileFemale.png");
        	} */
        	$('#myModalUserRole').modal('hide');
            console.log("no error");
           <%--  submitFormAllValues(form,'<%=postUrl+"cmd="+CMD.UPDATE+"&recid="+employee.getId() %>'); --%>
           <%-- submitFormAllValues(form,'<%=postUrl+"cmd="+CMD.CREATE %>'); --%>
           console.log('phone================================'+$("#modules").val());
    	   var module=$("#modules").val();
    	   console.log("modules mod "+module.split(","))
    	   console.log(module.split(","))
    	   var modArr = module.split(",");
    	   var modRoleStr = "";
    	   for (var i=0;i<modArr.length;i++){
    		   console.log("modu "+modArr[i]);
    		   
    		   if(modArr[i]!=""){
    			   console.log("MNB")
    			   var roleStr ="";
    			   $('input[name="'+modArr[i]+'"]:checked').each(function() {
            		   console.log(this.value);
            		   roleStr+=this.value;
            		});
    			   modRoleStr+="&"+modArr[i].replace(" ","_")+"_module="+roleStr;
    		   }
    	   }
    	   console.log("modRoleStr "+modRoleStr)
    	   
    	 /*   $('input[name="Users"]:checked').each(function() {
    		   console.log(this.value);
    		}); */
       
           submitFormAllValues(form,'<%=postUrl + "cmd=" + CMD.UPDATE+"&recId="+userRole.getId()%>'+modRoleStr);
       
        } 
    });

});
/* scroll top */
$(window).scrollTop(0);
/* $(window).scroll(function(e){ 
	  if ($(this).scrollTop() > 20){ 
	    $('#saveBtn').css({'top': '60'});
	    $('#cancelBtn').css({'top': '60'});
	  }
	  if ($(this).scrollTop() < 20)
	  {
	    $('#saveBtn').css({'top': '100'});
	    $('#cancelBtn').css({'top': '100'});
	  }
	}); */
</script>

