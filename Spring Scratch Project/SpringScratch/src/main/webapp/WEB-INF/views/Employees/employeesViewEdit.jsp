<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%-- <%@page import="com.eoxys.Model.Desig"%> --%>
<%@page import="java.util.List"%>
<%@page import="com.eoxys.Util.CMD"%>
<%@page import="com.eoxys.Util.QUERY"%>
<%@page import="com.eoxys.Model.Employees"%>
<%@page import="com.eoxys.Util.AppUrl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	Employees employee = (Employees) request.getAttribute("employee");
/* 	List<Desig> desigList = (List<Desig>) request.getAttribute("desigList"); */
	//String submitUrl= (String) request.getAttribute("submitUrl");
	System.out.println("employee=" + employee.getName());
	String divName = "content-wrapper";
	String baseUrl = request.getContextPath() + "/employees";
	String actUrl = request.getContextPath() + "/employees/act?";
	String postUrl = request.getContextPath() + "/employees/post?";
	DateFormat dateFormat = new SimpleDateFormat("EEE MMM-dd yyyy");
	String ddd = dateFormat.format(employee.getDob());
	AppUrl appUrl=(AppUrl)request.getAttribute("appUrl"); 
	String imgUrl=appUrl.getBaseUrl()+appUrl.getMediaUrl();
	 String fileUrl = request.getContextPath()+"/employees/myImages/fileUpload";
	    String deleteUrl = request.getContextPath()+"/employees/myImages/delete";
%>
<script
	src="${pageContext.request.contextPath}/resources/js/countries.js"></script>
