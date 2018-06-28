package com.eoxys.Model;

import java.util.Date;

public class AtomicCounter {
	private int id;
	private int user_uid;
	private Date user_uid_dt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_uid() {
		return user_uid;
	}
	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}
	public Date getUser_uid_dt() {
		return user_uid_dt;
	}
	public void setUser_uid_dt(Date user_uid_dt) {
		this.user_uid_dt = user_uid_dt;
	}

}
