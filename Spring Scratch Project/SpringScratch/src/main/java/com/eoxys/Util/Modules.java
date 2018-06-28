package com.eoxys.Util;


public class Modules {
	private String[] modulesArr;
	private String[] cusUserType;
	private String[] cusUserModules;

	public String[] getModulesArr() {
		return modulesArr;
	}

	public void setModulesArr(String[] modulesArr) {
		this.modulesArr = modulesArr;
	}
	
	public String getModuleArrAt(int index){
		return this.modulesArr[index];
	}

	public String[] getCusUserType() {
		return cusUserType;
	}
	public int getModuleArrIndex(String value) {
		int index =-1;
		for(int i=0;i<this.modulesArr.length;i++){
			if(this.modulesArr[i].equalsIgnoreCase(value)){
				index=i;
				break;
			}
		}
		return index;
	}

	public void setCusUserType(String[] cusUserType) {
		this.cusUserType = cusUserType;
	}

	public String[] getCusUserModules() {
		return cusUserModules;
	}

	public void setCusUserModules(String[] cusUserModules) {
		this.cusUserModules = cusUserModules;
	}
	
	
//	private int webLogin;
//	private int dashboard;
//	private int employee;
//	public int getWebLogin() {
//		return webLogin;
//	}
//	public void setWebLogin(int webLogin) {
//		this.webLogin = webLogin;
//	}
//	public int getDashboard() {
//		return dashboard;
//	}
//	public void setDashboard(int dashboard) {
//		this.dashboard = dashboard;
//	}
//	public int getEmployee() {
//		return employee;
//	}
//	public void setEmployee(int employee) {
//		this.employee = employee;
//	}

	
	
}
