package com.orgweb.service.interfaces;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.orgweb.entitydto.UploadFile;
import com.orgweb.utils.PageList;
/**
 * @author qlee
 * @date 20170330
 * @version 1.0.0
 */
public interface IUploadFileService {
	/*******
	 * 根据id查询
	 * @param  id
	 * @return 计划抬头信息
	 * @throws Exception
	 */
	public UploadFile queryUploadFileById(int id) throws Exception;

	/*******
	 * 带分页查询
	 * @param  condition 条件
	 * @param  page 分页信息
	 * @return 计划抬头信息集合
	 * @throws Exception
	 */
	public List<UploadFile> queryAllUploadFiles(@Param("condition") Map<String, Object> condition, PageList<UploadFile> page) throws Exception;
	
	/*******
	 * 根据id删除
	 * @param  id
	 * @return 受影响行数
	 * @throws Exception
	 */
	public int deleteUploadFile(Integer id) throws Exception;
	
	/*******
	 * 根据多条id删除
	 * @param  ids
	 * @return 受影响行数
	 * @throws Exception
	 */
	public int deleteUploadFiles(Integer[] ids) throws Exception ;
	
	/*******
	 * 新增
	 * @param  head
	 * @return 受影响行数
	 * @throws Exception
	 */
	public Long insertUploadFileBySaveMethod(UploadFile UploadFile) throws Exception;
	
	//判定为空编码和名称
	public void judgeNotNullCodeName(UploadFile UploadFile) throws Exception;
	
	/*******
	 * 根据id更新
	 * @param  head
	 * @return 受影响行数
	 * @throws Exception
	 */
	public int updateUploadFile(UploadFile UploadFile) throws Exception;
	
	public PageList<UploadFile> findConfigInfo(UploadFile dto,
                                               PageList<UploadFile> page);

}
