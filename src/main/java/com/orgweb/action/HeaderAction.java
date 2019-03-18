package com.orgweb.action;

import com.alibaba.fastjson.JSONObject;
import com.orgweb.utils.Constant;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 值班序列
 * 
 * @author qlee
 * @version 1.0.0
 */
@Controller
@RequestMapping("/head")
public class HeaderAction extends ShareBaseAction {
	private static final Logger log = Logger.getLogger(HeaderAction.class);
	
	/**
	 * @param request
	 * @return
	 */
	@RequestMapping("/header")
	public String toIndex(HttpServletRequest request){
		return "headfoot/header";
	}
	/**
	 * 跳转到登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/toLogin")
	public String toLogin(HttpServletRequest request){
		return "login";
	}
	/**
	 * 跳转到登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/toLoginapi")
	public String toLoginApi(HttpServletRequest request){
		return "loginapi";
	}


}
