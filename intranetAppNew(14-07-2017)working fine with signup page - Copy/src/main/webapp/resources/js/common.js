/* the below code is to override back button to get the ajax content without page reload*/
/*$(window).bind('popstate', function() {

	if (confirm('This will not preferable, Do you want to continue ?') == true)
		{
	if(location.pathname=="/Bumper_Glass/dashboard"){
		//$.load(location.pathname);
		location.reload();
	}else{
		location.reload();
		$.ajax({url:location.pathname,success: function(data){
			console.log(location.pathname);
			$('#content-wrapper').html(data);

		}});
	}
		}
});*/
	window.onpopstate = function(e) {
		if(location.pathname=="/Bumper_Glass/dashboard" || location.pathname=="/Bumper_Glass/deviceOwner_dashboard" || location.pathname=="/Bumper_Glass/advertiser_dashboard" ){
			//$.load(location.pathname);
			location.reload();
		}else{
			if($('.sidebar-menu').length==0){
				location.reload();
			}else{
			console.log($('.sidebar-menu').length);
			menuInit('.sidebar');
			$('li.active').removeClass('active');
			addMenu(location.pathname);
			console.log(location.pathname);
				$('#content-wrapper').html(e.state.data);
			}
		}
	};
	function addMenu(url){
		console.log($('.side-adm').length);
		console.log($('.side-dev').length);
		/*admin*/
		if($('.side-adm').length > 0){
			console.log('adm');
			if ( url.indexOf("employees") > -1 ) {
				$('#emp').addClass('active');
			}else if( url.indexOf("users") > -1 ){
				$('#users').addClass('active');
			}else if(url.indexOf("advertisers") > -1 ){
				$('#adv').addClass('active');
			}else if(url.indexOf("deviceOwners") > -1 ){
				$('#dev').addClass('active');
			}
			/*deviceOwners*/
		}else if($('.side-dev').length > 0){
			console.log('dev');
			console.log(url.indexOf("myProfile"));
			console.log(url.indexOf("myDevice"));
		 if( url.indexOf("myProfile") > -1 ){
				$('#dmyPro').addClass('active');
			}else if(url.indexOf("myDevice") > -1 ){
				$('#dmyDev').addClass('active');
			}else if(url.indexOf("myImages") > -1 ){
				$('#dmyImg').addClass('active');
			}
				/*advertiser*/
		}else if($('.side-adv').length > 0){
			if( url.indexOf("myProfile") > -1 ){
				$('#dmyPro').addClass('active');
			}else if(url.indexOf("myCampaigns") > -1 ){
				$('#dmycamp').addClass('active');
			}
		}
	}
