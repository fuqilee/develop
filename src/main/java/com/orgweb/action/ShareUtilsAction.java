package com.orgweb.action;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import javax.servlet.http.HttpServletRequest;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orgweb.entitydto.UserInfo;
import com.orgweb.service.interfaces.IUserService;

@Controller
@RequestMapping("/shareUtils")
public class ShareUtilsAction {
	private static final Logger log = Logger.getLogger(ShareUtilsAction.class);
	@Autowired
	private IUserService userService;
	
	
}
