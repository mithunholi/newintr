package com.eoxys.Controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import org.springframework.web.bind.support.SessionStatus;

import com.eoxys.Model.Employees;
import com.eoxys.Model.Users;
import com.eoxys.Services.EmployeesService;
/*import com.eoxys.Services.LoginService;
import com.eoxys.Services.UsersService;
import com.eoxys.Services.WebloginService;*/
import com.eoxys.Services.LoginService;
import com.eoxys.Services.UserService;
import com.eoxys.Util.EncDecPassword;

@Controller
public class WebloginController {

	String msg="";
	String click="";
	@Autowired
	LoginService loginService;
	
	@Autowired
	EmployeesService employeesService;
	
	//Redirect to default login page
	@RequestMapping(value = "/")
	public String redirectIndex(ModelMap map,HttpServletRequest req) {
	
		return "login";
	}

	@RequestMapping(value = "/login")
	public String Login(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("login page");
		map.addAttribute("click", "inactive");
		System.out.println("loginclick sended");
		System.out.println();
		return "login";
	}
	
	@RequestMapping(value = "/news1")
	public String news1(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("news1 page");

		System.out.println();
		return "news1";
	}
	
	@RequestMapping(value = "/news2")
	public String news2(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("news2 page");

		System.out.println();
		return "news2";
	}
	
	@RequestMapping(value = "/Auth/forget")
	public String forget(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("forget page");

		System.out.println();
		return "forget";
	}
	/*@RequestMapping(value = "/applyleave", method = RequestMethod.GET)
	public String applyleave(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("applyleave page");

		System.out.println();
		return "applyleaveGet";
	}*/
	/*@RequestMapping(value = "/Index/intraprofile")
	public String Intraprofile(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("Intraprofile page");
		return "intraprofile";
	}*/
	@RequestMapping(value = "/adduser", method = {RequestMethod.GET,RequestMethod.POST})
	public String adduser(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("adduser page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "adduserGET";
		}else{
			System.out.println("POST");
			return "adduserPOST";
		}
		
	}
	
	/*@RequestMapping(value = "/login", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("login page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "loginGET";
		}else{
			System.out.println("POST");
			return "loginPOST";
		}
		
	}*/
	@RequestMapping(value = "/newsletter", method = {RequestMethod.GET,RequestMethod.POST})
	public String newsletter(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("adduser page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "newsletterGET";
		}else{
			System.out.println("POST");
			return "newsletterPOST";
		}
		
	}
	
	@RequestMapping(value = "/fullcalendar", method = {RequestMethod.GET,RequestMethod.POST})
	public String fullcalender(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("fullcalender page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "fullcalendarGET";
		}else{
			System.out.println("POST");
			return "fullcalendarPOST";
		}
		
	}
	
	@RequestMapping(value = "/monthlyevent", method = {RequestMethod.GET,RequestMethod.POST})
	public String monthlyevent(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("monthlyevent page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "monthlyeventGET";
		}else{
			System.out.println("POST");
			return "monthlyeventPOST";
		}
		
	}
	
	
	
	@RequestMapping(value = "/policy", method = {RequestMethod.GET,RequestMethod.POST})
	public String policy(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("policy page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "policyGET";
		}else{
			System.out.println("POST");
			return "policyPOST";
		}
		
	}
	
	
@RequestMapping(value = "/applyleave", method = {RequestMethod.GET,RequestMethod.POST})
	public String applyleave(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("applyleave page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "applyleaveGET";
		}else{
			System.out.println("POST");
			return "applyleavePOST";
		}
		
	}
	
	@RequestMapping(value = "/intraprofile", method = {RequestMethod.GET,RequestMethod.POST})
	public String intraprofile(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("intraprofile page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "intraprofileGET";
		}else{
			System.out.println("POST");
			return "intraprofilePOST";
		}
		
	}
	
	@RequestMapping(value = "/news1", method = {RequestMethod.GET,RequestMethod.POST})
	public String newss(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("news1 page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "news1GET";
		}else{
			System.out.println("POST");
			return "news1POST";
		}
		
	}
	@RequestMapping(value = "/news2", method = {RequestMethod.GET,RequestMethod.POST})
	public String newss2(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("news2 page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "news2GET";
		}else{
			System.out.println("POST");
			return "news2POST";
		}
		
	}
	
	//form value 
	@RequestMapping(value = "/check")
	public String check123(ModelMap map) {
		System.out.println("login again page");
		map.addAttribute("click", "active");
		System.out.println();
		return "index";
	}
	
	/*@RequestMapping(value = "/Weblogin/index")
	public String check(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("ur in home page");
		map.addAttribute("click", "inactive");
		System.out.println("loginclick sended");
		
		System.out.println("");
		String respMsgTyp="";
		String respMsg="";
		String respAct="";
		
		
		respMsgTyp="html";
		respMsg="";
		respAct= req.getContextPath()+"/check";
		map.addAttribute("type", respMsgTyp);
		map.addAttribute("msg", respMsg);
		map.addAttribute("act", respAct);
		
		return "respJson";
		}
}*/
	
	
	@RequestMapping(value = "/Weblogin/index", method = RequestMethod.POST)
	public String checkLogin( HttpServletRequest req, ModelMap map,HttpSession session,SessionStatus status) {
		
		System.out.println("ur in home page");
		map.addAttribute("click", "inactive");
		System.out.println("loginclick sended");
		
		String retView="respJson";
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		System.out.println("username="+username+ " & pswd="+password);
		String encpwd=EncDecPassword.encPassword(password);
		System.out.println("username="+username+ " & pswd="+encpwd);
		/*int empId = loginService.getEmployeeIdUsingUsername(username);*/
		Users user =loginService.checkLogin(username , encpwd);
		System.out.println("user="+user);
		String respMsgTyp="";
		String respMsg="";
		String respAct="";
		if(user==null){
			respMsgTyp="fail";
			respMsg="Invalid Username and Password";
			map.addAttribute("type", respMsgTyp);
			map.addAttribute("msg", respMsg);
			map.addAttribute("act", respAct);
			System.out.println("Invalid Username and Password");
			retView="respJson";
		}
		/*else{
			if(user.getActivation_sts().equals("0")){
				respMsgTyp="fail";
				respMsg="Your Account is Inactive";
				map.addAttribute("type", respMsgTyp);
				map.addAttribute("msg", respMsg);
				map.addAttribute("act", respAct);
				System.out.println("Your Account is Inactive");
				retView="respJson";
			} */	
					else {
						System.out.println("hello");
						respMsgTyp="html";
						respMsg="";
						respAct= req.getContextPath()+"/check";
						map.addAttribute("type", respMsgTyp);
						map.addAttribute("msg", respMsg);
						map.addAttribute("act", respAct);
						retView="respJson";
					}
				
			
		
		
		return retView;
	}
	
	/*@RequestMapping(value = "/signupnew", method = {RequestMethod.GET,RequestMethod.POST})
	public String signupnew(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("signupnew page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "signupnewGET";
		}else{
			System.out.println("POST");
			return "signupnewPOST";
		}
		
	}*/
	/*@RequestMapping(value = "/signupnew")
	public String signup(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("login page");
		map.addAttribute("click", "inactive");
		System.out.println("loginclick sended");
		System.out.println();
		return "signup";
	}*/
	
	
	
}

	