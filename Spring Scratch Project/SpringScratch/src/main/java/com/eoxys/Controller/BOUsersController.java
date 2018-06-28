package com.eoxys.Controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.eoxys.Services.AtomicCounterService;
import com.eoxys.Services.BOUserModuleAccesService;
import com.eoxys.Services.BOUserRoleService;
import com.eoxys.Services.BOUsersService;
import com.eoxys.Services.EmployeesService;
import com.eoxys.Util.AppUrl;
import com.eoxys.Util.Modules;

@Controller
@RequestMapping(value = "/users")
public class BOUsersController {
	int showRecsPerPage = 5;
	@Autowired
	BOUsersService usersService;
	@Autowired
	EmployeesService employeesService;
	@Autowired
	AtomicCounterService atomicCounterService;
	@Autowired
	BOUserRoleService roleService;
	@Autowired
	AppUrl appUrl;
	@Autowired
	Modules modules;
	@Autowired
	BOUserModuleAccesService bOUserModuleAccessService;

	/* ROLE REQUEST */
	@Autowired
	BOUserRoleService userRoleService;


	@RequestMapping(method = RequestMethod.GET)
	public String usersViewAllGet(HttpServletRequest req, ModelMap map, @CookieValue("role") String role) {
		System.out.println("usersGet " + req.getSession().getAttribute("role"));
		return "usersGet";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String usersViewAllPost(HttpServletRequest req, ModelMap map) {
		System.out.println("usersPost " + req.getParameter("role"));
		return "usersPost";
	}

}
