package com.orgweb.entitydto;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class UserInfo  implements Serializable{
	private static final long serialVersionUID = 2917210383547487486L;

	//id
	private long id;
	//用户ID
	private String userId;
	//上报期次
	private String period;
	//用户类型。1：企业，2：个人
	private String userType;
	//所属平台id
	private long platformId;
	//用户名或昵称
	private String nickname;
	//真实姓名
	private String name;
	//年龄
	private int age;
	//身份证号
	private String idCardNumber;
	//手机号码
	private String phone;
	//邮箱
	private String email;
	//推荐人手机
	private String recommendedPhone;
	//注册时间。yyyy-mm-dd hh:mm:ss
	private Timestamp registrationTime;
	//性别。男、女
	private String gender;
	//国籍。中国、外国
	private String nationality;
	//民族。56个民族加其他
	private String nation;
	//生日
	private Date birthday;
	//常住所在地（省）
	private String permanentProvince;
	//常住所在地（市）
	private String permanentCity;
	//详细地址
	private String address;
	//风险偏好 1,高风险 2,低风险
	private String riskLover;
	//婚姻状况。1未婚、2已婚、3离异
	private String maritalStatus;
	//购房情况。1有、0无
	private String houSesituation;
	//购车情况。1有、0无
	private String carSesituation;
	//文化程度。1小学、2初中、3高中、4大专、5本科、6硕士、7博士
	private String educationDegree;
	//企业名称
	private String enterpriseName;
	//组织机构代码
	private String organizationCode;
	//工商注册号
	private String egistrationNumber;
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
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public long getPlatformId() {
		return platformId;
	}
	public void setPlatformId(long platformId) {
		this.platformId = platformId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getIdCardNumber() {
		return idCardNumber;
	}
	public void setIdCardNumber(String idCardNumber) {
		this.idCardNumber = idCardNumber;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRecommendedPhone() {
		return recommendedPhone;
	}
	public void setRecommendedPhone(String recommendedPhone) {
		this.recommendedPhone = recommendedPhone;
	}
	public Timestamp getRegistrationTime() {
		return registrationTime;
	}
	public void setRegistrationTime(Timestamp registrationTime) {
		this.registrationTime = registrationTime;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPermanentProvince() {
		return permanentProvince;
	}
	public void setPermanentProvince(String permanentProvince) {
		this.permanentProvince = permanentProvince;
	}
	public String getPermanentCity() {
		return permanentCity;
	}
	public void setPermanentCity(String permanentCity) {
		this.permanentCity = permanentCity;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRiskLover() {
		return riskLover;
	}
	public void setRiskLover(String riskLover) {
		this.riskLover = riskLover;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getHouSesituation() {
		return houSesituation;
	}
	public void setHouSesituation(String houSesituation) {
		this.houSesituation = houSesituation;
	}
	public String getCarSesituation() {
		return carSesituation;
	}
	public void setCarSesituation(String carSesituation) {
		this.carSesituation = carSesituation;
	}
	public String getEducationDegree() {
		return educationDegree;
	}
	public void setEducationDegree(String educationDegree) {
		this.educationDegree = educationDegree;
	}
	public String getEnterpriseName() {
		return enterpriseName;
	}
	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}
	public String getOrganizationCode() {
		return organizationCode;
	}
	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}
	public String getEgistrationNumber() {
		return egistrationNumber;
	}
	public void setEgistrationNumber(String egistrationNumber) {
		this.egistrationNumber = egistrationNumber;
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
}
