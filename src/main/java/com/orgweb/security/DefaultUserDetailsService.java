package com.orgweb.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

import com.orgweb.dao.UserDao;
import com.orgweb.service.interfaces.IManagerSqlInfoService;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import com.orgweb.utils.EncryptionUtil;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * 在这个类中你可以通过读取数据库来进行权限赋值，下面的代码未注解的是我写的静态的
 * @author qlee
 *
 */
public class DefaultUserDetailsService implements UserDetailsService {
	@Autowired
	private ITableInfoColumnService tableInfoColumnService;
	@Autowired
	private IManagerSqlInfoService managerSqlInfoService;
    
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        // TODO Auto-generated method stub
        System.out.println("userDetail********");
        //Collection <GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
        Collection <SimpleGrantedAuthority> auths = new ArrayList<SimpleGrantedAuthority>();

       // GrantedAuthority auth2 = new SimpleGrantedAuthority("ROLE_ADMIN");
        
        //auths.add(auth2);
        Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("loginName", username);
		Map map =tableInfoColumnService.findInfoForSTGetSingleData(conditionMap, "dc_user");
        String password="";
        if(map!=null&& map.containsKey("PASSWORD")){
        	password=map.get("PASSWORD").toString();
        }else{
        	 throw new UsernameNotFoundException("用户不存在");
        }
        //权限设置
        String roleSQL="SELECT c.* from dc_role c " 
        		+"LEFT JOIN dc_user_role d on c.roleId=d.roleId "
        		+"LEFT JOIN dc_user e on d.userId=e.userId  where e.userId='"+map.get("USERID")+"' ";
        //List<Map> roleList=userDao.findUserRoleList(map.get("userId").toString());
        List<Map<String, Object>> roleList=managerSqlInfoService.findInfoForUDGetList(new HashMap(), roleSQL, new HashMap());
        if(roleList!=null&&roleList.size()>0){
        	for(Map roleMap:roleList){
        	  //把roleId当成角色名称
        	  String roleName=roleMap.get("ROLEID").toString();
        	  //GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(roleName);
                SimpleGrantedAuthority grantedAuthority = new SimpleGrantedAuthority(roleName);
              auths.add(grantedAuthority);
        	}
        }
       // User user = new User(username,password,true,true,true,true,auths);
        String nicheng=map.get("USERNAME")==null?"":map.get("USERNAME").toString();
        String lastloginname=map.get("LASTLOGINTIME")==null?"":map.get("LASTLOGINTIME").toString();
        UserDto userdto=new UserDto(username, password, nicheng, true, true, true, true, auths,lastloginname);
//        User user = new User(username,"479af1f093d748449343040090b3767a06b7daf9003ad95ed066797803db0f8bc4343198d73438fa",true,true,true,true,auths);
        return userdto;
        
        
//        TUser paramU = new TUser();
//        paramU.setUsername(username);
//        List<TUser> userList = userDao.selectByUserParam(paramU);
//        TUser user = new TUser();
//        if(userList==null || userList.size()<=0){
//            throw new UsernameNotFoundException("username");
//        }
//        //得到用户权限
//        if(user.getRoles()!=null && user.getRoles().size()>0){
//            
//            for(Role role : user.getRoles()){
//                GrantedAuthority grantedAuthority = new GrantedAuthorityImpl(
//                        role.getRolecode().toUpperCase());
//                auths.add(grantedAuthority);
//            }
//            
//        }
//        user.setAuthorities(auths);
//        return user;
    }
    
   
    
    public static void main(String[] args){
    	
    	
    	 Md5PasswordEncoder md5encoder = new Md5PasswordEncoder();
    	 //String hel =md5encoder.encodePassword("1111", "admin");
    	 String hel =md5encoder.encodePassword("123456", "MD5");
    	
    	 //System.out.println(encoder.encode("1111"));
    	System.out.println(EncryptionUtil.encryptionByMD5("123456"));
    	System.out.println(hel);
    	
    	
    }
    
    private static final StandardPasswordEncoder encoder = new StandardPasswordEncoder("my-secret-key");//秘钥值  
    
    public static String encrypt(String rawPassword) {  
         return encoder.encode(rawPassword);  
    }  
   
    public static boolean match(String rawPassword, String password) {  
         return encoder.matches(rawPassword, password);  
    } 

}