/*$(window).on('beforeunload', function(){
    // your logic here
	location.pathname="/Bumper_Glass/dashboard";
	location.reload();
	//alert( "reload?." );
});*/
$(window).on('load', function(){
	/*$('#loader').modal('show');*/
	menuInit('.sidebar');
});
$(window).bind('load', function(){
	/*$('#loader').modal('hide');*/
});
function menuInit(mid) {
	var _this = this;
	var animationSpeed = 500; //$.AdminLTE.options.animationSpeed;
	$("li a", $(mid)).on('click', function (e) {
		//Get the clicked link and the next element
		console.log("clicked1");
		var $this = $(this);
		var curElement = $this;
		var nxtElement = $this.next();

		//Check if the next element is a menu and is visible
		if ((nxtElement.is('.treeview-menu')) && (nxtElement.is(':visible'))) {
			//Close the menu
			nxtElement.slideUp(animationSpeed, function () {
				nxtElement.removeClass('menu-open');
				//Fix the layout in case the sidebar stretches over the height of the window
				//_this.layout.fix();
			});
			nxtElement.parent("li").removeClass("active");
		}
		//If the menu is not visible
		else if ((nxtElement.is('.treeview-menu')) && (!nxtElement.is(':visible'))) {
			//Get the parent menu
			var parent = $this.parents('ul').first();
			//Close all open menus within the parent
			var ul = parent.find('ul:visible').slideUp(animationSpeed);
			//Remove the menu-open class from the parent
			ul.removeClass('menu-open');
			//Get the parent li
			var parent_li = $this.parent("li");

			//Open the target menu and add the menu-open class
			nxtElement.slideDown(animationSpeed, function () {
				//Add the class active to the parent li
				nxtElement.addClass('menu-open');
				parent.find('li.active').removeClass('active');
				parent_li.addClass('active');
				//Fix the layout in case the sidebar stretches over the height of the window
				_this.layout.fix();
			});
		}
		console.log(curElement);
		if ((!curElement.is('.treeview-menu')) && (curElement.is(':visible'))) {
			console.log("A");
			//Get the parent menu
			var parent = $this.parents('ul').first();
			//Close all open menus within the parent
			var ul = parent.find('ul:visible').slideUp(animationSpeed);
			//Remove the menu-open class from the parent
			ul.removeClass('menu-open');
			//Get the parent li
			var parent_li = $this.parent("li");

			//Open the target menu and add the menu-open class
			//nxtElement.slideDown(animationSpeed, function () {
			//Add the class active to the parent li
			nxtElement.addClass('menu-open');
			parent.find('li.active').removeClass('active');
			parent_li.addClass('active');
			//curElement.addClass("active");
			//});
		}else if ((!curElement.is('.treeview-menu')) && (!curElement.is(':visible'))) {
			console.log("B");
			//nxtElement.parent("li").addClass("active");
			curElement.addClass("active");
		}
		//if this isn't a link, prevent the page from being redirected
		if (nxtElement.is('.treeview-menu')) {
			e.preventDefault();
		}
	});
};
function addHistory(response,urlstring){
	 var pageurl=urlstring;
		console.log(pageurl+", "+window.location);
		//Change the browser URL 
		if(pageurl!=window.location){
			win_loc=""+window.location;
			console.log(response);
			pageurl1="";
			pageUrlSplit=pageurl.split("/");
			splitUrl=win_loc.split("#");
			if(splitUrl.length>1){
				win_loc=splitUrl[0];
			}
			window.history.pushState({data:response},'',win_loc+"#"+pageurlSplit[pageurlSplit.length-1]+(new Date).getTime());
		}
}
function getAjaxMenuHtml(divId, urlstring) {
	/*$('#loader').modal('show');*/
	$('#search-term-form').attr("hidden","");
	urlstring = urlstring+"?page=1";
	console.log("Div :"+divId + " url= "+urlstring);
	$.ajax({
		type: "POST",
		url: urlstring,
		success: function(response) {
			$('#loader').modal('hide');
			console.log(response);
			$('#'+divId).html(response);
			var pageurl=urlstring;
			console.log(pageurl+", win===="+window.location);
			//Change the browser URL 
			if(pageurl!=window.location){
				window.history.pushState({data:response},'',pageurl);
			}
			//$('#notification-bar').text('The page has been successfully loaded');
			//DHTML
		},
		error: function() {
			/*$('#loader').modal('hide');*/
			console.log("An error occurred");
			//$('#notification-bar').text('An error occurred');
		},
		timeout: 20000
	});

	/*$.post( urlstring, function( response ) {
	    	  $( '#'+divId ).html( response );
	    	});*/
}
function getAjaxHtml(divId, urlstring) {
	console.log("Div :"+divId + " url= "+urlstring);
	$('#search-term-form').attr("hidden","");
	$.ajax({
		type: "POST",
		url: urlstring,
		success: function(response) {
			console.log(response);
			$('#'+divId).html(response);
			var pageurl=urlstring;
			console.log(pageurl+", "+window.location);
			//Change the browser URL 
			if(pageurl!=window.location){
				console.log(response);
				win_loc=""+window.location;
				pageurlSplit=pageurl.split("/");				
				splitUrl=win_loc.split("#");
				if(splitUrl.length>1){
					win_loc=splitUrl[0];
				}
				window.history.pushState({data:response},'',win_loc+"#"+pageurlSplit[pageurlSplit.length-1]+(new Date).getTime());
			}
			//$('#notification-bar').text('The page has been successfully loaded');
		},
		error: function() {
			console.log("An error occurred");
			//$('#notification-bar').text('An error occurred');
		},
		timeout: 20000
	});

	/*$.post( urlstring, function( response ) {
    	  $( '#'+divId ).html( response );
    	});*/

}
function getAjaxHtmlModal(divId, urlstring) {
    console.log("Div :"+divId + " url= "+urlstring);
    $.ajax({
    	type: "POST",
    	url: urlstring,
        success: function(response) {
            console.log(response);
            $("#htmlModal").html(response).modal({keyboard: true});
          /* addHistory(response,urlstring);*/
            //$('#notification-bar').text('The page has been successfully loaded');
        },
        error: function() {
            console.log("An error occurred");
            //$('#notification-bar').text('An error occurred');
        },
        timeout: 20000
   });

    /*$.post( urlstring, function( response ) {
    	  $( '#'+divId ).html( response );
    	});*/

}
function getHtmlPage(urlstring)
{
	window.location.href = urlstring;
}

