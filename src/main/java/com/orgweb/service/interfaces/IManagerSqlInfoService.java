package com.orgweb.service.interfaces;

import java.util.List;
import java.util.Map;

import com.orgweb.exception.LogicException;
import com.orgweb.utils.PageList;
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
public interface IManagerSqlInfoService {
	/**
	 *  1  新增 addInfoForUD
	 * @param saveCondition
	 * @param sql
	 */
	public void addInfoForUD(Map<String, Object> saveCondition, String sql) throws LogicException ;
	/**
	 *   2 删除deleteInfoForUD
	 * @param delCondition
	 */
	public void deleteInfoForUD(Map<String, Object> delCondition, String sql) throws LogicException;
	/** 
	 * 3.1.1 查询一个list集合findInfoForUDGetList
	 * @param findCondition
	 * @param sql
	 * @param innerCondition 复合查询的问题，咱符合查询里面比如一个（）里面有 a=? 这样的存在 ，就需要单独给一个参数去查询了
	 * @return
	 */
	public List<Map<String, Object>> findInfoForUDGetList(Map<String, Object> findCondition, String sql, Map<String, Object> innerCondition) throws LogicException;

	/**
	 * 3.1.2 查询单条数据findInfoForUDGetSingleData
	 * @param map
	 * @param sql
	 * @param paramMap
	 * @return
	 * @throws LogicException
	 */
	public Map<String, Object> findInfoForUDGetSingleData(Map<String, Object> map, String sql, Map<String, Object> paramMap) throws LogicException;

	/**
	 * 3.2.1 分页查询findInfoForUDByPage
	 * @param map
	 * @param page
	 * @param sql
	 * @param sqlCount
	 * @param paramMap
	 * @return
	 * @throws LogicException
	 */
	public PageList<Map<String,Object>> findInfoForUDByPage(Map<String, Object> map,
                                                            PageList<Map<String, Object>> page, String sql, String sqlCount, Map<String, Object> paramMap) throws LogicException;

	/**
	 * 3.2.1 分页查询findInfoForUDByPageOutWhere
	 * @param map
	 * @param page
	 * @param sql
	 * @param sqlCount
	 * @param paramMap
	 * @return
	 * @throws LogicException
	 */
	public PageList<Map<String,Object>> findInfoForUDByPageOutWhere(Map<String, Object> map,
                                                                    PageList<Map<String, Object>> page, String sql, String sqlCount, Map<String, Object> paramMap) throws LogicException;
	/**  
	 * 4 修改modifyInfoForUD
	 * @param saveInfo 
	 * @param sql : 自定义sql
	 * @param upadteCondition : 更新条件
	 */
	public void modifyInfoForUD(Map<String, Object> saveInfo, String sql, Map<String, Object> upadteCondition) throws LogicException;
	/**  
	 * 4 修改modifyInfoForUD
	 * @param saveInfo 
	 * @param sql : 自定义sql
	 */
	public void modifyInfoForMoreUD(Map<String, Object> saveInfo, String sql) throws LogicException;
	/**
	 * 需要存储缓存的信息
	 * @param findCondition
	 * @param sql
	 * @param innerCondition
	 * @param cachename 缓存名称
	 * @return
	 * @throws LogicException
	 */
	public List<Map<String, Object>> findInfoForUDGetListCache(Map<String, Object> findCondition, String sql,
                                                               Map<String, Object> innerCondition, String cachename) throws LogicException;
}
