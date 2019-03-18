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
 * @author qlee
 * @date 20170330
 * @version 1.0.0
 */
@Repository
public interface TableInfoColumnDao {
	// 一 、单表的操作(SingleTable 简写ST)

	/**
	 * 	1  新增 addInfoForST
	 * @param addMapInfo
	 * @param tablename
	 * @throws DaoException
	 */
	public void addInfoForST(@Param("map") Map<String, Object> addMapInfo, @Param("tablename") String tablename) throws DaoException;
	/**
	 *   2 删除deleteInfoForST
	 * @param delCondition
	 * @param tablename
	 */
	public void deleteInfoForST(@Param("map") Map<String, Object> delCondition, @Param("tablename") String tablename) throws DaoException;
	/**
	 *   3.1.1 查询一个list集合findInfoForSTGetList
	 * @param findCondition
	 * @param tablename
	 * @return
	 */
	public List<Map<String, Object>> findInfoForSTGetList(@Param("map") Map<String, Object> findCondition, @Param("tablename") String tablename) throws DaoException;
	/**
	 *   3.1.2 查询单条数据findInfoForSTGetSingleData
	 * @param findCondition
	 * @param tablename
	 * @return
	 */
	public Map<String, Object> findInfoForSTGetSingleData(@Param("map") Map<String, Object> findCondition, @Param("tablename") String tablename) throws DaoException;
	/**
	 *   3.2.1 分页查询findInfoForSTByPage
	 * @param findCondition
	 * @param pageNum
	 * @param pageSize
	 * @param tablename
	 * @return
	 */
	public List<Map<String,Object>> findInfoForSTByPage(@Param("map") Map<String, Object> findCondition, @Param("pageNum") int pageNum,
                                                        @Param("pageSize") int pageSize, @Param("tablename") String tablename) throws DaoException;
	/**
	 *   3.2.2 分页查询数据数量findInfoForSTByPageCount
	 * @param findCondition
	 * @param tablename
	 * @return
	 */
	public int findInfoForSTByPageCount(@Param("map") Map<String, Object> findCondition, @Param("tablename") String tablename) throws DaoException;
	/**
	 *  4 修改modifyInfoForST
	 * @param modifyCondition
	 * @param paramMap
	 * @param tablename
	 */
	public void modifyInfoForST(@Param("map") Map<String, Object> modifyCondition, @Param("paramMap") Map<String, Object> paramMap, @Param("tablename") String tablename) throws DaoException;
	
	/**
	 * 5 批量保存,保存字段信息
	 * @param jsonList
	 */
	public void batchAddTableInfoColumn(@Param("list") List<TableInfoColumn> jsonList) throws DaoException;
	
	public List<Map<String,Object>> findBaseInfoTest() throws DaoException;
	
}
