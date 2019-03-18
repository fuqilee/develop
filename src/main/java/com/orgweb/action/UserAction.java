package com.orgweb.action;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.orgweb.entitydto.UserInfo;
import com.orgweb.security.UserDto;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import com.orgweb.service.interfaces.IUserService;
import com.orgweb.utils.EncryptionUtil;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

@Controller
public class UserAction extends BaseAction{
	private static final Logger log = Logger.getLogger(UserAction.class);
	@Autowired
	private IUserService userService;
	@Autowired
	private ITableInfoColumnService tableInfoColumnService;

	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		/*log.debug("This is the debug message.");
        log.info("This is the info message.");
        log.warn("This is the warn message.");
        log.error("This is the error message.");
        log.fatal("This is the fatal message.");
		log.info("begin：toIndex");*/
		long start=System.currentTimeMillis();
		log.info("startTime:"+start);
		UserInfo user=userService.queryUserInfoById(1);
		long end=System.currentTimeMillis();
		log.info("endTime:"+end);
		log.info("use Time:"+(end-start));
		request.setAttribute("user", user);
		//throw new NullPointerException("NullPointerException Test!");
		log.info("end：toIndex");
		/*try {
            List a = null;
                System.out.println(a.size());
       } catch (Exception e) {
           log.error("run error.", e);
       }*/
		return "index";
	}
	/**
	 * 测试字ajax的链接方式
	 * @ResponseBody 这个是指返回的是json串
	 * @param user
	 * @return
	 */
	@RequestMapping("toJson")
	@ResponseBody
	public  UserInfo toJson(UserInfo user) {
		System.out.println(user.getId());
		UserInfo u=userService.queryUserInfoById((int)user.getId());
		//throw new Exception("NullPointerException Test!");
		return u;
	}

	/**
	 *  跳转到修改密码界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/tosetpassword")
	public String totaxdesc(HttpServletRequest request){
		return "view/user/setpassword";
	}
	/**
	 *  跳转到修改密码界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/findOldPassword")
	@ResponseBody
	public Map<String,Boolean> findOldPassword(HttpServletRequest request){
		String password=request.getParameter("oldpassword");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String loginpassword=((UserDto)authentication.getPrincipal()).getPassword();
		Md5PasswordEncoder md5encoder = new Md5PasswordEncoder();
		String md5password =EncryptionUtil.encryptionByMD5(password);
		Map<String,Boolean> result=new HashMap<String,Boolean>();
		result.put("valid",loginpassword.equals(md5password));
		return result;
	}
	/**
	 *  跳转到修改密码界面
	 * @param request
	 * @return
	 */
	@Transactional
	@RequestMapping("/user/modifyPassword")
	@ResponseBody
	public Map<String,Object> modifyPassword(HttpServletRequest request){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try{
			String newpassword=request.getParameter("newpassword");
			Md5PasswordEncoder md5encoder = new Md5PasswordEncoder();
			String md5password =EncryptionUtil.encryptionByMD5(newpassword);
			Map<String,Object> modfiyInfo=new HashMap<String,Object>();
			Map<String,Object> modifyCondition=jsonToMap("condition");
			modfiyInfo.put("password", md5password);
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String userid=authentication.getName();
			tableInfoColumnService.modifyInfoForST(modfiyInfo, modifyCondition, "DC_USER");
			resultMap.put("code", "10001");
			return resultMap;
		} catch (Exception e) {
			 log.info("保存异常:",e);
			 resultMap.put("code", "10002");
			//回滚
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			 return resultMap;
		 }
	}

	/**
	  * 修改数据
	  * @return
	  */
	 @RequestMapping("/user/bathModifyBase")
	 @ResponseBody
	 public Map<String,Object> bathModifyBase(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 resultMap.put("msg", "保存成功");
			 //获取类型名称
			 String tablename="DC_USER";
			 List js= (List) JSONObject.parseArray(getParameter("modifyInfo"));
			 for(int i=0;i<js.size();i++){
				 Map<String,Object> modifyConditionMap=new HashMap();
				 Map<String,Object> modify=(Map<String, Object>) js.get(i);
				 Map<String,Object> modifyInfo=new HashMap();
				 modifyConditionMap.put("LOGINNAME", modify.get("LOGINNAME"));
				 //身份证号才会进行初始化
				 if(modify.get("LOGINNAME").toString().length()>17){
						String cardid=modify.get("LOGINNAME").toString();
						String berpass=cardid.substring(cardid.length()-6);
						String password=EncryptionUtil.encryptionByMD5(berpass);
						//System.out.println("加密前密码为："+berpass);
						//System.out.println("密码为："+password);
						modifyInfo.put("PASSWORD", password);
				 }
				 //先获取sql信息
				 tableInfoColumnService.modifyInfoForST(modifyInfo, modifyConditionMap, tablename);;
			 }
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 //回滚
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			 return resultMap;
		 }
	 }



	/**
	 * 测试字ajax的链接方式
	 * @ResponseBody 这个是指返回的是json串
	 * @param user
	 * @return
	 */
	@RequestMapping("exitUser")
	@ResponseBody
	public  String exitUser(UserInfo user) {
		System.out.println(user.getId());
		//创建一个缓存管理器
		CacheManager cacheManager = CacheManager.create();
		//根据缓存名称，获取缓存
		Cache sample = cacheManager.getCache("myCache");
		//根据键值获取缓存中的元素
		Element us=sample.get(1);

		String code="001";

		if(us!=null){
			//根据键值移除缓存中的元素
			sample.remove(1);
			code="000";
		}
		//throw new Exception("NullPointerException Test!");
		return code;
	}

	 /*@RequestMapping(method = GET)
	  public String home(Model model) {
	    return "home";
	  }*/

	 /**
	 * 将json字符串转换为Map
	 * @return
	 */
	public Map<String,Object> jsonToMap(String paramname){
		 //获取参数
		 String paramjson=getParameter(paramname);
		 if(StringUtils.isBlank(paramjson)||paramjson.equals("\"\"")){
			 return new HashMap();
		 }
		 //将参数json化
		 Map<String,Object> map= JSONObject.parseObject(paramjson);
		 return map;
	 }

}
