package com.eoxys.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashboardController {

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboardHomeGet(ModelMap map) {
		System.out.println("dashboardGet");
		map.addAttribute("menu", "dash");
		return "empDashboardGet";
	}
	@RequestMapping(value = "/dashboard", method = RequestMethod.POST)
	public String dashboardHomePost(ModelMap map) {
		System.out.println("dashboardPost");
		map.addAttribute("menu", "dash");
		return "empDashboardPost";
	}
	@RequestMapping(value = "/advertiser_dashboard", method = RequestMethod.GET)
	public String adDashboardHomeGet(HttpSession session,HttpServletRequest req,ModelMap map) {
		System.out.println("adDashboardGet");
		map.addAttribute("menu", "dash");
		return "adDashboardGet";
	}
	@RequestMapping(value = "/advertiser_dashboard", method = RequestMethod.POST)
	public String adDashboardHomePost(HttpServletRequest req,ModelMap map) {
		System.out.println("adDashboardPost");
		map.addAttribute("menu", "dash");
		return "adDashboardPost";
	}
	@RequestMapping(value = "/deviceOwner_dashboard", method = RequestMethod.GET)
	public String devDashboardHomeGet(HttpSession session,HttpServletRequest req,ModelMap map) {
		System.out.println("devDashboardGet");
		map.addAttribute("menu", "dash");
		return "devDashboardGet";
	}
	@RequestMapping(value = "/deviceOwner_dashboard", method = RequestMethod.POST)
	public String devDashboardHomePost(HttpServletRequest req,ModelMap map) {
		System.out.println("devDashboardPost");
		map.addAttribute("menu", "dash");
		return "devDashboardPost";
	}
}
