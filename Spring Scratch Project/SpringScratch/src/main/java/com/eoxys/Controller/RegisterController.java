package com.eoxys.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.eoxys.Services.AtomicCounterService;
import com.eoxys.Util.Modules;

//import com.google.gson.JsonObject;

@Controller
public class RegisterController {

	@Autowired
	AtomicCounterService atomicCounterService;

	@Autowired
	Modules modules;

	

	@RequestMapping(value = "/success_register", method = RequestMethod.POST)
	public String successRegister(HttpServletRequest req, ModelMap map) {
		System.out.println("regController");
		/*
		 * try { boolean ret=new Email().sendTestEmail(); } catch (IOException
		 * e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 */
		// map.addAttribute("click","active");
		// map.addAttribute("msg","success");
		return "register";
	}





	@RequestMapping(value = "/completedReg", method = {RequestMethod.GET,RequestMethod.POST})
	public String completedReg(HttpServletRequest req, ModelMap map,
			HttpSession session, HttpServletResponse resp) {
		return "completedReg";
		
	}
	
	

}
