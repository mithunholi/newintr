package com.eoxys.Controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.method.annotation.AbstractJsonpResponseBodyAdvice;

import com.eoxys.Model.RestResp;
import com.eoxys.Util.EncDecPassword;

@RestController
@RequestMapping(value = "/restLogin")
public class RestLoginController {

	@ControllerAdvice
	public static class JsonpAdvice extends AbstractJsonpResponseBodyAdvice {
		public JsonpAdvice() {
			super("callback");
		}
	}
	@RequestMapping( value="/checkLogin",method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String checkLogin(HttpServletRequest req, ModelMap map,HttpServletResponse res,HttpSession session,SessionStatus status) throws IOException {
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		System.out.println("username="+username+ " & pswd="+password);
		String encpwd=EncDecPassword.encPassword(password);
		System.out.println(encpwd);
		RestResp resp=new RestResp();
		System.out.println("resp="+resp);
		String callback = req.getParameter("c");
		String ret = responceBuilder(callback,resp);
		return ret;
	}



	private String responceBuilder(String c,RestResp resp){

		String ret="";
		if (c != null) {
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("data", resp);
			System.out.println("parse1CSV JSONP End "+Calendar.getInstance().getTimeInMillis());
			try {
				ret= objectMapper.writeValueAsString(new JSONPObject(c,map1));
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			ret=resp.toString();
		}
		return ret;
	}


}
