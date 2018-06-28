/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
// JavaScript Document
var divid = 'output';
var loadingmessage = 'Processing...';
var areachecked = false;
var contactcount = 1;
var rowCount = 0;
var temp = 0;
var ids;
var curRow;
var clschange = false;


 function logout(str){
     window.location.replace(str,'window','toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=1');
        self.close()
 }
    function noBack() { 
//        alert("bala");
        window.history.forward(); 
    }

function AJAX() {
    var xmlHttp;
    try {
        xmlHttp = new XMLHttpRequest(); // Firefox, Opera 8.0+, Safari
        return xmlHttp;
    }
    catch (e) {
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP"); // Internet Explorer
            return xmlHttp;
        } catch (e) {
            try {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                return xmlHttp;
            }
            catch (e) {
                alert("Your browser does not support AJAX!");
                return false;
            }
        }
    }

}


function sizeTbl() {
    alert("Triggered");
    var ele = document.getElementById("toggleText");

    if (ele.style.display == "block") {
        ele.style.display = "none";
    }
    else {
        ele.style.display = "block";
    }
}

function sizeTbl1() {
    var ele = document.getElementById("toggleText1");

    if (ele.style.display == "block") {
        ele.style.display = "none";
    }
    else {
        ele.style.display = "block";
    }
}

function upload() {
    var photo = document.getElementById("uploadedfile");
    var file = photo.files[0];

//    alert("File name: " + file.fileName);
//    alert("File size: " + file.fileSize);
//    alert("Binary content: " + file.getAsBinary());
//    alert("Text content: " + file.getAsText(""));

    //var preview = document.getElementById("preview");
    //preview.src = file.getAsDataURL();

    //return false;
}

function postfiledata(fobj, url) {
//    alert("URL String:" + url);

    var formData = new FormData();
    //var poststr = getFormValues(f);
    var myFileList = document.getElementById('fileInput').files;
    var myid = document.getElementById('my_id').value;
    // Grab the first File Object from the FileList
    var myFile = myFileList[0];
    formData.append("my_id", myid);
    formData.append("my_uploaded_file", myFile);
    //alert("Length :"+fobj.elements.length);
    /*for(var i = 0;i < fobj.elements.length;i++)
     {
     alert(fobj.elements[i].type);	
     switch(fobj.elements[i].type)
     {
     case "text":
     alert(fobj.elements[i].name+"::"+escape(fobj.elements[i].value));
     formData(fobj.elements[i].name,escape(fobj.elements[i].value));
     break;
     
     case "textarea":
     formData(fobj.elements[i].name,escape(fobj.elements[i].value));
     break;
     
     case "select-one":
     
     formData(fobj.elements[i].name, fobj.elements[i].options[fobj.elements[i].selectedIndex].value);
     break;
     
     case "hidden":
     formData(fobj.elements[i].name,escape(fobj.elements[i].value));
     break;
     case "button":
     formData(fobj.elements[i].name,escape(fobj.elements[i].value));
     
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
     formData( fobj.elements[i].name,escape(fobj.elements[i].value));
     //alert("True");
     }else{
     formData(fobj.elements[i].name,"");
     }
     break;
     case "file":
     //alert("Element :"+fobj.elements[i].name+"::"+escape(fobj.elements[i].files));
     //formData.append( fobj.elements[i].name,escape(fobj.elements[i].files));
     //break;
     }//switch
     }//for*/

    //formData.append('my_uploaded_file', myFileObject);
    //formData.append(parameters);
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState > 0 && xmlHttp.readyState < 4) {
            //document.getElementById(divid).innerHTML=loadingmessage;
        }
        if (xmlHttp.readyState == 4) {
            //alert("Saved :"+ xmlHttp.responseText);
            if (xmlHttp.responseText == "E100") {
                alert("Accepted Successfully");
            }
            if (xmlHttp.responseText == "U100") {
                alert("Updated Sucessfully ");
            }
            if (xmlHttp.responseText == "R100") {
                alert("Rejected Sucessfully ");
            }
            if (xmlHttp.responseText == "R101") {
                alert("Must be Select Payment Option CheckBox ");
            }
            if (xmlHttp.responseText == "A101") {
                alert("Argument missing while adding new record");
            }
            if (xmlHttp.responseText == "A102") {
                alert("Record Already Exists");
            }
            if (xmlHttp.responseText == "S100") {
                alert("Successfully Added");
            }
            if (xmlHttp.responseText == "E101") {
                alert("Argument missing");
            }
            if (xmlHttp.responseText == "D001") {
                alert("Deleted Successfully");
            }
            if (xmlHttp.responseText == "DD01") {
                alert("Must be select Distributor");
            }
            //document.getElementById(divid).innerHTML=xmlHttp.responseText;
            alert(xmlHttp.responseText);
            //document.getElementById(divid).innerHTML=xmlHttp.responseText;
        }
    }

    xmlHttp.open("POST", url);
    /*xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
     xmlHttp.setRequestHeader("Content-length", parameters.length);
     xmlHttp.setRequestHeader("Connection", "close");*/

    xmlHttp.send(formData);


}
var xmlHttp;

