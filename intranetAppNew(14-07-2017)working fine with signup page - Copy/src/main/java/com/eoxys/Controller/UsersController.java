package com.eoxys.Controller;

import java.util.HashMap;
import java.util.List;

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

import com.eoxys.Model.Employees;
import com.eoxys.Model.Users;
import com.eoxys.Services.AtomicCounterService;
import com.eoxys.Services.EmployeesService;
import com.eoxys.Services.UserRoleService;
import com.eoxys.Services.UserService;
import com.eoxys.Services.WebserService;
import com.eoxys.Util.EncDecPassword;
import com.mysql.fabric.xmlrpc.base.Array;

@Controller
@RequestMapping(value = "/users")
public class UsersController {
	int showRecsPerPage = 5;
	
	static public class RoleSet {
		static public enum roles {
			ADM, DOCAPP, PATAPP
		}

		static public String rolesArr[] = { "ADM", "DOC-APP", "PAT-APP" };
	}

	@Autowired 
	UserService usrService;
	
	@Autowired 
	UserRoleService usrRoleService;
	
	@Autowired
	AtomicCounterService atomicCounterService;
	
	// roles[0]="ADM";

	// private String role="ADM";
	
/*	@RequestMapping(method = RequestMethod.GET)
	public String usersViewAllGet(HttpServletRequest req, ModelMap map) {
		System.out.println("usersGet");
		String roleParam = null;// req.getParameter("role");

		int roleIdx = 0;
		String role = "ADM";
		if (req.getSession().getAttribute("role") != null
				|| req.getParameter("role") != null) {
			if (req.getSession().getAttribute("role") != null)
				roleParam = req.getSession().getAttribute("role").toString();
			System.out.println("users/-> post ->roles post Attr= "
					+ req.getParameter("role"));
			if (req.getParameter("role") != null) {
				roleParam = req.getParameter("role").toString();
				role = roleParam;
				// req.getSession().setAttribute("role",roleParam);
			}
			// roleParam = req.getSession().getAttribute("role").toString();
			if (RoleSet.roles.valueOf(roleParam) != null) {
				roleIdx = RoleSet.roles.valueOf(roleParam).ordinal();
				role = RoleSet.roles.valueOf(roleParam).toString();
			}
		}
		int userRole = roleService.getRoleIdByUId(RoleSet.rolesArr[roleIdx]);
		int page = 0;
		int start = 0, end = 0, totpages = 0;
	
		page = 1;
		
		int totrecs = usersService.numRecords(userRole);
		int[] ret = com.calcPageRange(page, totrecs);
		start = ret[0];
		end = ret[1];
		totpages = ret[2];
		req.getSession().setAttribute("page", "" + page);
		System.out.println("st" + start + " showRecsPerPage" + showRecsPerPage);
		List<Users> usersList = usersService.getAllUsers(start,
				Common.showRecsPerPage, userRole);
		System.out.println("usersList" + usersList);
		map.addAttribute("menu", Common.users);
		map.addAttribute("pagno", "" + page);
		map.addAttribute("totpages", "" + totpages);
		map.addAttribute("usersList", usersList);
		map.addAttribute("totrecs", ""+totrecs);
		map.addAttribute("start",start);
		map.addAttribute("end",end);
		req.getSession().setAttribute("role", role);
		map.addAttribute("searchEn","0");
		map.addAttribute("userListVerify","else");
		map.addAttribute("appUrl",appUrl);
		return "usersGet";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String usersViewAllPost(HttpServletRequest req, ModelMap map) {

		String roleParam = null;
		System.out.println("users/-> post ->roles post= "
				+ req.getSession().getAttribute("role"));

		int roleIdx = 0;
		String role = "ADM";
		if (req.getSession().getAttribute("role") != null
				|| req.getParameter("role") != null) {
			if (req.getSession().getAttribute("role") != null)
				roleParam = req.getSession().getAttribute("role").toString();
			System.out.println("users/-> post ->roles post Attr= "
					+ req.getParameter("role"));
			if (req.getParameter("role") != null) {
				roleParam = req.getParameter("role").toString();
				role = roleParam;
				// req.getSession().setAttribute("role",roleParam);
			}
			// roleParam = req.getSession().getAttribute("role").toString();
			if (RoleSet.roles.valueOf(roleParam) != null) {
				roleIdx = RoleSet.roles.valueOf(roleParam).ordinal();
				role = RoleSet.roles.valueOf(roleParam).toString();
			}
		}

		System.out.println("roles " + role);
		int start = 0, end = 0, totpages = 0;
		String spg = (String) req.getSession().getAttribute("page");
		System.out.println("page" + spg);
		int page = 1;
		if (spg == null) {
			page = 1;
			req.getSession().setAttribute("page", ""+page);
		} else {
			String rpg = req.getParameter("page");
			if (rpg == null) {
				page = Integer.parseInt(spg);
			} else {
				page = Integer.parseInt(rpg);
				req.getSession().setAttribute("page", rpg);
			}
		}
		
		int userRole = roleService.getRoleIdByUId(RoleSet.rolesArr[roleIdx]);
		int totrecs = usersService.numRecords(userRole);
		int[] ret = com.calcPageRange(page, totrecs);
		start = ret[0];
		end = ret[1];
		totpages = ret[2];
		// String userId=atomicCounterService.getAdminUserUid();
		System.out.println("st" + start + " showRecsPerPage" + showRecsPerPage);
		List<Users> usersList = usersService.getAllUsers(start,
				Common.showRecsPerPage, userRole);
		// Employee empName = employeesService.getEmployee(id)
		System.out.println("usersList" + usersList);
		map.addAttribute("menu", Common.users);
		map.addAttribute("pagno", "" + page);
		map.addAttribute("totpages", "" + totpages);
		map.addAttribute("totrecs", ""+totrecs);
		map.addAttribute("start",start);
		map.addAttribute("end",end);
		map.addAttribute("usersList", usersList);
		// map.addAttribute("role",role);
		req.getSession().setAttribute("role", role);
		map.addAttribute("empService", employeesService);
		map.addAttribute("searchEn","0");
		map.addAttribute("userListVerify","else");
		map.addAttribute("appUrl",appUrl);
		return "usersPost";
	}*/
	@RequestMapping(value="/adduser", method={RequestMethod.POST,RequestMethod.GET})
	public String search(HttpServletRequest req, ModelMap map) {

		String retView="respJson";
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String confirmpassword=req.getParameter("confirmpassword");
		String desig = req.getParameter("type");
		//System.out.println("username="+username+ " & pswd="+password);
		String encpwd=EncDecPassword.encPassword(password);
		//System.out.println("username="+username+ " & pswd="+encpwd);
		/*int empId = loginService.getEmployeeIdUsingUsername(username);*/
		String Uid = atomicCounterService.getUserUid(desig);
		int user_role_id = usrRoleService.getUsr_role_Id(desig);
		boolean user =usrService.AddUser(username , encpwd,user_role_id,Uid);
		System.out.println("user="+user);
		String respMsgTyp="";
		String respMsg="";
		String respAct="";
		if(user){
			respMsgTyp="pass";
			respMsg="User added Successfully";
			map.addAttribute("type", respMsgTyp);
			map.addAttribute("msg", respMsg);
			map.addAttribute("act", respAct);
			//System.out.println("Invalid Username and Password");
			retView="respJson";
		}
		else{
			
				respMsgTyp="fail";
				respMsg="Your Account is Inactive";
				map.addAttribute("type", respMsgTyp);
				map.addAttribute("msg", respMsg);
				map.addAttribute("act", respAct);
				System.out.println("Your Account is Inactive");
				retView="respJson";
				
				/*	else {
						System.out.println("hello");
						respMsgTyp="html";
						respMsg="";
						respAct= req.getContextPath()+"/check";
						map.addAttribute("type", respMsgTyp);
						map.addAttribute("msg", respMsg);
						map.addAttribute("act", respAct);
						retView="respJson";
					}
				*/
		}	
		
		
		//return retView;
		// Employee empName = employeesService.getEmployee(id)
		
		return retView;
	}
	
	
}
