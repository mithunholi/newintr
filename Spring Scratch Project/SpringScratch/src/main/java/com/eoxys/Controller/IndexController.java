package com.eoxys.Controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	

	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,TimeZone tz,HttpServletRequest req) {
		logger.info("Welcome home! The client locale is {}.", locale);
		System.out.println("timezOne "+tz.getID());

		
		
		
//		Calendar calendar = convertDateStringToCalendar(pnrCreation, m_utcDatePattern);

//	    double offset = TimeZone.getTimeZone("Pacific/Fiji").getOffset(calendar.getTimeInMillis())/(60*60*1000.0);
		Calendar cal = Calendar.getInstance(tz);
		System.out.println("cal "+cal);
	
		SimpleDateFormat df = new SimpleDateFormat("Z");
		df.setTimeZone(tz);
		
		String result = df.format(new Date());
		System.out.println("result "+result);
		TimeZone tzInAmerica = TimeZone.getTimeZone("GMT+0530");
		
		System.out.println("timeZoness "+TimeZone.getTimeZone("GMT-0530"));
		System.out.println("timeZoness "+TimeZone.getTimeZone("GMT+05:30"));
		System.out.println("timeZoness "+TimeZone.getTimeZone("GMT+530"));
		System.out.println("timeZoness "+TimeZone.getTimeZone("GMT+5:30"));
		
		System.out.println("/");
		return "redirect:index";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome index! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		System.out.println("index");
		return "index";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String registerAd(HttpSession session,HttpServletRequest req,SessionStatus status, ModelMap map) {
		System.out.println("Ad signup");
		return "signup";
	}
/*	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("Welcome index! The client locale is {}.", locale);
		
		System.out.println("login");
		return "login";
	}*/
	
/*	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Locale locale, Model model) {
		logger.info("Welcome index! The client locale is {}.", locale);
		
		System.out.println("signup");
		return "signup";
	}*/
	
}