function uploadFile(fobj, url) {
//    alert("URL :" + url);
uploadUrl=document.getElementById("uploadUrl").value;
//    alert("UploadURL :" + uploadUrl);
    
    
    var myFileList;
    var myFile;
    //mydata = document.getElementById('my_data').value;
    var formData = new FormData();


    // Append our file to the formData object
    // Notice the first argument "file" and keep it in mind
    //formData.append('my_data', mydata);
    //formData.append('fileInput', myFile);
    //alert("ArrayLength :"+fobj.elements.length);
    for (var i = 0; i < fobj.elements.length; i++)
    {
        //alert(fobj.elements[i].type);	
        switch (fobj.elements[i].type)
        {
            case "text":
                //alert(fobj.elements[i].name+"::"+escape(fobj.elements[i].value));
                formData.append(fobj.elements[i].name, escape(fobj.elements[i].value));
                break;
            case "textarea":
                formData.append(fobj.elements[i].name, escape(fobj.elements[i].value));
                break;

            case "select-one":

                formData.append(fobj.elements[i].name, fobj.elements[i].options[fobj.elements[i].selectedIndex].value);
                break;

            case "hidden":
                //alert("Name :"+fobj.elements[i].name+":Value :"+fobj.elements[i].value);
                formData.append(fobj.elements[i].name, escape(fobj.elements[i].value));
                break;
            case "button":
                //alert("Name :"+fobj.elements[i].name+":Value :"+fobj.elements[i].value);
                formData.append(fobj.elements[i].name, escape(fobj.elements[i].value));

                if (fobj.elements[i].value == "Update") {
                    //var btn = "'"+ fobj.elements[i].name +"'";
                    document.getElementById('btnedit').style.visibility = 'hidden';
                }
                if (fobj.elements[i].value == "Save") {
                    //var btn = "'"+ fobj.elements[i].name +"'";
                    document.getElementById('btnAdd').style.visibility = 'hidden';
                }
                break;
            case "checkbox":
                //alert("SS :"+ fobj.elements[i].name);
                if (fobj.elements[i].checked == true) {
                    formData.append(fobj.elements[i].name, escape(fobj.elements[i].value));
                    //alert("True");
                } else {
                    formData.append(fobj.elements[i].name, "");
                }
                break;
            case "file":
//                alert("Element :"+fobj.elements[i].name+"::"+escape(fobj.elements[i].files));
                myFileList = fobj.elements[i].files;
                myFile = myFileList[0];
//                alert("File :"+myFile.name);
//                alert("File :"+myFile.size);
//                alert("File Name :"+fobj.elements[i].name);
                formData.append(fobj.elements[i].name, myFile);
                break;
        }//switch
    }//for
    //formData.append('my_data',myid);
    // Create our XMLHttpRequest Object
    xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function() {
        //alert("onreadychange");
        if (xmlHttp.readyState > 0 && xmlHttp.readyState < 4) {
            document.getElementById(divid).innerHTML = loadingmessage;
            document.getElementById("canvas").style.display = "block";
            document.getElementById("upload").style.display = "block";
        }
        if (xmlHttp.readyState == 4) {
            //alert("RespTxt: "+ xmlHttp.responseText);
            var resp = eval('(' + xmlHttp.responseText + ')');
            //alert("msg: "+resp);
            //alert("msg: "+resp.msg);
            //alert("act: "+resp.act);
            document.getElementById(divid).innerHTML = resp.msg;//xmlHttp.responseText;
            if (resp.act != undefined || resp.act != null) {
                //alert(resp.msg);
                document.getElementById("canvas").style.display = "none";
            document.getElementById("upload").style.display = "none";
                LoadDiv('Center_Content', resp.act);
            } else {
                document.getElementById(divid).innerHTML = resp.msg;
            }
        }
    }
    // Open our connection using the POST method
    xmlHttp.open("POST", url);
    // Send the file
    //alert("formData :"+formData);
    xmlHttp.send(formData);
}
function formSend(f, url) {
//	alert("URL :" + url);
    var poststr = getFormAllValues(f);

//	alert("POST STR :"+ poststr);
    postDataOnly(url, poststr);
}
function postDataOnly(url, parameters) {
    var xmlHttp = AJAX();
    xmlHttp.onreadystatechange = function() {
        //alert("gsdh");
        if (xmlHttp.readyState > 0 && xmlHttp.readyState < 4) {
            document.getElementById(divid).innerHTML = loadingmessage;
        }
        if (xmlHttp.readyState == 4) {
            //alert("RespTxt: "+ xmlHttp.responseText);
//                        var resp = eval('(' + xmlHttp.responseText + ')');
            //alert("msg: "+resp.msg);
            //alert("act: "+resp.act);
            //document.getElementById(divid).innerHTML=xmlHttp.responseText;
//                        if(resp.act != undefined || resp.act != null){
            //alert(resp.msg);
            //alert(resp.act);
            LoadDiv('Center_Content', url);
//                        }else{
//                            document.getElementById(divid).innerHTML=resp.msg;
//                        }
        }
    }
//    alert("url " + url);
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlHttp.setRequestHeader("Content-length", parameters.length);
    xmlHttp.setRequestHeader("Connection", "close");
    xmlHttp.send(parameters);

}
function formget(f, url) {
//    alert("URL :" + url);
    var poststr = getFormAllValues(f);

//    console.log("POST STR :"+ poststr);
    postData(url, poststr);
}
function formGetAll(f, url) {
    //alert("URL :" + url);
    var poststr = getFormAllValues(f);

//    alert("POST STR :" + poststr);
    postData(url, poststr);
}
function formGetDel(f, url) {
    //alert("URL :" + url);
    var poststr = getFormDelValues(f);

    //alert("POST STR :"+ poststr);
    postData(url, poststr);
}
function getFormAllValues(fobj)
{
    var str = "";
    var myFileList;
    var myFile;
    var formData;
    for (var i = 0; i < fobj.elements.length; i++)
    {

        switch (fobj.elements[i].type)
        {
            case "text":
                //alert("text :"+ fobj.elements[i].name);
                str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
                break;
            case "password":
                //alert("text :"+ fobj.elements[i].name);
                str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
                break;

            case "textarea":
                str += fobj.elements[i].name +
                        "=" + escape(fobj.elements[i].value) + "&";
                break;

            case "select-one":
                //alert("SS :"+ fobj.elements[i].name);
                str += fobj.elements[i].name +
                        "=" + fobj.elements[i].options[fobj.elements[i].selectedIndex].value + "&";
                break;
            case "hidden":
                str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
                break;
            case "button":
                str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";

                if (fobj.elements[i].value === "Update") {
                    //var btn = "'"+ fobj.elements[i].name +"'";
                    document.getElementById('btnedit').style.visibility = 'hidden';
                }
                if (fobj.elements[i].value === "Save") {
                    //var btn = "'"+ fobj.elements[i].name +"'";
                    document.getElementById('btnAdd').style.visibility = 'hidden';
                }
                break;
            case "checkbox":
//                alert("CB :" + fobj.elements[i].name);
                if (fobj.elements[i].checked == true) {
                    str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
                    //alert("True");
                } else {
                    str += fobj.elements[i].name + "=" + "" + "&";
                }
                break;
            case "radio":
                //alert("SS :"+ fobj.elements[i].name);
                if (fobj.elements[i].checked == true) {
                    str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
                    //alert(str);
                } else {
                    //str += fobj.elements[i].name + "=" + "" + "&";
                    //alert(str);
                }
                break;
            case "file":
//                alert("Element :" + fobj.elements[i].name + "::" + escape(fobj.elements[i].files));
                myFileList = fobj.elements[i].files;
//                myFile = myFileList[0];
//                alert("File :" + myFile.name);
//                alert("File :" + myFile.size);
//                alert("File Name :" + fobj.elements[i].name);
                formData.append(fobj.elements[i].name, myFile);
//                alert(formData);
                break;
        }
    }

    str = str.substr(0, (str.length - 1));
    //alert("POST All-Str :"+str);
    return str;
}

