package com.eoxys.Model;

import java.util.Date;

public class BOUsers {
	private int id;
//	private String username;
	private String employee_id;
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	private String password;
	private String user_role_uid;
	private String user_uid;
//	private String validation_sts;
	private String activation_sts;
//	private String registration_sts;
	private Date created_at;
	private Date updated_at;
	
	//Foreign
	private String userName;
	private String url;
	
	
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
//	public String getUsername() {
//		return username;
//	}
//	public void setUsername(String username) {
//		this.username = username;
//	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_role_uid() {
		return user_role_uid;
	}
	public void setUser_role_uid(String user_role_uid) {
		this.user_role_uid = user_role_uid;
	}
	public String getUser_uid() {
		return user_uid;
	}
	public void setUser_uid(String user_uid) {
		this.user_uid = user_uid;
	}
//	public String getValidation_sts() {
//		return validation_sts;
//	}
//	public void setValidation_sts(String validation_sts) {
//		this.validation_sts = validation_sts;
//	}
	public String getActivation_sts() {
		return activation_sts;
	}
	public void setActivation_sts(String activation_sts) {
		this.activation_sts = activation_sts;
	}
//	public String getRegistration_sts() {
//		return registration_sts;
//	}
//	public void setRegistration_sts(String registration_sts) {
//		this.registration_sts = registration_sts;
//	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
}
