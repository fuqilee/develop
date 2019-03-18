package com.orgweb.security.addtion;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.RequestCache;

public class CustomSavedRequestAwareAuthenticationSuccessHandler extends
		SavedRequestAwareAuthenticationSuccessHandler {
	
	
	// 增加登录日志  
	private static final Logger logger = Logger.getLogger(CustomSavedRequestAwareAuthenticationSuccessHandler.class);  
      
    /*@Autowired  
    private SystemLogService systemLogService;  
      
    @Autowired  
    private UserService userService;  */
      
    @Override  
    public void onAuthenticationSuccess(HttpServletRequest request,  
            HttpServletResponse response, Authentication authentication)  
            throws ServletException, IOException {  
          
        System.out.println("用户登录成功处理。。。。");  
        /*User u = LogInfoService.getLoginUser();  
        HttpSession session =request.getSession();  
        if(u.getUserType()==UserType.TeamAdmin ){//用户为团队管理员  
            List<Crop> croplist = u.getCropSet();  
            for(Iterator<Crop> iter = croplist.iterator();iter.hasNext();){//去除被禁止的作物  
                String status = userService.getUserCropStatus(u.getId(),iter.next().getId());  
                if(status!=null && !status.equals("1")){  
                    iter.remove();  
                }                 
            }  
            session.setAttribute("croplist", croplist);    
        }else if(u.getUserType()==UserType.TeamUser){//用户为普通用户  
            List<Crop> croplist = u.getCropSet();  
            for(Iterator<Crop> iter = croplist.iterator();iter.hasNext();){//去除团队管理员被禁止的作物  
                String status = userService.getUserCropStatus(u.getUserGroup().getTeamAdmin().getId(),iter.next().getId());  
                if(status!=null && !status.equals("1")){  
                    iter.remove();  
                }                 
            }  
            session.setAttribute("croplist", croplist);  
        }else{//用户为系统管理员  
            session.setAttribute("croplist", LogInfoService.getAllCrops());  
        }   */
        
        HttpSession session =request.getSession();  
        String userName = authentication.getName(); //用户名  
        String address =  request.getRemoteAddr();  //远程地址  
        
        session.setAttribute("username", userName);
        session.setAttribute("address", address);
        //写入日志  
       // systemLogService.save(new SystemLog(address, "登录", "用户登录系统", userName, new Date()));  
        logger.info("用户" + userName + "在地址" + address + "登入系统，时间："+new Date());  
        super.onAuthenticationSuccess(request, response, authentication);     
  
    }  
  
    @Override  
    public void setRequestCache(RequestCache requestCache) {  
          
        super.setRequestCache(requestCache);  
    }  
}
