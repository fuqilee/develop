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

Date: 2018-11-15 09:17:12
*/


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
