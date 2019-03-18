package com.orgweb.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.orgweb.service.interfaces.IManagerSqlInfoService;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import com.orgweb.utils.Constant;
import com.orgweb.utils.DataSourceContextHolder;
import com.orgweb.utils.PageList;

@Controller
@RequestMapping("/managerSqlInfo")
public class ManagerSqlInfoAction  extends BaseAction {
	private static final Logger log = Logger.getLogger(ManagerSqlInfoAction.class);
	@Autowired
	private ITableInfoColumnService tableInfoColumnService;
	@Autowired
	private IManagerSqlInfoService managerSqlInfoService;
	 /**
	  *   1  新增 addInfoForUD
	  */
	 @RequestMapping("/addInfoForUD")
	 @ResponseBody
	 public Map<String,Object> addInfoForUD(){
		//处理结果值
		Map<String,Object> resultMap=new HashMap<String,Object>();
		//前台传来的查询参数
		String addInfo=getParameter("conditionMap");
		Map<String,Object> map= JSONObject.parseObject(addInfo);
		if(map!=null){
			map.put("delFlag",0);
			map.put("createTime", new Timestamp(System.currentTimeMillis()));
			map.put("creator", "");
			map.put("updateTime", new Timestamp(System.currentTimeMillis()));
			map.put("updator","");
		}
		//先获取sql信息
		Map<String,Object> sqlInfo=getSQLInfo(getParameter("sqlname"));
		String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
		//处理结果值
		try{
			managerSqlInfoService.addInfoForUD(map, sql);
			resultMap.put("code", 10001);
		} catch (Exception e) {
			 log.info("保存异常:",e);
			 resultMap.put("code", 10002);
		}
		return resultMap;
	 }
	 //  2 删除deleteInfoForUD
	 @RequestMapping("/deleteInfoForUD")
	 @ResponseBody
	 public Map<String,Object> deleteInfoForUD(){
		//处理结果值
		Map<String,Object> resultMap=new HashMap<String,Object>();
		//前台传来的查询参数
		String delCondition=getParameter("conditionMap");
		Map<String,Object> whereMap= JSONObject.parseObject(delCondition);
		//先获取sql信息
		Map<String,Object> sqlInfo=getSQLInfo(getParameter("sqlname"));
		String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
		try{
			managerSqlInfoService.deleteInfoForUD(whereMap, sql);
			resultMap.put("code", 10001);
		} catch (Exception e) {
			 log.info("删除异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
		return resultMap;
	 }
	 //  3.1.1 查询一个list集合findInfoForUDGetList
	 @RequestMapping("/findInfoForUDGetList")
	 @ResponseBody
	 public Map<String,Object> findInfoForUDGetList(){
		//处理结果值
		Map<String,Object> resultMap=new HashMap<String,Object>();
		//前台传来的查询参数
		String conditionMap=getParameter("conditionMap");
		Map<String,Object> map= JSONObject.parseObject(conditionMap);
		
		//先获取sql信息
		Map<String,Object> sqlInfo=getSQLInfo(getParameter("sqlname"));
		String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		map=processParams(map, sqlInfo,paramMap);
		String datasource=getParameter("datasource",null);
		//注意这里在调用service前切换到dataSourceSim的数据源    
		if(StringUtils.isNotBlank(datasource)){
			DataSourceContextHolder.setDBType(datasource); 
		}
		List<Map<String, Object>> listMap=managerSqlInfoService.findInfoForUDGetList(map, sql,paramMap);
		//处理结果值
		try{
			if(listMap!=null&&listMap.size()>0){
				resultMap.put("code", 10001);
				resultMap.put("list", listMap);
			}else{
				resultMap.put("code", 10004);
			}
		} catch (Exception e) {
			log.info("查询异常:",e);
			resultMap.put("code", "10002");
		}finally{
			DataSourceContextHolder.clearDBType();
		}
		return resultMap;
	 }
	 //  3.1.2 查询单条数据findInfoForUDGetSingleData
	 @RequestMapping("/findInfoForUDGetSingleData")
	 @ResponseBody
	 public Map<String,Object> findInfoForUDGetSingleData(){
		//处理结果值
		Map<String,Object> resultMap=new HashMap<String,Object>();
		//前台传来的查询参数
		String conditionMap=getParameter("conditionMap");
		Map<String,Object> map= JSONObject.parseObject(conditionMap);
		
		//先获取sql信息
		Map<String,Object> sqlInfo=getSQLInfo(getParameter("sqlname"));
		String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		map=processParams(map, sqlInfo,paramMap);
		Map<String,Object> colMap=managerSqlInfoService.findInfoForUDGetSingleData(map, sql, paramMap);
		//处理结果值
		resultMap.put("result",colMap);
		resultMap.put("code", 10001);
		return resultMap;
	 }
	 //  3.2.1 分页查询findInfoForUDByPage
	 /**
	  * 查询基本信息
	  * 今天解决了 1 查询条件带a.x前缀这样的问题 2 最大值最小值MaxNum MinNum 3 当map中含有a.x这样的问题 用value 详情看此方法的xml 
	  * 
	  * @throws IOException 
	  */
	 @RequestMapping("/findInfoForUDByPage")
	 @ResponseBody
	 public Map<String,Object> findInfoForUDByPage(){
		//处理结果值
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		try{
			//先获取sql信息-查询数据库得到一条记录
			Map<String,Object> sqlInfo=getSQLInfo(getParameter("sqlname"));
			//从记录中得到sql内容
			String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
			
			//这个是查询数量的sql语句
			Map<String,Object> sqlInfoCount=getSQLInfo(getParameter("sqlname")+"Count");
			String sqlCount=sqlInfoCount.get(Constant.SQLCONTENT).toString();
			//当前页
			//当前页
			int curPage=getParameterInt("curPage",1);
			int pageSize = Constant.PAGESIZE;
			PageList<Map<String,Object>> page =  new PageList<Map<String,Object>>(curPage,pageSize);
			//获取条件
			String searchInfo=getParameter("conditionMap");
			Map<String,Object> map= JSONObject.parseObject(searchInfo);
			
			page.setPage(map);
			
			if(map==null){
				map=new HashMap<String, Object>();
			}
			Map<String,Object> paramMap=new HashMap<String,Object>();
			//对查询条件以及sql信息进行处理加工
			map=processParams(map, sqlInfo,paramMap);
			page=managerSqlInfoService.findInfoForUDByPage(map, page, sql,sqlCount,paramMap);
			page.setUrl("/managerSqlInfo/findInfoForUDByPage.do");
			page.setParams("");
			
			resultMap.put("result", JSON.toJSONString(page));
			if(page.getList()!=null&&page.getList().size()>0){
				//正常查询，查询成功
				resultMap.put("code", 10001);
			}else{
				//没有数据
				resultMap.put("code", 10004);
			}
		} catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
		return resultMap;
	 }
	 /**
	  * 查询基本信息
	  * 今天解决了 1 查询条件带a.x前缀这样的问题 2 最大值最小值MaxNum MinNum 3 当map中含有a.x这样的问题 用value 详情看此方法的xml 
	  * 
	  * @throws IOException 
	  */
	 @RequestMapping("/findInfoForUDByPageOutWhere")
	 @ResponseBody
	 public Map<String,Object> findInfoForUDByPageOutWhere(){
		 //处理结果值
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 //先获取sql信息-查询数据库得到一条记录
			 Map<String,Object> sqlInfo=getSQLInfo(getParameter("sqlname"));
			 //从记录中得到sql内容
			 String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
			 
			 //这个是查询数量的sql语句
			 Map<String,Object> sqlInfoCount=getSQLInfo(getParameter("sqlname")+"Count");
			 String sqlCount=sqlInfoCount.get(Constant.SQLCONTENT).toString();
			 //当前页
			 //当前页
			 int curPage=getParameterInt("curPage",1);
			 int pageSize = Constant.PAGESIZE;
			 PageList<Map<String,Object>> page =  new PageList<Map<String,Object>>(curPage,pageSize);
			 //获取条件
			 String searchInfo=getParameter("conditionMap");
			 Map<String,Object> map= JSONObject.parseObject(searchInfo);
			 
			 page.setPage(map);
			 
			 if(map==null){
				 map=new HashMap<String, Object>();
			 }
			 Map<String,Object> paramMap=new HashMap<String,Object>();
			 //对查询条件以及sql信息进行处理加工
			 map=processParams(map, sqlInfo,paramMap);
			 page=managerSqlInfoService.findInfoForUDByPageOutWhere(map, page, sql,sqlCount,paramMap);
			 page.setUrl("/managerSqlInfo/findInfoForUDByPage.do");
			 page.setParams("");
			 
			 resultMap.put("result", JSON.toJSONString(page));
			 if(page.getList()!=null&&page.getList().size()>0){
				 //正常查询，查询成功
				 resultMap.put("code", 10001);
			 }else{
				 //没有数据
				 resultMap.put("code", 10004);
			 }
		 } catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		 }
		 return resultMap;
	 }
	 //  3.2.2 分页查询数据数量findInfoForUDByPageCount
	 
