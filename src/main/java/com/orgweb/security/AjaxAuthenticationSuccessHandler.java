package com.orgweb.security;

import com.alibaba.fastjson.JSON;
import com.orgweb.service.interfaces.IManagerSqlInfoService;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*import com.orgweb.entity.FunctionList;
import com.orgweb.entity.Role;
import com.orgweb.entity.RolePrivilege;
import com.orgweb.entity.User;
import com.orgweb.entity.UserFunction;
import com.orgweb.entity.UserRole;
import com.orgweb.service.impl.FunctionListService;
import com.orgweb.service.impl.RoleService;
import com.orgweb.service.impl.UserService;*/
public class AjaxAuthenticationSuccessHandler implements
		AuthenticationSuccessHandler {
	private static final Logger logger = Logger.getLogger(AjaxAuthenticationSuccessHandler.class);  
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	@Autowired
	private ITableInfoColumnService tableInfoColumnService;
	@Autowired
	private IManagerSqlInfoService managerSqlInfoService;

    @SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setContentType("application/json");
        httpServletResponse.setCharacterEncoding("UTF-8");
        PrintWriter out = httpServletResponse.getWriter();
        String username =(authentication.getPrincipal() == null) ? "NONE_PROVIDED" : authentication.getName();
        Map map=new HashMap();
        map.put("msg", "登录成功");
        map.put("status", "110003");
        map.put("username", username);
        map.put("lastlogintime", ((UserDto)authentication.getPrincipal()).getLastloginname());
        //((UserDto)authentication.getPrincipal()).getAuthorities(); 角色
        //HttpSession session =httpServletRequest.getSession();  
        String userName = authentication.getName(); //用户名  
        //String password = httpServletRequest.getParameter("password"); //密码
        String address =  httpServletRequest.getRemoteAddr();  //远程地址  
        login(httpServletRequest, userName,map);
        /*session.setAttribute("username", userName);
        session.setAttribute("address", address);*/
        //写入日志  
        // systemLogService.save(new SystemLog(address, "登录", "用户登录系统", userName, new Date()));  
        logger.info("用户" + userName + "在地址" + address + "登入系统，时间："+new Date());  
        /** 登陆成功 ---start*/
        
        /** 登陆成功 ---end*/
        
        out.println(JSON.toJSONString(map));
        out.flush();
        out.close();
		if(SecurityContextHolder.getContext().getAuthentication()!=null){
			//解决登陆之后，用户一直报ROLE_ANONYMOUS的错误
			httpServletRequest.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
		}
    }
    
    public void setRequestCache(RequestCache requestCache) {

    	this.requestCache = requestCache;
	}
    
    /**
     * 将登陆信息保存到session中
     * @param request
     * @param username
     * @param map 
     */
    public void login(HttpServletRequest request,String username, Map map)  {
		
		Map<String,Object> user;
		try {
			///String findsqlUserSQL="select * from dc_user where username='"+username+"'";
			//user =managerSqlInfoService.findInfoForUDGetSingleData(new HashMap(), findsqlUserSQL, new HashMap());
			Map<String,Object> conditionMap=new HashMap<String,Object>();
			conditionMap.put("loginName", username);
			user =tableInfoColumnService.findInfoForSTGetSingleData(conditionMap, "dc_user");
			//user = userService.getUserByName(username);
			
			//更新登录日期
			Date now = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String currentTime = df.format(now);
			Map<String,Object> modfiyInfoUser=new HashMap<String,Object>();
			modfiyInfoUser.put("lastloginTime",currentTime);
			tableInfoColumnService.modifyInfoForST(modfiyInfoUser, conditionMap, "dc_user");
			
			//user.setLastloginTime(currentTime);
			//userService.updateUser(user);
			String functionsql="SELECT a.* from dc_privilege a  "
					+"LEFT JOIN dc_role_privilege b on a.funcId=b.privId "
					+"LEFT JOIN dc_role c on b.roleId=c.roleId "
					+"LEFT JOIN dc_user_role d on c.roleId=d.roleId "
					+"LEFT JOIN dc_user e on d.userId=e.userId  where e.userId='"+user.get("USERID")+"'";
			List<Map<String,Object>> funcList =managerSqlInfoService.findInfoForUDGetList(new HashMap(), functionsql, new HashMap());
			//List<FunctionList> funcList = this.getFunctionsOfUser(user.getUserId(),user);
			if(funcList==null||funcList.size()<1){
				map.put("status", "110004");
				map.put("msg", "请先给用户分配权限！");
			}
			//取得一级菜单
			/*List<Map<String,Object>> firstFuncList = new ArrayList<Map<String,Object>>();
			for(Map<String,Object> fl : funcList) {
				if((fl.get("funcPId")==null||StringUtils.isBlank(fl.get("funcPId").toString())) && fl.get("funcPId").toString().equals("1")) {
					firstFuncList.add(fl);
				}
			}
			
			Map<String, List<FunctionList>> secondMenuMap = new HashMap<String, List<FunctionList>>();
			//取得一级菜单下对应的二级菜单
			for(FunctionList func : firstFuncList) {
				String firstMenuKey = func.getFuncId();
				List<FunctionList> secondFuncList = new ArrayList<FunctionList>();
				for(FunctionList secondFunc : funcList) {
					if(firstMenuKey.equals(secondFunc.getFuncPId()) && secondFunc.getIsfunc() == 1) {
						secondFuncList.add(secondFunc);
					}
				}
				secondMenuMap.put(firstMenuKey, secondFuncList);
			}*/
			if(funcList==null||funcList.size()<1){
				map.put("status", "110004");
				map.put("msg", "请先给用户分配权限！");
			}
			request.getSession().setAttribute("menulist", JSON.toJSONString(funcList));
			request.getSession().setAttribute("userName", user.get("LOGINNAME"));
			request.getSession().setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("登陆异常："+e.getMessage());
		}
	}
    
    private boolean existsKey(String key, List<String> keyList) {
		for(int i = 0; i < keyList.size(); i++) {
			if(key.equals(keyList.get(i))) {
				return true;
			}
		}
		return false;
	}
    

}

