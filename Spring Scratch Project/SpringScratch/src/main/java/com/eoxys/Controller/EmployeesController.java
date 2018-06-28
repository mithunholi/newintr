package com.eoxys.Controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.imgscalr.Scalr.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;

//import com.eoxys.Controller.UsersController.RoleSet;
//import com.eoxys.Model.Desig;
import com.eoxys.Model.Employees;
//import com.eoxys.Services.DesigService;
//import com.eoxys.Services.DocPatMapService;
import com.eoxys.Services.EmployeesService;
import com.eoxys.Services.BOUsersService;
import com.eoxys.Util.AppUrl;
import com.eoxys.Util.CMD;
import com.eoxys.Util.Common;
import com.eoxys.Util.DeleteImage;
import com.eoxys.Util.ImageRenderer;

@Controller
@RequestMapping(value = "/employees")
public class EmployeesController {
	@Autowired
	EmployeesService employeesService;
	@Autowired
	BOUsersService usersService;
	// @Autowired
	// DocPatMapService docPatMapService;
	@Autowired
	ServletContext context;
	// @Autowired
	// DesigService desigService;
	int showRecsPerPage = 5;
	@Autowired
	AppUrl appUrl;

/*	static public class RoleSet {
		static public enum roles {
			ALL, DOC, DEO, Nurse, Attender
		}

		static public String rolesArr[] = { "ALL", "DOC", "DEO", "Nurse",
				"Attender" };
	}*/

	Common com = new Common();
	String mediaUrl;

