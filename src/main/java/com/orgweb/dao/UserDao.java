package com.orgweb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.orgweb.entitydto.UserInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

	/*******
	 * 根据id查询
	 * @param  id
	 * @return 计划抬头信息
	 * @throws DataAccessException
	 */
	public UserInfo queryUserInfoById(int id) throws DataAccessException;

	/*******
	 * 带分页查询
	 * @param  condition 条件
	 * @return 计划抬头信息集合
	 * @throws DataAccessException
	 */
	public List<UserInfo> queryAllUserInfos(@Param("condition") Map<String, Object> condition, Object n) throws DataAccessException;
	
	/*******
	 * 根据id删除
	 * @param  id
	 * @return 受影响行数
	 * @throws DataAccessException
	 */
	public int deleteUserInfo(@Param("id") Integer id) throws DataAccessException;
	
	/*******
	 * 新增
	 * @return 受影响行数
	 * @throws DataAccessException
	 */
	public int insertUserInfoBySaveMethod(UserInfo userInfo) throws DataAccessException;
	
	/*******
	 * 根据id更新
	 * @return 受影响行数
	 * @throws DataAccessException
	 */
	public int updateUserInfo(UserInfo userInfo) throws DataAccessException;
	
	
	/**
	 * 唯一性校验，返回重复数据的数量<br>
	 * 	支持单字段唯一性校验，联合字段唯一性校验
	 * @param userInfo
	 * @return	int
	 */
	int getCountOfUKByObj(UserInfo userInfo) throws DataAccessException;
	
	public UserInfo testUserInfo(@Param("dto") UserInfo dto) throws DataAccessException;
	
	public List getAllType();
	
	public List testSql(@Param("sql") String sql, @Param("map") Map<String, Object> map);
	
	public List testSqlCache(@Param("map") Map userType);
	
	public List testIfNull(@Param("map") Map map);
}
