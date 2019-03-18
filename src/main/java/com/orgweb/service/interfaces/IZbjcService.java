package com.orgweb.service.interfaces;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.orgweb.entitydto.UserInfo;

public interface IZbjcService {
	/**
	 * 校验数据规范性
	 */
	public Map validateData(Map<String, Object> recordMap, List<Map<String, Object>> columnList, String tablename, String checkFlag, String isValideExistsCol);
	
	public Map getValidateData(List<Map<String, Object>> columnList) ;
}
