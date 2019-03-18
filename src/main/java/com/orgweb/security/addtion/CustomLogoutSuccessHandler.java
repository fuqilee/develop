package com.orgweb.security.addtion;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
	private static final Logger logger = Logger.getLogger(CustomLogoutSuccessHandler.class);  
    /*@Autowired  
    private SystemLogService systemLogService;  */
    
    @Override  
    public void onLogoutSuccess(HttpServletRequest request,  
            HttpServletResponse response, Authentication authentication)  
            throws IOException, ServletException {  
        System.out.println("用户退出成功处理。。。。"); 
        if(authentication!=null&&StringUtils.isNotBlank(authentication.getName())){
        	 String userName = authentication.getName(); //用户名  
             String address =  request.getRemoteAddr();  //远程地址  
             logger.info("日志：ip:"+request.getRemoteAddr() +"host:"+request.getRemoteHost()+"退出时间："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));    
        }
       
        super.onLogoutSuccess(request, response, authentication);
    }
}
