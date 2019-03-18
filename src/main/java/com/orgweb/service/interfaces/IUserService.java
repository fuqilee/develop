package com.orgweb.service.interfaces;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.orgweb.entitydto.UserInfo;

public interface IUserService {
	/*******
	 * 根据id查询
	 * @param  id
	 * @return 计划抬头信息
	 * @throws BusinessException
	 */
	public UserInfo queryUserInfoById(int id);
	
	//获取所有栏目类型
	public List getAllType();
	
	public List testSql(String sql, Map<String, Object> map);

	UserInfo queryUserInfoByIdTest(int id, String name);
	//	测试缓存
	JSONObject testSqlCache(String userType);

	List<Map> testSqlCacheListMap(String userType);

	List<Map> testSqlCacheListMap(Map userType);

	List<Map> testIfNull(Map map);
}
