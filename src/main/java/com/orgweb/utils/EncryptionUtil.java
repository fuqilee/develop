package com.orgweb.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptionUtil {
	/**
	 * 校验输入和待校验的密码是否一致
	 * @param submitPassword 输入密码
	 * @param saltPassword 数据库中的密码
	 * @return
	 */
	public static boolean MD5WithSalt(String submitPassword,String saltPassword){
		if(encryptionByMD5(submitPassword).equals(saltPassword)){
			return true;
		}else{
			return false;
		}
		
	}
	/**
	 * 通过MD5算法进行加密
	 * @param sInput 加密元数据
	 * @return 加密后字符串
	 */
	public static String encryptionByMD5(String sInput) {
		
		if(sInput == null || "".equals(sInput)) {
			return "";
		}
		try {
			// 获得MD5摘要算法的 MessageDigest 对象
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// 使用指定的字节更新摘要
			mdInst.update(sInput.getBytes());
			// 获得密文
			byte md[] = mdInst.digest();
			// 把密文转换成十六进制的字符串形式
			StringBuffer hexString = new StringBuffer();
			// 字节数组转换为 十六进制 数
			for (int i = 0; i < md.length; i++) {
				String shaHex = Integer.toHexString(md[i] & 0xFF);
				if (shaHex.length() < 2) {
					hexString.append(0);
				}
				hexString.append(shaHex);
			}
			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 通过SHA1算法进行加密
	 * @param sInput 加密元数据
	 * @return 加密后字符串
	 */
	public static String encryptionBySHA1(String sInput) {
		
		if(sInput == null || "".equals(sInput)) {
			return "";
		}
		
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-1");
			digest.update(sInput.getBytes());
			byte messageDigest[] = digest.digest();
			// Create Hex String
			StringBuffer hexString = new StringBuffer();
			// 字节数组转换为 十六进制 数
			for (int i = 0; i < messageDigest.length; i++) {
				String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
				if (shaHex.length() < 2) {
					hexString.append(0);
				}
				hexString.append(shaHex);
			}
			return hexString.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "";
	}
	
}
