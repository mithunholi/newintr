package com.eoxys.Model;

import java.util.Date;

public class BOUserModuleAccess {
	private int id;
	private int module_id;
	private int bo_user_role_id;
	private String access;
	private Date created_at;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getModule_id() {
		return module_id;
	}
	public void setModule_id(int module_id) {
		this.module_id = module_id;
	}
	public int getBo_user_role_id() {
		return bo_user_role_id;
	}
	public void setBo_user_role_id(int bo_user_role_id) {
		this.bo_user_role_id = bo_user_role_id;
	}
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	

}
