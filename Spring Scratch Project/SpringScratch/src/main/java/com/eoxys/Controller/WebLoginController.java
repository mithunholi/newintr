package com.eoxys.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.eoxys.Dao.BOUsersDao;
import com.eoxys.Email.Email;
import com.eoxys.Model.BOUsersLoginFailedReport;
import com.eoxys.Model.BOUsersLoginReport;
//import com.eoxys.Model.Advertisers;
//import com.eoxys.Model.DeviceBusinessOwners;
//import com.eoxys.Model.DeviceIndividualOwners;
import com.eoxys.Model.Employees;
import com.eoxys.Model.BOUsers;
import com.eoxys.Services.BOUsersLoginFailedReportService;
import com.eoxys.Services.BOUsersLoginReportService;
//import com.eoxys.Services.AdvertisersService;
//import com.eoxys.Services.DeviceOwnersService;
import com.eoxys.Services.EmployeesService;
import com.eoxys.Services.LoginService;
import com.eoxys.Services.BOUsersService;
import com.eoxys.Util.EncDecPassword;

@Controller
public class WebLoginController {
	String msg = "";
	String click = "";
	@Autowired
	LoginService loginService;
	@Autowired
	BOUsersLoginFailedReportService bOUsersLoginFailedReportService;
	@Autowired
	BOUsersLoginReportService bOUsersLoginReportService;
	// @Autowired
	// AdvertisersService advertisersService;
	@Autowired
	EmployeesService employeesService;

	// @Autowired
	// DeviceOwnersService deviceOwnersService;

	@RequestMapping(value = "/login")
	public String Login(ModelMap map, HttpServletRequest req,
			HttpServletResponse resp) {
		System.out.println("LOGIN " + req.getRemoteAddr() + ","
				+ req.getRemoteHost() + "," + req.getRemoteUser() + ","
				+ req.getHeader("X-FORWARDED-FOR"));
		// System.out.println(req.getCookies());
		// Cookie[] cookies = req.getCookies();
		// int login_attempt=0;
		// for(Cookie cook : cookies){
		// if(cook.getName().equals("login_attempt")){
		// try{
		// login_attempt=Integer.parseInt(cook.getValue().toString().toString());
		// login_attempt++;
		// cook.setValue(login_attempt+"");
		// }catch(Exception e){
		//
		// }
		// }
		// }
		// if(login_attempt==0){
		// Cookie logAptCook = new Cookie("login_attempt", "1");
		// // logAptCook.setPath("/MyApplication");
		// logAptCook.setMaxAge(3600);
		// resp.addCookie(logAptCook);
		//
		// }
		// System.out.println("login_attempt "+login_attempt);
		// System.out.println("login page "+req.getParameter("logged_in"));
		// map.addAttribute("click", "inactive");
		// map.addAttribute("logged_in", req.getParameter("logged_in"));
		System.out.println("loginclick sended");
		// System.out.println();
		return "login";
	}

	@RequestMapping(value = "/login_again")
	public String Login_again(HttpServletRequest req, HttpServletResponse resp,
			ModelMap map) {
		System.out.println("login again page");
		// Cookie[] cookies = req.getCookies();
		// int login_attempt=0;
		// for(Cookie cook : cookies){
		// if(cook.getName().equals("login_attempt")){
		// try{
		// login_attempt=Integer.parseInt(cook.getValue().toString().toString());
		// login_attempt++;
		// cook.setValue(login_attempt+"");
		// }catch(Exception e){
		//
		// }
		// }
		// }
		// if(login_attempt==0){
		// Cookie logAptCook = new Cookie("login_attempt", "1");
		// // logAptCook.setPath("/MyApplication");
		// logAptCook.setMaxAge(3600);
		// resp.addCookie(logAptCook);
		//
		// }
		// System.out.println("login_attempt "+login_attempt);
		System.out.println("login page " + req.getParameter("logged_in") + ","
				+ req.getParameter("goto"));
		map.addAttribute("click", "inactive");
		map.addAttribute("logged_in", req.getParameter("logged_in"));
		map.addAttribute("goto", req.getParameter("goto"));
		System.out.println();
		return "login";
	}
	
