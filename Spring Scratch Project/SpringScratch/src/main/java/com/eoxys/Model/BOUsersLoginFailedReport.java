package com.eoxys.Model;

import java.util.Date;

public class BOUsersLoginFailedReport {
	private int id;
	private String user_id;
	private String client_ip_address;
	private Date created_at;
	private String time_zone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getClient_ip_address() {
		return client_ip_address;
	}
	public void setClient_ip_address(String client_ip_address) {
		this.client_ip_address = client_ip_address;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTime_zone() {
		return time_zone;
	}
	public void setTime_zone(String time_zone) {
		this.time_zone = time_zone;
	}
	
	
}
