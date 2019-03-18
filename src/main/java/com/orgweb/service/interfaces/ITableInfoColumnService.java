package com.orgweb.service.interfaces;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.orgweb.entitydto.TableInfoColumn;
import com.orgweb.exception.LogicException;
import com.orgweb.utils.PageList;

public interface ITableInfoColumnService {
	/**
	 * 	1  新增 addInfoForST
	 * @param 新增信息 addMapInfo 
	 * @param tablename
	 */
	public void addInfoForST(Map<String, Object> addMapInfo, String tablename) throws LogicException;
	/**
	 *   2 删除deleteInfoForST
	 * @param delCondition
	 * @param tablename
	 */
	public void deleteInfoForST(Map<String, Object> delCondition, String tablename) throws LogicException;
	/**
	 *   3.1.1 查询一个list集合findInfoForSTGetList
	 * @param findCondition
	 * @param tablename
	 * @return
	 */
	public List<Map<String, Object>> findInfoForSTGetList(Map<String, Object> findCondition, String tablename) throws LogicException;
	/**
	 *   3.1.2 查询单条数据findInfoForSTGetSingleData
	 * @param findCondition
	 * @param tablename
	 * @return
	 */
	public Map<String, Object> findInfoForSTGetSingleData(Map<String, Object> findCondition, String tablename) throws LogicException;
	/**
	 *   3.2.1 分页查询findInfoForSTByPage
	 * @param findCondition
	 * @param pageNum
	 * @param pageSize
	 * @param tablename
	 * @return
	 */
	public PageList<Map<String,Object>> findInfoForSTByPage(Map<String, Object> map,
                                                            PageList<Map<String, Object>> page, String tablename) throws LogicException;
	/**
	 *  4 修改modifyInfoForST
	 * @param modfiyInfo
	 * @param modifyCondition
	 * @param tablename
	 */
	public void modifyInfoForST(Map<String, Object> modfiyInfo, Map<String, Object> modifyCondition, String tablename) throws LogicException;
	
	/**
	 * 5 批量保存,保存字段信息
	 * @param jsonList
	 */
	public void batchAddTableInfoColumn(List<TableInfoColumn> jsonList) throws LogicException;
	
	/**
	 * 查询数量
	 */
	/**
	 *   3.2.2 分页查询数据数量findInfoForSTByPageCount
	 * @param findCondition
	 * @param tablename
	 * @return
	 */
	public int findInfoForSTByPageCount(@Param("map") Map<String, Object> findCondition, @Param("tablename") String tablename) throws LogicException;
	/**
	 * 校验数据
	 * @param recordMap
	 * @param columnList
	 * @param tablename
	 * @param checkFlag
	 * @return
	 */
	public  String checkBaseInfo(Map<String, Object> recordMap, List<Map<String, Object>> columnList, String tablename, String checkFlag) ;
	/**
	 * 测试方法
	 * @return
	 * @throws LogicException
	 */
	List<Map<String, Object>> findBaseInfoTest() throws LogicException;
	/**
	 * 查询sql信息
	 * @param findCondition 内有sql名
	 * @param tablename
	 * @return
	 * @throws LogicException
	 */
	public Map<String, Object> findSqlInfo(
            Map<String, Object> findCondition, String tablename) throws LogicException;
	/**
	 * 获取表属性的集合
	 * @param tablename
	 * @return
	 * @throws LogicException
	 */
	public List<Map<String, Object>> getColumn(String tablename) throws LogicException;
}
