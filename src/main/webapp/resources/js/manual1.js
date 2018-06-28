function changeLogin()
{
	document.getElementById("ihome").className='';
	document.getElementById("iAd").className='';
	document.getElementById("iDev").className='';
	document.getElementById('ilogin').className='active';
	document.getElementById('iregister').className='';
	}
function changeRegister()
{
	document.getElementById("ihome").className='';
	document.getElementById("iAd").className='';
	document.getElementById("iDev").className='';
	document.getElementById('iregister').className='active';
	document.getElementById('ilogin').className='';
	
	}

function changeHome()
{
	document.getElementById('ihome').className='active';
	document.getElementById('iAd').className='';
	document.getElementById('iDev').className='';
	document.getElementById('iregister').className='';
	document.getElementById('ilogin').className='';
	};
function changeAd()
{
	document.getElementById('ihome').className='';
	document.getElementById('iAd').className='active';
	document.getElementById('iDev').className='';
	document.getElementById('iregister').className='';
	document.getElementById('ilogin').className='';
	};
	function changeDev()
	{
		document.getElementById('ihome').className='';
		document.getElementById('iAd').className='';
		document.getElementById('iDev').className='active';
		document.getElementById('iregister').className='';
		document.getElementById('ilogin').className='';
		};

/*dasboard menus*/
		function changeDash()
		{
			document.getElementById("dash").className='active';
			document.getElementById("emp").className='';
			document.getElementById("user").className='';
			document.getElementById('adv').className='';
			document.getElementById('dev').className='';
			}


/*function Manual1()
{

}
Manual1.prototype.getonload= function(click) {
	console.log("click print");
console.log(click);
if(click=="loginClicked")
	{
	document.getElementById('login').className='active';
	ajaxlogin();
	}


function ajaxlogin() {
	console.log("ajax");
	        $.ajax({
	            type: "GET",
	            url: "login1",
	            success: function(response) {
	                $("#sidebar").html( response );
	            }
	        });
	    }
};*/
