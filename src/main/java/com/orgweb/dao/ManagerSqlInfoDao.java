package com.orgweb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.orgweb.exception.DaoException;
import org.springframework.stereotype.Repository;

/**
 * 自定义sql (user-defined 简写UD)
 * 	1  新增 addInfoForUD
 *  2 删除deleteInfoForUD
 *  3.1.1 查询一个list集合findInfoForUDGetList
 *  3.1.2 查询单条数据findInfoForUDGetSingleData
 *  3.2.1 分页查询findInfoForUDByPage
 *  3.2.2 分页查询数据数量findInfoForUDByPageCount
 *  4 修改modifyInfoForUD
 * 说明：参数sql都是指的 自定义的sql
 *     参数paramMap 是指内部参数；在复合的sql中，有select * from (select * from a where a=#{paramMap.xxx})
 * @author qlee
 * @date 20170330
 * @version 1.0.0
 */
@Repository
public interface ManagerSqlInfoDao {
	// 一 、单表的操作(SingleTable 简写UD)
	/**
	 *  1  新增 addInfoForUD
	 * @param saveCondition
	 * @param sql
	 */
	public void addInfoForUD(@Param("map") Map<String, Object> saveCondition, @Param("sql") String sql)  throws DaoException;
	/**
	 *   2 删除deleteInfoForUD
	 * @param delCondition
	 */
	public void deleteInfoForUD(@Param("map") Map<String, Object> delCondition, @Param("sql") String sql)throws DaoException;
	/** 
	 * 3.1.1 查询一个list集合findInfoForUDGetList
	 * @param findCondition
	 * @param sql
	 * @param innerCondition 复合查询的问题，咱符合查询里面比如一个（）里面有 a=? 这样的存在 ，就需要单独给一个参数去查询了
	 * @return
	 */
	public List<Map<String, Object>> findInfoForUDGetList(@Param("map") Map<String, Object> findCondition, @Param("sql") String sql, @Param("paramMap") Map<String, Object> innerCondition)throws DaoException;
	/**
	 *   3.1.2 查询单条数据findInfoForUDGetSingleData
	 * @return
	 */
	public Map<String, Object> findInfoForUDGetSingleData(@Param("map") Map<String, Object> map, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;
	/**
	 *  3.2.1 分页查询findInfoForUDByPage
	 * @param map
	 * @param pageNum
	 * @param pageSize
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	public List<Map<String,Object>> findInfoForUDByPageOutWhere(@Param("map") Map<String, Object> map, @Param("pageNum") int pageNum,
                                                                @Param("pageSize") int pageSize, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;
	/**
	 *  3.2.1 分页查询findInfoForUDByPage
	 * @param map
	 * @param pageNum
	 * @param pageSize
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	public List<Map<String,Object>> findInfoForUDByPage(@Param("map") Map<String, Object> map, @Param("pageNum") int pageNum,
                                                        @Param("pageSize") int pageSize, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;
	/**
	 * 3.2.2 分页查询数据数量findInfoForUDByPageCount
	 * @param map
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	public int findInfoForUDByPageCountOutWhere(@Param("map") Map<String, Object> map, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;
	/**
	 * 3.2.2 分页查询数据数量findInfoForUDByPageCount
	 * @param map
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	public int findInfoForUDByPageCount(@Param("map") Map<String, Object> map, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;
	/**  
	 * 4 修改modifyInfoForUD
	 * @param saveInfo 
	 * @param sql : 自定义sql
	 * @param upadteCondition : 更新条件
	 */
	
	public void modifyInfoForUD(@Param("map") Map<String, Object> saveInfo, @Param("sql") String sql, @Param("upadteMap") Map<String, Object> upadteCondition)throws DaoException;
	/**  
	 * 4 修改modifyInfoForUD
	 * @param saveInfo 
	 * @param sql : 自定义sql
	 */
	
	public void modifyInfoForMoreUD(@Param("map") Map<String, Object> saveInfo, @Param("sql") String sql)throws DaoException;

}
