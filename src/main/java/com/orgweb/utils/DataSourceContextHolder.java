package com.orgweb.utils;

/**
 * 切换数据源的工具类
 * @author qlee
 */
public class DataSourceContextHolder {
	
	 	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();      
     
	    public static void setDBType(String dbType) {      
	        contextHolder.set(dbType);      
	    }      
	  
	    public static String getDBType() {      
	        return ((String) contextHolder.get());      
	    }      
	  
	    public static void clearDBType() {      
	        contextHolder.remove();      
	    }      
}