	@RequestMapping(method = RequestMethod.GET)
	public String employeesViewAllGet(HttpServletRequest req, ModelMap map) {
//		String roleParam = null;// req.getParameter("role");

		int roleIdx = 0;
		String role1 = "ALL";
//		if (req.getSession().getAttribute("role1") != null
//				|| req.getParameter("role1") != null) {
//			if (req.getSession().getAttribute("role1") != null)
//				roleParam = req.getSession().getAttribute("role1").toString();
//			System.out.println("users/-> post ->roles post Attr= "
//					+ req.getParameter("role1"));
//			if (req.getParameter("role1") != null) {
//				roleParam = req.getParameter("role1").toString();
//				role1 = roleParam;
//				// req.getSession().setAttribute("role",roleParam);
//			}
//			// roleParam = req.getSession().getAttribute("role").toString();
//			if (RoleSet.roles.valueOf(roleParam) != null) {
//				roleIdx = RoleSet.roles.valueOf(roleParam).ordinal();
//				role1 = RoleSet.roles.valueOf(roleParam).toString();
//			}
//		}

		int page = 0;
		int start = 0, end = 0, totpages = 0;
		System.out.println("employeesGet");
		page = 1;
		int totrecs = 0;
		// int roleId=0;
		// if(RoleSet.rolesArr[roleIdx].equals("ALL")){
		totrecs = employeesService.getNumRows();
		// }else{
		// roleId=desigService.getDesigId(RoleSet.rolesArr[roleIdx]);
		// totrecs=employeesService.getNumRows(roleId);
		// }
		int[] ret = com.calcPageRange(page, totrecs);
		start = ret[0];
		end = ret[1];
		totpages = ret[2];
		if (page != 1 && page > totpages) {
			page = page - 1;
		}
		req.getSession().setAttribute("page", "" + page);
		List<Employees> employeesList = new ArrayList<Employees>();
		// if(RoleSet.rolesArr[roleIdx].equals("ALL")){
		employeesList = employeesService.getAllEmployees(start,
				Common.showRecsPerPage);
		// }else{
		// employeesList =
		// employeesService.getAllEmployees(start,Common.showRecsPerPage,roleId);
		// }
		map.addAttribute("menu", Common.employees);
		map.addAttribute("pagno", "" + page);
		map.addAttribute("totpages", "" + totpages);
		map.addAttribute("totrecs", "" + totrecs);
		map.addAttribute("start", start);
		map.addAttribute("end", end);
		req.getSession().setAttribute("role1", role1);
		map.addAttribute("empList", employeesList);
		map.addAttribute("searchEn", "0");
		map.addAttribute("empListVerify", "else");
		map.addAttribute("appUrl", appUrl);
		return "employeesGet";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String employeesViewAllPost(HttpServletRequest req, ModelMap map) {
		String roleParam = null;
		System.out.println("users/-> post ->roles post= "
				+ req.getSession().getAttribute("role1"));

		int roleIdx = 0;
		String role1 = "ALL";
		if (req.getSession().getAttribute("role1") != null
				|| req.getParameter("role1") != null) {
			if (req.getSession().getAttribute("role1") != null)
				roleParam = req.getSession().getAttribute("role1").toString();
			System.out.println("users/-> post ->roles post Attr= "
					+ req.getParameter("role1"));
			if (req.getParameter("role1") != null) {
				roleParam = req.getParameter("role1").toString();
				role1 = roleParam;
				// req.getSession().setAttribute("role",roleParam);
			}
			// roleParam = req.getSession().getAttribute("role").toString();
		/*	if (RoleSet.roles.valueOf(roleParam) != null) {
				roleIdx = RoleSet.roles.valueOf(roleParam).ordinal();
				role1 = RoleSet.roles.valueOf(roleParam).toString();
			}*/
		}
		System.out.println("role1=" + role1);
		int start = 0, end = 0, totpages = 0;
		System.out.println("employeesPost");
		String spg = (String) req.getSession().getAttribute("page");
		int page = 1;
		if (spg == null) {
			page = 1;
			req.getSession().setAttribute("page", "" + page);
		} else {
			String rpg = req.getParameter("page");
			if (rpg == null) {
				page = Integer.parseInt(spg);
			} else {
				page = Integer.parseInt(rpg);
				req.getSession().setAttribute("page", rpg);
			}
		}
		int totrecs = 0;
		int roleId = 0;
//		if (RoleSet.rolesArr[roleIdx].equals("ALL")) {
			totrecs = employeesService.getNumRows();
//		} else {
//			roleId = desigService.getDesigId(RoleSet.rolesArr[roleIdx]);
//			totrecs = employeesService.getNumRows(roleId);
//		}
		System.out.println("totrecs=" + totrecs + ", page=" + page);
		int[] ret = com.calcPageRange(page, totrecs);
		start = ret[0];
		end = ret[1];
		totpages = ret[2];
		System.out.println("ret=" + start + " " + end + " " + totpages);
		if (page != 1 && page > totpages) {
			page = page - 1;
		}
		List<Employees> employeesList = new ArrayList<Employees>();
//		if (RoleSet.rolesArr[roleIdx].equals("ALL")) {
			employeesList = employeesService.getAllEmployees(start,
					Common.showRecsPerPage);
//		} else {
//			employeesList = employeesService.getAllEmployees(start,
//					Common.showRecsPerPage, roleId);
//		}
		System.out.println("employeesList" + employeesList);
		map.addAttribute("menu", Common.employees);
		map.addAttribute("pagno", "" + page);
		map.addAttribute("totpages", "" + totpages);
		map.addAttribute("totrecs", "" + totrecs);
		map.addAttribute("start", start);
		map.addAttribute("end", end);
		req.getSession().setAttribute("role1", role1);
		map.addAttribute("empList", employeesList);
		map.addAttribute("searchEn", "0");
		map.addAttribute("empListVerify", "else");
		map.addAttribute("appUrl", appUrl);
		return "employeesPost";
	}

	@RequestMapping(value = "/search", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String search(HttpServletRequest req, HttpSession session,
			ModelMap map) {
		String roleParam = null;
		int roleIdx = 0;
		String role1 = "ALL";
		if (req.getSession().getAttribute("role1") != null
				|| req.getParameter("role1") != null) {
			if (req.getSession().getAttribute("role1") != null)
				roleParam = req.getSession().getAttribute("role1").toString();
			System.out.println("users/-> post ->roles post Attr= "
					+ req.getParameter("role1"));
			if (req.getParameter("role1") != null) {
				roleParam = req.getParameter("role1").toString();
				role1 = roleParam;
				// req.getSession().setAttribute("role",roleParam);
			}
			// roleParam = req.getSession().getAttribute("role").toString();
//			if (RoleSet.roles.valueOf(roleParam) != null) {
//				roleIdx = RoleSet.roles.valueOf(roleParam).ordinal();
//				role1 = RoleSet.roles.valueOf(roleParam).toString();
//			}
		}
		System.out.println("Method=" + req.getMethod());
		System.out.println("submit user Form");
		String retView = "employeesPost";
		int start = 0, end = 0, totpages = 0;
		System.out.println("employeesPost");
		String spg = (String) req.getSession().getAttribute("page");
		int page;
		if (spg == null) {
			page = 1;
			req.getSession().setAttribute("page", "" + page);
		} else {
			String rpg = req.getParameter("page");
			System.out.println("rpg=" + rpg);
			if (rpg == null) {
				page = Integer.parseInt(spg);
			} else {
				page = Integer.parseInt(rpg);
				req.getSession().setAttribute("page", rpg);
			}
		}
		String searchKey = req.getParameter("searchKey");
		System.out.println("search=" + searchKey);
		int totrecs = 0;
		int roleId = 0;
//		if (RoleSet.rolesArr[roleIdx].equals("ALL")) {
			totrecs = employeesService.getNumRows(searchKey);
//		} else {
//			roleId = desigService.getDesigId(RoleSet.rolesArr[roleIdx]);
//			totrecs = employeesService.getNumRows(searchKey, roleId);
//		}
		System.out.println("totrecs=" + totrecs + ", page=" + page
				+ ", roleId=" + roleId);
		int[] ret = com.calcPageRange(page, totrecs);
		start = ret[0];
		end = ret[1];
		totpages = ret[2];
		System.out.println("st" + start + " end" + end);
		List<Employees> employeesList = new ArrayList<Employees>();
//		if (RoleSet.rolesArr[roleIdx].equals("ALL")) {
			System.out.println("without roleId");
			employeesList = employeesService.getSearchEmployees(searchKey,
					start, Common.showRecsPerPage);
//		} else {
//			System.out.println("with roleId");
//			employeesList = employeesService.getSearchEmployees(searchKey,
//					start, Common.showRecsPerPage, roleId);
//		}
		System.out.println("empList--" + employeesList);
		map.addAttribute("empListVerify", searchKey);
		map.addAttribute("empList", employeesList);
		map.addAttribute("menu", Common.employees);
		map.addAttribute("pagno", "" + page);
		System.out.println("page=" + page);
		map.addAttribute("totpages", "" + totpages);
		map.addAttribute("totrecs", "" + totrecs);
		req.getSession().setAttribute("role1", role1);
		map.addAttribute("start", start);
		map.addAttribute("end", end);
		map.addAttribute("searchEn", "1");
		map.addAttribute("appUrl", appUrl);
		retView = "employeesPost";
		return retView;
	}

	@RequestMapping(value = "/act", method = RequestMethod.POST)
	public String employeesViewAct(ModelMap map, HttpServletRequest req) {
		String retView = "employeesPost";
		System.out.println("view All employees with Action get");
		Integer cmd = Integer.parseInt(req.getParameter("cmd"));
		System.out.println("cmd=" + cmd);
		if (cmd == CMD.VIEWIND) {
			int recId = Integer.parseInt(req.getParameter("recid"));
			Employees employee = employeesService.getEmployee(recId);
			System.out.println("viewindGet");
			map.put("employee", employee);
			map.addAttribute("appUrl", appUrl);
			retView = "empViewInd";
		} else if (cmd == CMD.EDITIND) {
			int recId = Integer.parseInt(req.getParameter("recid"));
			Employees employee = employeesService.getEmployee(recId);
//			List<Desig> desigList = desigService.designationDrop();
			map.put("employee", employee);
//			map.put("desigList", desigList);
			map.addAttribute("appUrl", appUrl);
			retView = "empViewEdit";
		}else if(cmd==CMD.ADDIND){
			retView = "empViewAdd";
		}else if (cmd == CMD.DELETE) {
		
			int page = 1;
			page = Integer.parseInt(req.getParameter("pageSend"));
			int recId = Integer.parseInt(req.getParameter("recid"));
			Employees emp = employeesService.getEmployee(recId);
			boolean ret = employeesService.delEmployee(recId);
			String respMsgTyp = "";
			String respMsg = "";
			String respAct = "";
			if (ret) {
				boolean ret1 = usersService.delUserWithEmpId(recId);
//				boolean ret2 = docPatMapService.removeDocPatMapWithEmpId(recId);
				respMsgTyp = "pass";
				respMsg = "Successfully deleted record";
				respAct = req.getContextPath() + "/employees?page=" + page;
			} else {
				respMsgTyp = "fail";
				respMsg = "Failed to delete record";
			}
			map.addAttribute("type", respMsgTyp);
			map.addAttribute("msg", respMsg);
			map.addAttribute("act", respAct);
			retView = "respJson";
		}
		map.addAttribute("menu", Common.employees);
		return retView;
	}

	@RequestMapping(value = "/post", method = RequestMethod.POST)
	public String employeesViewPost(HttpServletRequest req, ModelMap map)
			throws ParseException {
		System.out.println("submit employee Form");
		String retView = "employeesPost";
		Integer cmd = Integer.parseInt(req.getParameter("cmd"));
		System.out.println("cmd=" + cmd);
		if (cmd == CMD.UPDATE) {
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Employees employee = new Employees();
			employee.setId(Integer.parseInt(req.getParameter("recid")));
			String urlStr = req.getParameter("url");
			String urlStr_str = urlStr.replaceAll("%3A", ":");
			employee.setUrl(urlStr_str);
			String imageUrl = urlStr_str;
			String thumbUrl = req.getParameter("thumbUrl");
			System.out.println("THUMB=====" + req.getParameter("thumbUrl"));
			employee.setThumb_url(thumbUrl);
			// employee.setUser_uid(req.getParameter("user_uid"));
			employee.setDesig(req.getParameter("desig"));
			employee.setName(req.getParameter("name"));
			employee.setSex(req.getParameter("sex"));
			employee.setAge(Integer.parseInt(req.getParameter("age")));
			employee.setDob(dateFormat.parse(req.getParameter("dob")));
			employee.setCity(req.getParameter("city"));
			employee.setState(req.getParameter("state"));
			employee.setCountry(req.getParameter("country"));
			employee.setAddress_line1(req.getParameter("address_line1"));
			employee.setAddress_line2(req.getParameter("address_line2"));
			employee.setZip(req.getParameter("zip"));
			/*
			 * employee.setUrl(req.getParameter("url"));
			 * System.out.println("thumb_url "+req.getParameter("thumb_url"));
			 * employee.setThumb_url(req.getParameter("thumb_url"));
			 */
			employee.setDesignation(req.getParameter("designation"));
			employee.setEmail(req.getParameter("email"));
			/* employee.setPhone(req.getParameter("phone")); */
			String phone = req.getParameter("phone");
			phone = phone.replaceAll("\\s", "");
			employee.setPhone(phone);
			employee.setUrl(req.getParameter("url"));
			System.out.println("uname=" + employee.getName() + ", pwd="
					+ employee.getCity() + ",,,,,,,,,,,,URL="
					+ employee.getUrl());
			System.out.println("thumb=" + employee.getThumb_url());
			employee.setUrl(req.getParameter("url").replace(appUrl.getBaseUrl()+appUrl.getMediaUrl(),""));
			employee.setThumb_url(req.getParameter("thumbUrl").replace(appUrl.getBaseUrl()+appUrl.getMediaUrl(),""));
//			employee.setUrl(com.getUrl(req.getParameter("url")));
//			employee.setThumb_url(com.getThumbUrl(req.getParameter("thumbUrl")));
			boolean ret = employeesService.updateEmployee(employee);
			String respMsgTyp = "";
			String respMsg = "";
			String respAct = "";
			if (ret) {
				respMsgTyp = "pass";
				respMsg = "Successfully saved the changes";
			} else {
				respMsgTyp = "fail";
				respMsg = "Failed to save the changes";
			}
			map.addAttribute("type", respMsgTyp);
			map.addAttribute("msg", respMsg);
			map.addAttribute("act", respAct);
			retView = "respJson";
		} else if (cmd == CMD.CREATE) {
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			String respMsgTyp = "";
			String respMsg = "";
			String respAct = "";
			Employees employee = new Employees();
			try{
				String urlStr = req.getParameter("url");
				String urlStr_str = urlStr.replaceAll("%3A", ":");
				employee.setUrl(urlStr_str);
				String imageUrl = urlStr_str;
				String thumbUrl = req.getParameter("thumbUrl");
				System.out.println("THUMB=====" + req.getParameter("thumbUrl"));
				employee.setThumb_url(thumbUrl);
				// employee.setUser_uid(req.getParameter("name"));
				employee.setDesig(req.getParameter("desig"));
				employee.setName(req.getParameter("name"));
				employee.setSex(req.getParameter("sex"));
				employee.setAge(Integer.parseInt(req.getParameter("age")));
				employee.setDob(dateFormat.parse(req.getParameter("dob")));
				employee.setCity(req.getParameter("city"));
				employee.setState(req.getParameter("state"));
				employee.setCountry(req.getParameter("country"));
				employee.setAddress_line1(req.getParameter("address_line1"));
				employee.setAddress_line2(req.getParameter("address_line2"));
				employee.setZip(req.getParameter("zip"));
				employee.setDesignation(req.getParameter("type"));
				employee.setEmail(req.getParameter("email"));
				/* employee.setPhone(req.getParameter("phone")); */
				String phone = req.getParameter("phone");
				phone = phone.replaceAll("\\s", "");
				employee.setPhone(phone);
				System.out.println("repl "+req.getParameter("thumbUrl").replace(appUrl.getBaseUrl()+appUrl.getMediaUrl(),""));
//				employee.setUrl(req.getParameter("url").replace("",req.getParameter("url")));
				employee.setUrl(req.getParameter("url").replace(appUrl.getBaseUrl()+appUrl.getMediaUrl(),""));
				employee.setThumb_url(req.getParameter("thumbUrl").replace(appUrl.getBaseUrl()+appUrl.getMediaUrl(),""));
				System.out.println("uname=" + employee.getName() + ", pwd="
						+ employee.getCity() + ",,,,,,,,,,,,URL="
						+ employee.getUrl());
				System.out.println("thumb=" + employee.getThumb_url());
				boolean ret = employeesService.createEmployee(employee);
				if (ret) {
					respMsgTyp = "pass";
					respMsg = "Successfully saved the record";
				} else {
					respMsgTyp = "fail";
					respMsg = "Failed to save the record";
				}
			}catch(Exception ex){
				respMsgTyp = "fail";
				respMsg = "Error : "+ex;
				System.out.println("Error : "+ex);
			}
			map.addAttribute("type", respMsgTyp);
			map.addAttribute("msg", respMsg);
			map.addAttribute("act", respAct);
			retView = "respJson";
		}
		map.addAttribute("menu", Common.employees);
		return retView;
	}

	

	@RequestMapping(value = "/myImages/fileUpload", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String fileUpload(
			@RequestParam(value = "file_source", required = false) MultipartFile file,
			HttpServletRequest req, HttpServletResponse response, ModelMap map)
			throws MultipartException, IOException {
		System.out.println("oop=====image upload====");
		String role = "profile";
		String msg = null, imgUrl = null, imgThumbUrl = null;
		System.out.println("ret=" + req.getParameter("path"));
		System.out.println("d =" + context.getRealPath(""));
		String phyPath = context.getRealPath("" + appUrl.getMediaUrl());
		/*
		 * String phyPathThumb =
		 * context.getRealPath(""+appUrl.getThumbnailUrl());
		 */
		System.out.println(phyPath);
		System.out.println(file.getOriginalFilename());
		DateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
		Date date = new Date();
		System.out.println(phyPath);
		String dateString = dateFormat.format(date);
		String orgName = dateString + "_"
				+ file.getOriginalFilename().replaceAll("[\\s()]", "");
		System.out.println("download=" + orgName);
		// thumb name is adding
		String fileFullName = file.getOriginalFilename();
		fileFullName = fileFullName.replaceAll("[\\s()]", "");
		System.out.println("fileName=" + fileFullName);
		String fileName = FilenameUtils.getBaseName(fileFullName);
		System.out.println("fileName123=" + fileName);
		String fileType = FilenameUtils.getExtension(fileFullName);
		System.out.println(fileName + ",,," + fileType);
		String orgNameThumb = dateString + "_" + fileName + "_thumb."
				+ fileType;

		File directoryDest = new File(phyPath + "//" + role);
		File dest = new File(directoryDest + "//" + orgName);
		File directoryDestThumb = new File(phyPath + "//" + role + "//thumb");
		File destThumb = new File(directoryDestThumb + "//" + orgNameThumb);
		System.out.println("file1" + file);
		String retView = "";
		String respMsgTyp = "";
		String respMsg = "";
		String respUrl = "";
		String respDiv = "div1";
		msg += directoryDest;
		if (!directoryDest.exists()) {
			if (directoryDest.mkdirs()) {
				System.out.println("Directory is created!");
				System.out.println("dir=" + directoryDest);
				System.out.println(dest);
			} else {
				System.out.println("Failed to create directory!");
				respMsgTyp = "fail";
				respMsg = "Failed to Upload";
				map.addAttribute("type", respMsgTyp);
				map.addAttribute("msg", respMsg);
				map.addAttribute("div", respDiv);
				retView = "fileRespJson";
			}
		}
		if (!directoryDestThumb.exists()) {
			if (directoryDestThumb.mkdirs()) {
				System.out.println("Directory is createdfor Thumbnail!");
				System.out.println("dir=" + directoryDestThumb);
				System.out.println(destThumb);
			} else {
				System.out.println("Failed to create directory for Thumbnail!");
				respMsgTyp = "fail";
				respMsg = "Failed to Upload";
				map.addAttribute("type", respMsgTyp);
				map.addAttribute("msg", respMsg);
				map.addAttribute("div", respDiv);
				retView = "fileRespJson";
			}
		}
		try {
			mediaUrl = appUrl.getBaseUrl() + appUrl.getMediaUrl();
			file.transferTo(dest);
			File convFile = new File(dest.toString());
			BufferedImage img = ImageIO.read(convFile);
			System.out.println("buff=" + img);
			/*
			 * Image scaledImg = img.getScaledInstance(100, 50,
			 * Image.SCALE_SMOOTH);
			 */
			BufferedImage thumbnail = Scalr.resize(img, 150);
			thumbnail.createGraphics().drawImage(thumbnail, 0, 0, null);
			ImageIO.write(thumbnail, "png", new File(destThumb.toString()));

			msg += ",Successfully Uploaded";
			/*
			 * imgUrl="http://"+req.getServerName()+":"+req.getLocalPort()+req.
			 * getContextPath() +"/resources/media/"+userId+"/"+orgName;
			 */
			imgUrl = "/" + role + "/" + orgName;
			imgThumbUrl = "/" + role + "/thumb/" + orgNameThumb;
			respMsgTyp = "pass";
			respMsg = "successfully Uploaded";
			respUrl = imgUrl;
			map.addAttribute("type", respMsgTyp);
			map.addAttribute("msg", respMsg);
			map.addAttribute("url", mediaUrl + respUrl);
			System.out.println("url=" + mediaUrl + respUrl);
			map.addAttribute("thumbUrl", mediaUrl + imgThumbUrl);
			System.out.println("thumbUrl=" + mediaUrl + imgThumbUrl);
			map.addAttribute("div", respDiv);
			retView = "fileRespJson";
		} catch (IllegalStateException e) {
			// e.printStackTrace()
			System.out.println("eror" + e);
			respMsgTyp = "fail";
			respMsg = "Failed to Upload";
			map.addAttribute("type", respMsgTyp);
			map.addAttribute("msg", respMsg);
			map.addAttribute("div", respDiv);
			retView = "fileRespJson";
		} catch (Exception ex) {
			System.out.println(ex);
			respMsgTyp = "fail";
			respMsg = "Failed to Upload";
			map.addAttribute("type", respMsgTyp);
			map.addAttribute("msg", respMsg);
			map.addAttribute("div", respDiv);
			retView = "fileRespJson";
		}
		// System.out.println(file.);
		return retView;
	}

	@RequestMapping(value = "/myImages/delete", method = { RequestMethod.POST })
	public String imageDelete(HttpServletRequest req,
			HttpServletResponse response, ModelMap map) {
		System.out.println(req.getParameter("url"));
		System.out.println(req.getParameter("thumbUrl"));
		String url = req.getParameter("url");
		String thumbUrl = req.getParameter("thumbUrl");
		Common com = new Common();
		String url1 = com.getUrl(url);
		String thumbUrl1 = com.getThumbUrl(thumbUrl);
		String phyPath = context.getRealPath("" + appUrl.getMediaUrl());
		url1 = phyPath + url1.replace("/", "\\");
		thumbUrl1 = phyPath + thumbUrl1.replace("/", "\\");
		DeleteImage delImg = new DeleteImage();
		delImg.deleteImage(url1, thumbUrl1);
		return "respJson";
	}
}
