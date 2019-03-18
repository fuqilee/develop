package com.orgweb.service.interfaces;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.orgweb.entitydto.TableInfoColumn;
import com.orgweb.exception.LogicException;
import com.orgweb.utils.PageList;

public interface IShareService {
	/**
	 * 根据条件删除信息
	 * @param andcondition
	 * @param orcondition
	 * @param tablename
	 * @throws Exception
	 */
	public void deleteInfoForST(Map<String, Object> andcondition, Map<String, Object> orcondition, String tablename) throws Exception;
	/**
	 * 根据条件查询表信息
	 * @param andcondition
	 * @param orcondition
	 * @param tablename
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findInfoForSTGetList(Map<String, Object> andcondition, Map<String, Object> orcondition, String tablename) throws Exception;
	/**
	 * 根据条件查询单条信息
	 * @param andcondition
	 * @param orcondition
	 * @param tablename
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findInfoForSTGetSingleData(Map<String, Object> andcondition, Map<String, Object> orcondition, String tablename) throws Exception;
	/**
	 * 分页查询多条数据
	 * @param andcondition
	 * @param orcondition
	 * @param page
	 * @param tablename
	 * @return
	 * @throws Exception
	 */
	public PageList<Map<String,Object>> findInfoForSTByPage(Map<String, Object> andcondition, Map<String, Object> orcondition,
                                                            PageList<Map<String, Object>> page, String tablename) throws Exception;
	/**
	 * 修改信息
	 * @param modfiyInfo：待修改的信息
	 * @param andcondition：and的条件信息
	 * @param orcondition：or的条件信息
	 * @param tablename：表名
	 * @throws Exception
	 */
	public void modifyInfoForST(Map<String, Object> modfiyInfo, Map<String, Object> andcondition, Map<String, Object> orcondition, String tablename) throws Exception;
	
	/**
	 * 查询分页的总条数
	 * @param andcondition
	 * @param orcondition
	 * @param tablename
	 * @return
	 * @throws Exception
	 */
	public int findInfoForSTByPageCount(Map<String, Object> andcondition, Map<String, Object> orcondition, String tablename) throws Exception;
	
	/****************************************************************按照sql进行操作的方法--start*/
	/**
	 *   2 删除deleteInfoForUD
	 * @param delCondition
	 */
	public void deleteInfoForUDSQL(Map<String, Object> andcondition, Map<String, Object> orcondition, String sql) throws LogicException;
	/** 
	 * 3.1.1 查询一个list集合findInfoForUDGetList
	 * @param findCondition
	 * @param sql
	 * @param innerCondition 复合查询的问题，咱符合查询里面比如一个（）里面有 a=? 这样的存在 ，就需要单独给一个参数去查询了
	 * @return
	 */
	public List<Map<String, Object>> findInfoForUDGetListSQL(Map<String, Object> andcondition, Map<String, Object> orcondition, String sql, Map<String, Object> innerCondition) throws LogicException;
	/**
	 *   3.1.2 查询单条数据findInfoForUDGetSingleData
	 * @param findCondition
	 * @param tablename
	 * @return
	 */
	public Map<String, Object> findInfoForUDGetSingleDataSQL(Map<String, Object> andcondition, Map<String, Object> orcondition, String sql, Map<String, Object> paramMap) throws LogicException;
	/**
	 *  3.2.1 分页查询findInfoForUDByPage
	 * @param map
	 * @param pageNum
	 * @param pageSize
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	public PageList<Map<String,Object>> findInfoForUDByPageSQL(Map<String, Object> andcondition, Map<String, Object> orcondition,
                                                               PageList<Map<String, Object>> page, String sql, String sqlCount, Map<String, Object> paramMap) throws LogicException;
	/**
	 *  3.2.1 分页查询findInfoForUDByPageOutWhere
	 * @param map
	 * @param pageNum
	 * @param pageSize
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	public PageList<Map<String,Object>> findInfoForUDByPageOutWhereSQL(Map<String, Object> andcondition, Map<String, Object> orcondition,
                                                                       PageList<Map<String, Object>> page, String sql, String sqlCount, Map<String, Object> paramMap) throws LogicException;
	/****************************************************************按照sql进行操作的方法--end*/
	
	/**
	 * 校验数据规范性
	 */
	public Map validateData(Map<String, Object> recordMap, List<Map<String, Object>> columnList, String tablename, String checkFlag, String isValideExistsCol);
	
}
