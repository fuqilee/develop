package com.orgweb.utils;

import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

public class PropertiesUtil {

	private static final Logger logger =  Logger.getLogger(PropertiesUtil.class);

	/**
	 * 
	 * @param path
	 * @param key
	 * @param obj
	 * @return
	 */
	public static String getProperty(String path, String key, Object obj){
		Properties properties = new Properties();
		try{
			properties.load(obj.getClass().getResourceAsStream(path));
			String property = properties.getProperty(key);
			return StringUtils.isBlank(property) ? null : property;
		}catch(Exception ex){
			logger.error("PropertiesUtil处理失败");
			logger.error("Cause:" + ex.getMessage());
//			ex.printStackTrace();
		}
		return null;
	}
	/**
	 * 
	 * @return
	 */
	public static Properties getPropertyList(){
		Properties properties = new Properties();
		/*try{
			//properties.load(PropertiesUtil.class.getResourceAsStream("/config/dataConfig.properties"));
			return properties;
		}catch(Exception ex){
			logger.error("PropertiesUtil处理失败");
			logger.error("Cause:" + ex.getMessage());
//			ex.printStackTrace();
		}*/
		return properties;
	}
	public static void main(String[] args){
		Properties properties = new Properties();
		try{
			properties.load(PropertiesUtil.class.getResourceAsStream("/dataConfig.properties"));
		}catch(Exception ex){
			logger.error("PropertiesUtil处理失败");
			logger.error("Cause:" + ex.getMessage());
//			ex.printStackTrace();
		}
	}

}
