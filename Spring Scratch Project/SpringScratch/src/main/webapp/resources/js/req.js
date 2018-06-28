function requestWithCallBack(urlstring,sucCallback,failCallBack){
	console.log("urlsrt1=="+urlstring);
	console.log("urlsrt2=="+sucCallback);
	console.log("urlsrt3=="+failCallBack);
	$('#loader').modal('show');
//	$('#search-term-form').attr("hidden", "");
//	urlstring = urlstring + "?page=1";
//	console.log(sucCallback);
//	console.log(typeof sucCallback =='function');
	var sucCB=function(){console.log("mnb")};
	if(sucCallback!=undefined && typeof sucCallback =='function'){
		sucCB=sucCallback;
	}
//	console.log(sucCB);
	var failCB=function(){};
	if(failCallBack){
		failCB=failCallBack;
	}
//	console.log("Div :" + divId + " url= " + urlstring);
	$.ajax({
		type : "POST",
		url : urlstring,
		success : function(response) {
//			$('#loader').modal('hide');
			console.log(response)
//			console.log(sucCB);
			sucCB(response);
			
		},
		error : function() {
			$('#loader').modal('hide');
//			console.log("An error occurred");
			failCB();
			// $('#notification-bar').text('An error occurred');
		},
		timeout : 20000
	});
}