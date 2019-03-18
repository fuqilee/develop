package com.orgweb.service.impl;

import java.beans.IntrospectionException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.orgweb.service.interfaces.IZbjcService;
import com.orgweb.utils.DateUtils;
import com.orgweb.utils.IDCardValidate;
import com.orgweb.utils.ValidatorUtils;
@Service("zbjcServiceImpl")
public class ZbjcServiceImpl implements IZbjcService {
	/**
	 * 根据属性表中的校验项进行校验
	 * a：校验是否为空    是否为空 1-是；0-否；字段名为 isNull
	 * b：校验是否为系统属性，如果是系统属性则需要通过user获取赋值 ；isSystem
	 * c： 字段类型 S-字符串；L-长整型；I-整形；D-浮点类型；T-时间；TD-日期;M-枚举 ；
	 * 		除枚举值外都需要进行对应校验，如果是枚举值则需要对 【m】信息处理
	 * d:正则表达式 枚举之外的校验，根据c进行d的校验，可以写也可以不写
	 * e：提示信息： alertInfo；这是对d的判断，如果有则进行提示，如果没有则按照ab进行提示
	 * f：枚举类型设置内容；枚举内容menuType 设置格式为 【code1:中文显示1,code1:中文显示1】,进行判断code是否对应
	 * @param checkFlag : 01-代表新增的时候的校验；02-代表修改的时候的校验;
	 * @param isValideExistsCol : 01-如果自动没有在数据可以不校验；02-或者其他都进行不存在的提示;
	 * @return
	 * @throws IntrospectionException 
	 */
	@Override
	public Map validateData(Map<String,Object> recordMap,List<Map<String,Object>> columnList,String tablename,String checkFlag,String isValideExistsCol) {
		//定义装载错误信息的对象
				Map<String,String> resultMap=new HashMap<String, String>();
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
					int isSystem=columnMap.get("ISSYSTEM")==null?0:Integer.parseInt(columnMap.get("ISSYSTEM").toString());
					//是否为空
					int isNull=columnMap.get("ISNULL")==null?1:Integer.parseInt(columnMap.get("ISNULL").toString());
					//是否重复
				//	Integer isEqual=columnMap.get("ISEQUAL")==null?null:Integer.valueOf(columnMap.get("ISEQUAL").toString());
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
						}else if(StringUtils.isBlank(isValideExistsCol)||!"01".equals(isValideExistsCol)){
							errInfo.append("缺少字段【"+columnname+"】!<br/>");
							resultMap.put(columnename, "缺少字段【"+columnname+"】!");
						}
						continue;
						
					}
					//字段值
					Object columnValue=recordMap.get(columnename);
					// * a：校验是否为空    是否为空 1-是；0-否；字段名为 isNull
					if(isNull==0&&(columnValue==null||StringUtils.isEmpty(columnValue.toString()))){
						errInfo.append("字段【"+columnname+"】为空!<br/>");
						resultMap.put(columnename, "字段【"+columnname+"】为空!");
						continue;
						//可以为空，不是系统字段，并且值为空或者
					}else if(isNull==1&&isSystem!=1&&(columnValue==null||StringUtils.isEmpty(columnValue.toString()))){
						continue;
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
								resultMap.put(columnename," 【"+columnname+"】"+alertInfo);
							}else{
								resultMap.put(columnename," 字段【"+columnname+"】不符合规则!");
								errInfo.append(" 【"+columnname+"】不符合规则，请检查!<br/>");
								continue;
							}
					    }
					}else if(StringUtils.isNotBlank(dataType)&&StringUtils.isNotBlank(columnValue.toString())){
						//增加对身份证的验证 
						if(dataType.equals("SF")&&!new IDCardValidate(columnValue.toString()).validate()){
							errInfo.append(" 身份证号【"+columnname+"】不符合规则，请检查!<br/>");
							resultMap.put(columnename," 身份证号【"+columnname+"】不符合规则，请检查!");
						}
						else if((dataType.equals("L")||dataType.toString().equals("I"))&&!columnValue.toString().matches("[0-9]*")){
							errInfo.append("字段【"+columnname+"】必须为数字，请检查!<br/>");
							resultMap.put(columnename,"【"+columnname+"】必须为数字，请检查!");
							continue;
						}else if(dataType.equals("D")&&!columnValue.toString().matches("[\\d]+\\.[\\d]+")){
							errInfo.append("字段【"+columnname+"】必须为小数，请检查!<br/>");
							resultMap.put(columnename,"【"+columnname+"】必须为小数，请检查!");
							continue;
						}else if(dataType.equals("C")&&!(columnValue.toString().matches("[\\d]+\\.[\\d]+")||columnValue.toString().matches("[0-9]*"))){
							errInfo.append("字段【"+columnname+"】为金额类型，填写有误，请检查!<br/>");
							resultMap.put(columnename,"【"+columnname+"】为金额类型，填写有误，请检查!");
							continue;
						}else if(dataType.equals("TD")&&!DateUtils.isDate(columnValue.toString(), "yyyy-MM-dd",true)){
							errInfo.append("字段【"+columnname+"】是日期格式，请输入【yyyy-MM-dd】格式的内容!<br/>");
							resultMap.put(columnename,"【"+columnname+"】是日期格式，请输入【yyyy-MM-dd】格式的内容!");
							continue;
						}else if(dataType.equals("T")){
							String regex="^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\\d):[0-5]?\\d:[0-5]?\\d$";
							if(!columnValue.toString().matches(regex)){
								errInfo.append("字段【"+columnname+"】是日期格式，请输入【yyyy-MM-dd hh:mm:ss】格式的内容!<br/>例如：【2016-01-12 09:36:47】<br/>");
								resultMap.put(columnename,"【"+columnname+"】是日期格式，请输入【yyyy-MM-dd hh:mm:ss】格式的内容!<br/>例如：【2016-01-12 09:36:47】");
								continue;
							}
						} else if(dataType.equals("M")){
							// * f：枚举类型设置内容；枚举内容menuType 设置格式为 【{code1:中文显示1,code1:中文显示1}】,进行判断code是否对应
							Map<String, Object> mapjson=JSONObject.parseObject(menuType);
							if(!mapjson.containsKey(columnValue.toString())){
								errInfo.append("字段【"+columnname+"】是枚举类型，枚举内容【"+columnValue.toString()+"】填写有误,<br/>请填写"+JSONObject.toJSONString(mapjson.keySet())+"中的一个!<br/>");
								resultMap.put(columnename,"【"+columnname+"】是枚举类型，枚举内容【"+columnValue.toString()+"】不存在!");
								continue;
							}
						}else if(dataType.equals("CT")){
							if(!ValidatorUtils.isValidateDate(columnValue.toString())){
								resultMap.put("rwsj", "【"+columnname+"】的时间格式为【xxxx年xx月xx日xx时xx分 】，举例：1992年02月12日5时31分！");
							}
						}
					}
					//多增加一个逻辑对日期的时间进行一个转换
					try {
						if(StringUtils.isNotBlank(dataType)&&StringUtils.isNotBlank(columnValue.toString())){
							if(dataType.equals("T")&&columnValue!=null){
								SimpleDateFormat sdfT=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								recordMap.put(columnename, sdfT.parse(columnValue.toString()));
							}else if(dataType.equals("TD")){
								SimpleDateFormat sdfD=new SimpleDateFormat("yyyy-MM-dd"); 
								recordMap.put(columnename, sdfD.parse(columnValue.toString()));
							}
						}
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				return resultMap;
	}
	/**
	 * 组装js的验证信息
	 * @param columnList
	 * @return
	 */
	public Map getValidateData(List<Map<String,Object>> columnList) {
		//定义装载错误信息的对象
		Map<String,String> resultMap=new HashMap<String, String>();
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
			int isSystem=columnMap.get("ISSYSTEM")==null?0:Integer.parseInt(columnMap.get("ISSYSTEM").toString());
			//是否为空
			int isNull=columnMap.get("ISNULL")==null?1:Integer.parseInt(columnMap.get("ISNULL").toString());
			//是否重复
			//	Integer isEqual=columnMap.get("ISEQUAL")==null?null:Integer.valueOf(columnMap.get("ISEQUAL").toString());
			//自定义匹配内容 正则表达式
			String matchInfo=columnMap.get("MATCHINFO")==null?null:columnMap.get("MATCHINFO").toString();
			//自定义匹配内容 正则表达式-提示信息
			String alertInfo=columnMap.get("ALERTINFO")==null?null:columnMap.get("ALERTINFO").toString();
			//数据类型
			String dataType=columnMap.get("DATATYPE")==null?null:columnMap.get("DATATYPE").toString();
			//枚举内容menuType
			String menuType=columnMap.get("MENUTYPE")==null?null:columnMap.get("MENUTYPE").toString();
			//控制长度 n,m
			String stringLength=columnMap.get("STRINGLENGTH")==null?null:columnMap.get("STRINGLENGTH").toString();
			StringBuffer validateStr=new StringBuffer();
			validateStr.append("  			 "+columnename+":{ \n");
			validateStr.append("  			   validators:{  \n");
			//校验项拼装
			StringBuffer vals=new StringBuffer();
			
			//中间加上内容
		/*	validateStr.append("}");
			validateStr.append("}");*/
			
			if(isNull==0){
				if(StringUtils.isNotBlank(vals.toString())){
					vals.append(", \n");
				}
				vals.append("  			      notEmpty:{  \n");
				vals.append("  			          message:'【"+columnname+"】不能为空！' \n");
				vals.append("  			      }");
				
			}
			//最小和最大
			if(StringUtils.isNotBlank(stringLength)){
				String[] ss=stringLength.split(",");
				if(ss.length==2){
					if(StringUtils.isNotBlank(vals.toString())){
						vals.append(", \n");
					}
					vals.append("  			      stringLength:{  \n");
					vals.append("  			          min: "+ss[0]+",  \n");
					vals.append("  			          max: "+ss[1]+",  \n");
					vals.append("  			          message:'【"+columnname+"】长度在"+ss[0]+"到"+ss[1]+"位之间！' \n");
					vals.append("  			      }");
				}
			}
				    
			// * c： 字段类型 S-字符串；L-长整型；I-整形；D-浮点类型；T-时间；TD-日期;M-枚举 ；
			// * 除枚举值外都需要进行对应校验，如果是枚举值则需要对 【m】信息处理
			// * d:正则表达式 枚举之外的校验，根据c进行d的校验，可以写也可以不写
			// * e：提示信息： alertInfo；这是对d的判断，如果有则进行提示，如果没有则按照ab进行提示
			if(StringUtils.isNotBlank(matchInfo)&&StringUtils.isNotBlank(alertInfo)){
				if(StringUtils.isNotBlank(vals.toString())){
					vals.append(", \n");
				}
				vals.append("  			      regexp:{ \n");
				vals.append("  			         regexp:"+matchInfo+", \n");
				vals.append("   			        message:'【"+columnname+"】"+alertInfo+"' \n");
				vals.append("   			     }");
			}else if(StringUtils.isNotBlank(dataType)){
				//增加对身份证的验证 
				if(dataType.equals("SF")){
					if(StringUtils.isNotBlank(vals.toString())){
						vals.append(",\n");
					}
					vals.append("  			      creditCard:{\n");
					vals.append("   			        message:'【"+columnname+"】身份证格式不正确！'\n");
					vals.append("   			     }");
				}
				else if((dataType.equals("L")||dataType.toString().equals("I"))){
					if(StringUtils.isNotBlank(vals.toString())){
						vals.append(",\n");
					}
					vals.append("    			    regexp:{ \n");
					vals.append("    			        regexp:/^[0-9]\\\\d*$/,\n");
					vals.append("    			        message:'【"+columnname+"】必须是整数' \n");
					vals.append("    			    }");
				}else if(dataType.equals("D")){
					if(StringUtils.isNotBlank(vals.toString())){
						vals.append(",\n");
					}
					vals.append("   			     numeric:{\n");
					vals.append("   			         message:'【"+columnname+"】请输入正确的数字'\n");
					vals.append("    			    }");
				}else if(dataType.equals("C")){
					if(StringUtils.isNotBlank(vals.toString())){
						vals.append(",");
					}
					vals.append("   			     regexp:{\n");
					vals.append("   			        regexp:/^\\\\d+(\\\\.\\\\d+)?$/,\n");
					vals.append("   			        message:'【"+columnname+"】请输入正确的金额！'\n");
					vals.append("    			    }");
				}else if(dataType.equals("TD")){
					if(StringUtils.isNotBlank(vals.toString())){
						vals.append(",");
					}
					vals.append("    			    date:{\n");
					vals.append("    			       message:'【"+columnname+"】请输入正确的日期'\n");
					vals.append("    			    }");
				}else if(dataType.equals("T")){
					if(StringUtils.isNotBlank(vals.toString())){
						vals.append(",\n");
					}
					vals.append("   			     date:{\n");
					vals.append("   			         message:'【"+columnname+"】请输入正确的日期'\n");
					vals.append("    			    }\n");
				} else if(dataType.equals("M")){
					// * f：枚举类型设置内容；枚举内容menuType 设置格式为 【{code1:中文显示1,code1:中文显示1}】,进行判断code是否对应
					/*Map<String, Object> mapjson=JSONObject.parseObject(menuType);
					if(!mapjson.containsKey(columnValue.toString())){
						errInfo.append("字段【"+columnname+"】是枚举类型，枚举内容【"+columnValue.toString()+"】填写有误,<br/>请填写"+JSONObject.toJSONString(mapjson.keySet())+"中的一个!<br/>");
						resultMap.put(columnename,"【"+columnname+"】是枚举类型，枚举内容【"+columnValue.toString()+"】不存在!");
						continue;
					}*/
				}
			}
			//中间加上内容
			validateStr.append(vals.toString());
			if(StringUtils.isNotBlank(vals.toString())){
				vals.append("\n");
			}
			validateStr.append("   			  }\n");
			validateStr.append("	      }\n");
			resultMap.put(columnename,validateStr.toString());
		}
		return resultMap;
	}
		
}
