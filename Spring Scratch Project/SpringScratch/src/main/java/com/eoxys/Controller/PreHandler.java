package com.eoxys.Controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.eoxys.Model.BOUserModuleAccess;
import com.eoxys.Model.BOUsers;
import com.eoxys.Services.BOUserModuleAccesService;
import com.eoxys.Services.LoginService;
import com.eoxys.Util.CMD;
import com.eoxys.Util.EncDecPassword;
import com.eoxys.Util.Modules;

public class PreHandler extends HandlerInterceptorAdapter {
	@Autowired
	LoginService loginService;
	@Autowired
	Modules modules;
	@Autowired
	BOUserModuleAccesService bOUserModuleAccesService;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res,
			Object handler) throws Exception {
		System.out.println("preHandler");
		String url = req.getRequestURI();

		System.out.println("Interceptor");

		Cookie[] cookies = req.getCookies();
		System.out.println("helo");
		String userUid = null, displayName = null, pwd = null, role = null;
		if (!(cookies == null)) {
			System.out.println("helo");
			for (Cookie cookie : cookies) {
				System.out.println("for->  " + cookie.getName());
				if ("userUid".equals(cookie.getName())) {
					// System.out.println("if1 " + cookie.getName());
					userUid = cookie.getValue();
				}
				if ("displayName".equals(cookie.getName())) {
					// System.out.println("if2" + cookie.getName());
					displayName = cookie.getValue();
				}
				if ("pwd".equals(cookie.getName())) {
					// System.out.println("if2" + cookie.getName());
					pwd = cookie.getValue();
				}
				if ("role".equals(cookie.getName())) {
					// System.out.println("if2" + cookie.getName());
					role = cookie.getValue();
				}
			}
			System.out.println("userUid,displayName,pwd,role " + userUid + ","
					+ displayName + "," + pwd + "," + role);
		}
		BOUsers userO = new BOUsers();
		/* userO=loginService.checkLogin(EncDecPassword.decBase64(userid)); */
		if (userUid != null) {
			System.out.println("user=" + userUid);
			userO = loginService.checkLogin(userUid);
			if (userO != null) {
				if (userUid.equals(userO.getUser_uid())
						&& pwd.equals(EncDecPassword.encPassword(req
								.getRemoteAddr()
								+ userO.getPassword()
								+ "CHIDA"
								+ EncDecPassword.encPassword("bumperGlass")))) {
					System.out.println("auth person");
				} else {
					System.out.println("not auth person");
					res.sendRedirect(req.getContextPath()
							+ "/login_again?msg=auth-error");
					return false;
				}

				System.out
				.println("Switch started=" + userO.getUser_role_uid());
				System.out.println("role "
						+ Integer.parseInt(EncDecPassword.decBase64(role)));
				int roleId = Integer.parseInt(EncDecPassword.decBase64(role));
				String[] mods = modules.getModulesArr();
				req.setAttribute("modules", mods);
				System.out.println("method " + req.getMethod());
				if (req.getMethod().equalsIgnoreCase("GET")) {
					List<BOUserModuleAccess> boM1 = bOUserModuleAccesService
							.getAccessByRoleId(roleId);
					String[] accessArr = new String[mods.length];
					for (int i = 0; i < boM1.size(); i++) {
						BOUserModuleAccess bo = boM1.get(i);

						char[] acc = bo.getAccess().toCharArray();
						if(mods.length > i){
							for (char c : acc) {
								if (c == '1') {
									accessArr[i] = mods[i];
									break;
								}
							}
						}
						
					}
					System.out.println("accessArr.length " + accessArr.length);
					if (accessArr.length == 0) {
						return false;
					}
					req.setAttribute("accessModules", accessArr);
				}

				boolean r = false, w = false, d = false;
				String userAccess = "";
				for (int i = 0; i < mods.length; i++) {
					System.out.println("mods[i]================================= "+mods[i]);
					if (url.indexOf(mods[i]) > -1) {
						BOUserModuleAccess boM = bOUserModuleAccesService
								.getAccessByRoleModId(roleId, i);
						if (boM != null) {
							System.out.println("Access " + i + ","
									+ boM.getModule_id());
							if (boM.getModule_id() == i) {

								char[] roleAccArr = boM.getAccess()
										.toCharArray();
								System.out.println("sdfvbsdk");
								if (roleAccArr[0] == '1') {
									r = true;
								}
								System.out.println("sdfvbsdk");
								if (roleAccArr[1] == '1') {
									w = true;
								}
								System.out.println("sdfvbsdk");
								if (roleAccArr[2] == '1') {
									d = true;
								}
								System.out.println("sdfvbsdk");

							}
							System.out.println("sdfvbsdk " + r + "," + w + ","
									+ d);
							if (r || w || d) {
								req.setAttribute("att", "mnb");
								if (url.indexOf("login") > -1) {
									System.out.println("already Loged In "
											+ EncDecPassword.encBase64(req
													.getContextPath()
													+ "/dashboard"));
									res.sendRedirect(req.getContextPath()
											+ "/login_again?logged_in=true&msg=auth-error&goto="
											+ EncDecPassword.encBase64(req
													.getContextPath()
													+ "/dashboard"));
									return false;
								}
								System.out.println("cmd "
										+ req.getParameter("cmd"));
								if (req.getParameter("cmd") != null) {
									int cmdParam = Integer.parseInt(req
											.getParameter("cmd"));
									if (!w
											&& (cmdParam == CMD.EDITIND
											|| cmdParam == CMD.UPDATE
											|| cmdParam == CMD.ADDIND || cmdParam == CMD.CREATE)) {
										return false;
									}
									if(!d && (cmdParam==CMD.DELETE)){
										return false;
									}
								}
								return true;
							} else {
								return false;
							}
						}

						break;
					}
				}

				return false;
			} else {
				System.out.println("if3");
				res.sendRedirect(req.getContextPath()
						+ "/login_again?msg=error");
				return false;
			}

		} else {
			System.out.println("if3");
			if (url.indexOf("login") > -1) {
				return true;
			} else {
				res.sendRedirect(req.getContextPath()
						+ "/login_again?msg=error");
			}

			return false;
		}

		/*
		 * System.out.println("Cooki_id="+userUid+" ,dispname="+displayName);
		 * if(userUid==null && displayName==null) { System.out.println("if3");
		 * res.sendRedirect(req.getContextPath()+"/login_again?msg=error");
		 * return false; }else{ System.out.println("else");
		 * req.setAttribute("userUid", userUid); req.setAttribute("displayName",
		 * displayName); return true; }
		 */

	}
	// @Override
	// public boolean preHandle(HttpServletRequest req, HttpServletResponse res,
	// Object handler) throws Exception {
	// System.out.println("preHandler");
	// String url = req.getRequestURI();
	// /*
	// * String pwd=EncDecPassword.encPassword(req.getRemoteAddr()+
	// * "6c2b6746c48dd8bd2ab40da30cdbddb056aaed9d"
	// * +"CHIDA"+EncDecPassword.encPassword("bumperGlass"));
	// */
	// /* String role=EncDecPassword.encBase64("2"); */
	// /*
	// * String userid=EncDecPassword.encBase64("ADV2015090016");
	// * System.out.println(req.getRequestURI()+",,,"+req.getRequestURL());
	// *
	// * if( ( (url.indexOf("advertisers%3F")>-1)) ){
	// * System.out.println("test true="
	// * +url.indexOf("advertisers%3F")+"=="+url.indexOf("advertiser"));
	// * }else{
	// * System.out.println("test false="+url.indexOf("advertisers%3F")+
	// * "=="+url.indexOf("advertiser%2F")); }
	// */
	//
	// System.out.println("Interceptor");
	//
	// Cookie[] cookies = req.getCookies();
	// System.out.println("helo");
	// String userUid = null, displayName = null, pwd = null, role = null;
	// if (!(cookies == null)) {
	// System.out.println("helo");
	// for (Cookie cookie : cookies) {
	// System.out.println("for->  " + cookie.getName());
	// if ("userUid".equals(cookie.getName())) {
	// // System.out.println("if1 " + cookie.getName());
	// userUid = cookie.getValue();
	// }
	// if ("displayName".equals(cookie.getName())) {
	// // System.out.println("if2" + cookie.getName());
	// displayName = cookie.getValue();
	// }
	// if ("pwd".equals(cookie.getName())) {
	// // System.out.println("if2" + cookie.getName());
	// pwd = cookie.getValue();
	// }
	// if ("role".equals(cookie.getName())) {
	// // System.out.println("if2" + cookie.getName());
	// role = cookie.getValue();
	// }
	// }
	// System.out.println("userUid,displayName,pwd,role " + userUid + ","
	// + displayName + "," + pwd + "," + role);
	// }
	// BOUsers userO = new BOUsers();
	// /* userO=loginService.checkLogin(EncDecPassword.decBase64(userid)); */
	// if (!(userUid == null)) {
	// System.out.println("user=" + userUid);
	// userO = loginService.checkLogin(userUid);
	// if (userO != null) {
	// if (userUid.equals(userO.getUser_uid())
	// && pwd.equals(EncDecPassword.encPassword(req
	// .getRemoteAddr()
	// + userO.getPassword()
	// + "CHIDA"
	// + EncDecPassword.encPassword("bumperGlass")))) {
	// System.out.println("auth person");
	// } else {
	// System.out.println("not auth person");
	// res.sendRedirect(req.getContextPath()
	// + "/login_again?msg=auth-error");
	// return false;
	// }
	// System.out.println("Switch started=" + userO.getUser_role_uid());
	// System.out.println("role "+Integer.parseInt(EncDecPassword.decBase64(role)));
	// switch (Integer.parseInt(EncDecPassword.decBase64(role))) {
	// // admin
	// case 1:
	// if (((url.indexOf("dashboard") > -1
	// || url.indexOf("employees") > -1
	// || url.indexOf("users") > -1
	// || url.indexOf("uadvertisers") > -1 || url
	// .indexOf("udeviceOwners") > -1) && !(url
	// .indexOf("advertiser_dashboard") > -1 || url
	// .indexOf("deviceOwner_dashboard") > -1))) {
	// System.out.println("admin");
	// return true;
	// }else if(url.indexOf("login")>-1){
	// System.out.println("already Loged In "+EncDecPassword.encBase64(req.getContextPath()+"/dashboard"));
	// res.sendRedirect(req.getContextPath()+
	// "/login_again?logged_in=true&msg=auth-error&goto="+EncDecPassword.encBase64(req.getContextPath()+"/dashboard"));
	// return false;
	// }else {
	//
	// System.out.println("not admin");
	// res.sendRedirect(req.getContextPath()+ "/login_again?msg=auth-error");
	// return false;
	// }
	// // advertiser
	// case 2:
	// if (((url.indexOf("advertiser_dashboard") > -1 || url
	// .indexOf("advertiser") > -1) && !(url
	// .indexOf("advertisers") > -1))) {
	// System.out.println("advertiser");
	// return true;
	// } else {
	// res.sendRedirect(req.getContextPath()
	// + "/login_again?msg=auth-error");
	// return false;
	// }
	// // deviceOwners
	// case 3:
	// case 4:
	// if (((url.indexOf("deviceOwner_dashboard") > -1 || url
	// .indexOf("deviceOwner") > -1) && !(url
	// .indexOf("deviceOwners") > -1))) {
	// System.out.println("deviceowner");
	// return true;
	// } else {
	// res.sendRedirect(req.getContextPath()
	// + "/login_again?msg=auth-error");
	// return false;
	// }
	// // others
	// default:
	// res.sendRedirect(req.getContextPath()
	// + "/login_again?msg=error");
	// return false;
	//
	// }
	// } else {
	// System.out.println("if3");
	// res.sendRedirect(req.getContextPath()
	// + "/login_again?msg=error");
	// return false;
	// }
	//
	// } else {
	// System.out.println("if3");
	// if(url.indexOf("login") > -1){
	// return true;
	// }else{
	// res.sendRedirect(req.getContextPath() + "/login_again?msg=error");
	// }
	//
	//
	// return false;
	// }
	//
	// /*
	// * System.out.println("Cooki_id="+userUid+" ,dispname="+displayName);
	// * if(userUid==null && displayName==null) { System.out.println("if3");
	// * res.sendRedirect(req.getContextPath()+"/login_again?msg=error");
	// * return false; }else{ System.out.println("else");
	// * req.setAttribute("userUid", userUid); req.setAttribute("displayName",
	// * displayName); return true; }
	// */
	// }
}
