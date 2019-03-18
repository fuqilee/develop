package com.orgweb.entitydto;

import java.io.Serializable;
import java.sql.*;

import lombok.Getter;
import lombok.Setter;

/**
 * @author lee
 * 2017年4月5日
 */
@Setter
@Getter
public class UploadFile implements Serializable{
	private static final long serialVersionUID = 5997790866792661241L;
	//附件id
	private long fileId;
	//主体ID
	private long bodyId;
	public long getFileId() {
		return fileId;
	}
	public void setFileId(long fileId) {
		this.fileId = fileId;
	}
	public long getBodyId() {
		return bodyId;
	}
	public void setBodyId(long bodyId) {
		this.bodyId = bodyId;
	}
	public long getPlatformId() {
		return platformId;
	}
	public void setPlatformId(long platformId) {
		this.platformId = platformId;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(int delFlag) {
		this.delFlag = delFlag;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public String getUpdator() {
		return updator;
	}
	public void setUpdator(String updator) {
		this.updator = updator;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	//平台id
	private long platformId;
	//平台期次
	private String period;
	//附件名称
	private String newFileName;
	//附件名称
	private String fileName;
	//附件类型。1：风控制度；2：信息披露制度；3：合规委员会文件；4：资金托管协议；5：第三方支付合作协议；6：企业征信报告；7：个人征信报告
	private String type;
	//文件类型。图片、文件、视频
	private String fileType;
	//存放位置
	private String location;
	//备注
	private String memo;
	//
	private int delFlag;
	//
	private Timestamp createTime;
	//
	private String creator;
	//
	private Timestamp updateTime;
	//
	private String updator;
	
}


