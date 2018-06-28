function doClick(buttonName,e)
{
    var keyunicode=e.charCode || e.keyCode    
    //the purpose of this function is to allow the enter key to 
    //point to the correct button to click.
    var key;					
    if(e.which){//firefox
        if (keyunicode == 13)
        {
            //Get the button the user wants to have clicked
            var btn = document.getElementById(buttonName);
            if (btn != null)
            { //If we find the button click it
                btn.click(); e.charCode = 0 ; //firefox
            }
        }                                              
    }
    else {
        key = e.keyCode; //IE    
        if (key == 13)
        {
            //Get the button the user wants to have clicked
            var btn = document.getElementById(buttonName);
            if (btn != null)
            { //If we find the button click it
                btn.click(); e.keyCode = 0 ; //IE
            }
        }                        
    }
}

        var key1 = 'ABQIAAAAGbe15MnqXib6_AaXgHErgxRsROQRoIwy6oyws6FuiOM8dwVGcxT4PV59tKtGC1JTW4yxbegtlyBwQw';
        var key2 = 'ABQIAAAAGbe15MnqXib6_AaXgHErgxSwjfvWQ-isB4Rz4D7GZAmS-xEErxQEqveaiCBNZdetB1hDaqHBggK21Q';
        var myKey = key2;
        if (window.location.host == 'www.gmapplus.com' || window.location.host== 'gmapplus.com') {
          myKey = key1;
        }
        else {
          myKey = key2;
        }
        var scriptTag = '<' + 'script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=' + myKey + '">'+'<'+'/script>';
        document.write(scriptTag);


        var map ;   
        var lastpoint;
        var lastclick = "" ;				// Last Clicked Point        
        function initialize() {
        	console.log("initialized");
            map = new GMap2(document.getElementById("map_canvas"));
            var latlng = new GLatLng(39,-26) ; // Memphis Airport
            map.setCenter(latlng,2);
            map.addControl(new GSmallMapControl());
            map.addControl(new GMapTypeControl());  
            map.addMapType(G_PHYSICAL_MAP);
            map.setMapType(G_PHYSICAL_MAP);                      
            //map.enableScrollWheelZoom();
            }                    
        
        function updateCountryList(result){            
            var SelectCountry = document.getElementById("SelectCountry");            
            SelectCountry.options.length = 1;            
            var countryArray = new Array();
            countryArray = result.split("|");
            var y=document.createElement("option");
            y.text='default';
            var i = 0;                
            for(i=0;i<countryArray.length;i++){                
                y = document.createElement("option");                
                y.text = countryArray[i];
                if (window.attachEvent) { // IE
                    document.getElementById("SelectCountry").add(y);
                }else{ // firefox
                    document.getElementById("SelectCountry").add(y,null);
                }                
            }                      
        }
        
        function SelectCountry_onchange(){
            window.status = "Update region values...";
            var SelectCountry = document.getElementById("SelectCountry");
            var SelectRegion = document.getElementById("SelectRegion");
            if(SelectCountry.options[SelectCountry.selectedIndex].text==".."){
                SelectRegion.options.length = 1;
                map.clearOverlays();
                return;
            }          
        }
        
        function UpdateRegion(result){
            var SelectRegion = document.getElementById("SelectRegion");
            SelectRegion.options.length = 1;
            var regionArray = new Array();
            regionArray = result.split("|");
            var y=document.createElement("option");
            y.text='default';
            var i = 0;                
            for(i=0;i<regionArray.length;i++){
                y = document.createElement("option");
                y.text = regionArray[i];
                if (window.attachEvent) { // IE
                    document.getElementById("SelectRegion").add(y);
                }else{ // firefox
                    document.getElementById("SelectRegion").add(y,null);
                }                                
            }            
        }

        function SelectRegion_onchange(){
            window.status = "Update region values...";
            var SelectCountry = document.getElementById("SelectCountry");
            var SelectRegion = document.getElementById("SelectRegion");
            if(SelectCountry.options[SelectCountry.selectedIndex].text==".."){
                SelectRegion.options.length = 1;
                map.clearOverlays();
                return;
            }
            if(SelectRegion.options[SelectRegion.selectedIndex].text==".."){                
                map.clearOverlays();
                return;
            }        
        }
        
        function UpdateMap(result){
            var SelectCountry = document.getElementById("SelectCountry");
            var SelectRegion = document.getElementById("SelectRegion"); 
            var TDDetail = document.getElementById("TDDetail");       
            var returnAry = new Array();
            returnAry = result.split("+");
            var returnCenterX = returnAry[0];
            var returnCenterY = returnAry[1];
            var returnGeom = returnAry[2];
            var htmlStr="";
            htmlStr+="<table style='width: 95%; border-top-style: ridge; border-right-style: ridge; border-left-style: ridge; border-bottom-style: ridge;'>";
            htmlStr+="<tr style='background-color: #aaaaaa;'><td>Country</td></tr><tr><td align='center'><a href='#'>"+SelectCountry.options[SelectCountry.selectedIndex].text+"</a></td></tr>"
            htmlStr+="<tr style='background-color: #aaaaaa;'><td>Region-State-Province</td></tr><tr><td align='center'><a href='#'>"+SelectRegion.options[SelectRegion.selectedIndex].text+"</a></td></tr>"
            htmlStr+="</table>";
            
            TDDetail.innerHTML = htmlStr;

            map.clearOverlays();            
            var geomAry = new Array();
            geomAry = returnGeom.split("|");
            var XY = new Array();
            var points = [] ;
            for (var i = 0; i < geomAry.length; i++)
            {
                XY = geomAry[i].split(",");
                points.push( new GLatLng(parseFloat(XY[1]),parseFloat(XY[0])) ) ;
            }                
            map.addOverlay( new GPolygon(points,"#f33f00", 1, 1, "#ff0000", 0.2) );
            if((map.getZoom()>8) |(map.getZoom()<4)){
                map.setCenter(new GLatLng(parseFloat(returnCenterY),parseFloat(returnCenterX)),5);
            }
            else{
                map.panTo(new GLatLng(parseFloat(returnCenterY),parseFloat(returnCenterX)));
            }      
            var polygonjs=document.getElementById("polygonjs");
            polygonjs.value="";
            polygonjs.value+="\\\\The following code generate a  \n";
            polygonjs.value+="\\\\GPolygon object\n";
            polygonjs.value+="\\\\Named as dynRegionPolygon  \n";
            polygonjs.value+="var returnGeom = '"+ +"'; \n";
            polygonjs.value+="var geomAry = new Array(); \n";
            polygonjs.value+="geomAry = returnGeom.split('|'); \n";
            polygonjs.value+="var XY = new Array(); \n";
            polygonjs.value+="var points = []; \n";
            polygonjs.value+="for (var i = 0; i < geomAry.length; i++) \n";
            polygonjs.value+="{ \n";
            polygonjs.value+="XY = geomAry[i].split(','); \n";
            polygonjs.value+="points.push( new GLatLng(parseFloat(XY[1]),parseFloat(XY[0]))) ; \n";
            polygonjs.value+="} \n";
            polygonjs.value+="var dynRegionPolygon = new GPolygon(points,'#f33f00', 1, 1, '#ff0000', 0.2); \n";            
        }        