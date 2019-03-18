package com.orgweb.security;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Component;

@Component("ajaxFailHandler")
public class AjaxAuthenticationFailureHandler  implements AuthenticationFailureHandler {
	 public AjaxAuthenticationFailureHandler() {
	    }

	    @SuppressWarnings({ "rawtypes", "unchecked" })
		@Override
	    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
	    	/**
	    	 * status :
	    	 * 110001 登录失败
	    	 * 110002验证码有误
	    	 * 110003登录成功
	    	 */
	    	String msg="用户或者密码错误";
	    	String status="110001";
	    	if(e.getMessage().contains("验证码")){
	        	msg=e.getMessage();
	        	status="110002";
	        }
	    	httpServletResponse.setContentType("application/json");
	        httpServletResponse.setCharacterEncoding("UTF-8");
	        PrintWriter out = httpServletResponse.getWriter();
	        Map map = new HashMap();
	        map.put("status", status);
	        map.put("msg", msg);
	        out.println(JSON.toJSONString(map));
	        out.flush();
	        out.close();
	    }
}
