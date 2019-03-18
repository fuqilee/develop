package com.orgweb.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.orgweb.dao.UploadFileDao;
import com.orgweb.entitydto.UploadFile;
import com.orgweb.service.interfaces.IUploadFileService;
import com.orgweb.utils.PageList;
@Service("uploadFileService")
public class UploadFileServiceImpl implements IUploadFileService {
	
	@Autowired
	private UploadFileDao uploadFileDao;

	/*******
	 * 根据id查询
	 * @param  id
	 * @return 计划抬头信息
	 * @throws Exception
	 */
	public UploadFile queryUploadFileById(int id) throws Exception{
		return uploadFileDao.queryUploadFileById(id);
	};

	/*******
	 * 带分页查询
	 * @param  condition 条件
	 * @param  page 分页信息
	 * @return 计划抬头信息集合
	 * @throws Exception
	 */
	/*public List<UploadFile> queryAllUploadFiles(@Param("condition")Map<String, Object>  condition,Page<UploadFile> page) throws Exception{
		return uploadFileDao.queryAllUploadFiles(condition, page);
	};*/
	
	/*******
	 * 根据id删除
	 * @param  id
	 * @return 受影响行数
	 * @throws Exception
	 */
	public int deleteUploadFile(Integer id) throws Exception{
		if(id==null){
			throw new Exception("请选择需要删除的数据。");
		}
		return uploadFileDao.deleteUploadFile(id);
	};
	
	/*******
	 * 根据多条id删除
	 * @param  ids
	 * @return 受影响行数
	 * @throws Exception
	 */
	public int deleteUploadFiles(Integer[] ids) throws Exception {
		int count=0;
		if(ids==null){
			throw new Exception("请选择需要删除的数据。");
		}
		//如果有下级请自己查询验证
		for(int i=0;ids.length>i;i++){
			count=count+uploadFileDao.deleteUploadFile(ids[i]);
		}
		return count;
	};
	
	/*******
	 * 新增
	 * @return 受影响行数
	 * @throws Exception
	 */
	public Long insertUploadFileBySaveMethod(UploadFile  UploadFile) throws Exception{
		//判断非空字段
		judgeNotNullCodeName(UploadFile);
		return uploadFileDao.insertUploadFileBySaveMethod(UploadFile);
	};
	
	//判定为空编码和名称
	public void judgeNotNullCodeName(UploadFile  UploadFile) throws Exception{
		if(UploadFile!=null){
			
		}else{
			 throw new Exception("数据不可为空。");
		}
	}
	
	/*******
	 * 根据id更新
	 * @return 受影响行数
	 * @throws Exception
	 */
	public int updateUploadFile(UploadFile  UploadFile) throws Exception{
		int count=0;
		//id字段不可为空
		if(UploadFile!=null){
			if(UploadFile.getFileId()==0){
				throw new Exception("传参有误。");
			}
			count=uploadFileDao.updateUploadFile(UploadFile);
		}else{
			 throw new Exception("数据不可为空。");
		}
		return count;
	};
	
	public PageList<UploadFile> findConfigInfo(UploadFile dto,
			PageList<UploadFile> page) {
		int pageSize=page.getPageSize();
		int pageNum=(page.getCurPage()-1)*pageSize;
		page.setList(uploadFileDao.findFileInfo(dto,pageNum,pageSize));
		page.setTotalCount(uploadFileDao.findFileCount(dto));
		return page;
	}

	@Override
	public List<UploadFile> queryAllUploadFiles(Map<String, Object> condition,
			PageList<UploadFile> page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

	
}
