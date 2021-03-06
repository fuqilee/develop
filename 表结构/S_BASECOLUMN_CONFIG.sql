/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.3.0

Source Server         : oracle_13
Source Server Version : 110200
Source Host           : 192.168.0.6:1521
Source Schema         : FWTX_ZZZB

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2018-11-15 09:16:59
*/


-- ----------------------------
-- Table structure for S_BASECOLUMN_CONFIG
-- ----------------------------
DROP TABLE "FWTX_ZZZB"."S_BASECOLUMN_CONFIG";
CREATE TABLE "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" (
"ID" NUMBER NOT NULL ,
"TABLEID" NUMBER NULL ,
"COLUMNNAME" VARCHAR2(100 CHAR) NULL ,
"COLUMNENAME" VARCHAR2(100 CHAR) NULL ,
"ISNULL" NUMBER DEFAULT 1  NULL ,
"ISEQUAL" NUMBER DEFAULT 0  NULL ,
"ISSYSTEM" NUMBER DEFAULT 0  NULL ,
"DATATYPE" VARCHAR2(15 CHAR) NULL ,
"MATCHINFO" VARCHAR2(500 CHAR) NULL ,
"ALERTINFO" VARCHAR2(255 CHAR) NULL ,
"ISFIND" NUMBER DEFAULT 0  NULL ,
"ORDERNUM" NUMBER NULL ,
"MENUTYPE" VARCHAR2(600 CHAR) NULL ,
"DISTYPE" NUMBER DEFAULT 0  NULL ,
"ISDISPLAY" NUMBER DEFAULT 1  NULL ,
"FINDDISPLAY" NUMBER DEFAULT 0  NULL ,
"FINDORDERNUM" NUMBER DEFAULT 0  NULL ,
"MODIFYDISPLAY" NUMBER DEFAULT 1  NULL ,
"ADDDISPLAY" NUMBER NULL ,
"DISCONTENT" VARCHAR2(2000 CHAR) NULL ,
"DELFLAG" NUMBER NULL ,
"CREATETIME" TIMESTAMP(0)  NULL ,
"CREATOR" VARCHAR2(100 CHAR) NULL ,
"UPDATETIME" TIMESTAMP(0)  NULL ,
"UPDATOR" VARCHAR2(100 CHAR) NULL ,
"ISKEY" NUMBER DEFAULT 0  NULL ,
"STRINGLENGTH" VARCHAR2(10 CHAR) NULL ,
"ISLEAF" VARCHAR2(10 CHAR) NULL ,
"PID" VARCHAR2(50 CHAR) NULL ,
"CONTENTJS" VARCHAR2(1000 CHAR) NULL ,
"NM" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ID" IS '主键ID';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."TABLEID" IS '配置表ID';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."COLUMNNAME" IS '配置字段中文名';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."COLUMNENAME" IS '配置字段英文名';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ISNULL" IS '是否为空 1-是；0-否';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ISEQUAL" IS '是否允许重复 1-是【代表不能重复】；0-否  【代表可以重复】';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ISSYSTEM" IS '是否为系统字段，系统字段不需要手动录入 0-否；1-是';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."DATATYPE" IS '字段类型 S-字符串；L-长整型；I-整形；D-浮点类型；T-时间；TD-日期;M-枚举';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."MATCHINFO" IS '正则表达式';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ALERTINFO" IS '如果不符合规则，给出提示信息';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ISFIND" IS '允许为查询条件：0-否，1-是';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ORDERNUM" IS '排列顺序';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."MENUTYPE" IS '枚举类型设置内容；';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."DISTYPE" IS '展示类型：0-文本框，1-文本域，2-枚举，3-复选框，4-其他';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ISDISPLAY" IS '是否显示：0-否，1-是';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."FINDDISPLAY" IS '查询时是否显示 0-否，1-是';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."FINDORDERNUM" IS '查询界面的排列顺序';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."MODIFYDISPLAY" IS '修改时是否显示 0-否 ，1-是';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ADDDISPLAY" IS '新增时是否显示 0-否，1-是';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."DISCONTENT" IS '自定义内容(自定义展示内容)';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."DELFLAG" IS '删除标志';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."CREATETIME" IS '创建时间';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."CREATOR" IS '创建人';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."UPDATETIME" IS '更新时间';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."UPDATOR" IS '更新人';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."ISKEY" IS '是否为主键：0不为主键，1为主键';
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASECOLUMN_CONFIG"."NM" IS '内码';

-- ----------------------------
-- Table structure for S_BASETABLE_CONFIG
-- ----------------------------
DROP TABLE "FWTX_ZZZB"."S_BASETABLE_CONFIG";
CREATE TABLE "FWTX_ZZZB"."S_BASETABLE_CONFIG" (
"ID" NUMBER NOT NULL ,
"TABLENAME" VARCHAR2(255 BYTE) NULL ,
"TABLEENAME" VARCHAR2(255 BYTE) NULL ,
"DELFLAG" NUMBER NOT NULL ,
"CREATETIME" TIMESTAMP(6)  NULL ,
"CREATOR" VARCHAR2(100 BYTE) NULL ,
"UPDATETIME" TIMESTAMP(6)  NULL ,
"UPDATOR" VARCHAR2(100 BYTE) NULL ,
"NM" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "FWTX_ZZZB"."S_BASETABLE_CONFIG"."NM" IS '内码';

-- ----------------------------
-- Table structure for S_MANAGER_SQLINFO
-- ----------------------------
DROP TABLE "FWTX_ZZZB"."S_MANAGER_SQLINFO";
CREATE TABLE "FWTX_ZZZB"."S_MANAGER_SQLINFO" (
"ID" NUMBER NULL ,
"SQLTITLE" VARCHAR2(255 BYTE) NULL ,
"SQLNAME" VARCHAR2(50 BYTE) NULL ,
"SQLWHERECOLUMN" VARCHAR2(500 BYTE) DEFAULT ''  NULL ,
"ORDERBY" VARCHAR2(255 BYTE) DEFAULT ''  NULL ,
"SQLCONTENT" VARCHAR2(2000 BYTE) NULL ,
"IMAGE" VARCHAR2(100 BYTE) NULL ,
"DELFLAG" NUMBER NULL ,
"CREATETIME" TIMESTAMP(6)  NULL ,
"CREATOR" VARCHAR2(100 BYTE) NULL ,
"UPDATETIME" TIMESTAMP(6)  NULL ,
"UPDATOR" VARCHAR2(100 BYTE) NULL ,
"NM" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "FWTX_ZZZB"."S_MANAGER_SQLINFO"."ID" IS '主键ID';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MANAGER_SQLINFO"."SQLTITLE" IS '方法名称';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MANAGER_SQLINFO"."SQLNAME" IS 'SQL名称 以此名称来查询唯一的sql';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MANAGER_SQLINFO"."SQLWHERECOLUMN" IS 'where语句中的字段值，用json串的方式存放起来';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MANAGER_SQLINFO"."ORDERBY" IS '排序字段';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MANAGER_SQLINFO"."SQLCONTENT" IS 'SQL内容';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MANAGER_SQLINFO"."IMAGE" IS '方法对应模块截图';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MANAGER_SQLINFO"."NM" IS '内码';

-- ----------------------------
-- Table structure for S_MODAL_TYPE
-- ----------------------------
DROP TABLE "FWTX_ZZZB"."S_MODAL_TYPE";
CREATE TABLE "FWTX_ZZZB"."S_MODAL_TYPE" (
"NM" VARCHAR2(32 BYTE) NOT NULL ,
"MKLX" VARCHAR2(50 BYTE) NULL ,
"MKMC" VARCHAR2(100 BYTE) NULL ,
"ISLEAF" VARCHAR2(5 BYTE) NULL ,
"XH" NUMBER NULL ,
"PID" NUMBER NULL ,
"DWMC" VARCHAR2(50 BYTE) NULL ,
"XWM" VARCHAR2(50 BYTE) NULL ,
"USERID" VARCHAR2(50 BYTE) NULL ,
"BDNM" VARCHAR2(50 BYTE) NULL ,
"YWMC" VARCHAR2(50 BYTE) NULL ,
"TBNAME" VARCHAR2(50 BYTE) NULL ,
"CONTENT" VARCHAR2(3000 BYTE) NULL ,
"BELONGMODAL" VARCHAR2(50 BYTE) NULL ,
"DISJS" VARCHAR2(500 BYTE) NULL ,
"SAVEJB" VARCHAR2(10 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."NM" IS '内码';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."MKLX" IS '模块类型';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."MKMC" IS '模块名称';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."ISLEAF" IS '是否为叶子节点 1是；0否';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."XH" IS '序号';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."PID" IS '父节点';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."DWMC" IS '单位名称';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."XWM" IS '席位名称';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."USERID" IS '登录ID';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."BDNM" IS '部队内码';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."YWMC" IS '英文名称';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."TBNAME" IS '对应表名';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."CONTENT" IS 'html内容';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."BELONGMODAL" IS '所属模板类型';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."DISJS" IS 'JS展示';
COMMENT ON COLUMN "FWTX_ZZZB"."S_MODAL_TYPE"."SAVEJB" IS '保存级别 1 主表 ；2-子单信息 ；3-子多信息';

-- ----------------------------
-- Indexes structure for table S_BASECOLUMN_CONFIG
-- ----------------------------

-- ----------------------------
-- Checks structure for table S_BASECOLUMN_CONFIG
-- ----------------------------
ALTER TABLE "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" ADD CHECK ("NM" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table S_BASECOLUMN_CONFIG
-- ----------------------------
ALTER TABLE "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" ADD PRIMARY KEY ("NM");

-- ----------------------------
-- Indexes structure for table S_BASETABLE_CONFIG
-- ----------------------------

-- ----------------------------
-- Checks structure for table S_BASETABLE_CONFIG
-- ----------------------------
ALTER TABLE "FWTX_ZZZB"."S_BASETABLE_CONFIG" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "FWTX_ZZZB"."S_BASETABLE_CONFIG" ADD CHECK ("DELFLAG" IS NOT NULL);
ALTER TABLE "FWTX_ZZZB"."S_BASETABLE_CONFIG" ADD CHECK ("NM" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table S_BASETABLE_CONFIG
-- ----------------------------
ALTER TABLE "FWTX_ZZZB"."S_BASETABLE_CONFIG" ADD PRIMARY KEY ("NM");

-- ----------------------------
-- Indexes structure for table S_MANAGER_SQLINFO
-- ----------------------------

-- ----------------------------
-- Checks structure for table S_MANAGER_SQLINFO
-- ----------------------------
ALTER TABLE "FWTX_ZZZB"."S_MANAGER_SQLINFO" ADD CHECK ("NM" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table S_MANAGER_SQLINFO
-- ----------------------------
ALTER TABLE "FWTX_ZZZB"."S_MANAGER_SQLINFO" ADD PRIMARY KEY ("NM");

-- ----------------------------
-- Indexes structure for table S_MODAL_TYPE
-- ----------------------------

-- ----------------------------
-- Checks structure for table S_MODAL_TYPE
-- ----------------------------
ALTER TABLE "FWTX_ZZZB"."S_MODAL_TYPE" ADD CHECK ("NM" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table S_MODAL_TYPE
-- ----------------------------
ALTER TABLE "FWTX_ZZZB"."S_MODAL_TYPE" ADD PRIMARY KEY ("NM");