function getAjaxHtmlGet(divId, urlstring) {
	console.log("Div :"+divId + " url= "+urlstring);
	$.ajax({
		type: "GET",
		url: urlstring,
		success: function(response) {
			console.log(response);
			$('#'+divId).html(response);
			//$('#notification-bar').text('The page has been successfully loaded');
		},
		error: function() {
			console.log("An error occurred");
			//$('#notification-bar').text('An error occurred');
		},
		timeout: 20000
	});

	/*$.post( urlstring, function( response ) {
    	  $( '#'+divId ).html( response );
    	});*/

}
function getAjaxJson(divId, urlstring, row) { 
/*	$('#loader').modal('show');*/
	$('#search-term-form').attr("hidden","");
	console.log("Div :"+divId + " url= "+urlstring);
	$.ajax({
		type: 'POST',
		url: urlstring,
		success: function(response) {
			/*$('#loader').modal('hide');*/
			console.log('Successfully submitted form');
			console.log(response);
			//$('#'+divId).html(response);
			var resp=$.parseJSON(response);
			if(resp.type=="pass"){
				if(row){
					$('#'+row).addClass("animated shake start");	
				}
				$('#respDiv').css({"visibility":"visible", "color":"black"});
				$('#respDiv').addClass("alert alert-success");
				$('#respDiv').fadeIn(40).delay(2000).fadeOut(400);
				$('#saveBtn').hide();
				$('#cancelBtn').html("back");
			}else{
				$('#respDiv').css({"visibility":"visible", "color":"#990000"});
				$('#respDiv').addClass("alert alert-danger");
				$('#respDiv').fadeIn(40).delay(2000).fadeOut(400);
			}        
			$('#respDiv').html(resp.msg);
			if(resp.act!=""){
				setTimeout(function(){
            		getAjaxHtml('content-wrapper', resp.act);
            		}, 1000);
			}
			//$('#notification-bar').text('The page has been successfully loaded');
		},
		error: function() {
			$('#loader').modal('hide');
			console.log("An error occurred");
			//$('#notification-bar').text('An error occurred');
			$('#respDiv').css({"visibility":"visible", "color":"red"});
			$('#respDiv').html("Action Failed");
		},
		timeout: 20000
	});
}
function submitForm(divId,postUrl)
{
	var data = $('#'+divId).serialize();
	// console.log('Hello');
	console.log('ser data= '+data);
	/*$.post(postUrl,data,success = function(){    
                        location.reload();   }
                    );*/
	$('#'+divId).submit();
}
function submitFormElement(divId,postUrl)
{
	console.log(divId);
	var data = $(divId).serialize();
	// console.log('Hello');
	console.log('ser data= '+data);
	/*$.post(postUrl,data,success = function(){    
                        location.reload();   }
                    );*/
	$(divId).submit();
}
function submitFormWithJson(divId,postUrl)
{
	/*$('#loader').modal('show');*/
	$('#search-term-form').attr("hidden","");
	var data = $('#'+divId).serialize();
	// console.log('Hello');
	console.log('ser data= '+data);
	/*$.post(postUrl,data,success = function(){    
                        location.reload();   }
                    );*/
	$('#respDiv').css({"visibility":"hidden"});
	$.ajax(
			{
				type: 'POST',
				url: postUrl,
				data: data, //your form datas to post          
				success: function(response)
				{
					/*$('#loader').modal('hide');*/
					console.log('Successfully submitted form');
					console.log(response);
					var resp=$.parseJSON(response);
					console.log(resp);
					if(resp.type=="html")
					{

						getHtmlPage(resp.act);



					}
					else{
						if(resp.type=="pass"){
							console.log('if');
							$('#respDiv').attr('style','');
							$('#respDiv').css({"visibility":"visible", "color":"black"});
							$('#respDiv').addClass("alert alert-success");
							$('#iconDiv').addClass("fa fa-check-circle");
							$('#respDiv').fadeIn(40).delay(2000).fadeOut(400);
							//$('#saveBtn').css({"display": "none"});
							$('#saveBtn').hide();
							$('#cancelBtn').html("back");
						}else{
							console.log('else');
							$('#respDiv').css({"visibility":"visible", "color":"#990000"});
							$('#respDiv').addClass("alert alert-danger");
							$('#iconDiv').addClass("fa fa-warning");
							$('#respDiv').fadeIn(40).delay(2000).fadeOut(400);
						}
						$('#respDiv').html(resp.msg);
						if(resp.act!=""){
							setTimeout(function(){
			            		getAjaxHtml('content-wrapper', resp.act);
			            		}, 1000);
						}

					}
				},
				error: function()
				{
					/*$('#loader').modal('hide');*/
					console.log('Failed to submit form');
					$('#respDiv').css({"visibility":"visible", "color":"red"});
					$('#respDiv').html("Failed to submit");
					//alert("Failure");
				},
				timeout: 20000
			});
}
function submitFileWithJson(fobj,postUrl)
{
	/*$('#loader').modal('show');*/
	$('#search-term-form').attr("hidden","");
	var myFileList;

	var myFile;

	//mydata = document.getElementById('my_data').value;

	var formData = new FormData();

	for(var i = 0;i < fobj.elements.length;i++)

	{

		//alert(fobj.elements[i].type);	

		switch(fobj.elements[i].type)

		{

			case "text":

				//alert(fobj.elements[i].name+"::"+escape(fobj.elements[i].value));

				formData.append(fobj.elements[i].name,escape(fobj.elements[i].value));

				break;

			case "textarea":

				formData.append(fobj.elements[i].name,escape(fobj.elements[i].value));

				break;



			case "select-one":



				formData.append(fobj.elements[i].name, fobj.elements[i].options[fobj.elements[i].selectedIndex].value);

				break;

			

			case "hidden":

				//alert("Name :"+fobj.elements[i].name+":Value :"+fobj.elements[i].value);

				formData.append(fobj.elements[i].name,escape(fobj.elements[i].value));

				break;

			case "button":

				//alert("Name :"+fobj.elements[i].name+":Value :"+fobj.elements[i].value);

				formData.append(fobj.elements[i].name,escape(fobj.elements[i].value));



				if(fobj.elements[i].value=="Update"){

					//var btn = "'"+ fobj.elements[i].name +"'";

					document.getElementById('btnedit').style.visibility='hidden';

				}

				if(fobj.elements[i].value=="Save"){

					//var btn = "'"+ fobj.elements[i].name +"'";

					document.getElementById('btnAdd').style.visibility='hidden';

				}

				break;

			case "checkbox":

				//alert("SS :"+ fobj.elements[i].name);

				if(fobj.elements[i].checked == true){

					formData.append(fobj.elements[i].name,escape(fobj.elements[i].value));

					//alert("True");

				}else{

					formData.append(fobj.elements[i].name,"");

				}

				break;

			case "file":

				//alert("Element :"+fobj.elements[i].name+"::"+escape(fobj.elements[i].files));

				myFileList=fobj.elements[i].files;

				myFile = myFileList[0];

				//alert("File :"+myFile.name);

				//alert("File Name :"+fobj.elements[i].name);

				formData.append(fobj.elements[i].name,myFile);

				break;

		}//switch

	}//for
	console.log(formData);
	$('#respDiv').css({"visibility":"hidden"});
	$.ajax(
			{	
		        type: 'POST',
                url: postUrl,
                data : formData,
                cache: false,
                contentType: false,
                processData: false,
			/*	beforeSend: function(ajaxOptions){
					var xhr = new XMLHttpRequest();
					xhr.open("POST", postUrl,true);
					xhr.send(formData);
					console.log("XHR Status = "+xhr.status);
                    console.log("AjaxOptions = "+ajaxOptions);
					
				},*/
				success: function(response)
				{
					/*$('#loader').modal('hide');*/
					console.log('Successfully submitted form');
					console.log(response);
					var resp=$.parseJSON(response);
					var respDiv=resp.div;
					console.log(resp.url);
					console.log(resp.div);
						if(resp.type=="pass"){
							console.log('personal file');
							//personal msg upload
							if(resp.div == "div1"){
								console.log("1");
								$('#upload').hide();
								$('#delete').show();	
								$('#'+respDiv).attr('src',resp.thumbUrl);
								$('#'+respDiv).fadeOut();
								$('#'+respDiv).fadeIn();
								$('#url').val(resp.url);
								$('#thumbUrl').val(resp.thumbUrl);
							}else if(resp.div == ""){
								console.log("2");
								label1:
								for(i=1;i<=5;i++){
									label2:
										//close
									if($('#url'+i).val()==""){
										$('#div'+i).show();							
										$('#div'+i).attr('style','width:100px; height:100px; background:no-repeat; background:url('+resp.thumbUrl+'); background-size:cover;background-position:center;border-radius: 2px;margin-left:55px;margin-top:5px;box-shadow:1px 1px 1px 1px rgba(0, 0, 0, 0.19), 1px 1px 1px 1px rgba(0, 0, 0, 0.19)');
										$('#div'+i).fadeOut("slow");
										$('#div'+i).fadeIn("slow");
										$('#url'+i).val(resp.url);
										$('#thumbUrl'+i).val(resp.thumbUrl);
										$('#upload-file-info').val("");
										$('#file_source').val("");
										break label1;
										break label2;
									}
								}
							}else if(resp.div == "nxt_div"){
								console.log("3");
								label3:
									for(i=1;i<=5;i++){
										label4:
											//far
										if($('#nxt_url'+i).val()==""){
											$('#nxt_div'+i).show();							
											$('#nxt_div'+i).attr('style','width:100px; height:100px; background:no-repeat; background:url('+resp.thumbUrl+'); background-size:cover;background-position:center;border-radius: 2px;margin-left:55px;margin-top:5px;box-shadow:1px 1px 1px 1px rgba(0, 0, 0, 0.19), 1px 1px 1px 1px rgba(0, 0, 0, 0.19)');
											$('#nxt_div'+i).fadeOut("slow");
											$('#nxt_div'+i).fadeIn("slow");
											$('#nxt_url'+i).val(resp.url);
											$('#nxt_thumbUrl'+i).val(resp.thumbUrl);
											$('#nxt-upload-file-info').val("");
											$('#nextFile_source').val("");
											break label3;
											break label4;
										}
									}
								}else{
									console.log("4");
									label5:
										for(i=1;i<=10;i++){
											label6:
												//serial
											if($('#serial_url'+i).val()==""){
												$('#serial_div'+i).show();
												if(i==6){
												$('#serial_div'+i).attr('style','width:100px; height:100px; background:no-repeat; background:url('+resp.thumbUrl+'); background-size:cover;background-position:center;border-radius: 2px;margin-left:45px;margin-top:25px;box-shadow:1px 1px 1px 1px rgba(0, 0, 0, 0.19), 1px 1px 1px 1px rgba(0, 0, 0, 0.19)');
												}else{
													$('#serial_div'+i).attr('style','width:100px; height:100px; background:no-repeat; background:url('+resp.thumbUrl+'); background-size:cover;background-position:center;border-radius: 2px;margin-left:55px;margin-top:25px;box-shadow:1px 1px 1px 1px rgba(0, 0, 0, 0.19), 1px 1px 1px 1px rgba(0, 0, 0, 0.19)');	
												}
												$('#serial_div'+i).fadeOut("slow");
												$('#serial_div'+i).fadeIn("slow");
												$('#serial_url'+i).val(resp.url);
												$('#serial_thumbUrl'+i).val(resp.thumbUrl);
												$('#serial-upload-file-info').val("");
												$('#serial_file_source').val("");
												break label5;
												break label6;
											}
										}
								}
						}else{
							console.log('else');
							$('#'+respDiv).html(resp.msg);
						}
					},
				error: function()
				{
					/*$('#loader').modal('hide');*/
					console.log('Failed to submit form');
					$('#respDiv').css({"visibility":"visible", "color":"red"});
					$('#respDiv').html("Failed to submit");
					//alert("Failure");
				},
				timeout: 20000
			});
}
function submitFileWithProfile(fobj,postUrl)
{
	/*$('#loader').modal('show');*/
	$('#search-term-form').attr("hidden","");
	var myFileList;

	var myFile;

	//mydata = document.getElementById('my_data').value;

	var formData = new FormData();

	for(var i = 0;i < fobj.elements.length;i++)

	{

		//alert(fobj.elements[i].type);	

		switch(fobj.elements[i].type)

		{
		case "file":

			//alert("Element :"+fobj.elements[i].name+"::"+escape(fobj.elements[i].files));

			myFileList=fobj.elements[i].files;

			myFile = myFileList[0];

			//alert("File :"+myFile.name);

			//alert("File Name :"+fobj.elements[i].name);

			formData.append(fobj.elements[i].name,myFile);

			break;

	}//switch

}//for
console.log(formData);
$('#respDiv').css({"visibility":"hidden"});
$.ajax(
		{	
	        type: 'POST',
            url: postUrl,
            data : formData,
            cache: false,
            contentType: false,
            processData: false,
			success: function(response)
			{
				/*$('#loader').modal('hide');*/
				console.log('Successfully submitted form');
				console.log(response);
				var resp=$.parseJSON(response);
				var respDiv=resp.div;
				console.log(resp.url);
				console.log(resp.div);
				$('#'+resp.div).css('background','url('+resp.url+')');
				$('#url').val(resp.url);
				$('#delete').show();
				$('#upload').hide();
				},
			error: function()
			{
				/*$('#loader').modal('hide');*/
				console.log('Failed to submit form');
				$('#respDiv').css({"visibility":"visible", "color":"red"});
				$('#respDiv').html("Failed to submit");
				//alert("Failure");
			},
			timeout: 20000
		});
}

