package com.eoxys.Model;


public class RestResponse {
private String msg;
private String success;
private String act;
private RestParam param;

public RestParam getParam() {
	return param;
}
public void setParam(RestParam param) {
	this.param = param;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public String getSuccess() {
	return success;
}

public void setSuccess(String success) {
	this.success = success;
}
public String getAct() {
	return act;
}
public void setAct(String act) {
	this.act = act;
}


}
