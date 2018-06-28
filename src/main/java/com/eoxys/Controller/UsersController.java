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
import com.eoxys.Services.LoginService;
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
			
		}	
		
		
		return retView;
	}
	
	
}
