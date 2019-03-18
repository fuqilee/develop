package com.orgweb.action;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
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
public class ShareBaseAction extends BaseAction {
	private static final Logger log = Logger.getLogger(ShareBaseAction.class);
	@Autowired
	public IZbjcService zbjcServiceImpl;
	@Autowired
	public ITableInfoColumnService tableInfoColumnService;
	@Autowired
	public IManagerSqlInfoService managerSqlInfoService;
	
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
	 public Map<String,Object> findValidators(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
			 String typename=getParameter("typename");
			 String tablename=Constant.CONFIGPROP.getProperty(typename);
			 
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
	  */
	 public Map validate(String tablename,Map<String,Object> validateMap){
		 //是否进行验证
		 String flag=Constant.CONFIGPROP.getProperty("is_or_not_start_validator_front");
		 if(flag.equals("10001")){
			 List<Map<String,Object>> columnList=getColumn(tablename);
			 Map resultMap=zbjcServiceImpl.validateData(validateMap, columnList, tablename, "02", "01");
			 return resultMap;
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
		    	whereMap=processParams(whereMap, sqlInfo, null);
		    }
		    List<Map<String, Object>> listMap=managerSqlInfoService.findInfoForUDGetList(whereMap, sql,paramMap);
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
		 
			 /**
			  * 跨域进行请求
			  * @return
			  */
		    @RequestMapping(value = "/toOtherPlaceByUrl", method = RequestMethod.POST)
			@ResponseBody
			public Map toOtherPlaceByUrl(){
		    	/*@PropertySource("classpath:serverConfig.properties") 放到类上的注解
		    	@Value("${zb.url}") //根据注解获取里面的属性
		    	String url;*/   
		    	String url=""; //这个是ip端口等
				//处理结果值
				Map<String,Object> resultMap=new HashMap<String,Object>();
				HttpClient httpclient = new DefaultHttpClient();
				//创建HttpGet或HttpPost对象，将要请求的URL通过构造方法传入HttpGet或HttpPost对象。 
				HttpPost httppost  = new HttpPost(url+getParameter("URL"));
				//建立一个NameValuePair数组，用于存储欲传送的参数
				List<NameValuePair> dsNvs = new ArrayList<NameValuePair>();
				//获取request中所有的参数
				Enumeration<String> e = getRequest().getParameterNames();
				//将request中的参数组装到传送参数的数组中
				while (e.hasMoreElements()) {
					String name = e.nextElement();
					dsNvs.add(new BasicNameValuePair(name,  getRequest().getParameter(name)));
				}
				
				//log.info("访问数据工厂接口开始：");
				BufferedInputStream bain = null;
				ByteArrayOutputStream baout = null;
				try {
					//log.info("访问数据工厂接口参数："+nvps);
					httppost.setEntity(new UrlEncodedFormEntity(dsNvs, HTTP.UTF_8));
					HttpResponse response = httpclient.execute(httppost);
					HttpEntity entity = response.getEntity();

					baout = new ByteArrayOutputStream();
					bain = new BufferedInputStream(entity.getContent());
					byte[] b = new byte[1024 * 100];
					int offset;
					while ((offset = bain.read(b)) > -1) {
						baout.write(b, 0, offset);
					}
					String result=new String(baout.toByteArray(), HTTP.UTF_8);
					Map httpMap=JSONObject.parseObject(result);
					return httpMap;
				} catch (Exception ex) {
					 resultMap.put("code", "10002");
					 resultMap.put("msg", "网络异常");
					 return resultMap;
				 }finally {
					try {
						bain.close();
						baout.close();
						httpclient.getConnectionManager().shutdown(); 
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
	 /************************公共方法 end*****************************************/

}
