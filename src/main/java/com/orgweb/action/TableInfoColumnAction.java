package com.orgweb.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.orgweb.entitydto.TableInfoColumn;
import com.orgweb.service.interfaces.IManagerSqlInfoService;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import com.orgweb.utils.Constant;
import com.orgweb.utils.PageList;
/**
 * 基本信息控制层
 * 1 跳转到新增界面 toAddBaseInfo
 * 2 新增 addBaseInfo
 * 3 删除 delBaseInfo
 * 4 跳转到修改界面  toModifyBaseInfo
 * 5 修改  modifyBaseInfo
 * 6 查询  分页查询 findBaseInfo
 * 7 单个信息查询 findSingleBaseInfo
 * 8 查询一个list  findListBaseInfo
 * 公共转换方法
 * 
 * @author qlee
 * @version 1.0.0
 */
@Controller
@RequestMapping("/baseInfo")
public class TableInfoColumnAction extends BaseAction {
	private static final Logger log = Logger.getLogger(TableInfoColumnAction.class);
	@Autowired
	private ITableInfoColumnService tableInfoColumnService;
	@Autowired
	private IManagerSqlInfoService managerSqlInfoService;
	
	//HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
	
	/************************基本方法 start*****************************************/
	/**
	 *  分页查询sql
	 * @param request
	 * @return
	 */
	@RequestMapping("/toFindManagerSqlBaseInfo")
	public String toFindManagerSqlBaseInfo(HttpServletRequest request){
		/*//Map<String,Object> tableinfo=getTableInfo(id);
		Map<String,Object> tableinfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
		//存储表信息
		setAttribute("tableinfo", tableinfo);*/
		System.out.println(getParameter("sqlName"));
		setAttribute("sqlName", getParameter("sqlName"));
		return "jsp/front/baseinfo/findMangerSqlInfo";
	}
	/**
	 * 查询列表，可以直接执行sql，不分页
	 * @param request
	 * @return
	 */
	@RequestMapping("/toFindSqlListInfo")
	public String toFindSqlListInfo(HttpServletRequest request){
		/*//Map<String,Object> tableinfo=getTableInfo(id);
		Map<String,Object> tableinfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
		//存储表信息
		setAttribute("tableinfo", tableinfo);*/
		System.out.println(getParameter("sqlName"));
		System.out.println(getParameter("datasource",""));
		setAttribute("sqlName", getParameter("sqlName"));
		setAttribute("datasource", getParameter("datasource",""));
		return "jsp/front/baseinfo/findSqlListInfo";
	}
	 /**
	  *   跳转到查询界面
	  * @param request
	  * @return
	  */
	 @RequestMapping("/toFindBaseInfo")
	 public String toFindBaseInfo(HttpServletRequest request){
		 //Map<String,Object> tableinfo=getTableInfo(id);
		 Map<String,Object> tableinfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
		 //存储表信息
		 setAttribute("tableinfo", tableinfo);
		 return "jsp/front/baseinfo/findBaseInfo";
	 }
	 
