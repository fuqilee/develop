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

Date: 2018-11-15 09:17:24
*/


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
