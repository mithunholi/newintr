package com.eoxys.Controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eoxys.Model.Employees;
import com.eoxys.Services.AtomicCounterService;
import com.eoxys.Services.EmployeesService;
import com.eoxys.Services.UserService;
import com.eoxys.Util.CMD;

@Controller
public class RegisterController {
	@Autowired
	EmployeesService employeesService;
	@Autowired
	AtomicCounterService atomicCounterService;
	
	@RequestMapping(value = "/signupnew", method = {RequestMethod.GET,RequestMethod.POST})
	public String signupnew(ModelMap map,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("signupnew page");
		if(req.getMethod().equals("GET")){
			System.out.println("GET");
			return "signupnewGET";
		}else{
			System.out.println("POST");
			return "signupnewPOST";
		}
		
	}
	@RequestMapping(value="/post")
	public String sign(ModelMap map,HttpServletRequest req,HttpServletResponse resp, String user) throws ParseException{
		
		System.out.println("submit Signup page Form");
		String retView="respJson";
	/*	Integer cmd=Integer.parseInt(req.getParameter("cmd"));*/
	/*if(cmd==CMD.CREATE){*/
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			DateFormat timeFormat= new SimpleDateFormat("KK:mm a");
			Employees emp = new Employees();
			System.out.println("===checkkkk"+emp.getId());
			//emp.setTbl_user_id(req.getParameter("tbl_user_id"));
			emp.setFirst_name(req.getParameter("firstname"));
			System.out.println("=======FN");
			emp.setLast_name(req.getParameter("lastname"));
			System.out.println("=======LN");
			emp.setMiddle_name(req.getParameter("middlename"));
			emp.setPhone_number(req.getParameter("phone"));
			emp.setPassport_number(req.getParameter("passport_no"));	
			emp.setPancard_number(req.getParameter("pancard_no"));
			emp.setDob(dateFormat.parse(req.getParameter("dob")));
			emp.setDoj(dateFormat.parse(req.getParameter("doj")));
			emp.setEmail_id(req.getParameter("gmail"));
			emp.setEoxys_mail(req.getParameter("eoxysmail"));
			emp.setSkype_mail(req.getParameter("skypemail"));
			emp.setEmployeeid_number(req.getParameter("empployee"));
			emp.setBlood_group(req.getParameter("bloodgrp"));
			emp.setEducation_qualification(req.getParameter("education"));
			emp.setPermanent_address(req.getParameter("permanentaddress"));
			emp.setLocal_address(req.getParameter("localaddress"));
			/*int userid=UserService.getUserid(user);*/
			/*System.out.println("user==="+userid);*/
			String userUid1=atomicCounterService.getUserUid();
			System.out.println("user==="+userUid1);
			emp.setTbl_user_id(userUid1);
			boolean ret = employeesService.createEmployee(emp);
			String respMsgTyp="";
			String respMsg="";
			String respAct="";
			if(ret){
				respMsgTyp="pass";
				respMsg="Successfully saved the record";
			}else{
				respMsgTyp="fail";
				respMsg="Failed to save the record";
			}
			map.addAttribute("type", respMsgTyp);
			map.addAttribute("msg", respMsg);
			map.addAttribute("act", respAct);
			retView="respJson";
		/*}*/
			
	
	return retView;
}
}