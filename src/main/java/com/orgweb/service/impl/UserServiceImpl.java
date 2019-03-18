package com.orgweb.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.orgweb.dao.UserDao;
import com.orgweb.entitydto.UserInfo;
import com.orgweb.service.interfaces.IUserService;
@Service("userService")
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserDao userDao;//注入dao
	/*******
	 * 根据id查询
	 * @param  id
	 * @return 计划抬头信息
	 * @throws BusinessException
	 */
	@Override
	@Cacheable(value="myCache")
	public UserInfo queryUserInfoById(int id){
		//System.out.println("hello world!!");
		//return userDao.queryUserInfoById(id);
		UserInfo dto=new UserInfo();
		System.out.println("访问一次："+System.currentTimeMillis());
		return userDao.testUserInfo(dto);
	}
	
	/*******
	 * 根据id查询
	 * @param  id
	 * @return 计划抬头信息
	 * @throws BusinessException
	 * 注明，value是不支持变量的
	 */
	@Override
	@Cacheable(value="myCache",key="#id")
	public UserInfo queryUserInfoByIdTest(int id,String name){
		//System.out.println("hello world!!");
		//return userDao.queryUserInfoById(id);
		UserInfo dto=new UserInfo();
		System.out.println("访问一次："+System.currentTimeMillis());
		return userDao.testUserInfo(dto);
	}
	
	//获取所有栏目类型
	public List getAllType(){
		return userDao.getAllType();
	}
	//获取所有栏目类型
	public List testSql(String sql,Map<String,Object> map){
		return userDao.testSql(sql,map);
	}
	
	//获取所有栏目类型
	@Override
	@Cacheable(value="myCache",key="#userType")
	public JSONObject testSqlCache(String userType){
		JSONObject json = new JSONObject();
		/*List list=userDao.testSqlCache(userType);
		json.put("result", list);*/
		return json;
	}
	//获取所有栏目类型
	@Override
	@Cacheable(value="myCache")
	public List<Map> testSqlCacheListMap(Map map){
		return userDao.testSqlCache(map);
	}
	@Override
	public List<Map> testIfNull(Map map){
		return userDao.testIfNull(map);
	}

	@Override
	public List<Map> testSqlCacheListMap(String userType) {
		// TODO Auto-generated method stub
		return null;
	}
}