function getFormDelValues(fobj){
    var str = "";
console.log("formDel "+fobj);
console.log("len "+fobj.elements.length);
    for (var i = 0; i < fobj.elements.length; i++){
        console.log("formDel "+fobj.elements[i].type);
        switch (fobj.elements[i].type){
            case "button":
                console.log("BUTTON");
                str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
                if (fobj.elements[i].value === "Delete") {
                    //var btn = "'"+ fobj.elements[i].name +"'";
                    document.getElementById('btnDelete').style.visibility = 'hidden';
                }
                break;
            case "checkbox":
                console.log("SS :"+ fobj.elements[i].name);
                if (fobj.elements[i].checked === true) {
                    str += fobj.elements[i].name + "=" + escape(fobj.elements[i].value) + "&";
                    //alert("True");
                }
                break;
        }
    }

    str = str.substr(0, (str.length - 1));
    //alert("POST Del-Str :"+str);
    return str;
}
function postData(url, parameters) {

    var xmlHttp = AJAX();

    xmlHttp.onreadystatechange = function() {
        //alert("gsdh");
        if (xmlHttp.readyState > 0 && xmlHttp.readyState < 4) {
            document.getElementById(divid).innerHTML = loadingmessage;
        }
        if (xmlHttp.readyState == 4) {
            //alert("RespTxt: "+ xmlHttp.responseText);
            var resp = eval('(' + xmlHttp.responseText + ')');
            //alert("msg: "+resp.msg);
            //alert("act: "+resp.act);
            //document.getElementById(divid).innerHTML=xmlHttp.responseText;
            if (resp.act != undefined || resp.act != null) {
//                alert("msg: "+resp.msg);
//            alert("act: "+resp.act);
//                console.log(resp.msg);
//                console.log(resp.act);
                LoadDiv('Center_Content', resp.act);
            } else {
                document.getElementById(divid).innerHTML = resp.msg;
            }
        }
    };
//        alert("url "+url);
//    console.log("para " + parameters);
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlHttp.setRequestHeader("Content-length", parameters.length);
    xmlHttp.setRequestHeader("Connection", "close");
    xmlHttp.send(parameters);
}

function toggle() {
    var ele = document.getElementById("toggleText");
    var text = document.getElementById("displayText");
    if (ele.style.display == "block") {
        ele.style.display = "none";
        if (text.value == "HIDE ORDER DETAILS") {
            text.value = "SHOW ORDER DETAILS";
        } else if (text.value == "HIDE PAYMENT DETAILS") {
            text.value = "SHOW PAYMENT DETAILS";
        }
    }
    else {
        ele.style.display = "block";
        if (text.value == "SHOW PAYMENT DETAILS") {
            text.value = "HIDE PAYMENT DETAILS";
        } else if (text.value == "SHOW ORDER DETAILS") {
            text.value = "HIDE ORDER DETAILS";
        }
    }
}

function toggleImage(a) {
    //alert("Welcome :" + a );
    //alert("Welcome1:"+ b );
    var ele = document.getElementById(a); //div Id
    //alert("Div ID:"+ele);

    //var text = document.getElementById(b);
    //alert("Text :"+text.value);
    if (ele.style.display == "none") {
        ele.style.display = "block";
        //		text.value = "HIDE";
    } else {
        ele.style.display = "none";
        //	text.value = "SHOW";
    }
}
function checking() {
    var divid = "pob";
    document.getElementId(divid).innerHTML = "selva";

}
function admin() {
    var divId = "Center_Content";
    var msg = "";
    document.getElementById(divId).innerHTML = "";
    msg = document.getElementById(divId).innerHTML;
    msg += "welcome to eoxys";
    document.getElementById(divId).innerHTML = msg;

}

function Home(urlString) {
    //alert("selva here");
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById("Center_Content").innerHTML = xmlhttp.responseText;

        }
    }
    xmlhttp.open("GET", urlString, true);
    xmlhttp.send();

}

function Test(e) {
    var keynum;
    var keychar;
    var numcheck;

    if (window.event) // IE
    {
        keynum = e.keyCode;
    }
    else if (e.which) // Netscape/Firefox/Opera
    {
        keynum = e.which;
    }

    if (keynum == 13) {
        return true;

    }

}
var uploadUrl="";
function abortReq() {
//alert("fgh");
//alert("uUrl "+uploadUrl);
//alert(xmlHttp.readyState);
xmlHttp.abort();
LoadDiv('Center_Content', uploadUrl);

}

function stopRKey(evt) {
    var evt = (evt) ? evt : ((event) ? event : null);
    var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
    if ((evt.keyCode == 13) && ((node.type == "text")||(node.type == "password"))) {
        return false;
    }
}
document.onkeypress = stopRKey;

function onDelete(data)
{
    //var a = document.frm.undo.value;
    var msg = '';
    if (data == 'Delete') {
        msg = 'Do you want to delete ?';
    } else if (data == 'Undo') {
        msg = 'Do you want to undo ?';
    }
    if (confirm(msg) == true)
    {
        return true;
    } else {
        return false;
    }
}

function onDeletes()
{
    //var a = document.frm.undo.value;
    if (confirm('Do you want to delete ?') == true)
    {
        return true;
    } else {
        return false;
    }
}
function ClickCheckAll(frm) {
    var i;

    for (i = 1; i <= document.getElementById("hdnCount").value; i++)
    {
        if (document.getElementById("CheckAll").checked == true) {
            document.getElementById("userbox" + i).checked = true;
        } else {
            document.getElementById("userbox" + i).checked = false;
        }
    }


}

