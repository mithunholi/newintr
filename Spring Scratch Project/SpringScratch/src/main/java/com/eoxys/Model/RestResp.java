package com.eoxys.Model;

import java.util.List;

public class RestResp {
private String msg;
private String success;
private String act;
private RestParam param;
//private RestDeviceOwners resDo;
//private RestDeviceConfig resDevC;
//private RestDoBankConfig restDoBankConfig;
//private  List<MessageTiming> msgTimings;
//private List<PersonalMessage> personalMsg;

//public List<PersonalMessage> getPersonalMsg() {
//	return personalMsg;
//}
//public void setPersonalMsg(List<PersonalMessage> personalMsg) {
//	this.personalMsg = personalMsg;
//}
//public List<MessageTiming> getMsgTimings() {
//	return msgTimings;
//}
//public void setMsgTimings(List<MessageTiming> msgTimings) {
//	this.msgTimings = msgTimings;
//}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public String getSuccess() {
	return success;
}
//public RestDeviceConfig getResDevC() {
//	return resDevC;
//}
//public void setResDevC(RestDeviceConfig resDevC) {
//	this.resDevC = resDevC;
//}
public void setSuccess(String success) {
	this.success = success;
}
public String getAct() {
	return act;
}
public void setAct(String act) {
	this.act = act;
}
public RestParam getParam() {
	return param;
}
public void setParam(RestParam param) {
	this.param = param;
}
//public RestDeviceOwners getResDo() {
//	return resDo;
//}
//public void setResDo(RestDeviceOwners resDo) {
//	this.resDo = resDo;
//}
//public RestDoBankConfig getRestDoBankConfig() {
//	return restDoBankConfig;
//}
//public void setRestDoBankConfig(RestDoBankConfig restDoBankConfig) {
//	this.restDoBankConfig = restDoBankConfig;
//}
}