	/*@RequestMapping(value = "/registerlogin", method = RequestMethod.POST)
	public String registerLogin(HttpServletRequest req, HttpServletResponse resp,
			ModelMap map, HttpSession session, SessionStatus status, TimeZone tz)
			throws Exception {
		return "";
	}*/

	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest req, HttpServletResponse resp,
			ModelMap map, HttpSession session, SessionStatus status, TimeZone tz)
			throws Exception {
		System.out.println("CheckLogin ");
		String retView = "respJson";
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println("username=" + username + " & pswd=" + password);
		String encpwd = EncDecPassword.encPassword(password);
		Employees emp = employeesService.getEmployeeUsingUsrName(username);
		System.out.println("Emp " + emp + "," + username);
		SimpleDateFormat df = new SimpleDateFormat("Z");
		String respMsgTyp = "";
		String respMsg = "";
		String respAct = "";
		BOUsers user = null;
		if (emp != null) {
			int userId = loginService.isUserAvail(username);
			if (userId > 0) {
				int empId = emp.getId();
				user = loginService.checkLogin(empId, encpwd);
				System.out.println("user=" + user);
				if (user == null) {
					respMsgTyp = "fail";
					respMsg = "Password incorrect.";
					int loginAtptCnt = bOUsersLoginFailedReportService
							.getFailedAttemptCnt(userId);
					if (loginAtptCnt > 2) {
						respMsg = "";
						System.out.println("Exceeds 3 attempt");
						if (loginService.changeActiveSt(userId)) {
							respMsg = "user is locked because";
						}
						respMsg += " Exceeds 3 login attempt";

					} else {
						loginAtptCnt++;
						BOUsersLoginFailedReport bo = new BOUsersLoginFailedReport();
						bo.setUser_id(userId + "");
						bo.setClient_ip_address(req.getRemoteAddr());

						df.setTimeZone(tz);

						String result = df.format(new Date());
						System.out.println("result " + result);
						bo.setTime_zone("GMT" + result);
						if (bOUsersLoginFailedReportService.addFailedReport(bo)) {
							respMsg = "Login attempt Failed (" + loginAtptCnt
									+ "/3)";
						}
					}
					System.out.println("loginAtptCnt " + loginAtptCnt);

				} else {
					Cookie cUid = new Cookie("login_attempt_cnt", "");
					cUid.setMaxAge(0);
					resp.addCookie(cUid);
					Cookie usr = new Cookie("login_username", "");
					usr.setMaxAge(0);
					resp.addCookie(usr);
					if (user.getActivation_sts().equals("0")) {
						respMsgTyp = "fail";
						respMsg = "Your Account is Inactive";

						System.out.println("Your Account is Inactive");
						// retView = "respJson";
					} else {
						bOUsersLoginFailedReportService
								.deleteAllFailedReport(userId);
						BOUsersLoginReport bo = new BOUsersLoginReport();
						bo.setUser_id(userId + "");
						bo.setClient_ip_address(req.getRemoteAddr());
						bo.setAction(1);
						df.setTimeZone(tz);

						String result = df.format(new Date());
						System.out.println("result " + result);
						bo.setTime_zone("GMT" + result);
						bOUsersLoginReportService.addLoginReport(bo);
						System.out.println("hello");
						respMsgTyp = "html";
						respMsg = "";
						respAct = req.getContextPath() + "/user_type?usrname="
								+ username + "&pwd=" + user.getPassword()
								+ "&user=" + user.getUser_uid() + "&userType="
								+ user.getUser_role_uid() + "&userId="
								+ user.getId();

					}
					System.out.println("respMsg " + respMsg);
					System.out.println("Invalid Username and Password");
				}
			} else {
				respMsgTyp = "fail";
				respMsg = "invalid Username.";
				// retView = "respJson";
			}
		} else {
			respMsgTyp = "fail";
			respMsg = "invalid Username.";
			// retView = "respJson";
		}
		map.addAttribute("msg", respMsg);
		map.addAttribute("act", respAct);
		map.addAttribute("type", respMsgTyp);
		retView = "respJson";
		// Users user = loginService.checkLogin(username, encpwd);

		return retView;
	}

	@RequestMapping(value = "/user_type")
	public String userType(ModelMap map, HttpServletRequest req,
			HttpServletResponse resp) {
		String Username = req.getParameter("usrname");
		String pwd = req.getParameter("pwd");
		pwd = EncDecPassword.encPassword(req.getRemoteAddr() + pwd + "CHIDA"
				+ EncDecPassword.encPassword("bumperGlass"));
		String userUid = req.getParameter("user");
		String userId = req.getParameter("userId");
		int userType = Integer.parseInt(req.getParameter("userType"));
		String displayName;
		Cookie[] cookies = req.getCookies();
		if (cookies == null)
			cookies = new Cookie[0];
		Cookie cUid = null, cName = null, cPwd = null, cRole = null, cUserId = null;
		// cookie concept
		cPwd = new Cookie("pwd", pwd);
		// cPwd.setMaxAge(60*60);
		resp.addCookie(cPwd);

		cRole = new Cookie("role", EncDecPassword.encBase64(userType + ""));
		// cRole.setMaxAge(18);//15*24*60*60
		resp.addCookie(cRole);

		cUid = new Cookie("userUid", userUid);
		// cUid.setMaxAge(18);
		resp.addCookie(cUid);

		cUserId = new Cookie("userId", userId);
		// cUserId.setMaxAge(18);
		resp.addCookie(cUserId);

		// switch case
		switch (userType) {
		case 1:
			Employees emp = employeesService.getEmployeeUsingUsrName(Username);
			if (emp == null) {
				displayName = "Super Admin";
			} else {
				displayName = emp.getName();
			}
			// cookie concept
			cName = new Cookie("displayName", displayName);
			cName.setPath("/");
			cName.setMaxAge(18);
			resp.addCookie(cName);
			return "redirect:dashboard";
		case 2:
			// Advertisers adInfo = advertisersService.getAdvertiser(userUid);
			// displayName = adInfo.getUser_display_name();
			// System.out.println("Adv ," + displayName);
			// // cookie concept
			// cName = new Cookie("displayName", displayName);
			// cName.setPath("/");
			// resp.addCookie(cName);
			// req.getSession().setAttribute("displayName", displayName);
			// return "redirect:advertiser_dashboard";
		case 3:
			// DeviceBusinessOwners dboInfo =
			// deviceOwnersService.getDbo(userUid);
			// displayName = dboInfo.getUser_display_name();
			// System.out.println("devB ," + displayName);
			// cName = new Cookie("displayName", displayName);
			// cName.setPath("/");
			// resp.addCookie(cName);
			// req.getSession().setAttribute("displayName", displayName);
			// return "redirect:deviceOwner_dashboard";
		case 4:
			// DeviceIndividualOwners dioInfo = deviceOwnersService
			// .getDio(userUid);
			// displayName = dioInfo.getUser_display_name();
			// System.out.println("devI ," + displayName);
			// cName = new Cookie("displayName", displayName);
			// cName.setPath("/");
			// resp.addCookie(cName);
			// req.getSession().setAttribute("displayName", displayName);
			// return "redirect:deviceOwner_dashboard";
		default:
			System.out.println("Not defined");
			break;
		}
		System.out.println("user=" + userUid + ", userType=" + userType);
		return "redirect:dashboard";
	}

	/*
	 * @RequestMapping(value = "/Advertiser_signup", method = RequestMethod.GET)
	 * public String ad_signup(HttpSession session,HttpServletRequest
	 * req,SessionStatus status, ModelMap map) {
	 * System.out.println("Ad signup"); map.addAttribute("msg",
	 * "Successfully logged out"); return "Advertiser_signup"; }
	 */

	/*
	 * @RequestMapping(value = "/DeviceOwner_signup", method =
	 * RequestMethod.GET) public String dev_signup(HttpSession
	 * session,HttpServletRequest req,SessionStatus status, ModelMap map) {
	 * System.out.println("Ad signup"); map.addAttribute("msg",
	 * "Successfully logged out"); return "DeviceOwner_signup"; }
	 */

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest req,
			HttpServletResponse resp, SessionStatus status, ModelMap map) {
		System.out.println("After logout");
		Cookie[] cookies = req.getCookies();
		String userId = "";
		for (Cookie cookie : cookies) {
			System.out.println("cooki " + cookie.getName() + "="
					+ cookie.getValue());
			if (cookie.getName().equals("userId")) {
				// System.out.println("userId " + cookie.getValue());
				userId = cookie.getValue();
			}

			if (cookie.getValue() == null && cookie.getValue() == null) {
				return "redirect:login_again?msg=error";
			}
		}
		Cookie cUid = new Cookie("userUid", "");
		cUid.setMaxAge(0);
		resp.addCookie(cUid);
		Cookie cName = new Cookie("displayName", "");
		cName.setPath("/");
		cName.setMaxAge(0);
		resp.addCookie(cName);
		Cookie cRole = new Cookie("role", "");
		cRole.setMaxAge(0);
		resp.addCookie(cRole);
		Cookie cUserId = new Cookie("userId", "");

		cUserId.setMaxAge(0);
		resp.addCookie(cUserId);
		System.out.println("userId " + userId);
		if (userId != null && !userId.equals("")) {
			System.out.println("userId======================= ");
			BOUsersLoginReport bo = new BOUsersLoginReport();
			bo.setUser_id(userId + "");
			bo.setClient_ip_address(req.getRemoteAddr());
			bo.setAction(0);

			bOUsersLoginReportService.addLoginReport(bo);
		}

		System.out.println("Successfully loggedOut");
		return "redirect:login_again?msg=goodbye";
	}

	@RequestMapping(value = "Advertiser-Auth/home", method = RequestMethod.GET)
	public String advertiserAuth(HttpSession session, HttpServletRequest req,
			SessionStatus status, ModelMap map) {
		System.out.println("After click");
		map.addAttribute("msg", "");
		return "Advertiser-Auth/home";
	}

	@RequestMapping(value = "/active_fail", method = RequestMethod.POST)
	public String activationFail(HttpServletRequest req, ModelMap map) {
		return "active_fail";
	}
}
