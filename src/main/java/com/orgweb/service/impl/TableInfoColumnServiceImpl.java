package com.orgweb.service.impl;

import java.beans.IntrospectionException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.alibaba.fastjson.JSONObject;
import com.orgweb.dao.TableInfoColumnDao;
import com.orgweb.entitydto.TableInfoColumn;
import com.orgweb.exception.LogicException;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import com.orgweb.utils.Constant;
import com.orgweb.utils.DateUtils;
import com.orgweb.utils.IDCardValidate;
import com.orgweb.utils.PageList;
@Service("tableInfoColumnService")
public class TableInfoColumnServiceImpl implements ITableInfoColumnService {
	@Autowired
	public TableInfoColumnDao tableInfoColumnDao;
	
	@Override
	public void addInfoForST(Map<String, Object> addMapInfo, String tablename) throws LogicException{
		// TODO Auto-generated method stub
		tableInfoColumnDao.addInfoForST(addMapInfo, tablename);
	}

	@Override
	public void deleteInfoForST(Map<String, Object> delCondition,
			String tablename)throws LogicException {
		// TODO Auto-generated method stub
		tableInfoColumnDao.deleteInfoForST(delCondition, tablename);
	}

	@Override
	public List<Map<String, Object>> findBaseInfoTest () throws LogicException{
		// TODO Auto-generated method stub
		return tableInfoColumnDao.findBaseInfoTest();
	}
	@Override
	public List<Map<String, Object>> findInfoForSTGetList (
			Map<String, Object> findCondition, String tablename) throws LogicException{
		// TODO Auto-generated method stub
		return tableInfoColumnDao.findInfoForSTGetList(findCondition, tablename);
	}
	
	@Override
	public Map<String, Object> findInfoForSTGetSingleData(
			Map<String, Object> findCondition, String tablename) throws LogicException{
		// TODO Auto-generated method stub
		return tableInfoColumnDao.findInfoForSTGetSingleData(findCondition, tablename);
	}
	/**
	 * 如果是查询sql信息的则保存到缓存，按照查询的
	 */
	@Override
	@Cacheable(value="myCache",key="#findCondition.get(\"SQLNAME\")" ,unless="#findCondition.get(\"SQLNAME\")==null || #result==null")
	public Map<String, Object> findSqlInfo(
			Map<String, Object> findCondition, String tablename) throws LogicException{
		// TODO Auto-generated method stub
		return tableInfoColumnDao.findInfoForSTGetSingleData(findCondition, tablename);
	}
	//获取属性名
	@Override
	@Cacheable(value="myCache",key="#tablename" ,unless="#tablename==null || #result==null")
	public List<Map<String, Object>> getColumn(String tablename) throws LogicException{
		 Map<String,Object> map=new HashMap<String,Object>();
		 map.put("TABLEENAME", tablename);
		 Map resultMap=findInfoForSTGetSingleData(map, Constant.TABLENAME_BASETABLE_CONFIG);
		 if(resultMap==null){
			 resultMap =new HashMap<String,Object>();
		 }
		 //定义一个容器，存储参数
		 map=new HashMap<String,Object>();
		 map.put("tableid", resultMap.get("ID"));
		 map.put("orderby", "orderNum");
		 //获取表名
		 List<Map<String,Object>> resultList= findInfoForSTGetList(map,Constant.TABLENAME_BASECOLUMN_CONFIG);
		 return resultList;
	}

	@Override
	public PageList<Map<String,Object>> findInfoForSTByPage(Map<String, Object> map,
			PageList<Map<String,Object>> page,String tablename)throws LogicException {
		int pageSize=page.getPageSize();
		int pageNum=(page.getCurPage()-1)*pageSize;
		//pageSize=pageNum+pageSize; oracle 的pagesize
		page.setList(tableInfoColumnDao.findInfoForSTByPage(map, pageNum, pageSize, tablename));
		page.setTotalCount(tableInfoColumnDao.findInfoForSTByPageCount(map,tablename));
		return page;
	}

	@Override
	public void modifyInfoForST(Map<String, Object> modfiyInfo,
			Map<String, Object> modifyCondition, String tablename) throws LogicException{
		tableInfoColumnDao.modifyInfoForST(modfiyInfo, modifyCondition, tablename);
		
	}

	@Override
	public void batchAddTableInfoColumn(List<TableInfoColumn> jsonList)throws LogicException {
		// TODO Auto-generated method stub
		tableInfoColumnDao.batchAddTableInfoColumn(jsonList);
	}

	@Override
	public int findInfoForSTByPageCount(Map<String, Object> findCondition,
			String tablename) throws LogicException{
		// TODO Auto-generated method stub
		return tableInfoColumnDao.findInfoForSTByPageCount(findCondition, tablename);
	}
	
	public void processCondition(){
		
	}

