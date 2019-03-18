package com.orgweb.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.orgweb.service.interfaces.IManagerSqlInfoService;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import com.orgweb.service.interfaces.IZbjcService;
import com.orgweb.utils.Constant;
import com.orgweb.utils.PageList;

/**
 * 战备检查
 * 
 * @author qlee
 * @version 1.0.0
 */
@Transactional
@Controller
@RequestMapping("/share")
public class ShareAction extends BaseAction {
	private static final Logger log = Logger.getLogger(ShareAction.class);
	@Autowired
	private IZbjcService zbjcServiceImpl;
	@Autowired
	private ITableInfoColumnService tableInfoColumnService;
	@Autowired
	private IManagerSqlInfoService managerSqlInfoService;
	//单表操作--------
	//1 增加
	/**
	 * 添加数据
	 * @return
	 */
	 @RequestMapping("/addSingleInfo")
	 @ResponseBody
	 public Map<String,Object> addSingleInfo(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 resultMap.put("msg", "保存成功");
			 //获取类型名称
			 String typename=getParameter("typename");
			 String tablename=Constant.CONFIGPROP.getProperty(typename);
			 //typename可能是类型，也可能是tablename，如果配置中没有就默认为表名
			 if(StringUtils.isBlank(tablename)){
				 tablename=typename;
			 }
			 //将参数json化
			 Map<String,Object> addMap= jsonToMap("addInfo");
			 //保存之前先验证
			 Map resultValidateMap=validate(tablename, addMap);
			 /**
			  * 如果返回有信息说明验证不通过，存储了错误的信息
			  */
			 if(resultValidateMap!=null&&resultValidateMap.keySet().size()>0){
				 resultMap.put("code", "10002");
				 resultMap.put("msg", "数据有问题！");
				 resultMap.put("result",resultValidateMap);
			 }
			 //先获取sql信息
			 tableInfoColumnService.addInfoForST(addMap, tablename);
			 return resultMap;
		 } catch (Exception e) {
			 log.info("保存异常:",e);
			 resultMap.put("code", "10002");
			//回滚
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			 return resultMap;
		 }
	}
	//2修改
	 /**
	 * 修改数据
	 * @return
	 */
	 @RequestMapping("/modifySingleInfo")
	 @ResponseBody
	 public Map<String,Object> modifySingleInfo(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 resultMap.put("msg", "保存成功");
			 //获取类型名称
			 String typename=getParameter("typename");
			 String tablename=Constant.CONFIGPROP.getProperty(typename);
			 //typename可能是类型，也可能是tablename，如果配置中没有就默认为表名
			 if(StringUtils.isBlank(tablename)){
				 tablename=typename;
			 }
			 //将参数json化
			 Map<String,Object> modifyMap=jsonToMap("modifyInfo");
			 Map<String,Object> modifyConditionMap=jsonToMap("condition");
			 //保存之前先验证
			 Map resultValidateMap=validate(tablename, modifyMap);
			 /**
			  * 如果返回有信息说明验证不通过，存储了错误的信息
			  */
			 if(resultValidateMap!=null&&resultValidateMap.keySet().size()>0){
				 resultMap.put("code", "10002");
				 resultMap.put("msg", "数据有问题！");
				 resultMap.put("result",resultValidateMap);
			 }
			 //先获取sql信息
			 tableInfoColumnService.modifyInfoForST(modifyMap, modifyConditionMap, tablename);;
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			//回滚
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			 return resultMap;
		 }
	} 
	 //3删除
	 @RequestMapping("/delInfo")
	 @ResponseBody
	 public Map<String,Object> delInfo(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 resultMap.put("msg", "删除成功");
			 //获取类型名称
			 String typename=getParameter("typename");
			 String tablename=Constant.CONFIGPROP.getProperty(typename);
			 //typename可能是类型，也可能是tablename，如果配置中没有就默认为表名
			 if(StringUtils.isBlank(tablename)){
				 tablename=typename;
			 }
			 //将参数json化
			 Map<String,Object> delCondition=jsonToMap("condition");
			 //先获取sql信息
			 tableInfoColumnService.deleteInfoForST(delCondition, tablename);
			 return resultMap;
		 } catch (Exception e) {
			 log.info("删除异常:",e);
			 resultMap.put("code", "10002");
			//回滚
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			 return resultMap;
		 }
	} 
	 @RequestMapping("/delBathInfo")
	 @ResponseBody
	 public Map<String,Object> delBathInfo(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 //前台传来的查询参数
		 String delCondition=getParameter("condition");
		 String typename=getParameter("typename");
		 String tableid=getParameter("tableid");
		 String tablename="";
		 if(StringUtils.isNotBlank(typename)){
			 tablename=Constant.CONFIGPROP.getProperty(typename);
		 }
		try{
			if(StringUtils.isNotBlank(tableid)){
				Map<String,Object> tableInfo=getTableInfo(getParameterInt("tableid"));;
				tablename=tableInfo.get(Constant.TABLEENAME).toString();
			}
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
	 //6 批量保存数据
	 @RequestMapping("/batchInsertData")
	 @ResponseBody
	 public Map<String,Object> batchInsertData(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try {
			resultMap.put("code", "10001");
			 resultMap.put("msg", "保存成功");
			 //获取类型名称
			 String typename=getParameter("typename");
			 String tablename="";
			 if(StringUtils.isNotBlank(typename)){
				 tablename=Constant.CONFIGPROP.getProperty(typename);
			 }
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
	//4查询list
	 @RequestMapping("/findList")
	 @ResponseBody
	 public Map<String,Object> findList(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 //获取类型名称
			 String typename=getParameter("typename");
			 String tablename=Constant.CONFIGPROP.getProperty(typename);
			 //typename可能是类型，也可能是tablename，如果配置中没有就默认为表名
			 if(StringUtils.isBlank(tablename)){
				 tablename=typename;
			 }
			 //将参数json化
			 Map<String,Object> findCondition=jsonToMap("condition");
			 if(tablename.equals("TBZB_MRQKRB_SJTZZS")){
				 String sql="SELECT glnm,nm,userid,to_char(sj,'yyyy-mm-dd HH24:mi:ss') as sj ,dw,ry,nr,clqk,scbj from TBZB_MRQKRB_SJTZZS";
				 List<Map<String,Object>> list= managerSqlInfoService.findInfoForUDGetList(findCondition, sql,new HashMap());
				 resultMap.put("result", list);
				 return resultMap;
			 }
			 //先获取sql信息
			 List<Map<String,Object>> list=tableInfoColumnService.findInfoForSTGetList(findCondition, tablename);
			 resultMap.put("result", list);
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	} 
	//5分页查询
	 @RequestMapping("/findListPage")
	 @ResponseBody
	 public Map<String,Object> findListPage(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 //获取类型名称
			 String typename=getParameter("typename");
			 String tablename=getParameter("tablename");
			 if(StringUtils.isNotBlank(typename)){
				 tablename=Constant.CONFIGPROP.getProperty(typename);
			 }
			 //typename可能是类型，也可能是tablename，如果配置中没有就默认为表名
			 if(StringUtils.isBlank(tablename)){
				 tablename=typename;
			 }
			 //将参数json化
			 Map<String,Object> condition=jsonToMap("condition");
			 PageList<Map<String,Object>> page= processPage(condition);
			 //先获取sql信息
			 page= tableInfoColumnService.findInfoForSTByPage(condition, page, tablename);
			 resultMap.put("code", "10001");
			 resultMap.put("rows",page.getList()); 
			 resultMap.put("currentPageNo",page.getCurPage());
			 resultMap.put("pageSize",page.getPageSize());
			 resultMap.put("start",(page.getCurPage()-1)*page.getPageSize());
			 resultMap.put("totalCount",page.getTotalCount());
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	} 
	//6单个查询
	 @RequestMapping("/findSingInfo")
	 @ResponseBody
	 public Map<String,Object> findSingInfo(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 //获取类型名称
			 String typename=getParameter("typename");
			 String tablename=Constant.CONFIGPROP.getProperty(typename);
			 //typename可能是类型，也可能是tablename，如果配置中没有就默认为表名
			 if(StringUtils.isBlank(tablename)){
				 tablename=typename;
			 }
			 //将参数json化
			 Map<String,Object> findCondition=jsonToMap("condition");
			 //先获取sql信息
			 Map<String,Object> singleInfo=tableInfoColumnService.findInfoForSTGetSingleData(findCondition, tablename);
			 resultMap.put("result", singleInfo);
			 /*if(singleInfo==null||singleInfo.keySet().size()==0){
				 resultMap.put("code", "10003");
				 resultMap.put("msg", "没有查询到数据！");
			 }*/
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	} 
	//多表操作---------
	//1查询list
	 @RequestMapping("/findListSql")
	 @ResponseBody
	 public Map<String,Object> findListSql(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 //获取类型名称
			 String sqlMethodName=getParameter("methodName");
			 //将参数json化
			 Map<String,Object> whereMap=jsonToMap("condition");
			 Map<String,Object> paramMap=jsonToMap("paramconfig");
			 List<Map<String,Object>> list=getListBySqlMethodName(sqlMethodName, whereMap, paramMap);
			 resultMap.put("result", list);
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	} 
	 //1.1是根据从前端传过来的sql进行查询
	 @RequestMapping("/findListSqlParam")
	 @ResponseBody
	 public Map<String,Object> findListSqlParam(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 //获取类型名称
			 String sql=getParameter("sql");
			 List<Map<String,Object>> list=managerSqlInfoService.findInfoForUDGetList(new HashMap(), sql, new HashMap());
			 resultMap.put("result", list);
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	 } 
	 //1.2缓存结果的代码
	 @RequestMapping("/findListSqlCache")
	 @ResponseBody
	 public Map<String,Object> findListSqlCache(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 //获取类型名称
			 String sqlMethodName=getParameter("methodName");
			 //将参数json化
			 Map<String,Object> whereMap=jsonToMap("condition");
			 Map<String,Object> paramMap=jsonToMap("paramconfig");
			 String cachename=getParameter("cache");
			 List<Map<String,Object>> list=getListBySqlMethodName(sqlMethodName, whereMap, paramMap,cachename);
			 resultMap.put("result", list);
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	} 
	//2.1分页查询
	 @RequestMapping("/findListPageSqlOutWhereParam")
	 @ResponseBody
	 public Map<String,Object> findListPageSqlOutWhereParam(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 //将参数json化
			 Map<String,Object> whereMap= jsonToMap("condition");
			 Map<String,Object> paramconfig= jsonToMap("paramconfig");
			 PageList<Map<String,Object>> page= processPage(whereMap);
			 //这个是查询数量的sql语句
			 String sqlCount=getParameter("sqlcount");
			 String sql=getParameter("sql");
			 page=managerSqlInfoService.findInfoForUDByPageOutWhere(whereMap, page, sql, sqlCount, paramconfig);
			 resultMap.put("code", "10001");
			 // resultMap.put("result", listMap);
			 resultMap.put("rows",page.getList()); 
			 resultMap.put("currentPageNo",page.getCurPage());
			 resultMap.put("pageSize",page.getPageSize());
			 resultMap.put("start",(page.getCurPage()-1)*page.getPageSize());
			 resultMap.put("totalCount",page.getTotalCount());
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	 } 
	//2.1分页查询
		 @RequestMapping("/findListPageSqlOutWhere")
		 @ResponseBody
		 public Map<String,Object> findListPageSqlOutWhere(){
			 Map<String,Object> resultMap=new HashMap<String,Object>();
			 try{
				 String sqlMethodName=getParameter("methodName");
				 //将参数json化
				 Map<String,Object> whereMap= jsonToMap("condition");
				 Map<String,Object> paramconfig= jsonToMap("paramconfig");
				 //先获取sql信息
				 Map<String,Object> sqlInfo=getSQLInfo(sqlMethodName);
				 String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
				 whereMap=processParams(whereMap, sqlInfo, null);
				 PageList<Map<String,Object>> page= processPage(whereMap);
				 //这个是查询数量的sql语句
				 Map<String,Object> sqlInfoCount=getSQLInfo(sqlMethodName+"Count");
				 String sqlCount=sqlInfoCount.get(Constant.SQLCONTENT).toString();
				 page=managerSqlInfoService.findInfoForUDByPageOutWhere(whereMap, page, sql, sqlCount, paramconfig);
				 resultMap.put("code", "10001");
				 // resultMap.put("result", listMap);
				 resultMap.put("rows",page.getList()); 
				 resultMap.put("currentPageNo",page.getCurPage());
				 resultMap.put("pageSize",page.getPageSize());
				 resultMap.put("start",(page.getCurPage()-1)*page.getPageSize());
				 resultMap.put("totalCount",page.getTotalCount());
				 return resultMap;
			 } catch (Exception e) {
				 log.info("查询异常:",e);
				 resultMap.put("code", "10002");
				 return resultMap;
			 }
		 } 
	//2分页查询
	 @RequestMapping("/findListPageSql")
	 @ResponseBody
	 public Map<String,Object> findListPageSql(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 String sqlMethodName=getParameter("methodName");
			 //将参数json化
			 Map<String,Object> whereMap= jsonToMap("condition");
			 Map<String,Object> paramconfig= jsonToMap("paramconfig");
			 //先获取sql信息
			 Map<String,Object> sqlInfo=getSQLInfo(sqlMethodName);
			 String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
			 whereMap=processParams(whereMap, sqlInfo, null);
			 PageList<Map<String,Object>> page= processPage(whereMap);
			 //这个是查询数量的sql语句
			 Map<String,Object> sqlInfoCount=getSQLInfo(sqlMethodName+"Count");
			 String sqlCount=sqlInfoCount.get(Constant.SQLCONTENT).toString();
			 page=managerSqlInfoService.findInfoForUDByPage(whereMap, page, sql, sqlCount, paramconfig);
			 resultMap.put("code", "10001");
			 // resultMap.put("result", listMap);
			 resultMap.put("rows",page.getList()); 
			 resultMap.put("currentPageNo",page.getCurPage());
			 resultMap.put("pageSize",page.getPageSize());
			 resultMap.put("start",(page.getCurPage()-1)*page.getPageSize());
			 resultMap.put("totalCount",page.getTotalCount());
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	} 
	 //3单个查询
	 @RequestMapping("/findSingleInfoSql")
	 @ResponseBody
	 public Map<String,Object> findSingleInfoSql(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 //获取类型名称
			 String sqlMethodName=getParameter("methodName");
			 //将参数json化
			 Map<String,Object> whereMap=jsonToMap("condition");
			 Map<String,Object> paramMap=jsonToMap("paramconfig");
			 Map<String,Object> singleInfo=getSingleObject(sqlMethodName, whereMap, paramMap);
			 resultMap.put("result", singleInfo);
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	}
	//  4 删除deleteInfoForUD
	 @RequestMapping("/deleteInfoForUD")
	 @ResponseBody
	 public Map<String,Object> deleteInfoForUD(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		//前台传来的查询参数
		String delCondition=getParameter("condition");
		//先获取sql信息
		Map<String,Object> sqlInfo=getSQLInfo(getParameter("methodName"));
		String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
		try{
			List js= (List) JSONObject.parseArray(delCondition);
			for(int i=0;i<js.size();i++){
				 Map<String,Object> whereMap=new HashMap();
				 Map<String,Object> map=(Map<String, Object>) js.get(i);
				 whereMap.put(map.get("key").toString(), map.get("value"));
				 managerSqlInfoService.deleteInfoForUD(whereMap, sql);
			}
			resultMap.put("code", 10001);
		} catch (Exception e) {
			 log.info("删除异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
		return resultMap;
	 }
	 //复杂组合的处理
	 @RequestMapping("/saveMoreInfo")
	 @ResponseBody
	 public Map<String,Object> saveMoreInfo(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 resultMap.put("code", "10001");
			 //获取类型名称
			 String sqlMethodName=getParameter("methodName");
			 Map<String,Object> sqlInfo=getSQLInfo(sqlMethodName);
			 String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
			 //将参数json化
			 Map<String,Object> saveinfo=jsonToMap("condition");
			 managerSqlInfoService.modifyInfoForMoreUD(saveinfo, sql);
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	} 
	/**
	 * 将key转换为大写
	 * @param paramMap
	 * @return
	 */
	public Map toUpperCaseMap(Map<String,Object> paramMap){
		 Map resultMap=new HashMap();
		 for(String key:paramMap.keySet()){
			 resultMap.put(key.toUpperCase(), paramMap.get(key));
		 }
		 return resultMap;
	 }
	
	/**
	 * 将json字符串转换为Map
	 * @param paramname
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
	
	
	 /**
	  * 发送情况：查询发送日期和接收单位,还有序号
	  * 参数只有一个NM
	  */
	 @RequestMapping("/findMenuList")
	 @ResponseBody
	 public Map<String,Object> findMenuList(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 //将参数json化
			 Map<String,Object> configMap=jsonToMap("conditionMap");
			 configMap=toUpperCaseMap(configMap);
			 //先获取sql信息
			 List<Map<String, Object>> listMap=getListBySqlMethodName("findMenuList", null, configMap);
			 resultMap.put("code", "10001");
			 // resultMap.put("result", listMap);
			 resultMap.put("data",listMap);
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
	 }
	 
	 /**
	  * 获取验证信息-到前端使用
	  */
	 @RequestMapping("/findValidators")
	 @ResponseBody
	 public Map<String,Object> findValidators(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 String typename=getParameter("typename");
			 String tablename=Constant.CONFIGPROP.getProperty(typename);
			 //typename可能是类型，也可能是tablename，如果配置中没有就默认为表名
			 if(StringUtils.isBlank(tablename)){
				 tablename=typename;
			 }
			 //每日情况日报
			 List<Map<String,Object>> result=getColumn(tablename);
			 resultMap.put("result",result);
			 resultMap.put("code","10001");
			 return resultMap;
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
	 }
	 
	 /************************公共的方法 start*****************************************/
	 /**
	  * 保存数据前对数据处理，目前只有一个，日期
	  * @param dataMap
	 * @throws ParseException 
	  */
	 public void beforeSaveProcessData(Map<String,Object> dataMap,String tablename) throws ParseException{
		 List<Map<String,Object>> colList=tableInfoColumnService.getColumn(tablename);
		 if(colList!=null){
			 //如果是时间格式的，或者日期格式的需要转换一下
			 for(Map<String,Object> map:colList){
				 //属性字段名
				 String columnename=map.get("COLUMNENAME")==null?null:map.get("COLUMNENAME").toString().toUpperCase();
				 //字段值
				 Object columnValue=dataMap.get(columnename);
				 //数据类型
				 String dataType=map.get("DATATYPE")==null?null:map.get("DATATYPE").toString();
				 if(dataMap.containsKey(columnename)&&StringUtils.isNotBlank(dataType)&&StringUtils.isNotBlank(columnValue.toString())){
					 if(dataType.equals("T")&&columnValue!=null){
						 SimpleDateFormat sdfT=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						 dataMap.put(columnename, sdfT.parse(columnValue.toString()));
					 }else if(dataMap.get("dataType").equals("TD")){
						 SimpleDateFormat sdfD=new SimpleDateFormat("yyyy-MM-dd"); 
						 dataMap.put(columnename, sdfD.parse(columnValue.toString()));
					 }
				 }
			 }
		 }
	 }
	 /**
	  * 处理分页信息
	  */
	 public PageList<Map<String,Object>>  processPage( Map<String,Object> configMap){
		//当前页
		int curPage=Integer.parseInt(configMap.get("currPage").toString());
		configMap.remove("currPage");
		int pageSize = Integer.parseInt(configMap.get("pageSize").toString());
		configMap.remove("pageSize");
		PageList<Map<String,Object>> page =  new PageList<Map<String,Object>>(curPage,pageSize);
	    return page;
	 }
	 
	 /**
	  * 验证表单
	  * @param tablename
	  * @param validateMap
	  * @return
	 * @throws ParseException 
	  */
	 public Map validate(String tablename,Map<String,Object> validateMap) throws ParseException{
		 //是否进行验证
		 String flag=Constant.CONFIGPROP.getProperty("is_or_not_start_validator_front");
		 if(flag.equals("10001")){
			 List<Map<String,Object>> columnList=getColumn(tablename);
			 Map resultMap=zbjcServiceImpl.validateData(validateMap, columnList, tablename, "02", "01");
			 return resultMap;
		 }else{
			 beforeSaveProcessData(validateMap, tablename);
		 }
		 return null;
	 }
	 /**
	  * 获取表信息
	  * @param tableid
	  * @return
	  */
	 public Map<String,Object> getTableInfo(Integer tableid){
		 //定义一个容器，存储参数
		 Map<String,Object> map=new HashMap<String,Object>();
		 if(tableid!=0){
			 map.put("id", tableid);
		 }
		 //获取表名
		 String tablename=Constant.TABLENAME_BASETABLE_CONFIG;
		 Map<String,Object> resultMap= tableInfoColumnService.findInfoForSTGetSingleData(map,tablename);
		return resultMap;
	 }
	 
	 /**
	  * 获取表属性集合
	  * @param tableid
	  * @return
	  */
	 public List<Map<String,Object>> getColumn(Integer tableid){
		 //定义一个容器，存储参数
		 Map<String,Object> map=new HashMap<String,Object>();
		 map.put("tableid", tableid);
		 //获取表名
		 String tablename=Constant.TABLENAME_BASECOLUMN_CONFIG;
		 List<Map<String,Object>> resultList= tableInfoColumnService.findInfoForSTGetList(map,tablename);
		 return resultList;
	 }
	 
		/**
		 * 获取sql信息
		 * key是sqlname;unless="#result==null" 表示返回空不保存
		 * @param sqlname
		 * @return
		 */
		public Map<String,Object> getSQLInfo(String sqlname){ 
			//定义一个查询参数
			Map<String,Object> paramMap= new HashMap<String,Object>();
			//从前台传来sql，相当于一条信息的ID 唯一标识
			paramMap.put(Constant.SQLNAMEINFO, sqlname);
			return tableInfoColumnService.findSqlInfo(paramMap, Constant.TABLENAMEMANAGERSQLINFO);
		}
		/**
		 * 根据sql方法查询list 
		 * @param sqlMethodName
		 * @param whereMap
		 * @param paramMap
		 * @return
		 */
		public List<Map<String,Object>> getListBySqlMethodName(String sqlMethodName,Map whereMap,Map paramMap){
			Map<String,Object> sqlInfo=getSQLInfo(sqlMethodName);
		    String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
		    if(whereMap==null){
		    	whereMap=new HashMap();
		    }
		    whereMap=processParams(whereMap, sqlInfo, paramMap);
		    List<Map<String, Object>> listMap=managerSqlInfoService.findInfoForUDGetList(whereMap, sql,paramMap);
		    return listMap;
		}
		/**
		 * 根据sql方法查询list 会缓存数据
		 * @param sqlMethodName
		 * @param whereMap
		 * @param paramMap
		 * @param cachename
		 * @return
		 */
		public List<Map<String,Object>> getListBySqlMethodName(String sqlMethodName,Map whereMap,Map paramMap,String cachename){
			Map<String,Object> sqlInfo=getSQLInfo(sqlMethodName);
			String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
			if(whereMap==null){
				whereMap=new HashMap();
			}
			whereMap=processParams(whereMap, sqlInfo, paramMap);
			List<Map<String, Object>> listMap=managerSqlInfoService.findInfoForUDGetListCache(whereMap, sql,paramMap,cachename);
			return listMap;
		}
		/**
		 * 根据sql方法查询list 
		 * @param sqlMethodName
		 * @param whereMap
		 * @param paramMap
		 * @return
		 */
		public Map<String,Object> getSingleObject(String sqlMethodName,Map whereMap,Map paramMap){
			Map<String,Object> sqlInfo=getSQLInfo(sqlMethodName);
			String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
			Map<String, Object> resultMap=managerSqlInfoService.findInfoForUDGetSingleData(whereMap, sql,paramMap);
			return resultMap;
		}
		
		 /**
		  * 根据表名设置主键id
		  * @param tablename
		  * @param paramMap
		  */
		 public void setKeyName(String tablename,Map<String,Object> paramMap){
			//如果主键有不是id的，以后在这里要进行处理
			paramMap.put("id", getParameterInt("key"));
		 }
		 
		 /**
		  * 处理参数:主要是掉查询条件和排序进行
		  * @param map 参数
		  * @param sqlInfo sql 信息
		  * @return
		  */
		 public Map<String,Object> processParams(Map<String,Object> map,Map<String,Object> sqlInfo,Map<String,Object> paramMap){
			//获取需要处理的where中的条件 比如有前缀的，或者需要设置最大值或者最小值的等等 还有加Like的
			String sqlwherecolumn=sqlInfo.get("sqlwhereColumn")!=null?sqlInfo.get("sqlwhereColumn").toString():null;
			//找到根据那个字段进行排序
			String orderby=sqlInfo.get("ORDERBY")!=null?sqlInfo.get("ORDERBY").toString():null;
			
			//加上一个关键的字段 排除被删除的数据
			//map.put("delFlag", 0);
			//是否设置了排序的内容，如果有的话则设置
			//是否设置了排序的内容，如果有的话则设置
			if(StringUtils.isNotBlank(orderby)&&!map.containsKey("ORDERBY")){
				map.put("orderby", orderby);
			}
			if(StringUtils.isNotBlank(sqlwherecolumn)){
				
				//这个处理非常重要，前台传来的查询条件，与后台的sql对应时，有时候where里面有前缀，而前台传值无前缀这样
				//执行sql时会报错，现在在这里处理一下，就不会报错了，就对应了，只有需要有前缀时才设置sqlwherecolumn
				Map<String,Object> whereMap= JSONObject.parseObject(sqlwherecolumn);
				for(Entry<String, Object> entry:whereMap.entrySet()) {
					//2 先校验是否为后台自己写入的条件 比如 a.status in(4,5,6)
					if(entry.getKey()!=null&&entry.getKey().toString().startsWith("WHERE")){
						String key=entry.getKey().toString().substring(5);
						//map中的参数值,来自于前端
						Object valueObje=entry.getValue();
						//判断一下后缀是In的参数，后台where中要用到in,这里要处理一下
						if(key.endsWith("In")&&valueObje!=null){
							//如果是in则讲valueObje转换为数组对象
							valueObje=valueObje.toString().split(",");
						}
						/*//不等于
						else if(key.endsWith("NoEqueal")&&valueObje!=null){
							//如果是in则讲valueObje转换为数组对象
							valueObje=valueObje.toString().split(",");
						}*/
						map.put(key, valueObje);
						continue;
					}
					//3处理前端传来的参数
					if(map.containsKey(entry.getKey())){
						/*1 解决复合查询的参数问题，首先该方法要加上一个paramMap 这样一个map，这个是保存在sql内部写有${paramMap.xx}的问题
						 * 内部的sql中where 后暂时不接受In结尾的参数，如果遇到实际应用再去考虑
						 */
						if(entry.getValue()!=null&&entry.getValue().toString().startsWith("#")){
							//在where里面写上#开头的就是这样的变量，需要将其增加到map中来
							paramMap.put(entry.getValue().toString().substring(1), map.get(entry.getKey()));
							map.remove(entry.getKey());
							continue;
						}
						//map中的参数值,来自于前端
						Object valueObje=map.get(entry.getKey());
						//判断一下后缀是In的参数，后台where中要用到in,这里要处理一下
						if(entry.getValue().toString().endsWith("In")&&valueObje!=null){
							//如果是in则讲valueObje转换为数组对象
							valueObje=valueObje.toString().split(",");
						}
						//如果存在了有前缀的 key 比如a.xxx;就移除，重新给参数fukey值;现增加一个新的，再删除旧的
						map.put(entry.getValue().toString(),valueObje);
						map.remove(entry.getKey());
					}
				}
			}
			 return map;
		 }
		 public int getMaxID(String tablename){
			 Map  map=new HashMap();
			 map.put("tablename", tablename);
			//获取最大的id+1
			//Map<String,Object> sqlInfo=getSQLInfo("findMaxID");
			String sql="SELECT max(id)+1 as id from "+tablename;
			Map<String,Object> colMap=managerSqlInfoService.findInfoForUDGetSingleData(new HashMap(), sql, map);
			int indexID=Integer.parseInt(colMap.get("ID").toString());
			return indexID;
		 }
		 
		 /**
		  * 获取表属性集合
		  * @param tablename
		  * @return
		  */
		 public List<Map<String,Object>> getColumn(String tablename){
			 Map<String,Object> map=new HashMap<String,Object>();
			 map.put("TABLEENAME", tablename);
			 Map resultMap=tableInfoColumnService.findInfoForSTGetSingleData(map, Constant.TABLENAME_BASETABLE_CONFIG);
			 //定义一个容器，存储参数
			 map=new HashMap<String,Object>();
			 map.put("tableid", resultMap.get("ID"));
			 //获取表名
			 List<Map<String,Object>> resultList= tableInfoColumnService.findInfoForSTGetList(map,Constant.TABLENAME_BASECOLUMN_CONFIG);
			 return resultList;
		 }
	 /************************公共方法 end*****************************************/
		 /**
		  * 获取验服务端时间
		  */
		 @RequestMapping("/getServerDateOrTime")
		 @ResponseBody
		 public Map<String,Object> getServerDateOrTime(){
			 Map<String,Object> resultMap=new HashMap<String,Object>();
			 try{
				 String type=getParameter("type");
				 String result="";
				 if(StringUtils.isNotBlank(type)&&type.equals("time")){
					 SimpleDateFormat sdfT=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					 result=sdfT.format(System.currentTimeMillis());
				 }else{
					 SimpleDateFormat sdfD=new SimpleDateFormat("yyyy-MM-dd");
					 result=sdfD.format(System.currentTimeMillis());
				 }
				 resultMap.put("result",result);
				 resultMap.put("code","10001");
				 return resultMap;
			 } catch (Exception e) {
				 log.info("查询异常:",e);
				 resultMap.put("code", "10002");
				 return resultMap;
			}
		 }
		 
		 
		 /**
		  * 拼装模糊查询的子表sql
		  * @param key
		  * @return
		  */
		 public String getLikeSql(String key,String tablename,String joinColMain,String joincolright){
			 //拼sql
			 StringBuilder sbl=new StringBuilder();
			 String sql="SELECT ROWNUM,COLUMNNAME,COLUMNENAME from S_BASECOLUMN_CONFIG a left join S_BASETABLE_CONFIG b on a.tableid=b.id where b.tableename='"+tablename+"'";
			 List<Map<String,Object>> cols=managerSqlInfoService.findInfoForUDGetList(new HashMap(), sql, new HashMap());
			 //根据列拼sql
			 sbl.append(" and EXISTS (");
			 sbl.append(" SELECT 1 FROM "+tablename+" c WHERE x.GLNM = c.GLNM and c.scbj='0' ");
			 
			 sbl.append(" and (");
			 for(Map<String,Object> map:cols){
				 int rownum=Integer.valueOf(map.get("ROWNUM").toString());
				 if(rownum==1){
					 sbl.append("c."+map.get("COLUMNENAME") +" like '%"+key+"%'");
				 }else{
					 sbl.append("or c."+map.get("COLUMNENAME") +" like '%"+key+"%'");
				 }
			 }
			 sbl.append(")");
			 
			 sbl.append(")");
			// 与原来的sql拼到一起
			 return sbl.toString();
		 }
		 /**
		 * 新增消息提醒
		 * * loginName : 登录的用户名 中文
		 * dwnm：提醒对方的单位内码
		 * menuid： 菜单对应的功能标识
		 * msgtype：消息类型 ，可为空
		 * msgid：消息id
		 * content：提醒内容，对方可见
		 * @return
		 */
		/*@RequestMapping(value="/sendAdvice",method=RequestMethod.POST)
		@ResponseBody
		public Boolean sendAdvice(){
			Map<String,Object> paramMap=jsonToMap("paramconfig");
			JSONArray dwnms=(JSONArray)paramMap.get("dwnms");
			String loginName=paramMap.get("loginname").toString();
			String menuid=paramMap.get("menuid").toString();
			String msgtype=paramMap.get("msgtype").toString();
			String msgid=paramMap.get("msgid").toString();
			String content=paramMap.get("content").toString();
			boolean flag=true;
			for(int i=0;i<dwnms.size();i++){
				flag=flag&&zbjcServiceImpl.instertAdvice(loginName, dwnms.getString(i), menuid, msgtype, msgid, content);
			}
			return flag;
		}*/
}
