package com.orgweb.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
/*import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;*/
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.JSONLibDataFormatSerializer;
import com.orgweb.entitydto.TableInfoColumn;
import com.orgweb.service.interfaces.IManagerSqlInfoService;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import com.orgweb.service.interfaces.IZbjcService;
import com.orgweb.utils.Constant;
import com.orgweb.utils.PageList;

/**
 * 值班序列
 * 
 * @author qlee
 * @version 1.0.0
 */
@Controller
@RequestMapping("/bootInfo")
public class BootInfoAction extends ShareBaseAction {
	private static final Logger log = Logger.getLogger(BootInfoAction.class);
	
	/**
	 * @param request
	 * @return
	 */
	@RequestMapping("/toIndex")
	public String toIndex(HttpServletRequest request){
		System.out.println("hello,world");
		return "index";
	}
	/**
	 *  分页查询sql
	 * @param request
	 * @return
	 */
	@RequestMapping("/tobootinfo")
	public String tobootinfo(HttpServletRequest request){

		return "bootinfo/bootInfo";
	}
	/**
	 *  分页查询sql
	 * @param request
	 * @return
	 */
	@RequestMapping("/tobootinfoBase")
	public String tobootinfoBase(HttpServletRequest request){
		
		return "bootinfo/bootInfoBase";
	}
	/**
	 *  跳转到基本属性页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/tobootcolumn")
	public String tobootcolumn(HttpServletRequest request){
		
		return "bootinfo/bootcolumn";
	}
	/**
	 *  跳转到模板配置页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/tobootmodaltype")
	public String tobootmodaltype(HttpServletRequest request){
		
		return "bootinfo/bootmodaltype";
	}
	/**
	 *  跳转到基本属性页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toboottable")
	public String toboottable(HttpServletRequest request){
		
		return "bootinfo/boottable";
	}
	
	/**
	 *  跳转到sql管理页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/tosql")
	public String tosql(HttpServletRequest request){
		return "bootinfo/sqlmanager";
	}
	/**
	 * 用户界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/tobootuser")
	public String tobootuser(HttpServletRequest request){
		
		return "bootinfo/bootuser";
	}
	/**
	 * 用户界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/tobootrole")
	public String tobootrole(HttpServletRequest request){
		
		return "bootinfo/bootrole";
	}
	/**
	 * 用户界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/tobootprivilege")
	public String tobootprivilege(HttpServletRequest request){
		
		return "bootinfo/bootprivilege";
	}
	
	 /**
	 * 修改数据
	 * @return
	 */
	 @RequestMapping("/bathModify")
	 @ResponseBody
	 public Map<String,Object> bathModify(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 resultMap.put("msg", "保存成功");
			 //获取类型名称
			 String typename=getParameter("typename");
			 String tablename=Constant.CONFIGPROP.getProperty(typename);
			 List js= (List) JSONObject.parseArray(getParameter("modifyInfo"));
			 for(int i=0;i<js.size();i++){
				 Map<String,Object> modifyConditionMap=new HashMap();
				 Map<String,Object> modify=(Map<String, Object>) js.get(i);
				 String key=modify.get("key").toString();
				 Map<String,Object> modifyInfo=(Map<String, Object>)  modify.get("value");
				 modifyConditionMap.put(key, modifyInfo.get(key));
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
	  * 修改数据
	  * @return
	  */
	 @RequestMapping("/bathModifyBase")
	 @ResponseBody
	 public Map<String,Object> bathModifyBase(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 resultMap.put("msg", "保存成功");
			 //获取类型名称
			 String tablename=getParameter("tablename");
			 List js= (List) JSONObject.parseArray(getParameter("modifyInfo"));
			 for(int i=0;i<js.size();i++){
				 Map<String,Object> modifyConditionMap=new HashMap();
				 Map<String,Object> modify=(Map<String, Object>) js.get(i);
				 String key=modify.get("key").toString();
				 Map<String,Object> modifyInfo=(Map<String, Object>)  modify.get("value");
				 
				 modifyConditionMap.put(key, modifyInfo.get(key));
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
	 
	 //6 批量保存数据
	 @RequestMapping("/batchInsertData")
	 @ResponseBody
	 public Map<String,Object> batchInsertData(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try {
			resultMap.put("code", "10001");
			 resultMap.put("msg", "保存成功");
			 //获取类型名称
			 String tablename=getParameter("tablename");
			 List js= (List) JSONObject.parseArray(getParameter("addInfo"));
			 boolean searchFlag=false;
			 int indexID=0;
			 for(int i=0;i<js.size();i++){
				 Map<String,Object> addInfo=(Map<String, Object>) js.get(i);
				 if(addInfo.containsKey("ID")){
					 if(!searchFlag){
						 indexID=getMaxID(tablename);
						 searchFlag=true;
					 }
					 addInfo.put("ID", indexID);
					 indexID++;
				 }
				 //先获取sql信息
				 tableInfoColumnService.addInfoForST(addInfo, tablename);;
			 }
			 return resultMap;
		} catch (Exception e) {
			log.info("查询失败：",e);
			resultMap.put("code", "10002");
			return resultMap;
		}
	 }
	 @Transactional
	 @RequestMapping("/batchAuthorizeData")
	 @ResponseBody
	 public Map<String,Object> batchAuthorizeData(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try {
			 resultMap.put("code", "10001");
			 resultMap.put("msg", "保存成功");
			 //获取类型名称
			 String tablename=getParameter("tablename");
			 List js= (List) JSONObject.parseArray(getParameter("addInfo"));
			 Map<String,Object> condition=jsonToMap("condition");
			 boolean searchFlag=false;
			 int indexID=0;
			 //保存之前先删除之前的信息
			 tableInfoColumnService.deleteInfoForST(condition, tablename);
			 for(int i=0;i<js.size();i++){
				 Map<String,Object> addInfo=(Map<String, Object>) js.get(i);
				 if(addInfo.containsKey("ID")){
					 if(!searchFlag){
						 indexID=getMaxID(tablename);
						 searchFlag=true;
					 }
					 addInfo.put("ID", indexID);
					 indexID++;
				 }
				 //先获取sql信息
				 tableInfoColumnService.addInfoForST(addInfo, tablename);
			 }
			 
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询失败：",e);
			 resultMap.put("code", "10002");
			 //回滚
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			 return resultMap;
		 }
	 }
	 public int getMaxID(String tablename){
		 Map  map=new HashMap();
		 map.put("tablename", tablename);
		//获取最大的id+1
		//Map<String,Object> sqlInfo=getSQLInfo("findMaxID");
		String sql="SELECT max(id)+1 as ID from "+tablename;
		Map<String,Object> colMap=managerSqlInfoService.findInfoForUDGetSingleData(new HashMap(), sql, map);
		int indexID=Integer.parseInt(colMap.get("ID").toString());
		return indexID;
	 }
	 
	 /**
	  *  3 删除 delBaseInfo
	  *  注意，如果是批量处理，请再前台往后传数据时将条件格式化为如此
	  *  conditionMap.put('xxIN','a,b,c');
	  * @return
	  */
	 @RequestMapping("/delBaseInfo")
	 @ResponseBody
	 public Map<String,Object> delBaseInfo(){
		//处理结果值
		Map<String,Object> resultMap=new HashMap<String,Object>();
		Map<String,Object> map= new HashMap();
		Map<String,Object> delcondition= JSONObject.parseObject(getParameter("condition"));
		try{
			//取出表的信息
			 String tablename=getParameter("tablename");
			if(tablename!=null&&StringUtils.isNotBlank(tablename)){
				tableInfoColumnService.deleteInfoForST(delcondition, tablename);
				resultMap.put("code", 10001);
			}else{
				//没有数据，表名不存在
				resultMap.put("code", 10005);
			}
			return resultMap;
		} catch (Exception e) {
			 log.info("删除异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
	 }
	 
	 
	 @RequestMapping("/delBathInfo")
	 @ResponseBody
	 public Map<String,Object> delBathInfo(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 //前台传来的查询参数
		 String delCondition=getParameter("condition");
		 String tablename=getParameter("tablename");
		try{
			
			List js= (List) JSONObject.parseArray(delCondition);
			for(int i=0;i<js.size();i++){
				 Map<String,Object> whereMap=new HashMap();
				 Map<String,Object> map=(Map<String, Object>) js.get(i);
				 whereMap.put(map.get("key").toString(), map.get("value"));
				 tableInfoColumnService.deleteInfoForST(whereMap, tablename);
			}
			resultMap.put("code", 10001);
		} catch (Exception e) {
			 log.info("删除异常:",e);
			 resultMap.put("code", "10002");
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			 return resultMap;
		}
		return resultMap;
	 }

}