	 //  4 修改modifyInfoForUD
	 @RequestMapping("/modifyInfoForUD")
	 @ResponseBody
	 public Map<String,Object> modifyInfoForUD(){
		Map<String,Object> resultMap=new HashMap<String,Object>();
		String conditionStr=getParameter("conditionMap");
		Map<String,Object> saveMap= JSONObject.parseObject(conditionStr);
		//先获取sql信息
		Map<String,Object> sqlInfo=getSQLInfo(getParameter("sqlname"));
		String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
		Map<String,Object> upadteCondition=new HashMap<String,Object>();
		processParams(saveMap, sqlInfo, upadteCondition);
		
		managerSqlInfoService.modifyInfoForUD(saveMap, sql, upadteCondition);
		//处理结果值
		try{
			resultMap.put("code", 10001);
		} catch (Exception e) {
			 log.info("更新异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
		return resultMap;
	 }
	 
	 /**
	  * 使用cache换成方法信息
	  * 获取sql信息
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
	  * 处理参数:主要是掉查询条件和排序进行
	  * @param map 参数
	  * @param sqlInfo sql 信息
	  * @return
	  */
	 public Map<String,Object> processParams(Map<String,Object> map,Map<String,Object> sqlInfo,Map<String,Object> paramMap){
		//获取需要处理的where中的条件 比如有前缀的，或者需要设置最大值或者最小值的等等 还有加Like的
		String sqlwherecolumn=sqlInfo.get("sqlwhereColumn")!=null?sqlInfo.get("sqlwhereColumn").toString():null;
		//找到根据那个字段进行排序
		String orderby=sqlInfo.get("orderby")!=null?sqlInfo.get("orderby").toString():null;
		
		//加上一个关键的字段 排除被删除的数据
		//map.put("delFlag", 0);
		if(map==null){
			map=new HashMap();
		}
		if(StringUtils.isNotBlank(sqlwherecolumn)){
			//是否设置了排序的内容，如果有的话则设置
			//是否设置了排序的内容，如果有的话则设置
			if(StringUtils.isNotBlank(orderby)&&!map.containsKey("orderby")){
				map.put("orderby", orderby);
			}
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
	 @Transactional
	 public void testT(String name){
		 log.debug("执行之前");
		 try{
			 //Thread.sleep(3000);
			// log.debug("停留3秒钟--------------------------------------111"+name);
			 managerSqlInfoService.modifyInfoForMoreUD(null, "UPDATE TBZB_MRQKRB set sfsb=0 where nm='R5ISXidfiJhdyrGusIF1pjMFPt7F'");
			 log.debug("【"+name+"】 开始休眠 30秒");
			 Thread.sleep(30000);
			 log.debug("执行了事物停留30秒钟--------------------------------------222 执行事物的名称：【"+name+"】");
		 }catch(Exception e){
			 log.debug("回滚"+name);
			//回滚
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		 }
		 
	 }
	 @Transactional
	 public void testTQ(String name){
		 log.debug("执行之前");
		 try{
			 //Thread.sleep(3000);
			 // log.debug("停留3秒钟--------------------------------------111"+name);
			 managerSqlInfoService.findInfoForUDGetList(new HashMap(), "select * from TBZB_MRQKRB where nm='R5ISXidfiJhdyrGusIF1pjMFPt7F'", new HashMap());
			// Thread.sleep(3000);
			 log.debug("执行了查询事物--------------------------------------222 执行事物的名称：【"+name+"】");
		 }catch(Exception e){
			 log.debug("回滚"+name);
			 //回滚
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		 }
		 
	 }
}
