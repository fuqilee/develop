package com.orgweb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;


import com.orgweb.entitydto.UploadFile;
import org.springframework.stereotype.Repository;

/**
 * @author qlee
 * @date 20170330
 * @version 1.0.0
 */
@Repository
public interface UploadFileDao {
	/*******
	 * 根据id查询
	 * @param  id
	 * @return 计划抬头信息
	 * @throws DataAccessException
	 */
	public UploadFile queryUploadFileById(int id) throws DataAccessException;

	/*******
	 * 带分页查询
	 * @param condition
	 * @param page
	 * @return
	 * @throws DataAccessException
	 */
	/*public List<UploadFile> queryAllUploadFiles(@Param("condition") Map<String, Object> condition, @Param("page") Page<UploadFile> page) throws DataAccessException;
	*/
	/*******
	 * 根据id删除
	 * @param  id
	 * @return 受影响行数
	 * @throws DataAccessException
	 */
	public int deleteUploadFile(@Param("fileId") Integer id) throws DataAccessException;
	
	/*******
	 * 新增
	 * @param  UploadFile
	 * @return 受影响行数
	 * @throws DataAccessException
	 */
	public Long insertUploadFileBySaveMethod(UploadFile UploadFile) throws DataAccessException;
	
	/*******
	 * 根据id更新
	 * @param  UploadFile
	 * @return 受影响行数
	 * @throws DataAccessException
	 */
	public int updateUploadFile(UploadFile UploadFile) throws DataAccessException;
	
	
	/**
	 * 唯一性校验，返回重复数据的数量<br>
	 * 	支持单字段唯一性校验，联合字段唯一性校验
	 * @param UploadFile
	 * @return	int
	 */
	int getCountOfUKByObj(UploadFile UploadFile) throws DataAccessException;
	/**
	 * 分页查询
	 * @param dto
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<UploadFile> findFileInfo(@Param("condition") UploadFile dto, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
	/**
	 * 查询数量
	 * @param dto
	 * @return
	 */
	public int findFileCount(@Param("condition") UploadFile dto);
	
}