function submitFormAllValues(fobj,postUrl)
{
	console.log("arrrrrrrrrrrrrrive");
	/*$('#loader').modal('show');*/
	$('#search-term-form').attr("hidden","");
	var str = "";
	var myFileList;
	var myFile;
	var formData;
	//console.log('id='+fobj.id);
	//$('#'+fobj.id).validate();
	var data = $(fobj).serialize();
	console.log('postUrl='+postUrl);
	console.log('ser data= '+data);
	for (var i = 0; i < fobj.elements.length; i++)
	{
		console.log('ele type= '+fobj.elements[i].type);
		switch (fobj.elements[i].type)
		{
		case "text":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i	].value) + "&";
			console.log('txt-value= '+fobj.elements[i].value);
			break;
		case "password":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
			console.log('pwd-value= '+fobj.elements[i].value);
			break;

		case "textarea":
			str += fobj.elements[i].name +"=" + escape(fobj.elements[i].value) + "&";
			console.log('txta-value= '+fobj.elements[i].value);
			break;

		case "select-one":
			str += fobj.elements[i].name +"=" + fobj.elements[i].options[fobj.elements[i].selectedIndex].value + "&";
			console.log('value= '+fobj.elements[i].options[fobj.elements[i].selectedIndex].value);
			break;
		case "hidden":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
			break;
		case "number":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
			break;
		case "date":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
			break;
		case "email":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
		break;
			/*case "button":
                str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";

                if (fobj.elements[i].value === "Update") {
                    //var btn = "'"+ fobj.elements[i].name +"'";
                    document.getElementById('btnedit').style.visibility = 'hidden';
                }
                if (fobj.elements[i].value === "Save") {
                    //var btn = "'"+ fobj.elements[i].name +"'";
                    document.getElementById('btnAdd').style.visibility = 'hidden';
                }
                break;*/
		case "checkbox":
			if (fobj.elements[i].checked == true) {
				str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
				console.log('chk-value= '+fobj.elements[i].value);
			} else {
				str += fobj.elements[i].name + "=" + "" + "&";
			}
			break;
		case "radio":
			if (fobj.elements[i].checked == true) {
				str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
				console.log('radio-value= '+fobj.elements[i].value);
			} else {
				//str += fobj.elements[i].name + "=" + "" + "&";
			}
			break;
		case "file":
			myFileList = fobj.elements[i].files;
			formData.append(fobj.elements[i].name, myFile);
			break;
		}
	}

	str = str.substr(0, (str.length - 1));
	console.log(str);
	//Post Form Data through AJAX
	$('#respDiv').css({"visibility":"hidden"});
	$('#respDiv2').css({"visibility":"hidden"});
	$('#respDiv3').css({"visibility":"hidden"});
	$.ajax(
			{
				type: 'POST',
				url: postUrl,
				data: str, //your form datas to post          
				success: function(response)
				{
					/*$('#loader').modal('hide');*/
					console.log('Successfully submitted form');
					console.log(response);
					var resp=$.parseJSON(response);
					console.log(resp);
					if(resp.type=="html")
					{

						getHtmlPage(resp.act);



					}
					else{
						if(resp.type=="pass"){
							console.log('if');
							$('#respDiv').css({"visibility":"visible", "color":"#FFF","background-color": "rgba(0, 166, 90, 0.77)"});
							$('#respDiv').addClass("alert alert-success roboto");
							$('#iconDiv').addClass("fa fa-check-circle");
							$('#respDiv').fadeIn(40).delay(2000).fadeOut(400);
							//respDiv2
							$('#respDiv2').css({"visibility":"visible", "color":"#FFF"});
							$('#respDiv2').addClass("alert alert-success roboto");
							$('#iconDiv').addClass("fa fa-check-circle");
							$('#respDiv2').fadeIn(40).delay(2000).fadeOut(400);
							//respDiv3
							$('#respDiv3').css({"visibility":"visible", "color":"#FFF"});
							$('#respDiv3').addClass("alert alert-success roboto");
							$('#iconDiv').addClass("fa fa-check-circle");
							$('#respDiv3').fadeIn(40).delay(2000).fadeOut(400);
							//$('#saveBtn').css({"display": "none"});
							$('#saveBtn').hide();
							$('#cancelBtn').html("back");
						}else if(resp.type=="fail"){
							console.log('else');
							$('#respDiv').css({"visibility":"visible", "color":"#990000","background-color":"rgba(225, 177, 177, 0.8)"});
							$('#respDiv').addClass("alert alert-danger roboto");
							$('#iconDiv').addClass("fa fa-warning");
							$('#respDiv').fadeIn(40).delay(2000).fadeOut(400);
							//respDiv2
							$('#respDiv2').css({"visibility":"visible", "color":"#990000"});
							$('#respDiv2').addClass("alert alert-danger roboto");
							$('#iconDiv').addClass("fa fa-warning");
							$('#respDiv2').fadeIn(40).delay(5000).fadeOut(400);
							//respDiv3
							$('#respDiv3').css({"visibility":"visible", "color":"#990000"});
							$('#respDiv3').addClass("alert alert-danger roboto");
							$('#iconDiv').addClass("fa fa-warning");
							$('#respDiv3').fadeIn(40).delay(2000).fadeOut(400);
						}

					$('#respDiv').html(resp.msg);
					$('#respDiv2').html(resp.msg);
					$('#respDiv3').html(resp.msg);
					console.log("bfr acttttttttttttt");
					if(resp.act!=""){
						setTimeout(function(){
							console.log("acttttttttttttt");
		            		getAjaxHtml('content-wrapper', resp.act);
		            		}, 1000);
					}

					}

				},
				error: function()
				{
					/*$('#loader').modal('hide');*/
					console.log('Failed to submit form');
					$('#su').css({"visibility":"visible", "color":"red"});
					$('#respDiv').html("Failed to submit");
					//alert("Failure");
				},
				timeout: 20000
			});


}