function printHeader(strText) {

    /*var centerDiv=document.getElementById("Center_H");
     centerDiv.style.text-align="center";
     centerDiv.style.color = "white";
     centerDiv.font-size="14";*/
    document.getElementById("Center_Header_Text").innerHTML = strText;
}
var xmlhttp1;
function LoadDiv(divId, urlstring) {
//    console.log("Div :"+divId + " = "+urlstring);
//    console.log("id "+ urlstring);
    if (xmlhttp1 == null || xmlhttp1 == "undefined") {
        //alert("Create xmlhttp1");
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            //alert("XML");
            xmlhttp1 = new XMLHttpRequest();
        } else {// code for IE6, IE5
            xmlhttp1 = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    xmlhttp1.onreadystatechange = function() {
//        alert("onready"+xmlhttp1.responseText);
        document.getElementById("loading").style.visibility = "visible";
        document.getElementById("canvas").style.display = "block";
//        document.getElementById("upload").style.display = "block";
        if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200) {
            document.getElementById(divId).innerHTML = xmlhttp1.responseText;
            document.getElementById("loading").style.visibility = "hidden";
            document.getElementById("canvas").style.display = "none";
            document.getElementById("upload").style.display = "none";
            //alert("resp=200");

        } else if (xmlhttp1.readyState == 4 && xmlhttp1.status != 200) {
//            alert("ghh");
            var errorText = "<span style='text-align:center; color:#999999; font-size:24px;margin-left:10%'>Connection Failed</span>";
            document.getElementById(divId).innerHTML = errorText;
            document.getElementById("loading").style.visibility = "hidden";
            document.getElementById("canvas").style.display = "none";
            document.getElementById("upload").style.display = "none";
        }
        //document.getElementById("loading").style.visibility = "hidden";
    }
    //document.getElementById("loading").style.visibility = "visible";
    //alert("send url :: "+urlstring);
    xmlhttp1.open("GET", urlstring, true);
    xmlhttp1.send();

    //window.location.href = s;
}
var expandFirstItemAutomatically = false;	// Expand first menu item automatically ?
var initMenuIdToExpand = false;	// Id of menu item that should be initially expanded. the id is defined in the <li> tag.
var expandMenuItemByUrl = true;	// Menu will automatically expand by url - i.e. if the href of the menu item is in the current location, it will expand
var initialMenuItemAlwaysExpanded = true;	// NOT IMPLEMENTED YET
var dhtmlgoodies_slmenuObj;
var divToScroll = false;
var ulToScroll = false;
var divCounter = 1;
var otherDivsToScroll = new Array();
var divToHide = false;
var parentDivToHide = new Array();
var ulToHide = false;
var offsetOpera = 0;
if (navigator.userAgent.indexOf('Opera') >= 0)
    offsetOpera = 1;
