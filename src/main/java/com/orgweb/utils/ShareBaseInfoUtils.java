package com.orgweb.utils;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.orgweb.service.impl.TableInfoColumnServiceImpl;
import com.orgweb.service.interfaces.ITableInfoColumnService;


public class ShareBaseInfoUtils {
	
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
	public static String checkBaseInfo(Map<String,Object> recordMap,List<Map<String,Object>> columnList,String tablename,String checkFlag) throws IntrospectionException{
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
			String columnename=columnMap.get("columnename")==null?null:columnMap.get("columnename").toString();
			//预留一个关键字为不是数据库字段的内容，这时候无需校验
			if("nodatacolumn".equals(columnename)){
				continue;
			}
			//属性字段名
			String columnname=columnMap.get("columnname")==null?null:columnMap.get("columnname").toString();
			//是否为系统字段
			int isSystem=columnMap.get("isSystem")==null?null:Integer.parseInt(columnMap.get("isSystem").toString());
			//是否为空
			int isNull=columnMap.get("isNull")==null?null:Integer.parseInt(columnMap.get("isNull").toString());
			//是否重复
			Integer isEqual=columnMap.get("isEqual")==null?null:Integer.valueOf(columnMap.get("isEqual").toString());
			
			//自定义匹配内容 正则表达式
			String matchInfo=columnMap.get("matchInfo")==null?null:columnMap.get("matchInfo").toString();
			//自定义匹配内容 正则表达式-提示信息
			String alertInfo=columnMap.get("alertInfo")==null?null:columnMap.get("alertInfo").toString();
			//数据类型
			String dataType=columnMap.get("dataType")==null?null:columnMap.get("dataType").toString();
			//枚举内容menuType
			String menuType=columnMap.get("menuType")==null?null:columnMap.get("menuType").toString();
			
			//首先判断map中是否含有该字段 如果没有该字段，并且该字段不是系统字段，则给出错误提示
			if(!recordMap.containsKey(columnename)&&1!=isSystem){
				if(columnename.equals("id")&&checkFlag.equals("01")){
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
			if(recordMap.containsKey(columnename)&&isEqual!=null&&isEqual==1&&checkFlag=="01"){
				ITableInfoColumnService tableInfoColumnService = (ITableInfoColumnService) Introspector.getBeanInfo(TableInfoColumnServiceImpl.class);
				//查看在数据库中是否存在,repeatMap.get("onlyOneKey") 这里是保证唯一性键值 用period+platformId+tableid 
				Map<String,Object> map=new HashMap<>();
	   	    	map.put(columnename, columnValue);
	   	    	Integer count=tableInfoColumnService.findInfoForSTByPageCount(map, tablename);
	   	    	if(count!=null&&count>1){
	   	    		errInfo.append("字段【"+columnname+"】在已经上报，不允许重复上报!<br/>");
	   	    	}
				
			}
			
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
