package com.orgweb.entitydto;

import java.io.Serializable;
import java.sql.*;

import lombok.Getter;
import lombok.Setter;

//
/**
 * 
 * @author lee
 * 2016年9月19日
 */
@Setter
@Getter
public class TableInfoColumn implements Serializable{
	private static final long serialVersionUID = 5997790866792661241L;

	//主键ID
	private int id;
	//配置表ID
	private int tableid;
	//配置字段中文名
	private String columnname;
	//配置字段英文名
	private String columnename;
	//是否为空 1-是；0-否
	private int isNull;
	//是否允许重复1-是；0-否
	private int isEqual;
	//是否为系统字段，系统字段不需要手动录入
	private int isSystem;
	//字段类型 S-字符串；L-长整型；I-整形；D-浮点类型；T-时间；TD-日期;M-枚举
	private String dataType;
	//正则表达式
	private String matchInfo;
	//如果不符合规则，给出提示信息
	private String alertInfo;
	//枚举类型设置内容；
	private String menuType;
	//删除标志
	private int delFlag;
	//创建时间
	private Timestamp createTime;
	//创建人
	private String creator;
	//更新时间
	private Timestamp updateTime;
	//更新人
	private String updator;
	//允许为查询条件：0-否，1-是
	private int isFind;
	//允许为查询条件：0-否，1-是
	private int findDisplay;
	//字段排序条件
	private int orderNum;
	//显示类型
	private int disType;
	//显示的内容
	private String disContent;
	//内码
	private String nm;

	public String getNm() {
		return nm;
	}


	public void setNm(String nm) {
		this.nm = nm;
	}
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getTableid() {
		return tableid;
	}


	public void setTableid(int tableid) {
		this.tableid = tableid;
	}


	public String getColumnname() {
		return columnname;
	}


	public void setColumnname(String columnname) {
		this.columnname = columnname;
	}


	public String getColumnename() {
		return columnename;
	}


	public void setColumnename(String columnename) {
		this.columnename = columnename;
	}


	public int getIsNull() {
		return isNull;
	}


	public void setIsNull(int isNull) {
		this.isNull = isNull;
	}


	public Integer getIsEqual() {
		return isEqual;
	}


	public void setIsEqual(Integer isEqual) {
		this.isEqual = isEqual;
	}


	public int getIsSystem() {
		return isSystem;
	}


	public void setIsSystem(int isSystem) {
		this.isSystem = isSystem;
	}


	public String getDataType() {
		return dataType;
	}


	public void setDataType(String dataType) {
		this.dataType = dataType;
	}


	public String getMatchInfo() {
		return matchInfo;
	}


	public void setMatchInfo(String matchInfo) {
		this.matchInfo = matchInfo;
	}


	public String getAlertInfo() {
		return alertInfo;
	}


	public void setAlertInfo(String alertInfo) {
		this.alertInfo = alertInfo;
	}


	public String getMenuType() {
		return menuType;
	}


	public void setMenuType(String menuType) {
		this.menuType = menuType;
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


	public int getIsFind() {
		return isFind;
	}


	public void setIsFind(int isFind) {
		this.isFind = isFind;
	}


	public int getFindDisplay() {
		return findDisplay;
	}


	public void setFindDisplay(int findDisplay) {
		this.findDisplay = findDisplay;
	}


	public int getOrderNum() {
		return orderNum;
	}


	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}


	public int getDisType() {
		return disType;
	}


	public void setDisType(int disType) {
		this.disType = disType;
	}


	public String getDisContent() {
		return disContent;
	}


	public void setDisContent(String disContent) {
		this.disContent = disContent;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return  "ExcelColumn ["
			+ "Id = " + getId() + ","
			+ "Tableid = " + getTableid() + ","
			+ "Columnname = " + getColumnname() + ","
			+ "Columnename = " + getColumnename() + ","
			+ "IsNull = " + getIsNull() + ","
			+ "IsSystem = " + getIsSystem() + ","
			+ "DataType = " + getDataType() + ","
			+ "MatchInfo = " + getMatchInfo() + ","
			+ "AlertInfo = " + getAlertInfo() + ","
			+ "MenuType = " + getMenuType() + ","
			+ "DelFlag = " + getDelFlag() + ","
			+ "CreateTime = " + getCreateTime() + ","
			+ "Creator = " + getCreator() + ","
			+ "UpdateTime = " + getUpdateTime() + ","
			+ "Updator = " + getUpdator() + ","
		+"]";
	}
	
}


