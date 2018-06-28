package com.eoxys.Model;

import java.util.Date;

public class Users {
	private int id;
	private String username;
    private String password;
	private int user_role_id;
	private String user_uid;

	private String activation_sts;
	
	private Date created_at;
	private Date updated_at;
     public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return getUsername();
	}
	public void setUsername(String username) {
		this.username = username;
}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUser_role_id() {
		return user_role_id;
	}
	public void setUser_role_id(int user_role_id) {
		this.user_role_id = user_role_id;
	}
	public String getUser_uid() {
		return user_uid;
	}
	public void setUser_uid(String user_uid) {
		this.user_uid = user_uid;
	}
	
	
	public String getActivation_sts() {
		return activation_sts;
	}
	public void setActivation_sts(String activation_sts) {
		this.activation_sts = activation_sts;
	}
	
	
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
