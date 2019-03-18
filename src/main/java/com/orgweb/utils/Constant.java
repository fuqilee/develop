package com.orgweb.utils;

import java.util.Properties;

public class Constant {

	/**************************查询表信息********************/
	//总体表信息存做于此表中
	public static String TABLENAMEID ="id";
	public static String TABLENAMEMANAGERSQLINFO="s_manager_sqlinfo";
	public static String UPLOADFILES="s_files";
	
	public static String TABLENAME_BASETABLE_CONFIG ="s_basetable_config";
	public static String TABLENAME_BASECOLUMN_CONFIG ="s_basecolumn_config";
	
	public static final String DEFAULT_DATE_FORMAT_DATE = "yyyy-MM-dd";

	public static final String DEFAULT_DATE_FORMAT_DATETIME = "yyyy-MM-dd HH:mm:ss";
	//sql处理部分常量使用
	public static String SQLNAMEINFO ="SQLNAME";
	public static String SQLCONTENT ="SQLCONTENT";
	public static String TABLEENAME ="TABLEENAME";
	
	//分页
	public static final int PAGESIZE=20;
	
	//访问数据工厂的URL
	public static final String DATAURL="";
	
	/**
	 * 新版录入表配置如下
	 */
	//新版录入
	public static String TABLENAME_T_XBLR="T_XBLR";
	//兵力调用
	public static String TABLENAME_T_XBLR_BLDYQK="T_XBLR_BLDYQK";
	//信息通信保障
	public static String TABLENAME_T_XBLR_XXTXBZQK="T_XBLR_XXTXBZQK";
	//重保任务
	public static String TABLENAME_T_XBLR_ZBRWQK="T_XBLR_ZBRWQK";
	//战备演训
	public static String TABLENAME_T_XBLR_ZBYX="T_XBLR_ZBYX";
	//获取查询数据的配置信息
	public static Properties CONFIGPROP=PropertiesUtil.getPropertyList();
}
