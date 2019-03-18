package com.orgweb.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSON;

public class ValidatorUtils {
	/** 
     * 正则表达式：验证用户名 
     */  
    public static final String REGEX_USERNAME = "^[a-zA-Z]\\w{5,17}$";  
   
    /** 
     * 正则表达式：验证密码 
     */  
    public static final String REGEX_PASSWORD = "^[a-zA-Z0-9]{6,16}$";  
   
    /** 
     * 正则表达式：验证手机号 
     */  
    public static final String REGEX_MOBILE = "^((13[0-9])|(15[^4,\\D])|(14[57])|(17[0])|(17[7])|(18[0,0-9]))\\d{8}$";  
   
    /** 
     * 正则表达式：验证邮箱 
     */  
    public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";  
   
    /** 
     * 正则表达式：验证汉字 
     */  
    public static final String REGEX_CHINESE = "^[\u4e00-\u9fa5],{0,}$";  
   
    /** 
     * 正则表达式：验证身份证 
     */  
    public static final String REGEX_ID_CARD = "(^\\d{18}$)|(^\\d{15}$)";  
   
    /** 
     * 正则表达式：验证URL 
     */  
    public static final String REGEX_URL = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";  
   
    /** 
     * 正则表达式：验证IP地址 
     */  
    public static final String REGEX_IP_ADDR = "(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)";  
    /** 
     * 正则表达式：验证是否为整数
     */  
    public static final String REGEX_IS_INTEGER = "\\d*$";  
   
    /** 
     * 校验用户名 
     * 
     * @param username 
     * @return 校验通过返回true，否则返回false 
     */  
    public static boolean isUsername(String username) {  
        return Pattern.matches(REGEX_USERNAME, username);  
    }  
   
    /** 
     * 校验密码 
     * 
     * @param password 
     * @return 校验通过返回true，否则返回false 
     */  
    public static boolean isPassword(String password) {  
        return Pattern.matches(REGEX_PASSWORD, password);  
    }  
   
    /** 
     * 校验手机号 
     * 
     * @param mobile 
     * @return 校验通过返回true，否则返回false 
     */  
    public static boolean isMobile(String mobile) {  
        return Pattern.matches(REGEX_MOBILE, mobile);  
    }  
   
    /** 
     * 校验邮箱 
     * 
     * @param email 
     * @return 校验通过返回true，否则返回false 
     */  
    public static boolean isEmail(String email) {  
        return Pattern.matches(REGEX_EMAIL, email);  
    }  
   
    /** 
     * 校验汉字 
     * 
     * @param chinese 
     * @return 校验通过返回true，否则返回false 
     */  
    public static boolean isChinese(String chinese) {  
        return Pattern.matches(REGEX_CHINESE, chinese);  
    }  
   
    /** 
     * 校验身份证 
     * 
     * @param idCard 
     * @return 校验通过返回true，否则返回false 
     */  
    public static boolean isIDCard(String idCard) {  
        return Pattern.matches(REGEX_ID_CARD, idCard);  
    }  
   
    /** 
     * 校验URL 
     * 
     * @param url 
     * @return 校验通过返回true，否则返回false 
     */  
    public static boolean isUrl(String url) {  
        return Pattern.matches(REGEX_URL, url);  
    }  
   
    /** 
     * 校验IP地址 
     * 
     * @param ipAddr 
     * @return 
     */  
    public static boolean isIPAddr(String ipAddr) {  
        return Pattern.matches(REGEX_IP_ADDR, ipAddr);  
    }  
    
    /**
     * 验证是否为整数
     * @param integ
     * @return
     */
    public static boolean isInteger(Object integ) {  
    	if(integ==null){
    		return false;
    	}
    	return Pattern.matches(REGEX_IS_INTEGER, integ.toString());  
    }  
    
    /**
     * 验证是否为空字符串
     * @param content
     * @return
     */
    public static boolean isNull(String content){
    	return StringUtils.isBlank(content);
    }
    
   public static boolean isValidateDate(String validateDate) {
	   boolean convertSucess=true;
	   SimpleDateFormat format=new SimpleDateFormat("yyyy年MM月dd日HH时mm分");
	  try {
		  format.setLenient(false);
		  format.parse(validateDate);
	  } catch (ParseException e) {
		  convertSucess=false;
	  }
	   return convertSucess;
   }
   /**
    * 比较两个日期的大小，如果前面的日期大于后面的日期则为true，否则为false
    * @param beforeDate
    * @param afterDate
    * @return
    */
   public static boolean compareDate(String beforeDate,String afterDate) {
	   boolean convertSucess=true;
	   SimpleDateFormat format=new SimpleDateFormat("yyyy年MM月dd日HH时mm分");
	  try {
		 return  format.parse(beforeDate).compareTo(format.parse(afterDate)) >=0;
	  } catch (ParseException e) {
		  convertSucess=false;
	  }
	   return convertSucess;
   }
}	
