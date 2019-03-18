package com.orgweb.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.orgweb.dao.ManagerSqlInfoDao;
import com.orgweb.exception.LogicException;
import com.orgweb.service.interfaces.IManagerSqlInfoService;
import com.orgweb.utils.PageList;
@Service("managerSqlInfoService")
public class ManagerSqlInfoServiceImpl implements IManagerSqlInfoService {
	@Autowired
	public ManagerSqlInfoDao managerSqlInfoDao;

	@Override
	public void addInfoForUD(Map<String, Object> saveCondition, String sql) throws LogicException{
		// TODO Auto-generated method stub
		 managerSqlInfoDao.addInfoForUD(saveCondition, sql);
	}

	@Override
	public void deleteInfoForUD(Map<String, Object> delCondition, String sql) throws LogicException{
		// TODO Auto-generated method stub
		managerSqlInfoDao.deleteInfoForUD(delCondition, sql);
	}

	@Override
	@Cacheable(value="myCache",key="#cachename" ,unless="#cachename==null || #result==null")
	public List<Map<String, Object>> findInfoForUDGetListCache(
			Map<String, Object> findCondition, String sql,
			Map<String, Object> innerCondition,String cachename) throws LogicException{
		// TODO Auto-generated method stub
		return managerSqlInfoDao.findInfoForUDGetList(findCondition, sql, innerCondition);
	}
	@Override
	public List<Map<String, Object>> findInfoForUDGetList(
			Map<String, Object> findCondition, String sql,
			Map<String, Object> innerCondition) throws LogicException{
		// TODO Auto-generated method stub
		return managerSqlInfoDao.findInfoForUDGetList(findCondition, sql, innerCondition);
	}

	@Override
	public Map<String, Object> findInfoForUDGetSingleData(
			Map<String, Object> map, String sql, Map<String, Object> paramMap) throws LogicException{
		// TODO Auto-generated method stub
		return managerSqlInfoDao.findInfoForUDGetSingleData(map, sql, paramMap);
	}

	@Override
	public PageList<Map<String, Object>> findInfoForUDByPageOutWhere(Map<String, Object> map,
			PageList<Map<String,Object>> page,String sql, String sqlCount, Map<String, Object> paramMap)throws LogicException {
		// TODO Auto-generated method stub
		int pageSize=page.getPageSize();
		int pageNum=(page.getCurPage()-1)*pageSize;
		//pageSize=pageNum+pageSize; oracle 的pagesize
		page.setList(managerSqlInfoDao.findInfoForUDByPageOutWhere(map,pageNum,pageSize,sql,paramMap));
		page.setTotalCount(managerSqlInfoDao.findInfoForUDByPageCountOutWhere(map,sqlCount,paramMap));
		return page;
	}
	@Override
	public PageList<Map<String, Object>> findInfoForUDByPage(Map<String, Object> map,
			PageList<Map<String,Object>> page,String sql, String sqlCount, Map<String, Object> paramMap)throws LogicException {
		// TODO Auto-generated method stub
		int pageSize=page.getPageSize();
		int pageNum=(page.getCurPage()-1)*pageSize;
		//pageSize=pageNum+pageSize; oracle 的pagesize
		page.setList(managerSqlInfoDao.findInfoForUDByPage(map,pageNum,pageSize,sql,paramMap));
		page.setTotalCount(managerSqlInfoDao.findInfoForUDByPageCount(map,sqlCount,paramMap));
		return page;
	}


	@Override
	public void modifyInfoForUD(Map<String, Object> saveInfo, String sql,
			Map<String, Object> upadteCondition) throws LogicException{
		// TODO Auto-generated method stub
		managerSqlInfoDao.modifyInfoForUD(saveInfo, sql, upadteCondition);
	}
	@Override
	public void modifyInfoForMoreUD(Map<String, Object> saveInfo, String sql) throws LogicException{
		// TODO Auto-generated method stub
		managerSqlInfoDao.modifyInfoForMoreUD(saveInfo, sql);
	}
	
}