	 /**
	  *  1 跳转到新增界面 toAddBaseInfo
	  * @param request
	  * @return
	  */
	 @RequestMapping("/toAddBaseInfo")
	 public String toAddBaseInfo(HttpServletRequest request){
		 Map<String,Object> tableinfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
		 //存储表信息
		 setAttribute("tableinfo", tableinfo);
		 return "jsp/front/baseinfo/addBaseInfo";
	 }
	 /**
	  *  2 新增 addBaseInfo
	  * @return
	  */
	 @RequestMapping("/addBaseInfo")
	 @ResponseBody
	 public Map<String,Object> addBaseInfo(){
		 Map<String,Object> resultMap=new HashMap<String,Object>();
		 try{
				//需要做更新的业务表信息
				Map<String,Object> tableInfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
				if(tableInfo!=null&& tableInfo.get(Constant.TABLEENAME)!=null){
					String tablename=tableInfo.get(Constant.TABLEENAME).toString();
					String saveInfoStr=getParameter("conditionMap");
					Map<String,Object> saveMap= JSONObject.parseObject(saveInfoStr);
					//转换key为大写
					saveMap=toUpperCaseMap(saveMap);
					List<Map<String,Object>> columnList=getColumn(getParameterInt(Constant.TABLENAMEID));
					//验证数据是否合法
					String errinfo=tableInfoColumnService.checkBaseInfo(saveMap, columnList, tablename, "01");
					if(StringUtils.isNotBlank(errinfo)){
						resultMap.put("errorinfo", errinfo);
						resultMap.put("code", 10003);
						return  resultMap;
					}
					if(saveMap!=null){
						saveMap.put("ID", getMaxID(tablename));
						saveMap.put("delFlag","0");
						//saveMap.put("createTime", new Timestamp(System.currentTimeMillis()));
						saveMap.put("creator", "test");
						//saveMap.put("updateTime", new Timestamp(System.currentTimeMillis()));
						//saveMap.put("updator", "test");
						tableInfoColumnService.addInfoForST(saveMap, tablename);
						resultMap.put("code", 10001);
					}else{
						resultMap.put("code", 10003);
					}
				}else{
					//没有数据，表名不存在
					resultMap.put("code", 10005);
				}
				return resultMap;
			} catch (Exception e) {
				 log.info("保存异常:",e);
				 resultMap.put("code", "10002");
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
		map.put("id", getParameter("key"));
		//map.put("tableid", getParameter("id"));
		try{
			//取出表的信息
			Map<String,Object> tableInfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
			if(tableInfo!=null&& tableInfo.get(Constant.TABLEENAME)!=null){
				String tablename=tableInfo.containsKey("TABLEENAME")?tableInfo.get(Constant.TABLEENAME).toString():null;
				tableInfoColumnService.deleteInfoForST(map, tablename);
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
	 // 4 跳转到修改界面  toModifyBaseInfo
	 @RequestMapping("/toModifyBaseInfo")
	 public String toModifyBaseInfo(){
		 Map<String,Object> tableinfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
		 //存储表信息
		 setAttribute("tableinfo", tableinfo);
		 //存储数据主键id
		 setAttribute("key", getParameter("key"));
		 
		 return "jsp/front/baseinfo/modifyBaseInfo";
	 }
	 // 4 1 跳转到详情界面  toDetaillBaseInfo
	 @RequestMapping("/toDetailBaseInfo")
	 public String toDetailBaseInfo(){
		 Map<String,Object> tableinfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
		 //存储表信息
		 setAttribute("tableinfo", tableinfo);
		 //存储数据主键id
		 setAttribute("key", getParameter("key"));
		 
		 return "jsp/front/baseinfo/detailBaseInfo";
	 }
	 public Map toUpperCaseMap(Map<String,Object> paramMap){
		 Map resultMap=new HashMap();
		 for(String key:paramMap.keySet()){
			 resultMap.put(key.toUpperCase(), paramMap.get(key));
		 }
		 return resultMap;
	 }
	 // 5 修改  modifyBaseInfo
	 @RequestMapping("/modifyBaseInfo")
	 @ResponseBody
	 public  Map<String,Object> modifyBaseInfo(){
		//处理结果值
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try{
			//需要做更新的业务表信息
			Map<String,Object> tableInfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
			List<Map<String,Object>> columnList=getColumn(getParameterInt(Constant.TABLENAMEID));
			if(tableInfo!=null&& tableInfo.get(Constant.TABLEENAME)!=null){
				String tablename=tableInfo.get(Constant.TABLEENAME).toString();
				//更新数据的参数集合
				Map<String,Object> paramMap=new HashMap<String,Object>();
				//设置主键id
				setKeyName(tablename, paramMap);
				
				String modifyCondionStr=getParameter("conditionMap");
				
				Map<String,Object> map= JSONObject.parseObject(modifyCondionStr);
				//将KEY的值转换为大写
				map=toUpperCaseMap(map);
				//验证数据是否合法
				String errinfo=tableInfoColumnService.checkBaseInfo(map, columnList, tablename, "02");
				if(StringUtils.isNotBlank(errinfo)){
					resultMap.put("errorinfo", errinfo);
					resultMap.put("code", 10003);
					return resultMap;
				}
				if(map!=null){
					//BaseUser user = WebHelper.getLoginUser(getRequest());
					map.remove("CREATETIME");
					map.remove("CREATOR");
					map.remove("UPDATETIME");
					map.remove("UPDATOR");
					/*map.put("updateTime", new Timestamp(System.currentTimeMillis()));
					map.put("updator", "lee");*/
					tableInfoColumnService.modifyInfoForST(map, paramMap, tablename);
					resultMap.put("code", 10001);
				}else{
					
					resultMap.put("errorinfo", "参数有问题，请检查！");
					resultMap.put("code", 10003);
				}
			}else{
				//没有数据，表名不存在
				resultMap.put("code", 10005);
			}
			return resultMap;
		} catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
	 }
	 // 6 查询  分页查询 findBaseInfo
	 @RequestMapping("/findBaseInfo")
	 @ResponseBody
	 public Map<String,Object> findBaseInfo(){
		//处理结果值
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try{
			//取出表的信息
			Map<String,Object> tableInfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
			List<Map<String,Object>> columnList=getColumn(getParameterInt(Constant.TABLENAMEID));
			if(tableInfo!=null&&columnList!=null&& tableInfo.get(Constant.TABLEENAME)!=null&&columnList.size()>0){
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
				/*if(!"s_administrative_area".equals(tableInfo.get(Constant.TABLEENAME).toString())){
					map.put("delFlagNoEqual", 1);
				}*/
				page=tableInfoColumnService.findInfoForSTByPage(map, page, tableInfo.get(Constant.TABLEENAME).toString());
				page.setUrl("/baseInfo/findBaseInfo.do");
				page.setParams("");
				resultMap.put("columnList",columnList);
				if(page.getList()!=null&&page.getList().size()>0){
					resultMap.put("result", JSON.toJSONString(page));
					//正常查询，查询成功
					resultMap.put("code", 10001);
				}else{
					resultMap.put("result", JSON.toJSONString(page));
					//没有数据
					resultMap.put("code", 10004);
				}
			}else{
				//没有数据，表名不存在
				resultMap.put("code", 10005);
			}
			return resultMap;
		} catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
	 }
	 // 7 单个信息查询 findSingleBaseInfo
	 @RequestMapping("/findSingleBaseInfo")
	 @ResponseBody
	 public Map<String,Object> findSingleBaseInfo(){
		//处理结果值
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try{
			//取出表的信息
			Map<String,Object> tableInfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
			List<Map<String,Object>> columnList=getColumn(getParameterInt(Constant.TABLENAMEID));
			if(tableInfo!=null&&columnList!=null&& tableInfo.get(Constant.TABLEENAME)!=null&&columnList.size()>0){
				//获取条件
				String searchInfo=getParameter("searchInfo");
				Map<String,Object> map= JSONObject.parseObject(searchInfo);
				if(map==null){
					map=new HashMap<String, Object>();
				}
				
				//主键设置
				map.put(getKeyEname(columnList), getParameter("key"));
				resultMap.put("columnList",columnList);
				Map<String,Object> resultMapInfo =tableInfoColumnService.findInfoForSTGetSingleData(map, tableInfo.get(Constant.TABLEENAME).toString());
				if(resultMapInfo!=null){
					resultMap.put("result",resultMapInfo);
					//正常查询，查询成功
					resultMap.put("code", 10001);
				}else{
					resultMap.put("result", resultMapInfo);
					//没有数据
					resultMap.put("code", 10004);
				}
			}else{
				//没有数据，表名不存在
				resultMap.put("code", 10005);
			}
			return resultMap;
		} catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
	 }
	 /**
	  * 从列中查询到主键英文名称
	  * @param columnList
	  * @return
	  */
	 public String getKeyEname(List<Map<String,Object>> columnList){
		 //默认为id
		 String keyName="id";
		 for(Map<String,Object> map:columnList){
			 if(Integer.parseInt(map.get("ISKEY").toString())==1){
				 keyName=map.get("COLUMNENAME").toString();
			 }
		 }
		 return keyName;
	 }
	 // 8 查询一个list  findListBaseInfo
	 @RequestMapping("/findListBaseInfo")
	 @ResponseBody
	 public Map<String,Object> findListBaseInfo(){
		//处理结果值
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try{
			//取出表的信息
			Map<String,Object> tableInfo=getTableInfo(getParameterInt(Constant.TABLENAMEID));
			List<Map<String,Object>> columnList=getColumn(getParameterInt(Constant.TABLENAMEID));
			if(tableInfo!=null&&columnList!=null&& tableInfo.get(Constant.TABLEENAME)!=null&&columnList.size()>0){
				//获取条件
				String searchInfo=getParameter("searchInfo");
				Map<String,Object> map= JSONObject.parseObject(searchInfo);
				if(map==null){
					map=new HashMap<String, Object>();
				}
				resultMap.put("columnList",columnList);
				List<Map<String,Object>> resultList =tableInfoColumnService.findInfoForSTGetList(map, tableInfo.get(Constant.TABLEENAME).toString());
				if(resultList!=null&&resultList.size()>0){
					resultMap.put("result",resultList);
					//正常查询，查询成功
					resultMap.put("code", 10001);
				}else{
					resultMap.put("result", resultList);
					//没有数据
					resultMap.put("code", 10004);
				}
			}else{
				//没有数据，表名不存在
				resultMap.put("code", 10005);
			}
			return resultMap;
		} catch (Exception e) {
			 log.info("查询异常:",e);
			 resultMap.put("code", "10002");
			 return resultMap;
		}
	 }
	 /************************基本方法 end*****************************************/
	 
	 
	 /************************配置方法 start*****************************************/
	 /**
	  * 跳转到查询界面
	  */
	 @RequestMapping("/toBaseTableConfig")
	 public String toBaseTableConfig(){
		return "jsp/front/baseconfig/baseTableConfig";
	 }
	 /**
	  * 跳转到查询界面
	  */
	 @RequestMapping("/toBaseColumnConfig")
	 public String toBaseColumnConfig(){
		setAttribute("tableid", getParameter("tableid"));
		return "jsp/front/baseconfig/baseColumnConfig";
	 }
	 /**
	  * 跳转到修改属性界面(基本配置属性表)
	  */
	 @RequestMapping("/toModifyBaseColumn")
	 public String toModifyBaseColumn(){
		 Map<String,Object> tableinfo=getTableInfo(52);
		 //存储表信息
		 setAttribute("tableinfo", tableinfo);
		 
		setAttribute("tableid", getParameterInt(Constant.TABLENAMEID));
		return "jsp/front/baseconfig/modifyBaseColumn";
	 }
	 
	 /**
		 * 查询列表信息
		 * @throws IOException 
		 */
		 @RequestMapping("/findBaseColumnConfig")
		 @ResponseBody
		public Map<String,Object> findBaseColumnConfig() throws IOException{
			Map<String,Object> resultMap=new HashMap<String,Object>();
			//先获取sql信息
			Map<String,Object> sqlInfo=getSQLInfo(getParameter("sqlname"));
			String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
			//前台传来的查询参数
			Map<String,Object> map= new HashMap<>();
			Map<String,Object>  tableinfo=getTableInfo(getParameterInt("tableid"));
			map.put("tablename", tableinfo.get(Constant.TABLEENAME));
			Map<String,Object> mapCondition= new HashMap<>();
			List<Map<String, Object>> listMap=managerSqlInfoService.findInfoForUDGetList(mapCondition, sql,map);
			//处理结果值
			JSONObject json = new JSONObject();
			try{
				resultMap.put("result",listMap);
				resultMap.put("code", 10001);
			} catch (Exception e) {
				 log.info("查询异常:",e);
				 resultMap.put("code", "10002");
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
				String templetstr=getParameter("templet");
				List<TableInfoColumn> jsonList=JSONObject.parseArray(templetstr, TableInfoColumn.class);
				//获取最大的id+1
				Map<String,Object> sqlInfo=getSQLInfo("findMaxID");
				String sql=sqlInfo.get(Constant.SQLCONTENT).toString();
				int indexID=getMaxID("S_BASECOLUMN_CONFIG");
				for(TableInfoColumn dto :jsonList){
					dto.setCreateTime(null);
					dto.setUpdateTime(null);
					dto.setDelFlag(0);
					dto.setId(indexID);
					indexID++;
					/*if (user != null) {
						dto.setCreator(user.getUserId().toString());
						dto.setUpdator(user.getUserId().toString());
					}*/
				}
				
				tableInfoColumnService.batchAddTableInfoColumn(jsonList);
				//正常
				resultMap.put("code", "10001");
			} catch (Exception e) {
				log.info("查询失败：",e);
				resultMap.put("code", "10002");
				return resultMap;
			}
			return resultMap;
		}
	 
	 
	 
	 /************************配置方法 end*****************************************/
	 
	 
	 /************************公共的方法 start*****************************************/
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
		 * @param sqlname
		 * @return
		 */
		public Map<String,Object> getSQLInfo(String sqlname){
			//定义一个查询参数
			Map<String,Object> paramMap= new HashMap<String,Object>();
			//从前台传来sql，相当于一条信息的ID 唯一标识
			paramMap.put(Constant.SQLNAMEINFO, sqlname);
			return tableInfoColumnService.findInfoForSTGetSingleData(paramMap, Constant.TABLENAMEMANAGERSQLINFO);
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
			String orderby=sqlInfo.get("orderby")!=null?sqlInfo.get("orderby").toString():null;
			
			//加上一个关键的字段 排除被删除的数据
			//map.put("delFlag", 0);
			
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
	 /************************公共方法 end*****************************************/
		 
		 /**
		  *  2 新增 addBaseInfo
		  * @return
		  */
		 @RequestMapping("/findTest")
		 @ResponseBody
		 public Map<String,Object> findTest(){
			 Map<String,Object> resultMap=new HashMap<String,Object>();
			 try{
				 getParameter("bldy");
				 List<Map<String,Object>> columnList=this.tableInfoColumnService.findBaseInfoTest();
				 resultMap.put("result", columnList);
				 resultMap.put("code", "10001");
				  return resultMap;
				} catch (Exception e) {
					 log.info("保存异常:",e);
					 resultMap.put("code", "10002");
					 return resultMap;
				}
		 }
	
}