	/**
	 * 根据属性表中的校验项进行校验
	 * a：校验是否为空    是否为空 1-是；0-否；字段名为 isNull
	 * b：校验是否为系统属性，如果是系统属性则需要通过user获取赋值 ；isSystem
	 * c： 字段类型 S-字符串；L-长整型；I-整形；D-浮点类型；T-时间；TD-日期;M-枚举 ；
	 * 		除枚举值外都需要进行对应校验，如果是枚举值则需要对 【m】信息处理
	 * d:正则表达式 枚举之外的校验，根据c进行d的校验，可以写也可以不写
	 * e：提示信息： alertInfo；这是对d的判断，如果有则进行提示，如果没有则按照ab进行提示
	 * f：枚举类型设置内容；枚举内容menuType 设置格式为 【code1:中文显示1,code1:中文显示1】,进行判断code是否对应
	 * @param checkFlag : 01-代表新增的时候的校验；02-代表修改的时候的校验
	 * @return
	 * @throws IntrospectionException 
	 */
	@Override
	public  String checkBaseInfo(Map<String,Object> recordMap,List<Map<String,Object>> columnList,String tablename,String checkFlag) {
		/*//excel中的每行的记录
		Map<String,Object> recordMap=checkParameter.getRecordMap();
		//excel要导入数据的字集合，这里面有校验项
		List<ExcelColumn> columnList=checkParameter.getColumnList();*/
		//重复的数据集合，当字段被设置为不可重复时，这里面会存该字段对应的内容，以便检查是否重复
		//Map<String,String> repeatMap=checkParameter.getRepeatMap();
		//存储历史记录的集合，当改字段不重复时，则保存到历史记录库中，以便将来进行重复性上报的校验
		//List<HistoryRecord> historyRecordList=checkParameter.getHistoryRecordList();
		//excel记录的行数
		//Integer recordRowNum=checkParameter.getRecordRowNum();
		//BaseUser user = WebHelper.getLoginUser(getRequest());
		
		//当前登录的用户ID
		//String userid=user.getUserId();
		//定义装载错误信息的对象
		StringBuffer errInfo=new StringBuffer();
		for(Map<String,Object> columnMap :columnList){
			
			//属性字段名
			String columnename=columnMap.get("COLUMNENAME")==null?null:columnMap.get("COLUMNENAME").toString().toUpperCase();
			//预留一个关键字为不是数据库字段的内容，这时候无需校验
			if("nodatacolumn".equals(columnename)){
				continue;
			}
			//属性字段名
			String columnname=columnMap.get("COLUMNNAME")==null?null:columnMap.get("COLUMNNAME").toString();
			//是否为系统字段
			int isSystem=columnMap.get("ISSYSTEM")==null?null:Integer.parseInt(columnMap.get("ISSYSTEM").toString());
			//是否为空
			int isNull=columnMap.get("ISNULL")==null?null:Integer.parseInt(columnMap.get("ISNULL").toString());
			//是否重复
			Integer isEqual=columnMap.get("ISEQUAL")==null?null:Integer.valueOf(columnMap.get("ISEQUAL").toString());
			
			//自定义匹配内容 正则表达式
			String matchInfo=columnMap.get("MATCHINFO")==null?null:columnMap.get("MATCHINFO").toString();
			//自定义匹配内容 正则表达式-提示信息
			String alertInfo=columnMap.get("ALERTINFO")==null?null:columnMap.get("ALERTINFO").toString();
			//数据类型
			String dataType=columnMap.get("DATATYPE")==null?null:columnMap.get("DATATYPE").toString();
			//枚举内容menuType
			String menuType=columnMap.get("MENUTYPE")==null?null:columnMap.get("MENUTYPE").toString();
			
			//首先判断map中是否含有该字段 如果没有该字段，并且该字段不是系统字段，则给出错误提示
			if(!recordMap.containsKey(columnename)&&1!=isSystem){
				if(columnename.equals("ID")&&checkFlag.equals("01")){
					//
				}else{
					errInfo.append("缺少字段【"+columnname+"】!<br/>");
				}
				
				break;
				
			}
			//字段值
			Object columnValue=recordMap.get(columnename);
			// * a：校验是否为空    是否为空 1-是；0-否；字段名为 isNull
			if(isNull==0&&(columnValue==null||StringUtils.isEmpty(columnValue.toString()))){
				errInfo.append("字段【"+columnname+"】为空!<br/>");
				continue;
			}else if(isSystem!=1&&(columnValue==null||StringUtils.isNotBlank(columnValue.toString()))){
				continue;
			}
			// * b：校验是否为系统属性，如果是系统属性则需要通过user获取赋值 ；isSystem
			//只有新增数据的时候才校验是否为系统字段
			/**if(isSystem==1&&checkFlag=="01"){
		   	 	//目前只处理平台ID和期次
		   	    if(columnename.toLowerCase().equals("platformid")){
		   	    	//平台Id
					Integer platformid=Integer.parseInt(user.getOrganization().getPlatformId().toString());
		   	    	recordMap.put(columnename, platformid);
		   	    } else if(columnename.toLowerCase().equals("period")){
		   	    	//期次
					String period=getParameter("period","");
		   	    	recordMap.put(columnename, period);
		   	    }
		   	    
		   	    //校验是否重复
		   	    if(isEqual!=null&&isEqual==1){
		   	    	Map<String,Object> map=new HashMap<>();
		   	    	map.put(columnename, columnValue);
		   	    	Integer count=baseInfoService.findBaseInfoCount(tablename,map);
		   	    	if(count!=null&&count>1){
		   	    		errInfo.append("字段【"+columnname+"】在已经上报，不允许重复上报!<br/>");
		   	    	}
		   	    }
		   	    continue;
			}*/
			
			//校验字段是否为重复字段，只有新增的时候才校验是否重复
			/*if(recordMap.containsKey(columnename)&&isEqual!=null&&isEqual==1&&checkFlag=="01"){
				//查看在数据库中是否存在,repeatMap.get("onlyOneKey") 这里是保证唯一性键值 用period+platformId+tableid 
				Map<String,Object> map=new HashMap<>();
	   	    	map.put(columnename, columnValue);
	   	    	Integer count=findInfoForSTByPageCount(map, tablename);
	   	    	if(count!=null&&count>1){
	   	    		errInfo.append("字段【"+columnname+"】在已经上报，不允许重复上报!<br/>");
	   	    	}
				
			}*/
			
			// * c： 字段类型 S-字符串；L-长整型；I-整形；D-浮点类型；T-时间；TD-日期;M-枚举 ；
			// * 除枚举值外都需要进行对应校验，如果是枚举值则需要对 【m】信息处理
			// * d:正则表达式 枚举之外的校验，根据c进行d的校验，可以写也可以不写
			// * e：提示信息： alertInfo；这是对d的判断，如果有则进行提示，如果没有则按照ab进行提示
			if(StringUtils.isNotBlank(matchInfo)&&StringUtils.isNotBlank(columnValue.toString())){
				Pattern p = Pattern.compile(matchInfo);
			    Matcher m = p.matcher(columnValue.toString());
			    if(!m.matches()){
			    	if(StringUtils.isNotBlank(matchInfo)&&StringUtils.isNotBlank(alertInfo)){
						errInfo.append(alertInfo+"<br/>");
					}else{
						errInfo.append(" 字段【"+columnname+"】不符合规则，请检查!<br/>");
						continue;
					}
			    }
			}else if(StringUtils.isNotBlank(dataType)&&StringUtils.isNotBlank(columnValue.toString())){
				//增加对身份证的验证 
				if(dataType.equals("SF")&&!new IDCardValidate(columnValue.toString()).validate()){
					errInfo.append(" 身份证号【"+columnname+"】不符合规则，请检查!<br/>");
				}
				else if((dataType.equals("L")||columnValue.toString().equals("I"))&&!columnValue.toString().matches("[0-9]*")){
					errInfo.append("字段【"+columnname+"】必须为数字，请检查!<br/>");
					continue;
				}else if(dataType.equals("D")&&!columnValue.toString().matches("[\\d]+\\.[\\d]+")){
					errInfo.append("字段【"+columnname+"】必须为小数，请检查!<br/>");
					continue;
				}else if(dataType.equals("C")&&!(columnValue.toString().matches("[\\d]+\\.[\\d]+")||columnValue.toString().matches("[0-9]*"))){
					errInfo.append("字段【"+columnname+"】为金额类型，填写有误，请检查!<br/>");
					continue;
				}else if(dataType.equals("TD")&&!DateUtils.isDate(columnValue.toString(), "yyyy-MM-dd",true)){
					errInfo.append("字段【"+columnname+"】是日期格式，请输入【yyyy-MM-dd】格式的内容!<br/>");
					continue;
				}else if(dataType.equals("T")){
					String regex="^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\\d):[0-5]?\\d:[0-5]?\\d$";
					if(!columnValue.toString().matches(regex)){
						errInfo.append("字段【"+columnname+"】是日期格式，请输入【yyyy-MM-dd hh:mm:ss】格式的内容!<br/>例如：【2016-01-12 09:36:47】<br/>");
						continue;
					}
				} else if(dataType.equals("M")){
					// * f：枚举类型设置内容；枚举内容menuType 设置格式为 【{code1:中文显示1,code1:中文显示1}】,进行判断code是否对应
					Map<String, Object> mapjson=JSONObject.parseObject(menuType);
					if(!mapjson.containsKey(columnValue.toString())){
						errInfo.append("字段【"+columnname+"】是枚举类型，枚举内容【"+columnValue.toString()+"】填写有误,<br/>请填写"+JSONObject.toJSONString(mapjson.keySet())+"中的一个!<br/>");
						continue;
					}
				}
				
			}
			
		}
		return errInfo.toString();
	}

	
}
