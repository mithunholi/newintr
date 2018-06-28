<%@page import="com.eoxys.Model.CUserRole"%>
<%@page import="java.util.List"%>
<%
	System.out.println("NEW USER JSP");
	List<CUserRole> roleList = (List<CUserRole> ) request.getAttribute("roleList");
	String[] cusTypes = (String[] ) request.getAttribute("cusType");
	String logUrl = request.getContextPath() + "/login";
	String regUrl = request.getContextPath() + "/submit";
	String roleUrl = request.getContextPath() + "/roleDropListById?";
	System.out.println("role Size "+roleList.size()+","+cusTypes.length);
	System.out.println("FFFF");
	boolean loggedIn=false;
%>

<style>
body {
	background: #DCDCDC !important
}
</style>

<header>
	<div class="container">
		<div style="padding-top: 120px; padding-bottom: 50px;">
			<div class="row">
				<!-- <div class="col-sm-9">
					<div class="intro-lead-in">Welcome To Our Eoxys!</div>
					<div class="intro-heading">It's Nice To Meet You</div>
					<a href="#services" class="page-scroll btn btn-xl">Tell Me More</a>
				</div> -->
				<%
					if (!loggedIn) {
				%>
				<div class="col-md-8 col-md-offset-2" style="border: 1px solid #FFF">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="section-heading">Login</h2>
						</div>

					</div>
					<form id="new-form" class="form-horizondal" role="form"
						method="POST">

						<fieldset>
							<legend style="color: #428BCA">Account Info</legend>
							<div class="row">
								<div class="form-group col-sm-6">
									<!-- 	<label for="phone" class="control-label">Want to become..</label> -->
									<div class="btn-group" style="display: block">
										<button type="button"
											class="form-control btn btn-default dropdown-toggle"
											data-toggle="dropdown" id="register_type_display">
											Want to become...<span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu" id="register_type">
											<%
												for (int i = 0; i < cusTypes.length; i++) {
																							String roles = cusTypes[i];
											%>
											<li><a
												href="javascript:regSelected('<%=roles%>','<%=i%>')"><%=roles%></a></li>
											<%-- <option value="<%=i%>"><%=roles%>
												</option> --%>
											<%
												}
											%>
											<!-- <li><a href="#">small</a></li>
										<li><a href="#">medium</a></li>
										<li><a href="#">large</a></li> -->
										</ul>
										<input type="hidden" id="register_type_value" name="register_type_value" value="">
									</div>
								</div>
								<div class="form-group col-sm-6">
									<!-- <label for="phone" class="control-label">Role..</label> -->
									<div class="btn-group" style="display: block">
										<button type="button"
											class="form-control btn btn-default dropdown-toggle"
											data-toggle="dropdown" id="role_type_display">
											Role...<span class="caret"></span>
										</button>
										<input type="hidden" id="role_type_value" name="role_type_value" value="">
										<ul class="dropdown-menu" role="menu" id="role_type">
										<li><a >Empty</a></li>
										
										</ul>
									</div>
								</div>
								<div class="form-group col-sm-6" id="name">
									<label for="phone" class="control-label">First Name</label>
									<div>
										<input class="form-control" placeholder="Name" name="first_name"
											type="text" value="">
									</div>
								</div>
								<div class="form-group col-sm-6" id="last_name">
									<label for="phone" class="control-label">Last Name</label>
									<div>
										<input class="form-control" placeholder="Last Name"
											name="last_name" type="text" value="">
									</div>
								</div>

							</div>

						</fieldset>
						<div class="clrSpace"></div>
						<fieldset>
							<legend style="color: #428BCA">Personal Info</legend>
							<div class="row">
								<div class="form-group col-sm-4">
									<label for="phone" class="control-label">Country</label>
									<div>
										<select class="form-control" id="country" name="country"></select>
										<!-- 	<input class="form-control" placeholder="Country" name="country"
					type="text" value=""> -->
									</div>
								</div>
								<div class="form-group col-sm-4">
									<label for="phone" class="control-label">State</label>
									<div>
										<select class="form-control" id="state" name="state"></select>
										<!-- <input class="form-control" placeholder="State" name="state"
					type="text" value=""> -->
									</div>
								</div>
								<div class="form-group col-sm-4" id="city">
									<label for="phone" class="control-label">City</label>
									<div>
										<input class="form-control" placeholder="City" name="city"
											type="text" value="">
									</div>
								</div>
								<div class="form-group col-sm-4" id="address_line1">
									<label for="phone" class="control-label">Address Line1</label>
									<div>
										<input class="form-control"
											placeholder="Eg: Street address, P.O.box, Company name, c/o"
											name="address_line1" type="text" value="">
									</div>
								</div>
								<div class="form-group col-sm-4" id="address_line2">
									<label for="phone" class="control-label">Address Line2</label>
									<div>
										<input class="form-control"
											placeholder="Eg: Apartment, suite, unit, building, floor, etc"
											name="address_line2" type="text" value="">
									</div>
								</div>
								<div class="form-group col-sm-4" id="zip">
									<label for="phone" class="control-label">Zip</label>
									<div>
										<input class="form-control" placeholder="Zip" name="zip"
											type="text" value="">
									</div>
								</div>
								
							</div>

						</fieldset>
						<div class="text-center">
							<h2>
								<button type="submit" class="btn btn-lg btn-info">
									<i class="fa fa-thumbs-up"></i> Get Started
								</button>
							</h2>

						</div>
					</form>
					<%-- <div id="respDiv" align="center">
						<i id="iconDiv"></i>
						<%
							if (msg.equals("goodbye")) {
						%>
						<div id="respDiv2" class="alert alert-success"
							style="background-color: rgba(167, 240, 168, 0.61)">
							<i class="fa fa-check-circle"></i> Successfully logged out
						</div>
						<%
							} else if (msg.equals("error")) {
						%>
						<div id="respDiv2" class="alert alert-warning"
							style="background-color: rgba(240, 233, 134, 0.63)">
							<i class="fa  fa-warning"></i> Please You First Login
						</div>
						<%
							} else if (msg.equals("auth-error")) {
						%>
						<div id="respDiv2" class="alert alert-danger"
							style="background-color: rgba(197, 45, 47, 0.25)">
							<i class="fa  fa-user-times"></i> Unauthorized: Authorization
							failed
						</div>
						<%
							}
						%>
					</div> --%>

				</div>
				<%
					} else {
				%>
				<div class="col-sm-3" style="border: 1px solid #FFF">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="section-heading">Already Loggedin</h2>
						</div>

					</div>
					<div class="row">
						<div class="col-lg-5 text-center">
							<div class="col">
								<!-- Change this to a button or input when using this as a form -->
								<%-- <button onclick="window.location='<%=goToUrl%>'" class="btn btn-lg btn-info btn-block">
									Go to App <i class="fa fa-sign-in"></i>
								</button> --%>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>

				<!-- </div> -->
			</div>
		</div>
</header>

<script src="<%=request.getContextPath()+"/resources/js/req.js"%>"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/countries.js"></script>

<script>
populateCountries("country", "state");
/* $(document).ready(function() {
	$('#role_type a').on('click', function(e){    
	    console.log(e);
	});
	$('#register_type a').on('click', function(e){    
	    console.log(e);
	});
	
}); */

function roleSelected(display,val){
	console.log(" roleSelected val "+val);
	
	 $('#role_type_display').html(display+'<span class="caret"></span>'); 
	 $('#role_type_value').val(val);
}
function regSelected(display,val){
	console.log("opop===========");
	console.log("val "+val);	
	 $('#register_type_display').html(display+'<span class="caret"></span>');
	 $('#register_type_value').val(val);
	 getRoleByCusType(val);
}

function getRoleByCusType(cusId){
	var sucCB = function(res){
		console.log("fsddvghdvb");
		if(res.result){
			var result = res.result;
			console.log(result)
			console.log(result)
			if( typeof result == 'array'){
				console.log("array")
			}
			console.log(typeof result == 'array');
			var roleListHtml="";
			
			for(var i=0;i<result.length;i++){
				console.log(result[i].id);
				console.log("'javascript:roleSelected('"+result[i].display+"','"+result[i].id+"')'");
				roleListHtml+="<li><a href='javascript:roleSelected(\""+result[i].display+"\",\""+result[i].id+"\")'>"+result[i].display+"</a></li>";
				console.log("output================"+roleListHtml);
			}
			$('#role_type').html(roleListHtml);
		}
	}
	requestWithCallBack('<%=roleUrl%>roleId=' + cusId, sucCB);

	}
	
$().ready(function() {
	console.log("dgfbd")
	// Selecting the form and defining validation method
	$("#new-form").validate({
		// Passing the object with custom rules
		rules : {
			// login - is the name of an input in the form
			first_name : {
				required : true
			},
			last_name : {
				required : true
			},
		/* 	register_type_value : {
				required : true,
			},
			role_type_value : {
				required : true,
			}, */
			city: { required: true },
			state: { required: true },
			country: { required: true },
			address_line1: {required: true }, 
			/* address_line2: { required: true }, */
			zip: {required: true, digits : true }
			
			
		},
		errorPlacement : function(error, element) {
			console.log("fghjj")
			console.log(error);
			console.log(element.attr("name"));
			if (element.attr("name") == "username") {
				error.insertAfter($('#Userspan'));
			} else if (element.attr("name") == "password") {
				error.insertAfter($('#Pwdspan'));
			} else {
				error.insertAfter(element);
			}
		},
		// Setting error messages for the fields
		messages : {
			password : {
				required : "Enter your password"
			},
			username : {
				required : "Enter your email"
			}
		},
		// Setting submit handler for the form
		submitHandler : function(form) {
			console.log("submit")
			if ($("#register_type_value").val()==''||$("#role_type_value").val()=='') {
				alert("Please Select Type and role");
			}else{
				submitFormAllValues(form, '<%=regUrl%>');	
			}
			
		}
	});
});
	
</script>
<%-- <script>   
$(document).ready(function() { console.log('form validate');
$('#new-form').validate({ // initialize the plugin rules: { type: {
required: true }, name: { required: true }, city: { required: true },
state: { required: true }, country: { required: true }, address_line1: {
required: true }, /* address_line2: { required: true }, */ zip: {
required: true, digits : true }, phone: { required: true, digits : true
} }, messages: { type: { required: "Type is needed" }, name: { required:
"Enter name" }, city: { required: "Enter City name" }, state: {
required: "Enter State" }, country: { required: "Enter Country" },
address_line1: { required: "Enter Address" }, /* address_line2: {
required: "Enter the Address" }, */ zip: { required: "Enter Zip code",
digits : "Invalid Zip code" }, phone: { required: "Enter Phone Number",
digits : "Invaild Phone Number" } }, submitHandler: function(form) {
console.log("no error"); submitForm(form,'<%=regUrl%>'); } }); });
</script> --%>