<script language="javascript">
		populateCountriesEdit("country", "state", "<%= employee.getCountry() %>", "<%= employee.getState() %>");
		</script>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div id="focus" class="panel-heading">
				<a href="javascript:getAjaxHtml('<%=divName%>', '<%=baseUrl%>');">Employees</a>
				&nbsp;<span class="divider"><i class="fa fa-chevron-circle-right"></i></span>&nbsp; Detail
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			<fieldset>
								<legend> Photo Identification</legend>
								 <form id="file-form" enctype="multipart/form-data">
								 <div class="row">
								 <div class="col-md-4" id="div" width="100px" height="100px"> 
								<div id="div1"  style="width:100px; height:100px;background-color:black; background:no-repeat; background:url('<%=imgUrl+employee.getThumb_url()%>'); background-size:cover;background-position:center;margin-left:20%;box-shadow:1px 1px 1px 1px rgba(0, 0, 0, 0.19), 1px 1px 1px 1px rgba(0, 0, 0, 0.19)">
								</div>
								 <%--  <img class="box-shadow-img" style="margin-top:1;margin-left:20%" id="div1" src="<%=imgUrl+employee.getThumb_url()%>" width="100px" height="100px"/> --%>
								 </div>
								<!--  <div class="col-md-4 "> -->
								 <%-- <div class="col-sm-5">
								 <img class="box-shadow-img" style="margin-top:1" id="div1" src="<%=imgUrl+employee.getThumb_url()%>" width="100px" height="100px"/> --%>
								<!--  </div> -->
			<!--  <div class="col-sm-4" style="margin-top:40px">					
		<button id="upload" type="submit" class="btn btn-sm btn-primary box-shadow"><i class="fa fa-upload"></i> Upload</button>
		<a id="delete" href="javascript:imgDelete()" class="btn btn-sm btn-danger box-shadow"><i class="fa fa-close"></i> Remove</a>
		</div> -->
		</div>
								
	<input type="hidden" id="imgUrlHidden" value=""/>
	<div class="row">
	
 			  <div id="div" class=" col-md-4" style="padding-top:10px;padding-bottom:10px;margin-left:1.5%">
 		
          <div style="position:relative;">
		<span><input type="text" name="path" id="upload-file-info" style="padding-bottom:5px;height:23px"/><a id="browser" class='btn btn-sm btn-primary box-shadow-flat'  href='javascript:;'>
			<i class="fa fa-folder-open"> Browser</i>
			<input type="file" name="file_source" accept="image/*" id="file_source" style='position:absolute;z-index:2;top:0;left:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";opacity:0;background-color:transparent;color:transparent;'  onchange='$("#upload-file-info").val($(this).val());'>
		</a></span>	</div>
		 <!-- <div style="position:relative;">
		 <button id="upload" type="submit" class="btn btn-sm btn-primary box-shadow"><i class="fa fa-upload"></i> Upload</button>
		<a id="delete" href="javascript:imgDelete()" class="btn btn-sm btn-danger box-shadow"><i class="fa fa-close"></i> Remove</a>
		</div> -->
	
		</div>
		
		</div>
		<div class="row" style="margin-left:8%">
		
		<button id="upload" type="submit" class="btn btn-xs btn-primary box-shadow"><i class="fa fa-upload"></i> Upload</button>
		<a id="delete" href="javascript:imgDelete()" class="btn btn-xs btn-danger box-shadow"><i class="fa fa-close"></i> Remove</a>
		</div>
		<!-- <div class="col-md-2" style="padding-top:50px;padding-bottom:50px">
		<button id="upload" type="submit" class="btn btn-sm btn-primary box-shadow"><i class="fa fa-upload"></i> Upload</button>
		<a id="delete" href="javascript:imgDelete()" class="btn btn-sm btn-danger box-shadow"><i class="fa fa-close"></i> Remove</a>
		</div> -->
			
			
	
                </form>							</fieldset>
			
							<form id="edit-form" class="form-horizondal" role="form">
					<!-- 	 <button type="submit" id="saveBtn" class="btn btn-primary">Save
								record</button>  -->
								       <%-- <fieldset>
								       <legend> Photo Identification</legend>
								        <div class="col-md-4 " id="div"><img class="box-shadow-img" style="margin-top:1;margin-left:25%" id="div1" src="<%=imgUrl+employee.getThumb_url()%>"/></div>
	<!-- <input type="hidden" id="imgUrlHidden" value=""/> -->
								       </fieldset> --%>
					<fieldset>
						<legend>Personal Info</legend>
						<div class="row">
							<div class="form-group col-sm-3">
								<label for="name" class=" control-label">Name</label>
								<div>
									<input type="text" class="form-control" name="name" value="<%=employee.getName() %>"
										placeholder="Name">
								</div>
							</div>
							
							

							<div class="form-group col-sm-3">
								<label for="dob" class=" control-label">DOB</label>
				             <div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
                    	<div class="input-append date" id="datepicker"
										 data-date-format="dd-mm-yyyy">

										<input name="dob" id="datepicker1" class="span2 form-control" size="16"
											type="text" > <span class="add-on"><i
											class="icon-th"></i></span>
									</div>
									       </div>
							</div>
							<div class="form-group col-sm-3">

								<!-- <div> -->
								<label for="age" class=" control-label">Age</label><br>
								<div id="ageDiv" class="input-group spinner">
									<input type="text" id="age" name="age" class="form-control"
										value="<%=employee.getAge()%>" disabled>
									<div class="input-group-btn-vertical">
										<button class="btn btn-default" type="button" disabled>
											<i class="fa fa-caret-up"></i>
										</button>
										<button class="btn btn-default" type="button" disabled>
											<i class="fa fa-caret-down"></i>
										</button>
									</div>
								</div>
								<!-- </div> -->
							</div>
							<div class="form-group col-sm-3">

								<div>
									<label for="sex" class="control-label">Sex</label>
									<div>
									<%String male=null,female=null;
											System.out.println("pay type="+employee.getSex());
											if(employee.getSex().equals("0")){
												male="checked";
											 }else{
											 female="checked";
											} %>
										<input class="pull-left" type="radio" id="male" name="sex" value="0" <%=male%>>Male&nbsp;&nbsp;
										<input type="radio" name="sex" id="female" value="1" <%=female%>><span
											id="sexSpan">Female</span>
										<div id="sexDiv"></div>
									</div>

								</div>
							</div>
									<%-- <div class="form-group col-sm-6">
								<label for="name" class=" control-label">Designation</label>
								<div>
							
											<select class="form-control" name="designation">
								<option>Select Designation</option>
								<%
									Desig desig;
									for (int i = 0; i < desigList.size(); i++) {
										
										desig = desigList.get(i);
										String selected = "";
										int dId = Integer.parseInt(employee.getDesignation());
										System.out.println("sys "+desig.getId()+","+dId);
										if(desig.getId() == dId)
											selected = "selected";
								%>
								<option value="<%=desig.getId()%>" <%=selected %>><%=desig.getDesig_value() + " - "+ desig.getDesig_value()%></option>
								<%
									}
								%>
							</select>
								</div>
							</div> --%>
							
							
							
						</div>
						<div class="row">
						<div class="form-group col-sm-3">
								<label for="name" class=" control-label">Designation </label>
								<div>
									<input type="text" class="form-control" name="desig" value="<%=employee.getDesig() %>"
										placeholder="Designation">
								</div>
							</div>
						</div>

					</fieldset>
					<div style=""></div>
					<fieldset>
						<legend>Contact Info</legend>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="address_line1" class="control-label">Address
									Line1</label>
								<div>
									<input type="text" class="form-control col-xs-4" value="<%=employee.getAddress_line1()%>"
										name="address_line1" placeholder="Address Line1">
								</div>
							</div>
							<div class="form-group col-sm-4">
								<label for="address_line2" class=" control-label">Address
									Line2</label>
								<div>
									<input type="text" class="form-control" name="address_line2" value="<%=employee.getAddress_line2() %>"
										placeholder="Address Line2(optional)">
								</div>
							</div>
							<div class="form-group col-sm-4">
								<label for="zip" class="control-label">Zip</label>
								<div>
									<input type="text" class="form-control" name="zip" value="<%=employee.getZip() %>"
										placeholder="Zip">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="country" class="control-label">Country</label>
								<div>
									<select class="form-control" id="country" name="country" value="<%=employee.getCountry() %>" ></select>

								</div>
							</div>
							<div class="form-group col-sm-4">
								<label for="state" class="control-label">State</label>
								<div>
									<select class="form-control select2" id="state" name="state" value="<%=employee.getState()%>"><option>select
											States</option></select>
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="city" class="control-label">City</label>
								<div>
									<input type="text" class="form-control" name="city" value="<%=employee.getCity()%>"
										placeholder="City">
								</div>
							</div>
							<div class="form-group col-sm-4">
								<label for="email" class="control-label">Email</label>
								<div>
									<input type="text" class="form-control" name="email" value="<%=employee.getEmail()%>"
										placeholder="Email">
								</div>
							</div><div class="form-group col-sm-4">
								<label for="dob" class=" control-label">Phone</label>
                       <div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-plus" style="color:#ccc"></i>
										</div> 
                    	

										<input type="text"  class="form-control" name="phone" value="<%=employee.getPhone() %>"
										placeholder=" Eg: 61 8526341">
											 <span class="add-on"><i
											class="icon-th"></i></span> 
								
									       </div>
							</div>
							
							
								<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<!-- <button type="button" id="saveBtn" class="btn btn-primary" onClick="javascript:submitFormAllValues(this.form,'<%=postUrl+"cmd="+CMD.UPDATE+"&recid="+employee.getId()%>')">Save changes</button>
                             -->
					                             <button type="submit" id="saveBtn" class="btn btn-primary fl fl-topLD fl-right-2"><i class="fa fa-save"></i> Save changes</button>
					                            <button type="reset" id="cancelBtn" class="btn fl fl-topLD fl-right" onClick="javascript:getAjaxHtml('<%=divName%>', '<%=baseUrl%>');">Back</button> 
			    <button type="reset" id="backBtn" class="btn fl fl-topLD fl-right" onclick="javascript:window.history.back();">Cancel</button>
						</div>
					</div>
					<input type="hidden" id="url" name="url" value="<%=imgUrl+employee.getUrl()%>"/>
						<input type="hidden" id="thumbUrl" name="thumbUrl" value="<%=imgUrl+employee.getThumb_url()%>"/>
		
						</div>
					</fieldset>
					<div class="clrSpace"></div>
				</form>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
				<%-- <form id="edit-form" class="form-horizontal" role="form">
					<!-- <div class="form-group">
						<label for="user_uid" class="col-sm-2 control-label">User
							ID</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="user_uid"
								value="<= employee.getUser_uid() %>">
						</div>
					</div> -->
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">Name</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="name"
								value="<%=employee.getName()%>">
						</div>
					</div>
					       <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Sex</label>
                        <div class="col-sm-5">
                        	<input class="pull-left" type="radio" id="male" name="sex" value="0">Male&nbsp;&nbsp;
										<input type="radio" id="female" name="sex" value="1"><span
											id="sexSpan">Female</span>
										<div id="sexDiv"></div>
                        </div>
                        </div>
                                            <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">DOB</label>
                        <div class="col-sm-5">
                        <div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
                    	<div class="input-append date" id="datepicker"
										 data-date-format="dd-mm-yyyy">

										<input name="dob" id="datepicker1" class="span2 form-control" size="16"
											type="text" > <span class="add-on"><i
											class="icon-th"></i></span>
									</div>
									       </div>
									       </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Age</label>
                        <div class="col-sm-5">
                        <input type="text" class="form-control" id="age" name="age" 
                            placeholder="Age" disabled>
                        </div>
                        </div>
					<div class="form-group">
						<label for="passWord" class="col-sm-2 control-label">City</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="city"
								value="<%=employee.getCity()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-2 control-label">State</label>
						<div class="col-sm-5">
							<select class="form-control select2" id="state" name="state" value="<%=employee.getState()%>"><option>select
											States</option></select>
						</div>
					</div>
					<div class="form-group">
						<label for="country" class="col-sm-2 control-label">Country</label>
						<div class="col-sm-5">
							<select class="form-control" id="country" name="country" value="<%=employee.getCountry() %>" ></select>
						</div>
					</div>
					<div class="form-group">
						<label for="address_line1" class="col-sm-2 control-label">Address
							Line1</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="address_line1"
								value="<%=employee.getAddress_line1()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="address_line2" class="col-sm-2 control-label">Address
							Line2</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="address_line2"
								value="<%=employee.getAddress_line2()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="zip" class="col-sm-2 control-label">Zip Code</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="zip"
								value="<%=employee.getZip()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="designation" class="col-sm-2 control-label">Designation</label>
						<div class="col-sm-5">
							<select class="form-control" name="designation">
								<option>Select Designation</option>
								<%
									Desig desig;
									for (int i = 0; i < desigList.size(); i++) {
										
										desig = desigList.get(i);
										String selected = "";
										int dId = Integer.parseInt(employee.getDesignation());
										System.out.println("sys "+desig.getId()+","+dId);
										if(desig.getId() == dId)
											selected = "selected";
								%>
								<option value="<%=desig.getId()%>" <%=selected %>><%=desig.getDesig_value() + " - "+ desig.getDesig_value()%></option>
								<%
									}
								%>
							</select>
							<!-- <input type="text" class="form-control" name="designation"
								value="<= employee.getDesignation() %>"> -->
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="email"
								value="<%=employee.getEmail()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">Phone
							Number</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="phone"
								value="<%=employee.getPhone()%>">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<!-- <button type="button" id="saveBtn" class="btn btn-primary" onClick="javascript:submitFormAllValues(this.form,'<%=postUrl+"cmd="+CMD.UPDATE+"&recid="+employee.getId()%>')">Save changes</button>
                             -->
					                             <button type="submit" id="saveBtn" class="btn btn-primary fl fl-topLD fl-right-2"><i class="fa fa-save"></i> Save changes</button>
			    <button type="reset" id="cancelBtn" class="btn fl fl-topLD fl-right" onClick="javascript:getAjaxHtml('<%=divName%>', '<%=baseUrl%>');">Cancel</button>
						</div>
					</div>
					<input type="hidden" id="url" name="url" value="/employees/default_profile.png"/>
				</form> --%>
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
$(document).ready(function() {
	if(<%=employee.getSex()%>==0){
		$("#male").prop("checked", true); 	
	}else{
		$("#female").prop("checked", true); 	
	}
	var ToEndDate1= new Date("<%=ddd%>");
	var day1 = ToEndDate1.getDate();
	var month1 = ToEndDate1.getMonth() + 1;
	var year1 = ToEndDate1.getFullYear();
	if (day1 < 10) {
	    day1 = "0" + day1;
	}
	if (month1 < 10) {
	    month1 = "0" + month1;
	}
	var date1 = day1 + "-" + month1 + "-" + year1;


	$('#datepicker1').val(date1);
	//age

		   $('#age').val(<%=employee.getAge()%>);


			var ToEndDate = new Date();
			ToEndDate.setFullYear(new Date().getFullYear()-18);

	$('#datepicker').datepicker({
		endDate:ToEndDate,
	});
	});
	
