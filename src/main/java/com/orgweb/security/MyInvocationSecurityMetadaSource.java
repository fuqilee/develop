package com.orgweb.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

import com.orgweb.service.interfaces.IManagerSqlInfoService;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import org.springframework.stereotype.Component;

/**
 * 这个类说白了就是从数据库中取出资源对应的权限，我这里也是写的静态的，修改为动态的方法也很简单，执行一个查询就行了
 * 
 * @author qlee
 *
 */
public class MyInvocationSecurityMetadaSource implements
		FilterInvocationSecurityMetadataSource {
	@Autowired
	private ITableInfoColumnService tableInfoColumnService;
	@Autowired
	private IManagerSqlInfoService managerSqlInfoService;
	 private static Map<String,Collection<ConfigAttribute>> resourceMap = null;
	 //不用自己的构造方法，解决注入为空的情况 步骤一
   /* public MyInvocationSecurityMetadaSource(){
        loadResourceDefine();
    }*/
	//不用自己的构造方法，解决注入为空的情况 步骤二 给方法加上@PostConstruct注解
    @PostConstruct
    private void loadResourceDefine(){
        resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
        Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
        //查询角色
        /**
         * List<Role> allList = roleService.getAllRoleList();
         * 根据角色查询对应的权限
         * 
         */
        //查询角色的集合
        List<Map<String, Object>> roles=managerSqlInfoService.findInfoForUDGetList(new HashMap(), "SELECT * from dc_role", new HashMap());
        // List<Map> roles=userDao.findRoleList();
        if(roles!=null&&roles.size()>0){
        	for(Map roleMap:roles){
        		//角色ID
        		String roleId=roleMap.get("ROLEID").toString();
        		//设置角色
        		atts = new ArrayList<ConfigAttribute>();
        		ConfigAttribute ca = new SecurityConfig(roleId);
        		atts.add(ca);
        		//查询角色对应的功能权限集合
        		String funsql="SELECT a.* from dc_privilege a "
        				+"LEFT JOIN dc_role_privilege b on a.funcId=b.privId  "
        				+"LEFT JOIN dc_role c on b.roleId=c.roleId "
        				+"where c.roleId='"+roleId+"' ";
        		List<Map<String, Object>> roleFunList=managerSqlInfoService.findInfoForUDGetList(new HashMap(), funsql, new HashMap());;
        		if(roleFunList!=null &&roleFunList.size()>0){
        			for(Map funcMap:roleFunList){
		        		String funcLink=funcMap.get("FUNCLINK").toString();
		        		if(!funcLink.startsWith("/")){
		        			//将权限加入 :(角色信息[前缀部分]--用于区分多个角色对应同一个url的情况，个性需求)+url
		        			resourceMap.put(roleId+"/"+funcLink,atts);
		        		}else{
		        			resourceMap.put(roleId+"/"+funcLink,atts);
		        		}
		        	}
        		}
        		
        	}
        }
    }

    public void getAuthority(){

	}

    
    @Override
    public Collection<ConfigAttribute> getAttributes(Object object)
            throws IllegalArgumentException {
        
        //object是一个URL ,为用户请求URL  
        String url = ((FilterInvocation)object).getRequestUrl();       
        int firstQuestionMarkIndex = url.indexOf("?");  
        if (firstQuestionMarkIndex != -1) {  
            url = url.substring(0, firstQuestionMarkIndex);  
        }  
        Iterator<String> iter = resourceMap.keySet().iterator();    
          
        String matchUrl=null;//匹配url  
        String roleId=null;//角色信息--前缀部分--用于区分多个角色对应同一个url的情况，个性需求
        Map<String,Object> user =null;
        HttpServletRequest request=((FilterInvocation)object).getHttpRequest();
    	if(request!=null){
    		user= (Map<String,Object>) request.getSession().getAttribute("user");
    	}
    	if(user==null){
    		return null;
    	}
    	String roleSql="SELECT c.* from dc_role c " 
    			+"LEFT JOIN dc_user_role d on c.roleId=d.roleId "
    			+"LEFT JOIN dc_user e on d.userId=e.userId  where e.userId='"+user.get("USERID")+"' ";
    	List<Map<String, Object>> roleList=managerSqlInfoService.findInfoForUDGetListCache(new HashMap(), roleSql, new HashMap(),user.get("USERID").toString());;
        //取到请求的URL后与上面取出来的资源做比较  
        while (iter.hasNext()) {  
            String resURL = iter.next();  
            String roleContent=resURL.substring(0,resURL.indexOf("/"));
            String endUrl=resURL.substring(resURL.indexOf("/"));
          //  if(urlMatcher.pathMatchesUrl(resURL,url)){ 
           // System.out.println(resURL);
              if(url.startsWith(endUrl)){ 
            	    boolean findflag=false;
	            	  if(user!=null&&roleList != null) {
	            		  for(Map<String, Object> ur:roleList){
	            			  if(roleContent.equals(ur.get("ROLEID"))){
	            				  matchUrl=endUrl;  
	                        	  roleId=roleContent;
	                        	  findflag=true;
	            				  break;
	            			  }
	            		  }
	            	  }else{
	            		 /* matchUrl=endUrl; 
	            		  roleId=roleContent;
        				  break;*/
	            	  }
	            	  //2018-12-12 修改内容，只要能匹配上都要加上这个内容，如果匹配到自己角色下就用自己的，如果没有就返回另外的
	            	  if(findflag){
	            		  break;
	            	  }
	            	  matchUrl=endUrl; 
            		  roleId=roleContent;
              }                
                  
        }  
        if(matchUrl!=null){  
            //如果存在匹配的url则返回需具备的权限  
//	          System.out.println(matchUrl+"-------"+resourceMap.get(matchUrl));  
            return resourceMap.get(roleId+matchUrl);  
        }  
        // 当系统中没配资源权限url，用户在访问这个资源的情况下，返回null 表示放行 ，  (疑问：如果系统中有此资源，resourceMap中没有配置，这样就允许通过了)
        // 如果当系统分配了资源url,但是这个用户立属的角色没有则 提示用户无权访问这个页面  
        return null;  
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        // TODO Auto-generated method stub
        return true;
    }

}