function submitProfileValues(fobj,postUrl)
{
	/*$('#loader').modal('show');*/
	$('#search-term-form').attr("hidden","");
	var str = "";
	var myFileList;
	var myFile;
	var formData;
	//console.log('id='+fobj.id);
	//$('#'+fobj.id).validate();
	var data = $(fobj).serialize();
	console.log('postUrl='+postUrl);
	console.log('ser data= '+data);
	for (var i = 0; i < fobj.elements.length; i++)
	{
		console.log('ele type= '+fobj.elements[i].type);
		switch (fobj.elements[i].type)
		{
		case "text":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i	].value) + "&";
			break;
		case "password":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
			break;

		case "textarea":
			str += fobj.elements[i].name +
			"=" + escape(fobj.elements[i].value) + "&";
			break;

		case "select-one":
			str += fobj.elements[i].name +
			"=" + fobj.elements[i].options[fobj.elements[i].selectedIndex].value + "&";
			break;
		case "hidden":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
			break;
			/*case "button":
                str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";

                if (fobj.elements[i].value === "Update") {
                    //var btn = "'"+ fobj.elements[i].name +"'";
                    document.getElementById('btnedit').style.visibility = 'hidden';
                }
                if (fobj.elements[i].value === "Save") {
                    //var btn = "'"+ fobj.elements[i].name +"'";
                    document.getElementById('btnAdd').style.visibility = 'hidden';
                }
                break;*/
		case "checkbox":
			if (fobj.elements[i].checked == true) {
				str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
			} else {
				str += fobj.elements[i].name + "=" + "" + "&";
			}
			break;
		case "radio":
			if (fobj.elements[i].checked == true) {
				str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
			} else {
				//str += fobj.elements[i].name + "=" + "" + "&";
			}
			break;
		case "file":
			myFileList = fobj.elements[i].files;
			formData.append(fobj.elements[i].name, myFile);
			break;
		}
	}

	str = str.substr(0, (str.length - 1));
	console.log(str);
	//Post Form Data through AJAX
	$('#respDiv').css({"visibility":"hidden"});
	$('#respDiv2').css({"visibility":"hidden"});
	$('#respDiv3').css({"visibility":"hidden"});
	$.ajax(
			{
				type: 'POST',
				url: postUrl,
				data: str, //your form datas to post          
				success: function(response)
				{
					$('#loader').modal('hide');
					console.log('Successfully submitted form');
					console.log(response);
					var resp=$.parseJSON(response);
					console.log(resp);
					if(resp.type=="html")
					{

						getHtmlPage(resp.act);



					}
					else{
						if(resp.act!=""){
							getAjaxHtml('content-wrapper', resp.act);
						}
						if(resp.type=="pass"){
							console.log('if');
							$('#respDiv').css({"visibility":"visible", "color":"black"});
							$('#respDiv').addClass("alert alert-success roboto");
							$('#iconDiv').addClass("fa fa-check-circle");
							$('#respDiv').fadeIn(40).delay(2000).fadeOut(400);
							window.location.reload();
							$('#saveBtn').hide();
							$('#cancelBtn').html("back");
						}else if(resp.type=="fail"){
							console.log('else');
							$('#respDiv').css({"visibility":"visible", "color":"#990000","background-color":"rgba(225, 177, 177, 0.8)"});
							$('#respDiv').addClass("alert alert-danger roboto");
							$('#iconDiv').addClass("fa fa-warning");
							$('#respDiv').fadeIn(40).delay(2000).fadeOut(400);
						}

					$('#respDiv').html(resp.msg);
					}

				},
				error: function()
				{
					/*$('#loader').modal('hide');*/
					console.log('Failed to submit form');
					$('#respDiv').css({"visibility":"visible", "color":"red"});
					$('#respDiv').html("Failed to submit");
					//alert("Failure");
				},
				timeout: 20000
			});


}
function submitFormAllValuesHtmlResp(fobj,postUrl,resultDiv)
{
	/*$('#loader').modal('show');*/
	var str = "";
	var myFileList;
	var myFile;
	var formData;
	var data = $(fobj).serialize();
	console.log('postUrl='+postUrl);
	console.log('ser data= '+data);
	for (var i = 0; i < fobj.elements.length; i++)
	{
		console.log('ele type= '+fobj.elements[i].type);
		switch (fobj.elements[i].type)
		{
		case "text":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i	].value) + "&";
			break;
		case "password":
			str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
			break;

		case "textarea":
			str += fobj.elements[i].name +
			"=" + escape(fobj.elements[i].value) + "&";
			break;
			
		case "select-one":
			str += fobj.elements[i].name +
			"=" + fobj.elements[i].options[fobj.elements[i].selectedIndex].value + "&";
			break;
			
		case "file":
			myFileList = fobj.elements[i].files;
			formData.append(fobj.elements[i].name, myFile);
			break;
		}
	}
	str = str.substr(0, (str.length - 1));
	console.log(str);
	//Post Form Data through AJAX
	$('#respDiv').css({"visibility":"hidden"});
	$.ajax(
			{
				type: 'POST',
				url: postUrl,
				data: str, //your form datas to post          
				success: function(response)
				{
					/*$('#loader').modal('hide');*/
					console.log('Successfully submitted form');
					console.log(response);
					$('#'+resultDiv).html(response);

				},
				error: function()
				{
					/*$('#loader').modal('hide');*/
					console.log('Failed to submit form');
					$('#respDiv').css({"visibility":"visible", "color":"red"});
					$('#respDiv').html("Failed to submit");
					//alert("Failure");
				},
				timeout: 20000
			});

}
function deleteImage(url,thumbUrl,postUrl){
	$('#loader').modal('show');
	var str="";
	console.log(url);
	
	str += thumbUrl.name + "=" + escape(thumbUrl.value) + "&";
	str += url.name + "=" + escape(url.value) + "&";
	str = str.substr(0, (str.length - 1));
	console.log(str);
	$.ajax(
			{
				type: 'POST',
				url: postUrl,
				data: str, //your form datas to post          
				success: function(response)
				{
					/*$('#loader').modal('hide');*/
					console.log('Successfully submitted form');
					console.log(response);
					$('#respDiv').html(response);

				},
				error: function()
				{
					/*$('#loader').modal('hide');*/
					console.log('Failed to submit form');
					$('#respDiv').css({"visibility":"visible", "color":"red"});
					$('#respDiv').html("Failed to submit");
					//alert("Failure");
				},
				timeout: 20000
			});
}
//bootbox icon
$("a[name='delete']").on( "click", function() {
	console.log('clicked');
$('.bootbox-body').prepend('<i class="fa fa-trash"></i>&nbsp;');
});
function confirmDelete()
{
	//var a = document.frm.undo.value;
	if (confirm('Do you want to delete ?') == true)
	{
		return true;
	} else {
		return false;
	}
};
function confirmDeleteNew(msg)
{
	if (confirm('Do you want to delete '+msg+' ?') == true)
	{
		return true;
	} else {
		return false;
	} 
	//var a = document.frm.undo.value;
};
function pswd_req()
{
	var div= document.getElementById('passMessage');
	if(div.hidden){
		console.log("if");
		document.getElementById("passMessage").hidden= false;
		$("#passMessage").css('outline',0).attr('tabindex',-1).focus();
	}else{
		console.log("else");
		$("#focus").css('outline',0).attr('tabindex',-1).focus();
		document.getElementById("passMessage").hidden= true;
	}
}


