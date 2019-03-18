package com.orgweb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.orgweb.entitydto.TableInfoColumn;
import com.orgweb.exception.DaoException;
import org.springframework.stereotype.Repository;

/**
 * 有两大类的方法
 * 一 、单表的操作(SingleTable 简写ST)
 * 	1  新增 addInfoForST
 *  2 删除deleteInfoForST
 *  3.1.1 查询一个list集合findInfoForSTGetList
 *  3.1.2 查询单条数据findInfoForSTGetSingleData
 *  3.2.1 分页查询findInfoForSTByPage
 *  3.2.2 分页查询数据数量findInfoForSTByPageCount
 *  4 修改modifyInfoForST
 *  5 批量保存,保存字段信息 batchAddTableInfoColumn
 * 自定义sql (user-defined 简写UD)
 *  2 删除deleteInfoForUDSQL
 *  3.1.1 查询一个list集合findInfoForUDGetListSQL
 *  3.1.2 查询单条数据findInfoForUDGetSingleDataSQL
 *  3.2.1 分页查询findInfoForUDByPageSQL
 *  3.2.2 分页查询数据数量findInfoForUDByPageCountSQL
 * 说明：参数sql都是指的 自定义的sql
 *     参数paramMap 是指内部参数；在复合的sql中，有select * from (select * from a where a=#{paramMap.xxx})
 * andcondition
 * @author qlee
 * @date 20170330
 * @version 1.0.0
 */
@Repository
public interface ShareDao {
	// 一 、单表的操作(SingleTable 简写ST)
	/**
	 *   2 删除deleteInfoForST
	 * @param tablename
	 */
	public void deleteInfoForST(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("tablename") String tablename) throws DaoException;
	/**
	 *   3.1.1 查询一个list集合findInfoForSTGetList
	 * @param tablename
	 * @return
	 */
	public List<Map<String, Object>> findInfoForSTGetList(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("tablename") String tablename) throws DaoException;
	/**
	 *   3.1.2 查询单条数据findInfoForSTGetSingleData
	 * @param andCondition
	 * @param tablename
	 * @return
	 */
	public Map<String, Object> findInfoForSTGetSingleData(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("tablename") String tablename) throws DaoException;
	/**
	 *   3.2.1 分页查询findInfoForSTByPage
	 * @param andCondition
	 * @param pageNum
	 * @param pageSize
	 * @param tablename
	 * @return
	 */
	public List<Map<String,Object>> findInfoForSTByPage(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("pageNum") int pageNum,
                                                        @Param("pageSize") int pageSize, @Param("tablename") String tablename) throws DaoException;
	/**
	 *   3.2.2 分页查询数据数量findInfoForSTByPageCount
	 * @param andCondition
	 * @param tablename
	 * @return
	 */
	public int findInfoForSTByPageCount(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("tablename") String tablename) throws DaoException;
	/**
	 *  4 修改modifyInfoForST
	 * @param andCondition
	 * @param orcondition
	 * @param tablename
	 */
	public void modifyInfoForST(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("tablename") String tablename) throws DaoException;
	//---------------------------------------单表操作结束-------------------------
	
	
	/****************************************************************************************sql操作   start*/
	/**
	 * 2 删除deleteInfoForUD
	 * @param andCondition
	 * @param orcondition
	 * @param sql
	 * @throws DaoException
	 */
	public void deleteInfoForUDSQL(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("sql") String sql)throws DaoException;
	/** 
	 * 3.1.1 查询一个list集合findInfoForUDGetList
	 * @param sql
	 * @param innerCondition 复合查询的问题，咱符合查询里面比如一个（）里面有 a=? 这样的存在 ，就需要单独给一个参数去查询了
	 * @return
	 */
	public List<Map<String, Object>> findInfoForUDGetListSQL(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("sql") String sql, @Param("paramMap") Map<String, Object> innerCondition)throws DaoException;

	/**
	 * 3.1.2 查询单条数据findInfoForUDGetSingleData
	 * @param andCondition
	 * @param orcondition
	 * @param sql
	 * @param paramMap
	 * @return
	 * @throws DaoException
	 */
	public Map<String, Object> findInfoForUDGetSingleDataSQL(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;

	/**
	 * 3.2.1 分页查询findInfoForUDByPage
	 * @param andCondition
	 * @param orcondition
	 * @param pageNum
	 * @param pageSize
	 * @param sql
	 * @param paramMap
	 * @return
	 * @throws DaoException
	 */
	public List<Map<String,Object>> findInfoForUDByPageOutWhereSQL(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("pageNum") int pageNum,
                                                                   @Param("pageSize") int pageSize, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;

	/**
	 * 3.2.1 分页查询findInfoForUDByPage
	 * @param andCondition
	 * @param orcondition
	 * @param pageNum
	 * @param pageSize
	 * @param sql
	 * @param paramMap
	 * @return
	 * @throws DaoException
	 */
	public List<Map<String,Object>> findInfoForUDByPageSQL(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("pageNum") int pageNum,
                                                           @Param("pageSize") int pageSize, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;
	/**
	 * 3.2.2 分页查询数据数量findInfoForUDByPageCount
	 * @param andCondition
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	public int findInfoForUDByPageCountOutWhereSQL(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;
	/**
	 * 3.2.2 分页查询数据数量findInfoForUDByPageCount
	 * @param andCondition
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	public int findInfoForUDByPageCountSQL(@Param("andmap") Map<String, Object> andCondition, @Param("ormap") Map<String, Object> orcondition, @Param("sql") String sql, @Param("paramMap") Map<String, Object> paramMap)throws DaoException;
	
	/****************************************************************************************sql操作   end*/
}