var slideMenuHeightOfCurrentBox = 0;
var objectsToExpand = new Array();
var initExpandIndex = 0;
var alwaysExpanedItems = new Array();
var dg_activeItem = null;
function popMenusToShow() {
    var obj = divToScroll;
    var endArray = new Array();
    while (obj && obj.tagName != 'BODY') {
        if (obj.tagName == 'DIV' && obj.id.indexOf('slideDiv') >= 0) {
            var objFound = -1;
            for (var no = 0; no < otherDivsToScroll.length; no++) {
                if (otherDivsToScroll[no] == obj) {
                    objFound = no;
                }
            }

            if (objFound >= 0) {

                otherDivsToScroll.splice(objFound, 1);
                //alert("poplength:"+otherDivsToScroll.length);
            }

        }
        obj = obj.parentNode;
    }
}
// Build the message by reading a JS object in a recursive manner
function showObject(obj) {
    var txt = "<table>";
    try {
        for (var key in obj) {

            txt += "<tr> <td>" + key + ":" + "</td>";
            txt += "<td>" + obj[key] + "</td></tr>";
        }
        txt += "</table>";
    } catch (e) {
//        alert("showObject: " + e);
    }
    return txt;
}
function showSubMenu(e, inputObj) {
//alert("step0");
    if (this && this.tagName)
        inputObj = this.parentNode;
    //alert("Length of otherdiv:"+otherDivsToScroll.length);
    if (inputObj && inputObj.tagName == 'LI') {
        divToScroll = inputObj.getElementsByTagName('DIV')[0];
        //alert("step10.1 ="+divToScroll.value );
        /*var txt="----divToScroll"+divToScroll.length;
         
         txt+= showObject(divToScroll);
         
         txt+="----otherDivToScroll";
         for(var no=0;no<otherDivsToScroll.length;no++){
         txt+= showObject(otherDivsToScroll[no]);
         txt+="-------------------------------------";
         }
         //document.getElementById('Empty').innerHTML = txt;*/
        for (var no = 0; no < otherDivsToScroll.length; no++) {
            if (otherDivsToScroll[no] == divToScroll && no == 0)
            {
                hidingInProcess = false;
                //alert("step44");
                /*if(otherDivsToScroll.length>0){
                 alert("popmenu-start");
                 popMenusToShow();
                 alert("popmenu-end");
                 }
                 alert("popmenu-out"+otherDivsToScroll.length);
                 */
                if (otherDivsToScroll.length > 0) {
                    //alert("autohide-start");
                    var hideSameDiv = true;
                    autoHideMenus(hideSameDiv);
                    hidingInProcess = true;
                    //alert("step55");
                }
                return;
            }
            //alert("step0-1"+otherDivsToScroll.length);
        }

    }
    hidingInProcess = false;
    //alert("Length="+otherDivsToScroll.length+" "+"DIVTOSCROLL:"+divToScroll);
    if (otherDivsToScroll.length > 0) {
        //alert("step1");
        if (divToScroll) {
            //alert("step2");
            if (otherDivsToScroll.length > 0) {
                popMenusToShow();
                //alert("step3");
            }
            if (otherDivsToScroll.length > 0) {
                //alert("step4");
                var hideSameDiv = false;
                autoHideMenus(hideSameDiv);

                hidingInProcess = true;
                //alert("step5");
            }

        }
    }
    if (divToScroll && !hidingInProcess) {
        //alert("step6");
        divToScroll.style.display = '';
        otherDivsToScroll.length = 0;
        otherDivToScroll = divToScroll.parentNode;
        otherDivsToScroll.push(divToScroll);
        //alert("step7"+" "+"divtoscroll:"+divToScroll);
        while (otherDivToScroll && otherDivToScroll.tagName != 'BODY') {
            if (otherDivToScroll.tagName == 'DIV' && otherDivToScroll.id.indexOf('slideDiv') >= 0) {
                otherDivsToScroll.push(otherDivToScroll);
                //alert("step8");

            }
            otherDivToScroll = otherDivToScroll.parentNode;
        }
        ulToScroll = divToScroll.getElementsByTagName('UL')[0];
        //alert("step9");
        if (divToScroll.style.height.replace('px', '') / 1 <= 1)
            scrollDownSub();
        //alert("step9.1");
    }
    if (e || inputObj) {
        if (dg_activeItem) {
            dg_activeItem.className = dg_activeItem.className.replace('dhtmlgoodies_activeItem', '');
            //alert("step10");
        }
        var aTags = inputObj.getElementsByTagName('A');
        if (aTags.length > 0) {
            aTags[0].className = aTags[0].className + ' dhtmlgoodies_activeItem';
            dg_activeItem = aTags[0];

            if (aTags[0].href.indexOf('#') == -1 || aTags[0].href.indexOf('#') < aTags[0].href.length - 1) {
                return true;
                //alert("step11");
            }
        }

    }

    return false;
//alert("step12");
}
function autoHideMenus(hideSameDiv) {
    if (otherDivsToScroll.length > 0) {
        if (hideSameDiv == true) {
            divToHide = otherDivsToScroll[0];
        } else {
            divToHide = otherDivsToScroll[otherDivsToScroll.length - 1];
        }
        parentDivToHide.length = 0;
        var obj = divToHide.parentNode.parentNode.parentNode;
        while (obj && obj.tagName == 'DIV') {
            if (obj.id.indexOf('slideDiv') >= 0)
                parentDivToHide.push(obj);
            obj = obj.parentNode.parentNode.parentNode;
        }
        var tmpHeight = (divToHide.style.height.replace('px', '') / 1 - slideMenuHeightOfCurrentBox);
        if (tmpHeight < 0)
            tmpHeight = 0;
        if (slideMenuHeightOfCurrentBox)
            divToHide.style.height = tmpHeight + 'px';
        ulToHide = divToHide.getElementsByTagName('UL')[0];
        slideMenuHeightOfCurrentBox = ulToHide.offsetHeight;
        scrollUpMenu();
    } else {
        slideMenuHeightOfCurrentBox = 0;
        showSubMenu();
    }
}
function scrollUpMenu() {
    var height = divToHide.offsetHeight;
    //alert("Height:"+height);
    height -= 15;
    if (height < 0)
        height = 0;
    divToHide.style.height = height + 'px';

    for (var no = 0; no < parentDivToHide.length; no++) {
        parentDivToHide[no].style.height = parentDivToHide[no].getElementsByTagName('UL')[0].offsetHeight + 'px';
    }
    if (height > 0) {
        setTimeout('scrollUpMenu()', 5);
        //alert("scrollupmenu-if");
    } else {
        //alert("scrollupmenu-else");
        var SameDiv = false;
        if (otherDivsToScroll[otherDivsToScroll.length - 1] == divToScroll) {
            //alert("same");
            SameDiv = true;
        }
        divToHide.style.display = 'none';
        otherDivsToScroll.length = otherDivsToScroll.length - 1;
        if (!SameDiv)
        {
            autoHideMenus();
        }
    }
}
function scrollDownSub() {
    if (divToScroll) {
        var height = divToScroll.offsetHeight / 1;
        var offsetMove = Math.min(15, (ulToScroll.offsetHeight - height));
        height = height + offsetMove;
        divToScroll.style.height = height + 'px';

        for (var no = 1; no < otherDivsToScroll.length; no++) {
            var tmpHeight = otherDivsToScroll[no].offsetHeight / 1 + offsetMove;
            otherDivsToScroll[no].style.height = tmpHeight + 'px';
        }
        if (height < ulToScroll.offsetHeight)
            setTimeout('scrollDownSub()', 5);
        else {
            divToScroll = false;
            ulToScroll = false;
            if (objectsToExpand.length > 0 && initExpandIndex < (objectsToExpand.length - 1)) {
                initExpandIndex++;

                showSubMenu(false, objectsToExpand[initExpandIndex]);
            }
        }
    }
}
function initSubItems(inputObj, currentDepth) {
    divCounter++;
    var div = document.createElement('DIV');	// Creating new div
    div.style.overflow = 'hidden';
    div.style.position = 'relative';
    div.style.display = 'none';
    div.style.height = '1px';
    div.id = 'slideDiv' + divCounter;
    div.className = 'slideMenuDiv' + currentDepth;
    inputObj.parentNode.appendChild(div);	// Appending DIV as child element of <LI> that is parent of input <UL>
    div.appendChild(inputObj);	// Appending <UL> to the div
    var menuItem = inputObj.getElementsByTagName('LI')[0];
    while (menuItem) {
        if (menuItem.tagName == 'LI') {
            var aTag = menuItem.getElementsByTagName('A')[0];
            aTag.className = 'slMenuItem_depth' + currentDepth;
            var subUl = menuItem.getElementsByTagName('UL');
            if (subUl.length > 0) {
                initSubItems(subUl[0], currentDepth + 1);
            }
            aTag.onclick = showSubMenu;
        }
        menuItem = menuItem.nextSibling;
    }
}
function initSlideDownMenu() {
    dhtmlgoodies_slmenuObj = document.getElementById('dhtmlgoodies_slidedown_menu');
    dhtmlgoodies_slmenuObj.style.visibility = 'visible';
    var mainUl = dhtmlgoodies_slmenuObj.getElementsByTagName('UL')[0];
    var mainMenuItem = mainUl.getElementsByTagName('LI')[0];
    mainItemCounter = 1;
    while (mainMenuItem) {
        if (mainMenuItem.tagName == 'LI') {
            var aTag = mainMenuItem.getElementsByTagName('A')[0];

            aTag.className = 'slMenuItem_depth1';
            var subUl = mainMenuItem.getElementsByTagName('UL');
            if (subUl.length > 0) {
                mainMenuItem.id = 'mainMenuItem' + mainItemCounter;
                initSubItems(subUl[0], 2);
                aTag.onclick = showSubMenu;
                mainItemCounter++;
            }
        }
        mainMenuItem = mainMenuItem.nextSibling;
    }
    if (location.search.indexOf('mainMenuItemToSlide') >= 0) {
        var items = location.search.split('&');
        for (var no = 0; no < items.length; no++) {
            if (items[no].indexOf('mainMenuItemToSlide') >= 0) {
                values = items[no].split('=');
                //alert("show1");
                showSubMenu(false, document.getElementById('mainMenuItem' + values[1]));
                initMenuIdToExpand = false;
            }
        }
    } else if (expandFirstItemAutomatically > 0) {
        if (document.getElementById('mainMenuItem' + expandFirstItemAutomatically)) {
            //alert("show2");
            showSubMenu(false, document.getElementById('mainMenuItem' + expandFirstItemAutomatically));
            initMenuIdToExpand = false;
        }
    }
    if (expandMenuItemByUrl) {
        var aTags = dhtmlgoodies_slmenuObj.getElementsByTagName('A');
        var currentLocation = location.pathname;
        for (var no = 0; no < aTags.length; no++) {
            var hrefToCheckOn = aTags[no].href;
            if (hrefToCheckOn.indexOf(currentLocation) >= 0 && hrefToCheckOn.indexOf('#') < hrefToCheckOn.length - 1) {
                initMenuIdToExpand = false;
                var obj = aTags[no].parentNode;
                while (obj && obj.id != 'dhtmlgoodies_slidedown_menu') {
                    if (obj.tagName == 'LI') {
                        var subUl = obj.getElementsByTagName('UL');
                        if (initialMenuItemAlwaysExpanded)
                            alwaysExpanedItems[obj.parentNode] = true;
                        if (subUl.length > 0) {
                            objectsToExpand.unshift(obj);
                        }
                    }
                    obj = obj.parentNode;
                }
                //alert("show3");
                showSubMenu(false, objectsToExpand[0]);
                break;
            }
        }
    }
    if (initMenuIdToExpand) {
        objectsToExpand = new Array();
        var obj = document.getElementById(initMenuIdToExpand)
        while (obj && obj.id != 'dhtmlgoodies_slidedown_menu') {
            if (obj.tagName == 'LI') {
                var subUl = obj.getElementsByTagName('UL');

                if (initialMenuItemAlwaysExpanded)
                    alwaysExpanedItems[obj.parentNode] = true;
                if (subUl.length > 0) {
                    objectsToExpand.unshift(obj);
                }
            }
            obj = obj.parentNode;
        }
        //alert("show4");
        showSubMenu(false, objectsToExpand[0]);

    }
}
/*******************************Validation****************************************************/
/*******************************Validation****************************************************/
function licence_validate(fobj) {
    //alert("Validation");
    //valid = true;
    //alert(fobj.elements.length);
    var ret = true;
    var err = " ";
    var count = 0;
    var id;
    var newPass="";
    for (var i = 0; i < fobj.elements.length; i++) {
        //alert("for element id :"+fobj.elements[i].id);
        id = fobj.elements[i].id;
        //alert(document.getElementById(fobj.elements[i].id).value);
        switch (id) {
//            case "ccode":
//                err = document.getElementById("ccodeL");
//                if (document.getElementById(id).value == "") {
//                    err.innerHTML = "Please enter Company Code.";
//                    count++;
//                } else {
//                    newPass=document.getElementById(id).value;
//                    err.innerHTML = "";
//                }
//                break;
            case "email":
                err = document.getElementById("emailL");
                var atpos=(document.getElementById(id).value).indexOf("@");
                var dotpos=(document.getElementById(id).value).lastIndexOf(".");
	
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Email ID.";
                    count++;
                }else if(atpos<1 || dotpos<atpos+2 || dotpos+2>=err.length){
                    err.innerHTML = "Please enter valid Email ID.";
                    count++;
		}else{
                    err.innerHTML = "";
                }
                break;
            case "key":
                err = document.getElementById("keyL");
//                console.log("len "+(document.getElementById(id).value).length);
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Key.";
                    count++;
                
                }
//                else if(document.getElementById(id).value.search(/[0-9A-Fa-f]/) != -1){
//                    alert("gh");
//                    err.innerHTML = "Please enter valid Key.";
//                    count++;
//                    
//                }
                else if((document.getElementById(id).value).length!=88){
                    err.innerHTML = "Key not valid.";
                    count++;
//                    console.log("not valid");
                }
                else{
                    err.innerHTML = "";
                }
                break;
            
        }
    }
    if (count > 0) {
        ret = false;
    }
    return ret;
}
function chekNewPass_validate(fobj) {
    //alert("Validation");
    //valid = true;
    //alert(fobj.elements.length);
    var ret = true;
    var err = " ";
    var count = 0;
    var id;
    var newPass="";
    for (var i = 0; i < fobj.elements.length; i++) {
        //alert("for element id :"+fobj.elements[i].id);
        id = fobj.elements[i].id;
        //alert(document.getElementById(fobj.elements[i].id).value);
        switch (id) {
            case "npass":
                err = document.getElementById("npassL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter New Password.";
                    count++;
                } else {
                    newPass=document.getElementById(id).value;
                    err.innerHTML = "";
                }
                break;
            case "cnpass":
                err = document.getElementById("cnpassL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please Reenter New password.";
                    count++;
                } else if(newPass!=document.getElementById(id).value){
                    err.innerHTML = "Password Mismatch.";
                    count++;
                }else{
                    err.innerHTML = "";
                }
                break;
            
        }
    }
    if (count > 0) {
        ret = false;
    }
    return ret;
}
function pass_validate(fobj) {
    //alert("Validation");
    //valid = true;
    //alert(fobj.elements.length);
    var ret = true;
    var err = " ";
    var count = 0;
    var id;
    for (var i = 0; i < fobj.elements.length; i++) {
        //alert("for element id :"+fobj.elements[i].id);
        id = fobj.elements[i].id;
        //alert(document.getElementById(fobj.elements[i].id).value);
        switch (id) {
            case "pass":
                err = document.getElementById("passL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Password.";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            
        }
    }
    if (count > 0) {
        ret = false;
    }
    return ret;
}
function chekQues_validate(fobj) {
    //alert("Validation");
    //valid = true;
    //alert(fobj.elements.length);
    var ret = true;
    var err = " ";
    var count = 0;
    var id;
    for (var i = 0; i < fobj.elements.length; i++) {
        //alert("for element id :"+fobj.elements[i].id);
        id = fobj.elements[i].id;
        //alert(document.getElementById(fobj.elements[i].id).value);
        switch (id) {
            case "qans":
                err = document.getElementById("qansL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Answer.";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            
        }
    }
    if (count > 0) {
        ret = false;
    }
    return ret;
}
function getUser_validate(fobj) {
    //alert("Validation");
    //valid = true;
    //alert(fobj.elements.length);
    var ret = true;
    var err = " ";
    var count = 0;
    var id;
    for (var i = 0; i < fobj.elements.length; i++) {
        //alert("for element id :"+fobj.elements[i].id);
        id = fobj.elements[i].id;
        //alert(document.getElementById(fobj.elements[i].id).value);
        switch (id) {
            case "uname":
                err = document.getElementById("unameL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Name.";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            
        }
    }
    if (count > 0) {
        ret = false;
    }
    return ret;
}
function scene_validate(fobj) {
    //alert("Validation");
    //valid = true;
    //alert(fobj.elements.length);
    var ret = true;
    var err = " ";
    var count = 0;
    var id;
    for (var i = 0; i < fobj.elements.length; i++) {
        //alert("for element id :"+fobj.elements[i].id);
        id = fobj.elements[i].id;
        //alert(document.getElementById(fobj.elements[i].id).value);
        switch (id) {
            case "desc":
                err = document.getElementById("descL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Description.";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            case "duration":
                err = document.getElementById("durationL");
                if (document.getElementById(id).value == "" || isNaN(document.getElementById(id).value)) {
                    if (isNaN(document.getElementById(id).value)) {
                        err.innerHTML = "Please enter a Number.";
                    } else {
                        err.innerHTML = "Please enter Duration";
                    }
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            case "status":
                err = document.getElementById("statusL");
                if (document.getElementById(id).selectedIndex == 0) {
                    err.innerHTML = "Please select Status";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            case "type":
                err = document.getElementById("typeL");
                if (document.getElementById(id).selectedIndex == 0) {
                    err.innerHTML = "Please select Type";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
        }
    }
    if (count > 0) {
        ret = false;
    }
    return ret;
}

function user_validate(fobj) {
//    alert("Validation");
    //valid = true;
    //alert(fobj.elements.length);
    var ret = true;
    var err = " ";
    var count = 0;
    var id;
    var newPass="";
    for (var i = 0; i < fobj.elements.length; i++) {
//        alert("for element id :"+fobj.elements[i].id);
        id = fobj.elements[i].id;
//        alert(document.getElementById(fobj.elements[i].id).value);
        switch (id) {

            case "uname":
                err = document.getElementById("unameL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Name.";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            case "ans":
                err = document.getElementById("ansL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Password.";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            
            case "ques":
                err = document.getElementById("quesL");
                if (document.getElementById(id).selectedIndex == 0) {
                    err.innerHTML = "Please select Status";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
                case "pword":
                err = document.getElementById("pwordL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter New Password.";
                    count++;
                } else {
                    newPass=document.getElementById(id).value;
                    err.innerHTML = "";
                }
                
                break;
            case "cpword":
                err = document.getElementById("cpwordL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please Reenter New password.";
                    count++;
                } else if(newPass!=document.getElementById(id).value){
                    err.innerHTML = "Password Mismatch.";
                    count++;
                }else{
                    err.innerHTML = "";
                }
                break;
            
        }
    }
    if (count > 0) {
        ret = false;
    }
    return ret;
}
function bgsound_validate(fobj) {
    //alert("Validation");
    //valid = true;
    //alert(fobj.elements.length);
    var ret = true;
    var err = " ";
    var count = 0;
    var id;
    for (var i = 0; i < fobj.elements.length; i++) {
        //alert("for element id :"+fobj.elements[i].id);
        id = fobj.elements[i].id;
        //alert(document.getElementById(fobj.elements[i].id).value);
        switch (id) {
            case "desc":
                err = document.getElementById("descL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Description";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            case "status":
                err = document.getElementById("statusL");
                if (document.getElementById(id).selectedIndex === 0) {
                    err.innerHTML = "Please select Status";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
        }
    }
    if (count > 0) {
        ret = false;
    }
    return ret;
}
function clientReg_validate(fobj) {
    //alert("Validation");
    //valid = true;
    //alert(fobj.elements.length);
    var ret = true;
    var err = " ";
    var count = 0;
    var id;
    for (var i = 0; i < fobj.elements.length; i++) {
        //alert("for element id :"+fobj.elements[i].id);
        id = fobj.elements[i].id;
        //alert(document.getElementById(fobj.elements[i].id).value);
        switch (id) {
            case "id":
                err = document.getElementById("idL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Client ID";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            case "desc":
                err = document.getElementById("descL");
                if (document.getElementById(id).value == "") {
                    err.innerHTML = "Please enter Description ";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            case "channel":
                err = document.getElementById("channelL");
                if (document.getElementById(id).selectedIndex === 0) {
                    err.innerHTML = "Please select channel";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
            case "status":
                err = document.getElementById("statusL");
                if (document.getElementById(id).selectedIndex === 0) {
                    err.innerHTML = "Please select Status";
                    count++;
                } else {
                    err.innerHTML = "";
                }
                break;
        }
    }
    if (count > 0) {
        ret = false;
    }
    return ret;
}
function test() {
    alert('triggered');
}
function getVideoDur() {
    var vid=0;
    vid = document.getElementById("thumbvideo").duration;
//    alert(isNaN(vid));
    if(!isNaN(vid)){
        document.getElementById("duration").value = vid;
    }else{
        document.getElementById("durationL").innerHTML = "unsupported format";
    }
    
}
var rowNo;
function  selectData(curRowNo) {
    var row = document.getElementById("row" + curRowNo);
    var arrowDiv = document.getElementById("arrowDiv" + curRowNo);
    var totrows = document.getElementById("totrows");
//    var start=(totrows.value-document.getElementById("numOfRows").value);
    var start=0;
    var up = document.getElementById("btnUp"+ curRowNo);
    var down = document.getElementById("btnDown"+ curRowNo);
    var mod=totrows.value%document.getElementById("numOfRows").value-1;
    if(mod!=0){
        start=(totrows.value-mod);
    }else{
        start=(totrows.value-document.getElementById("numOfRows").value);
    }

//    start=1;
    up.disabled = false;
    down.disabled = false;
    
    rowNo = curRowNo;
    curRow = curRowNo - start;
    console.log(start);
    if (rowNo == 1) {
        up.disabled = true;
    }

    if (((document.getElementById("endOfRec").value=="true")&&(rowNo >= totrows.value-1))) {
        down.disabled = true;
    }


    for (var i = start; i < totrows.value; i++){
        document.getElementById("arrowDiv" + i).style.display="none";
    }
    for (var i = start; i < totrows.value; i++) {
        document.getElementById("row" + i).setAttribute("class", "td_Gray");
    }
    arrowDiv.style.display="block";
    clschange = false;
    if (!clschange) {
        row.setAttribute("class", "td_Cyan");
        clschange = true;
    } else {
        row.setAttribute("class", "td_Gray");
        clschange = false;
    }
    
}
function reOrder(type) {
 
    var id=0;
    var sq=0;
    var id1=0;
    var sq1=0;
    var tmp=0;
    if(document.getElementById("id"+rowNo)!=null&&document.getElementById("sq"+rowNo)!=null){
        id=document.getElementById("id"+rowNo).value;
        sq=document.getElementById("sq"+rowNo).value;
    }
        
    var start=1;//document.getElementById("seq").value;
    start=parseInt(start);
    var totrows = document.getElementById("totrows");
    var vis = document.getElementById("vis");
//console.log(rowNo);
           var up = document.getElementById("btnUp"+ rowNo);
    var down = document.getElementById("btnDown"+ rowNo);

    if (rowNo+1 == 1) {
        up.disabled = true;
    }
    if (((document.getElementById("endOfRec").value=="true")&&(rowNo+1 >= totrows.value-1))) {
//        console.log("down");
        down.disabled = true;
        document.getElementById("vis").value="down";
//        console.log("vis down "+document.getElementById("vis").value);
    }
 
var srt=0;
    var rcnt = document.getElementById("rcnt")
    var val=0;
    var cur=0;
    var pre=0;
    var mod=totrows.value%document.getElementById("numOfRows").value-1;
//    console.log("mod "+(mod));
    if(mod!=0){
        srt=(totrows.value-mod);
    }else{
        srt=(totrows.value-document.getElementById("numOfRows").value);
    }
//    console.log("startr "+start);
  cur=parseInt(curRow)+parseInt(srt)-1;
    prev = 0;
    if (type === "up") {
        pre=cur-1;
        if (rowNo === start) {
            rowNo += 1;
        } else {
            rowNo -= 1;
        }

        val=curRow+start-1;
        document.getElementById("sltdRow").value = val;
    } else if (type === "down") {
        pre=cur+1;
//        prev = curRow + 1;
        if (rowNo === totrows.value) {
            rowNo -= 1;
        } else {
            rowNo += 1;
        }
        val=curRow+start+1;
        document.getElementById("sltdRow").value = val;
    }

    if(document.getElementById("id"+rowNo)!=null&&document.getElementById("sq"+rowNo)!=null){
        id1=document.getElementById("id"+rowNo).value;
        sq1=document.getElementById("sq"+rowNo).value;
    }

    tmp=sq;
    sq=sq1;
    sq1=tmp;

    if(document.getElementById("ro")!=null){
       document.getElementById("ro").value = id+","+sq+","+id1+","+sq1;
    }

        var totRec=((rcnt.value-1)+(srt-1));

    
    vis.value = "";
    if (type === "up") {
        if(rowNo<srt){
            document.getElementById("switch").value="up";
        }
        
    }else if(type == "down"){
        if(rowNo>totRec){
            document.getElementById("switch").value="down";
        }
    }
//    console.log("down-ngf "+document.getElementById("switch").value);
    if (rowNo === start) {
        vis.value = "up";
    } else if (((document.getElementById("endOfRec").value=="true")&&(rowNo >= totrows.value-1))) {
//        console.log("down----");
        vis.value = "down";
    }
 if (type === "up") {
        curRow = curRow - 1;
    } else if (type === "down") {
        curRow = curRow + 1;
    }
    return true;
}
function editQues(div,url){
    if(document.getElementById("btnedit").style.visibility=="hidden"){
        return false;
    }
    var urlcopy=url;
    var urlToSend="";
    console.log("editQues "+urlcopy.indexOf("eQues"));
    if(urlcopy.indexOf("eQues")!=-1){
        console.log("contains-edit");
        var urlSplit=urlcopy.split("&");
        
        for(var i=0;i<urlSplit.length;i++){
//            console.log("for");
//            console.log("match "+(urlSplit[i]));
            if(urlSplit[i].indexOf("eQues")!=-1){
                console.log("contans");
                var eQuesSplit=urlSplit[i].split("=");
//                console.log(eQuesSplit[0]+eQuesSplit[1]);
//                console.log((eQuesSplit[1]=="0"));
                if(eQuesSplit[1]=="0"){
                    urlToSend+="eQues=1&";
                }else{
                    urlToSend+="eQues=0&";
                }
            }else{
                urlToSend+=urlSplit[i]+"&";
            }
        }
        console.log("urlToSend "+urlToSend);
        LoadDiv(div,urlToSend);
    }
}
function editPass(div,url){
//    alert("up "+document.getElementById("btnedit").style.visibility);
    if(document.getElementById("btnedit").style.visibility=="hidden"){
        return false;
    }
     var urlcopy=url;
    var urlToSend="";
    if(urlcopy.indexOf("ePass")!=-1){
        var urlSplit=urlcopy.split("&");
        
        for(var i=0;i<urlSplit.length;i++){
            if(urlSplit[i].indexOf("ePass")!=-1){
                console.log("contans");
                var ePassSplit=urlSplit[i].split("=");
                if(ePassSplit[1]=="0"){
                    urlToSend+="ePass=1&";
                }else{
                    urlToSend+="ePass=0&";
                }
            }else{
                urlToSend+=urlSplit[i]+"&";
            }
        }
        console.log("urlToSend "+urlToSend);
        LoadDiv(div,urlToSend);
    }
}