function change(value)
{
	if(value==2)
	{
		console.log("ADV");
		document.getElementById("bus_email").hidden = false;
		document.getElementById("business_name").hidden= false;
		document.getElementById("website").hidden= false;
		document.getElementById("bus_phone").hidden= false;
	}
	else if(value==3)
	{
		console.log("DBO");
		document.getElementById("bus_email").hidden = false;
		document.getElementById("business_name").hidden= false;
		document.getElementById("website").hidden= false;
		document.getElementById("bus_phone").hidden= false;
	}
	else if(value=4)
	{
		document.getElementById("bus_email").hidden = true;
		document.getElementById("business_name").hidden= true;
		document.getElementById("website").hidden= true;
		document.getElementById("bus_phone").hidden= true;
	}
}

function changeMap(url,id){
	$.ajax(
			{
				type: 'POST',
				url: url,       
				success: function(response)
				{
					/*$('#loader').modal('hide');*/
					console.log('Successfully submitted form');
					console.log(response);
					$('#'+id).html(response);

				},
				error: function()
				{
					/*$('#loader').modal('hide');*/
					console.log('Failed to submit form');
					$('#respDiv').css({"visibility":"visible", "color":"red"});
					$('#respDiv').html("Failed to submit");
					//alert("Failure");
				},
				timeout: 20000
			});
}
function menuChange(id){
	console.log(id);
		$('.side-adv li.active').removeClass('active');
		document.getElementById(id).className = "active";
}
function dateFormat(date){
	dateList=date.split('/');
	mn=dateList[0];
	dt=dateList[1];
	yr=dateList[2];
	 if (dt < 10) {
		 dt = "0" + dt;
	 }
	 if (mn < 10) {
		 mn = "0" + mn;
	 }
	return dt + "-" + mn + "-" + yr;
}
/*timezone*/
function getGMT(date){
	function pad(value) {
	    return value < 10 ? '0' + value : value;
	}
	var sign = (date.getTimezoneOffset() > 0) ? "%2D" : "%2B";
    var offset = Math.abs(date.getTimezoneOffset());
    var hours = pad(Math.floor(offset / 60));
    var minutes = pad(offset % 60);
    console.log('GMT'+sign + hours + ":" + minutes);
    return 'GMT'+sign + hours + ":" + minutes;
}
function getTimeZoneId(){
    var timezone=String(new Date());
     return timezone.substring(timezone.lastIndexOf('(')+1).replace(')','').trim();
}

function deleteSelected(divName,actUrl){
	var recId="";
	console.log($("input[type='checkbox']").length);
	for(i=0;i<$("input[type='checkbox']").length;i++){
		console.log($('#case-'+i+':checked').length+"=="+$('#case'+i+':checked').length>0); 
		if($('#case-'+i+':checked').length>0){
			console.log($('#case-'+i+':checked').length+"=="+document.getElementById('case-'+i).value);
			recId+='"'+document.getElementById('case-'+i).value+'",';
		}
	}
	if(recId==""){
		bootbox.alert('Sorry, Nothing to Delete');
	}else{
		recId=recId.slice(0,recId.length-1);
	console.log('recId='+recId);
	bootbox.confirm('Do you want to delete selected Campaigns?', function(result) {if(result){
	getAjaxJson(divName, actUrl+'&pageSend='+pageSend+'&recs='+recId);
	}});
	}
}