var dob = $('#datepicker').datepicker({
	  onRender: function(date) {
		  console.log(date);
	    return date.valueOf() < now.valueOf() ? 'disabled' : '';
	  }
	}).on('changeDate', function(ev) {
		var currentDate = new Date();
	    var selectedDate = new Date(ev.date.toString());
	    var age = currentDate.getFullYear() - selectedDate.getFullYear();
	    var m = currentDate.getMonth() - selectedDate.getMonth();

	    if (m < 0 || (m === 0 && currentDate.getDate() < selectedDate.getDate())) {
	        age--;
	    }

	   $('#age').val(age);
		/* console.log(ev.date.valueOf()); */
		/* console.log(checkout.date.valueOf()); */
	 /*  if (ev.date.valueOf() > checkout.date.valueOf()) { */
		  if (ev.date.valueOf()) {
		  console.log(ev);
		  
	    var newDate = new Date(ev.date)
	    newDate.setDate(newDate.getDate() + 1);
	    /* checkout.setValue(newDate); */
	  }
	  dob.hide();
	  $('#datepicker')[0].focus();
	}).data('datepicker');
	
$(document).ready(function() {
	console.log('form validate');
	$('#edit-form').validate({ // initialize the plugin
        rules: {
            name: {
                required: true
            },
            sex: {
                required: true
            },
            city: {
                required: true
            },
            state: {
                required: true
            },
            country: {
                required: true
            },
            address_line1: {
                required: true
            },
            /* address_line2: {
                required: true
            }, */
            zip: {
                required: true,
                digits : true
            },
            type: {
                required: true
            },
            email: {
                required: true,
                email : true
            },
            phone: {
                required: true,
               /*  digits : true */
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
            sex: {
                required: "Enter Sex"
            },
            city: {
                required: "Enter City name"
            },
            state: {
                required: "Enter State"
            },
            country: {
                required: "Enter Country"
            },
            address_line1: {
                required: "Enter Address"
            },
            /* address_line2: {
                required: "Enter the Address"
            }, */
            zip: {
                required: "Enter Zip code",
                digits : "Invalid Zip code"
            },
            type: {
                required: "Enter Designation"
            },
            email: {
                required: "Enter Email",
                email : "Invalid Email Address"
            },
            phone: {
                required: "Enter Phone Number",
              /*   digits : "Invaild Phone Number" */
            }
        },
        submitHandler: function(form) {
         	/* if($("#female").prop("checked")){
        		alert($("#female").prop("checked"));
				$('#url').val("/employees/female-profileFemale.png");
        	} */
            console.log("no error");
        	 console.log("no error");
             if($('[name="type"].btn-primary').attr('id')=="1"){
 				
 				//Url split
 			url=$('#url').val();
 			urlSplit=url.split("/");
 			urlLength=urlSplit.length;
 			imgUrl=<%=AppUrl.Img%>;
 			url1="";
 			for(i=imgUrl;i>0;i--){
 			url1+="/"+url.split("/")[urlLength-i]
 			}
 			$('#url').val(url1);
 			console.log(url1);
 			console.log(imgUrl);
 			alert(url1);
 			
 			//thumbUrl Split
 			thumbUrl=$('#thumbUrl').val();
 			thumbUrlSplit=thumbUrl.split("/");
 			thumbUrlLength=thumbUrlSplit.length;
 			thumbImgUrl=<%=AppUrl.thumbImg%>;
 			thumbUrl1="";
 			for(i=thumbImgUrl;i>0;i--){
 				thumbUrl1+="/"+thumbUrl.split("/")[thumbUrlLength-i]
 			}
 			$('#thumbUrl').val(thumbUrl1);
 			console.log(thumbUrl1);
 			console.log(thumbImgUrl);
 			alert(url1);
 			}
             if($('#url').val()==""){
            	 alert("Please upload image");  
               }else{
              submitFormAllValues(form,'<%=postUrl+"cmd="+CMD.UPDATE+"&recid="+employee.getId()%>');
               }
            <%-- submitFormAllValues(form,'<%=postUrl%>'); --%>
											}
										});

					});
</script>
<script>
$(window).scrollTop(0);
/* scroll */
$('#cancelBtn').hide();
$(window).scroll(function(e){ 
	  if ($(this).scrollTop() > 20){ 
	    $('#saveBtn').css({'top': '60'});
	    $('#cancelBtn').css({'top': '60'});
	    $('#backBtn').css({'top': '60'});
	  }
	  if ($(this).scrollTop() < 20)
	  {
	    $('#saveBtn').css({'top': '100'});
	    $('#cancelBtn').css({'top': '100'});
	    $('#backBtn').css({'top': '100'});
	  }
	});
</script>
<script>
$().ready(function() {
	// Selecting the form and defining validation method
	$("#file-form").validate({
		// Passing the object with custom rules
		rules : {
			// login - is the name of an input in the form
		file_source : {
			required : true
	},
		},
		errorPlacement: function(error, element) {
			     error.insertAfter( $('#div') );
		  },
		messages : {
			file_source : {
				required : "No Images Found"
			},

		},
		// Setting submit handler for the form
		submitHandler : function(form) {
			var type=file_source.value;
			type=type.split('.').pop();
		 if(type != 'png' && type != 'jpg' && type != 'gif' && type != 'jpeg' && type != 'bmp') {
				 alert("Please upload image only");
			 }else{
				 console.log("form="+form);
			 
			submitFileWithJson(form,'<%=fileUrl%>');
			 }
		}
	});
});
</script>
<script>

function imgDelete(){
	console.log("hhh");
	<%-- deleteImage(document.getElementById("url"),document.getElementById("thumbUrl"),'<%=deleteUrl%>'); --%>
	$('#div1').removeAttr("style");
	/* $('#div1').removeClass(""); */
	$('#delete').hide();
	$('#upload').show();
	$('#upload-file-info').val("");
	$('#url').val("");
	$('thumbUrl').val("");
	$('#file_source').val("");
}

$(function() {
	$('#upload').hide();
	//Flat red color scheme for iCheck
	$(
			'input[type="checkbox"].groupCheck, input[type="checkbox"].individualCheck')
			.iCheck({
				checkboxClass : 'icheckbox_flat-green',
				radioClass : 'iradio_flat-green'
			});
	//AnyTime
	$("input[id='25']:checkbox").on(
			'ifToggled',
			function() {
				if ($(this).prop('checked')) {
					$("input[name='groupCheck']:checkbox").prop('disabled',
							true);
					$("input[name='groupCheck']:checkbox")
							.iCheck('uncheck');
					$("input[id='26']:checkbox").iCheck('uncheck');
				} else {
					if ($("input[id='26']:checkbox").prop('checked')) {
						$("input[name='groupCheck']:checkbox").prop(
								'disabled', true);
					} else {
						$("input[name='groupCheck']:checkbox").prop(
								'disabled', false);
					}
				}
			});
	//AllTime
	$("input[id='26']:checkbox").on(
			'ifToggled',
			function() {
				if ($(this).prop('checked')) {
					$("input[name='groupCheck']:checkbox")
							.iCheck('uncheck');
					$("input[name='groupCheck']:checkbox").prop('disabled',
							true);
					$("input[id='25']:checkbox").iCheck('uncheck');
				} else {
					if ($("input[id='25']:checkbox").prop('checked')) {
						$("input[name='groupCheck']:checkbox").prop(
								'disabled', true);
					} else {
						$("input[name='groupCheck']:checkbox").prop(
								'disabled', false);
					}
				}
			});
});
function reset() {
	$(
			'input[type="checkbox"].groupCheck, input[type="checkbox"].individualCheck')
			.iCheck('uncheck');
}
</script>   