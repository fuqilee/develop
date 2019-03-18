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

Date: 2018-11-15 09:20:58
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
-- Records of S_BASECOLUMN_CONFIG
-- ----------------------------
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('186', '34', '项目名称', 'projectName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A4D0DAC9BCFE48C39346A3D7B566E690');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('187', '34', '年化利率', 'annualRate', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9CC7500A7A1A43168BB8177DAB048B54');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('188', '34', '借款金额', 'borrowAmount', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C94E54A9AE944F93B5BED883243E5ED4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('189', '34', '是否逾期0-未逾期；1-逾期', 'isOverdue', '1', null, '0', 'M', null, null, '0', '0', '{0:''未逾期'',1:''逾期''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '67FAEB91DC094B3EA90F70C399EA10ED');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('190', '34', '是否坏账0-否；1-是', 'isBadDebt', '1', null, '0', 'M', null, null, '0', '0', '{0:''否',1:''是'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4F3CD95BBFF849DC9FB462E054BDC985');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('191', '34', '逾期或坏账金额', 'overdueOrBadDebt', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7FC070655BCA48F7B3B6FCC95D470FBD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('192', '34', '是否结清0-否；1-是', 'isSquare', '1', null, '0', 'M', null, null, '0', '0', '{0:''否',1:''是'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A0F416DF45544DA4BE76A8372B79CD6D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('193', '19', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '24B7D9848CA94CF3B9439BFAF06127EC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('194', '19', '姓名', 'name', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '58D89734F96B47CBBA01CEEF494636CE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('195', '19', '性别。 男 、女', 'sex', '1', null, '0', 'M', null, null, '0', '0', '{''男':''1'', ''女':''2''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C1789D1687B54EFFB866BD03D731BCE7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('196', '19', '身份证号', 'idNumber', '1', '1', '0', null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhaosdb', '0', null, null, null, null, '5FDADF6B1D5C4199ACD55CC1774669E3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('197', '19', '出生年月', 'birthday', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E8A3C0B5D7E74AA49C6F6B796A1F2015');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('198', '19', '学历。1小学、2初中、3高中、4大专、5本科、6硕士、7博士', 'degree', '1', null, '0', 'M', null, null, '0', '0', '{''1'':''小学'',''2'':''初中'',''3'':''高中'',''4'':''大专'',''5'':''本科'',''6'':''硕士'',''7'':''博士''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E9AC7A38F7324971BA53A5DB671E829D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('199', '19', '专业', 'profession', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3D325D7AC7E94EF29AC17AD602E5672F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('183', '29', '凭证号', 'certificateNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '820928A31BA54A76AECF09ACA232625C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('184', '29', '流水号', 'serialNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EAC31A49662F4E3E8E9B1039798A1048');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('200', '19', '婚姻情况.未婚、已婚、离异', 'marriage', '1', null, '0', 'M', null, null, '0', '0', '{''未婚'':''1'',''已婚'':''2'',''离异'':''3''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BB5D5FCE50B446C69C3D72FB53827DA7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('201', '19', '政治面貌', 'politicalStatus', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1767C9D72ED64E64876FBE6746D97754');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('202', '19', '所在部门', 'department', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FB9CACDEFA5A47C6A4037AFDDAB9CE26');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('203', '19', '担任职务', 'position', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F28E9CD92B294FB586A9AB181BDDA127');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('204', '19', '入职时间.yyyy-mm-dd', 'entryTime', '1', null, '0', 'TD', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7BCE09B6CDBF490387A592C4BA911E5A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('205', '19', '业务职能类型。行政、技术、风控、财务', 'workType', '1', null, '0', 'M', null, null, '0', '0', '{''行政'':''1'',''技术':''1'',''风控'':''1'',''财务'':''1''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A282D6A82A654C069FF65AD95ACC70AF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('206', '19', '人员类型。0员工、1法人、2董监高、3实际控制人', 'type', '1', null, '0', 'M', null, null, '0', '0', '{''0'':''员工'',''1'':''法人'',''2'':''董监高',''3'':''实际控制人'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EE54DA1435F948D7A12CF4F037CBD7BE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('207', '19', '户籍所在地', 'address', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '859ACBF458EC49379594DE3D8A0B3CA2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('208', '19', '电话号码', 'phoneNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4B1FCFC39F704952A24553BCB41D9F06');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('209', '19', '所属平台id', 'platformId', '1', null, '1', null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '22BB8AE8A9ED455D9A43DEC68FB32C29');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('210', '19', '企业id', 'enterpriseInfoId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6543AF200CA645ECB8231EDB8A2732A6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('211', '19', '是否会计师（是-1；否-0）', 'isAccountant', '1', null, '0', 'M', null, null, '0', '0', '{''0'':''否',''1'':''是'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '51C494B11A814B87BC3EBE6F28E8E2DF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('212', '19', '会计证号', 'accountantId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A27621CF27C944C3A8A889C321E96A7E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('213', '19', '风控人员资质（FRM） 有-1；无-0', 'FRMCertificate', '1', null, '0', 'M', null, null, '0', '0', '{''0'':''否',''1'':''是'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8C5EEABA99B44788BC436CB47A8699AD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('214', '19', '风控人员资质（PRM）有-1；无-0', 'PRMCertificate', '1', null, '0', 'M', null, null, '0', '0', '{''0'':''否',''1'':''是'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CEBC074C725D4B589F9F4B7264DE0E13');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('215', '19', '该领域从业年限', 'workingYear', '1', null, '0', 'I', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1445A899518B412EB272BDD58EA96AEF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('216', '41', '对应期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D7BE426C914547E5AD3140B83F3F0422');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('217', '41', '平台id', 'platformId', '1', null, '1', 'S', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '082EED5C308E4AD2B2745F40E7ECCE3F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('218', '41', '机构名称', 'branchName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F04F6AEA86394D399CEAD0F0254CE851');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('219', '41', '地址', 'address', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A63EFBC7C2CB4D8F8BA2683224EDFF8A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('220', '41', '负责人', 'linkPerson', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A1BF80914E564BCE929119126973EF21');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('221', '41', '联系电话', 'linkNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F62D23FBC88547728D6699768F15079F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('222', '41', '工商注册号', 'registNumber', '1', null, '0', 'L', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhaosdb', '0', null, null, null, null, 'E5679C069DD74D5586E93F437F1060BC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('223', '41', '机构代码', 'branchCode', '1', null, '0', 'L', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhaosdb', '0', null, null, null, null, '3485C22344AE4CBCA43596E64F741DD6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('224', '41', '经营项目', 'businessDesc', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BF2E32953C364938879D791EA1C77BAE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('225', '42', null, 'nodatacolumn', '1', null, '0', null, null, null, '0', '0', null, '4', '0', '1', '0', '1', '1', '''<span class="" style="font-size: 14px;font-weight: 900;">企业信息</span>''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2BF02C3372524B248122E5889367FF37');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('226', '42', '平台ID', 'platformid', '0', '1', '1', null, null, null, '1', '1', null, '0', '0', '0', '0', '0', '0', '''<input type="text" class="fs_inptxt" id="''+citem.columnename+''"  name="''+citem.columnename+''" value="''+value+''" />''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1E668920914443B28230A3B94ABCD6A0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('227', '42', '企业名称', 'enterpriseName', '1', '0', '0', '1', null, null, '0', '1', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '565B804FB2A24FD59323EAC36A68610B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('228', '42', '统一社会信用代码', 'creditNum', '1', null, '0', null, null, null, '0', '2', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8ACC6A3ECE9E446480306CBFE075F38A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('229', '42', '工商注册号', 'regCode', '1', '0', '0', '1', null, null, '0', '3', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F4EF650EA80B4DE1BCBF32FFBFC6F0BF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('230', '42', '组织机构代码', 'organizationCode', '1', '0', '0', '1', null, null, '0', '4', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F3EF3DBA516B4CFE93370FF27125DD80');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('231', '42', '税务登记', 'taxCode', '1', '0', '0', '1', null, null, '0', '5', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '02616A0ECC714235ACD978A5596088B8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('232', '42', '注册资本(万元）', 'regCapital', '1', '0', '0', 'C', null, null, '0', '6', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '40CA4C52383B41ACBC72651E8A70FC6D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('233', '42', '注资背景', 'capitalBackground', '1', '0', '0', '1', null, null, '0', '6', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CB1D32AC53FE483AA223ED9B129240A3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('234', '42', '实缴注册资本', 'paidupCapital', '1', '0', '0', 'C', null, null, '0', '7', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2AB00562E7A443B19448BC305724D2E0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('235', '42', '法定代表人', 'legalPerson', '1', '0', '0', '1', null, null, '0', '7', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '24CAA4C08F444879813BBEE91981EBB7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('236', '42', '企业成立时间', 'establishingDate', '1', '0', '0', 'TD', null, null, '0', '8', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C3E4FFB2E9BA4C9C80B37C89FC492EBD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('268', '43', '政治面貌', 'politicalStatus', '1', '0', '0', 'M', null, null, '0', '11', '{''1'':''群众'',''2'':''中共团员'',''3'':''中共党员'',''4'':''中共预备党员'',''5'':''其他''}', null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0645C7ED4B444B70B50D079EED53D0E7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('269', '43', '所在部门', 'department', '1', '0', '0', '1', null, null, '0', '11', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9BD90DEAE86E4A5888DD6CB6DAB1B2F4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('270', '43', '担任职务', 'position', '0', '0', '0', '1', null, null, '0', '12', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0C573C3DEA2A46BC96D2E0F9C35DFF0A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('271', '43', '入职时间', 'entryTime', '0', '0', '0', 'TD', null, null, '0', '13', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5C872728C7074494A57DA40A910DC4F6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('272', '43', '业务职能类型', 'workType', '0', '0', '0', 'M', null, null, '1', '14', '{''1'':''行政'',''2'':''技术',''3'':''风控'',''4'':''财务''}', null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2C0F37E11AF6420AB503BBFEF3E11856');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('273', '43', '人员类型', 'type', '0', '0', '0', 'M', null, null, '1', '10', '{''1'':''法人'',''2'':''董监高'}', null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0AD35BF79A5647158A08BF99C3CEA5A7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('274', '43', '所属平台id', 'platformId', '0', '0', '0', null, null, null, '0', '1', null, null, '1', '0', '0', '0', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B997745EE6414BF7839331B63C3D5183');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('275', '20', '所属平台id', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0859D59904D542C8927E966E2066D71B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('276', '20', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FB398DE0F27A41228CDCC4A5EE08F3DE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('277', '20', '合作机构名称', 'cooperationOrg', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '84F454DE022C4FEAAF99593F620C9826');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('278', '20', '组织机构代码', 'orgCode', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1889D7328C454421BD3C0228871A385A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('279', '20', '工商注册号', 'registrationNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5E6FFE96D8F54FAC8C68C91B4B8AEEC6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('280', '20', '合作机构类型', 'cooperationType', '1', '1', '0', 'M', null, null, '0', '0', '{''1'':''担保公司'',''2'':''审计公司'',''3'':''系统提供商',''4'':''律师事务所'',''5'':''其他''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, '04F8579A29D44E24BE039FD17487241A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('281', '20', '法人代表身份证号码', 'legalIDNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1FA84F8437344E079D4C3C0605D10153');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('282', '44', '上报期次', 'period', '1', '0', '1', null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9B370035D1524AC485BC3C47B21530DD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('283', '44', '姓名', 'name', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8EB138417C9642C3BDE9B9F4DAF5B53A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('284', '44', '性别', 'sex', '1', '0', '0', 'M', null, null, '0', '0', '{''1'':''男', ''2'':''女'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'aa1', '0', null, null, null, null, '55A00386DA50414097C0422A0FE87B2B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('237', '42', '公司类型', 'enterpriseType', '1', '0', '0', 'M', null, null, '0', '9', '{''1'':''国有企业'',''2'':''集体企业'',''3'':''股份合作企业'',''4'':''国有联营企业'',''5'':''集体联营企业'',''6'':''国有与集体联营企业',''7'':''其他联营企业'',''8'':''国有独资公司'',''9'':''有限责任公司'',''10'':''股份有限公司'',''11'':''私营企业'',''12'':''港、澳、台商独资经营企业',''13'':''港、澳、台商投资股份有限公司',''14'':''港、澳、台商合资经营企业',''15'':''港、澳、台商合作经营企业',''16'':''中外合资经营企业'',''17'':''中外合作经营企业'',''18'':''外资企业'',''19'':''外商投资股份有限公司'',''20'':''其他企业'',''21'':''个体户',''22'':''个人合伙''}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A0DFEDE69B954DF58306C96D0595E7CD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('238', '42', '营业期限开始时间', 'busnissBegin', '1', '0', '0', 'T', null, null, '0', '10', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5ABA7B9860744575A3B644FF2DCED408');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('239', '42', '营业期限结束时间', 'busnissEnd', '1', '0', '0', 'T', null, null, '0', '11', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A906A2E9B2EB42CB9DEFDE75EE6417D9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('240', '42', '所在省', 'province', '1', null, '0', null, null, null, '0', '12', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'AB622C6E503444C78648D8033FFA8D57');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('241', '42', '所在市', 'city', '1', null, '0', null, null, null, '0', '13', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F20018F1C82644C386BD38B3937AB7A8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('242', '42', '经营地址', 'addr', '1', '0', '0', '1', null, null, '0', '14', null, '1', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2D3B3CA92099442D925031BC1467D5E5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('243', '42', '经营范围', 'businessScope', '1', '0', '0', '1', null, null, '0', '15', null, '1', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B6AD2EE1F3DA488080EAC9524C8720BB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('244', '42', null, 'nodatacolumn', '1', null, '0', null, null, null, '0', '15', null, '4', '0', '1', '0', '1', '1', '''<span style="font-size: 14px;font-weight: 900;">平台信息</span>''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BA5B130992B949F0941A5B218433293E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('245', '42', '平台名称', 'platformName', '0', '0', '0', null, null, null, '0', '16', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '33FBBEA083D14C96A76F6BDBE9E85BA8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('246', '42', '平台简称', 'platformShortName', '1', '0', '0', '1', null, null, '0', '17', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DE8B8AC209EC4E44888113A5ECFFD2A1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('247', '42', '平台介绍', 'content', '1', '0', '0', '1', null, null, '0', '17', null, '1', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5613889B0B6248A1A44AC8F1CBC76640');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('248', '42', '平台类型', 'platformType', '0', '0', '0', 'M', null, null, '1', '18', '{''1'':''p2p'',''2'':''众筹'',''3'':''第三方支付',''4'':''其他''}', '0', '1', '1', '0', null, null, '{''1'':''p2p'',''2'':''众筹'',''3'':''第三方支付',''4'':''其他''}', '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, 'D8DD50D9FC7648F0B2A8D1CB28E1280E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('249', '42', '主营业务', 'business', '1', '0', '0', '1', null, null, '0', '18', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '644A3F5A180742EA8DC516AFEF36F7B1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('250', '42', '上线运营日期', 'onlineDate', '1', '0', '0', 'TD', null, null, '1', '19', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2A51A83E73234285B3A35C5FC60C09DD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('251', '42', '监管等级', 'supervisionLevel', '1', '0', '0', 'M', null, null, '0', '19', '{''1'':''一般监管',''2'':''重点监管'',''3'':''暂不关注''}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CBBC541D41434C8793ED38B9E22C11DA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('252', '42', '在金融办是否备案', 'isRecorded', '1', '0', '0', 'M', null, null, '0', '20', '{''1'':''是',''0'':''否'}', '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B6FEEA67750F44B1802C2E57AA5A9AEA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('253', '42', '备案日期', 'recordDate', '1', '0', '0', 'TD', null, null, '0', '20', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A45446C4C7014227BD0A5996466FF15C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('254', '42', '备案机构', 'recordOrganization', '1', null, '0', null, null, null, '0', '20', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BFB864AB85B2496F914E95C8EEA27DD9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('255', '42', '备案编号', 'recordCode', '1', null, '0', null, null, null, '0', '20', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '52F079005E954DD8BD29962440281D55');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('256', '42', '平台访问地址', 'url', '1', '0', '0', '1', null, null, '0', '21', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '63FE5170B8A8411A95A12EC6F0AED5B9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('257', '42', 'icp备案号', 'icp', '1', null, '0', null, null, null, '0', '22', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'zhaosdb', '0', null, null, null, null, '5108871F14C34760A39A3AAED254ABA7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('258', '42', 'icp经营许可号', 'icpManageNum', '1', null, '0', null, null, null, '0', '23', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'zhaosdb', '0', null, null, null, null, '6F8C2AD2FDF24AD5B273F1C17BF2618E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('259', '42', '平台状态', 'status', '0', '0', '0', 'M', null, null, '0', '25', '{''0'':''在营/存续'',''1'':''注销'',''2'':''吊销''}', '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '03AF0802370649BFA1CECF00779379F5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('260', '43', '对应期次', 'period', '1', '0', '0', null, null, null, '0', '16', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EF28949208DC4323843F1BD3C5ED8F0A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('261', '43', '姓名', 'name', '0', '0', '0', null, null, null, '0', '3', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '19BDE2D1F3F5466483481918F4786928');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('262', '43', '性别', 'sex', '0', '0', '0', 'M', null, null, '0', '4', '{''1'':''男', ''2'':''女'}', null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'aa1', '0', null, null, null, null, '258B71668E5F4B9EA8FA90DDC3F6CC7B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('263', '43', '身份证号', 'idNumber', '0', '0', '0', 'S', null, null, '0', '5', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B6C1F053972C4CB68F71CBB97B209579');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('264', '43', '出生年月', 'birthday', '0', '0', '0', '1', '^\d{4}(0[1-9]|10|1[1-2])$', '字段【出生年月】必须为【yyyyMM】格式，例如：198512 ', '0', '6', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1D852B4553B64F3B95C2AC27317CB057');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('265', '43', '学历', 'degree', '0', '0', '0', 'M', null, null, '0', '7', '{''1'':''小学'',''2'':''初中'',''3'':''高中'',''4'':''大专'',''5'':''本科'',''6'':''硕士'',''7'':''博士''}', null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BBB8EA3B3E2B4C2BB9CC4FAEC9CE26E8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('266', '43', '专业', 'profession', '0', '0', '0', '1', null, null, '0', '8', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2DEBF89D9C8B421CB652E5E114C65A35');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('267', '43', '婚姻情况', 'marriage', '0', '0', '0', 'M', null, null, '0', '9', '{''1'':''未婚'',''2'':''已婚'',''3'':''离异''}', null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D9E9D7118352455891B817EB8F928589');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('285', '44', '身份证号', 'idNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '27425AB06ED14EC7B7315EB31B4202C2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('286', '44', '出生年月', 'birthday', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '902F73B1E4124770B133C18C733DA076');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('287', '44', '学历', 'degree', '1', '0', '0', 'M', null, null, '0', '0', '{''1'':''小学'',''2'':''初中'',''3'':''高中'',''4'':''大专'',''5'':''本科'',''6'':''硕士'',''7'':''博士''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, '7544EA053EE840B6906A90AC95FA05E8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('288', '44', '专业', 'profession', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2678AE31666746A9805B221C835B99FC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('289', '44', '婚姻情况', 'marriage', '0', '0', '0', 'M', null, null, '0', '0', '{''1'':''未婚'',''2'':''已婚'',''3'':''离异''}', '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, '776AC960CDC64E2DBD6038740804823C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1248', '1021', '重点地域异常信号监测情况', 'ZDDYYCXHJCQK', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1C37F24BDC9D474EA2A1342B1A35D026');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1249', '1021', '用频干扰查处情况', 'YPGRCCQK', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4EC4ECB3030E4DF3876C69AB37BEFD0E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1250', '1021', '其他情况说明', 'QTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '32BC1F3F30FF4A08881BDDECC6A2EB5A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1251', '1021', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BC908BB7CA7E470FA666DA5A74B666E0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1252', '1021', '最近一次更新时间', 'GXSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1569DFAB7735436F88F9185F872646DB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1253', '1016', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0231BC513F024B1E9300B3DCC90D309A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1254', '1016', 'JIDS数据链系统情况说明', 'JIDSSJLXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F9BFA763CE3C4745A0120E3EE793EF85');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1255', '1016', '综合数据链系统情况说明', 'ZHSJLXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F98519C1504D4B65AF6A64657A7F3306');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1256', '1016', '视频指挥系统情况说明', 'SPZHXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3D1508E20CE042D6A3D41158C4C4AF87');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1257', '1016', 'IP话音系统情况说明', 'IPHYXTQKSM', '1', '1', '0', null, '/^[\s\S]{1,1000}$/', '长度在1-1000位之间！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', '1,10', null, null, null, '44DE8E3C94684985B242C3290B62AE89');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1258', '1016', '电视电话会议系情况说明', 'DSDHHYXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F8F24066A0DD4ACF88E329DCE9F08170');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1259', '1016', '部队内码', 'BDNM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A1EBCD570DC64DFDA08400A520D53B16');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1260', '1016', '指挥所信息系统运行状态', 'ZHSXXXTYXZT', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '32CA06B5E6D841FCA26AF6CB377DB45E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1261', '1016', '指挥文电运行状态', 'ZHWDYXZT', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5807FC2B74C548DBAC050915F1B0DFCA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1262', '1016', 'JIDS数据链系统运行状态', 'JIDSSJLXTYXZT', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '359065197DDF4B05A9BF034295F972D9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1263', '1016', '综合数据链系统运行状态', 'ZHSJLXTYXZT', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '620370564AB24FDF940763144C62C00E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1264', '1016', '视频指挥系统运行状态', 'SPZHXTYXZT', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D20C1AD46F814D538371FD28AA698DA0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1265', '1016', 'IP话音系统运行状态', 'IPHYXTYXZT', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8D54ABB380D54E15BFC208B589633E97');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1266', '1016', '电视电话会议系统运行状态', 'DSDHHYXTYXZT', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'EADE4CB3FBA844CF84B0632BDEF6B08D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1267', '1016', '指挥所信息系统情况说明', 'ZHSXXXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '30DE7B367C024870984C3E51F6169B2C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1268', '1016', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '90D17DEB2ACC46ACB27C2F86AC2B8843');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1269', '1016', '最近一次更新时间', 'GXSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6481FF564C434FADA0FEFE7F712740A8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1330', '1009', '其他情况', 'QTQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '20', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span></span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1010', null, '0B3C0BBFE78444E18C152B97E7178F95');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1388', '52', '数据长度（1,10）', 'STRINGLENGTH', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, null, null, null, '0', null, null, null, null, '3C5BBC5E40CF4962A72E1A900EA6B0DE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1389', '1019', '信息/数据中心故障情况说明', 'XXZXQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F209C58AA56B4B48B7500A2508A9D091');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1390', '1024', '指挥机构内码', 'BDNM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'AC55EE85F9C2447A8757BC415CAAF48F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1391', '1024', '所属部队信息', 'SSBDXX', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'EA193EFA3B794992A5A562C45ED8FCD2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1392', '1024', '部队名称', 'BDMC', '1', '0', '0', null, '/^[\s\S]{0,5}$/', '长度不可以超过5位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'AC84D9BC0E024524B188E82C6A450925');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1393', '1024', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '50C7CEDDC3C34D08A520B7C1B26232AD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1394', '1024', '部队代号', 'BDDH', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C90A754018FF43FFA82E7000520C0BEA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1395', '1024', '部队代字', 'BDDZ', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C5F8F257901A455FB41EA4A94BB6E087');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1396', '1024', '部队级别', 'BDJB', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '87A17F4E1C5740EC90FEB14B1C7B088A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1397', '1024', '所属军种', 'SSJZ', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1076C44545234190B4323D3D0CDB9BAC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1398', '1024', '所属战区', 'SSZQ', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1EA614526035467EB1FA5503EDA2D168');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1399', '1024', '部队类别', 'BDLB', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DC464B1FD5064529BE1F7D9F18BAE2CC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1400', '1024', '编成类别', 'BCLB', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '11872AE26BEA43448C8E617138143551');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1401', '1024', '作战方向', 'ZZFX', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B9576C94D70545B08E380F691673F1B4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1402', '1024', '部队驻地', 'BDZD', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C2230DAFB59E42B5892B59886E7D08F5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1403', '1024', '拓展地名', 'TZDM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'EB8549BAED0640228E3C9A64E7AC1277');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1404', '1024', '战备等级', 'ZBDJ', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A4EFF813052645C587C68988BE44F85D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1405', '1024', '驻地经度', 'ZDJD', '1', '0', '0', null, '/^(-?180)$|^(-?([1-9]?[0-9]|1[0-7][0-9])(\.([0-5]|[0-5][0-9]|[0-5][0-9][0-5]|[0-5][0-9][0-5][0-9]))?)$/', '经度录入格式为：度度.分分秒秒!', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6AFB2B37518042B4B98005009B679659');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1406', '1024', '驻地纬度', 'ZDWD', '1', '0', '0', null, '/^(-?90)$|^(-?([1-9]?[0-9]|1[0-7][0-9])(\.([0-5]|[0-5][0-9]|[0-5][0-9][0-5]|[0-5][0-9][0-5][0-9]))?)$/', '纬度录入格式为：度度.分分秒秒！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CFFC46D18DDD4586865387A8504BA285');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1407', '1024', '驻地高程', 'ZDGC', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '56783A25E91B482488C135FE260D0506');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1408', '1024', '编制人员', 'BZRY', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2451D8C7FE51431399305EEEC891B191');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1409', '1024', '实有人员', 'SYRY', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5D7AC1F53F88402D98ABDDAD2B47ECF0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1410', '1024', '当前在位人员', 'DQZWRY', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C6D14771F398486B897F40125BDA1349');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1411', '1024', '本级及下属单位情况', 'BJJXSDWQK', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '20960342474A44798175030703112231');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1412', '1024', '担负任务', 'DFRW', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7A871C2D976249939D7A7C62D5643CA8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1413', '1024', '主要领导', 'ZYLD', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BD8D94B5D9DA43DEB64FBA89E70D440B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1414', '1024', '主要通联方式', 'ZYTLFS', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '608596F3C02D49DA86FBD18AEF5DB8A8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1415', '1024', '备注', 'BZ', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '644374C81F6F41C5BD163B68A66DC24D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1416', '1024', '最近一次更新时间', 'GXSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F185F0F528DA4E94B91815F43CE111A7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1427', '1006', '今日值班领导职务', 'JRZBLDZW', '1', '0', '0', 'S', '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', '6', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-5 JRZBLDZW''>
	<div class=''form-group''>
		 <label class=''control-label''>
		 	<span>职务：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name=''JRZBY'' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1511', null, '12BBFDCD7EA64484B685C391D5AE8BAB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1428', '1006', '今日值班领导姓名', 'JRZBLDXM', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', '7', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-5''>
	<div class=''form-group''>
		 <label class=''control-label''>
		 	<span>姓名：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1511', null, 'C94D3FAB8A6A40A3B350BA5E2DFE9ABF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1676', '1028', 'html内容', 'DISCONTENT', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C0F931E1A93648BF92BC67F4D0B7A4AE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('2', '38', '姓名或企业名称', 'name', null, null, null, null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0C07A54126474BB181EDB8ABDA7E1BFC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('3', '1', '表英文名称', 'TABLEENAME', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, null, null, null, null, null, '0', null, null, null, null, 'BAD6FA10AF074AFE83A735CCFF76FB1B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('3', '38', '身份证号或工商注册号', 'idNumber', null, null, null, null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '37383871097A47EF873FB37008CB09C1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('4', '38', '加入黑名单缘由', 'result', null, null, null, null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '64C53432CD274A90B84F85C3437D38F3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('5', '38', '案例内容', 'caseContent', null, null, null, null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E260F3CD0CF645259FD0B72BDA3F5DA0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('6', '38', '定义成黑名单时间', 'makeTime', null, null, null, null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '04C36DDFACB644949BE1DBE8539DD1E6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('7', '38', '备注', 'memo', null, null, null, null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '34B06253BA2B40F290BAB500FF7435E5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('8', '17', '平台id', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A4B08C404CAF4B2EA3F870221F31ABFD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('9', '17', '企业信息id', 'enterpriseInfoId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3E3A465E13164044A3983073E44645DC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('10', '17', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FB945E6DC84E4DFEAAE83DFF5907D226');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('11', '17', '平台名称', 'platformName', '1', '1', '0', 'S', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5DFA11774ECF4B5D8EEFA8500EE2D43B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('12', '17', '平台简称', 'platformShortName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DDDF827733A546A1AD4EF176B3E4CF09');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('13', '17', '平台类型(0：p2p、1：众筹、2：第三方支付、3：其他)', 'platformType', '1', null, '0', 'M', null, null, '0', '0', '{''1'':''p2p'',''2'':''众筹'',''3'':''第三方支付',''4'':''其他''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, '7A700B29CFE5405790207EEA7B96942D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('14', '17', '上线运营日期', 'onlineDate', '1', '1', '0', 'TD', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D586AE3290E042D79B94B32B8912A82B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('15', '17', '平台访问地址', 'url', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B9ABF072ACF54C4CA010E7F894129D11');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('16', '17', '平台介绍', 'content', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '458A9F9B65834BD39B2F18ABDB46D049');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('17', '17', '主营业务', 'business', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E598B7B71FBC4B5F8CF6D979FD0D6609');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('18', '17', '备注', 'memo', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3BE0F058B5144785974C9FABC08596E3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('19', '17', '保证金（万元）', 'cashDeposit', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C1EAB62337A6487AA6C9B5CB572258E1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('20', '17', '风控制度（主要内容）', 'riskControl', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E64C2E26CBEB4F6596B41BF598B3CF36');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('21', '17', 'ICP备案号', 'icp', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '22F383947E47489895E8D7B578FF81C1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('22', '17', '信息披露制度（主要内容）', 'disclosure', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B7127BB46DF74F5985BB3606A54DCC9A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('23', '17', '合规委员会情况', 'complianceCommittee', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CB49756E333346CF8E60B0E63A013F91');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('24', '17', '所属地域', 'platformArea', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '69F66589686A4058972CF32EDB4C9C5E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('25', '17', '平台性质(1、信息中介；2、引入担保方；3、线下业务线上放贷)', 'platformNature', '1', null, '0', 'M', null, null, '0', '0', '{1:''信息中介'',2:''引入担保方',3:''线下业务线上放贷''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '507F23EAD87D40C7B8C2E00DA96FFCD3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('26', '17', '融资情况', 'financingSituation', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4B7DDF1414E24354B57B2F957C6BC064');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('27', '17', '网站备案主体', 'websiteRecordSubject', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '116C4B282B794C12BF8965EFD3AE505D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('28', '17', '是否办理备案登记', 'recordRegistration', '1', '0', '0', 'M', null, null, '1', '0', '{''1'':''是',''0'':''否'}', '0', '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EBBFEB4573064A29BD6877078FE92AF8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('29', '17', '网站通信是否安全', 'siteCommunicationSafe', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1B0A1B256200457DA6C173D706AB900F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('30', '17', '线上线下业务比例', 'onlineOfflineBusiness', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '125EEFCDBB834DD9B8DCA777CC4F8E9C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('31', '17', '是否允许信用卡投标', 'creditCardBidding', '1', '1', '0', null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhaosdb', '0', null, null, null, null, '37D98380F6B643E4A8325B272D03CFE3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('32', '17', '广告投放金额规模和收入占比', 'advertisingIncome', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7067895F6B34466C96574EC7CB08E016');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('33', '17', '实际经营地址', 'businessAddress', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '29311034614847D88BBC347E81EBE4DB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('34', '17', '融资总额', 'financingAmount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '05F95B9F55214779A705EC1F2398C778');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('35', '17', '是否允许信用卡投标 0-不允许；1-允许', 'allowCreditCardBit', '1', null, '0', 'M', null, null, '0', '0', '{0:''不允许',1:''允许''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0979A57E69AB49B7B656FFF0D257D1F8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('36', '17', '平台备案所在城市', 'platformRecordCity', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '20EFE4A151154E51B9E20A494B2E2C2C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('37', '18', '企业信息id', 'enterpriseInfoId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '28FA40950A1E445A8331C86CEF8CE7E6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('38', '18', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3436B3570D664287AE381A18B95DD932');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('39', '18', '企业名称', 'enterpriseName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '440E5FC223514C64BCC0436F25CD2EB3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('40', '18', '联系电话', 'telephone', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E16677834A7843A09086CE016E6978EF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('41', '18', '公司类型.(制造加工等)', 'type', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FB11E4B1B6974CF2A888E73D2118A0DE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('2', '1', '表名', 'TABLENAME', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, null, null, null, null, null, '0', null, null, null, null, '968F3F3F49EE4C66A6574C3D57B5929C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('42', '18', '工商注册号', 'regCode', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7CCB83B0CB9D4F7093F5763CB105A5C7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('43', '18', '组织机构代码', 'organizationCode', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '10A00402D486443A95F6079E662C6426');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('44', '18', '税务登记号', 'taxCode', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '24EE8B738AC34614BC6F085EBAE3CCC5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('45', '18', '注册资本（万元）', 'regCapital', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '31A777BA99B44DA0899BF8C576C610A8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('46', '18', '实缴注册资本（万元）', 'paidupCapital', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A3ABBD49ED99493BB54DD24F11B7BCC9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('47', '18', '经营范围', 'businessScope', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B946C092D2BD40D582F217608D407A3F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1', '1', '主键ID', 'ID', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, null, null, null, null, null, '0', null, null, null, null, '59C505C21A5544E8A8D192E2A095BA24');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('48', '18', '经营地址', 'addr', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4329B04979074CD0A99538AB7A650FC0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('49', '18', '法定代表人', 'legalPerson', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E866DD9B0EA841588B0016A89B19DF66');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('50', '18', '企业成立时间', 'establishingDate', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '98C6953667874FFB99F0719CAE3D10A9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('51', '18', '营业期限开始时间', 'busnissBegin', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EE17F50492974AB3AFFF45897C2FDFDD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('52', '18', '营业期限截止时间', 'busnissEnd', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '860A8BEDD3BD422FAD0C7EBF510EDC15');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('53', '18', '公司人员数', 'sumEmployee', '1', '0', '0', 'I', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '503B2295734C4197A7EE3F34A5DF369A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('54', '18', '本月人员离职数', 'leaveEmployee', '1', '0', '0', 'I', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DB1113A8299B4DB0954ED5C68A53CB61');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('55', '21', '用户ID', 'userId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '725A4D9CE22849F5BFBEC4E46FFC4D52');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('56', '21', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0DF6E5A014B542E79753E75FE27536ED');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('57', '21', '用户类型。1：企业，2：个人', 'userType', '1', null, '0', 'M', null, null, '0', '0', '{1:''企业'',2:''个人''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '063D7E8C468548E982F58696B6BE0132');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('58', '21', '所属平台id', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C3A1A105032A43208F2D521443DAC35D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('59', '21', '用户名或昵称', 'nickname', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0D8FF9FB4B1D4268A40B3C735478DCEB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('61', '21', '年龄', 'age', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8B7C024735304D1AB5EE8C6F289F7028');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('126', '26', '计息时间。单位：月', 'profitTime', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7DBA8B2269844672A5CDCBD3F0AAFC14');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('127', '26', '最小投标额。单位：元', 'minBidAmount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FF3D4C05D5B549D295B701BE48829ACB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('128', '26', '最大投标额。单位：元', 'maxBidAmount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '241701F2CF684B3684F153DFE9401F8C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('129', '26', '借款人或企业id', 'userId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EFAF7246FC7D4728B4C0E544FDFC1FE2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('130', '26', '借款项目概况', 'loanProjectOverview', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B93D92AFD3304EC9B0F387BFA5C8CBE9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('131', '26', '借款用途', 'borrowingPurposes', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BEBFE32246D443EBA326B58ECCD29100');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('132', '26', '还款来源', 'payment', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1FBC62A94808471CA04ACD0AC3AB8083');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('133', '26', '保证方式：1抵押、2质押、3担保、4其他、5信用', 'ensureWay', '1', null, '0', 'M', null, null, '0', '0', '{''1'':''抵押'',''2'':''质押'',''3'':''担保'',''4'':''其他'',''5'':''信用''}', null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3A8529220118467EA99665BC9AA86BA8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('134', '26', '担保公司名称', 'guaranteeCompany', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '21B346BEE4E84D6F8ED7346FF9C3EAFC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('135', '26', '发布时间', 'releaseTime', '1', null, '0', 'T', null, null, '0', '0', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4C84467E32BB453A8B1A7C71A2F8A815');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('136', '26', '募资期限。单位：天', 'fundraisingDeadline', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '625AB44241B0407EB9CD64810394232A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('137', '26', '满标时间', 'scaleTime', '1', null, '0', 'T', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A31C75C9A2004EFE88156E617439A979');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('122', '26', '借款（筹资）金额', 'financing', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '676527060F3743DA9C81ED71F4F7EFD7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('123', '26', '实际借款（筹资）金额', 'factFinancing', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F09FB9A30914499DAE680737BE0B5848');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('124', '26', '借款期限（月）', 'borrow', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '008B7FC1107B4BA4AAF57E6BB72F7537');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('138', '26', '结束时间', 'endTime', '1', null, '0', 'T', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7964BC4B6A844E03BDE09629466C1AF2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('139', '26', '状态。0投标中、1满标、2未完成标、3审核中、4还款中、5逾期、6还款失败、9成功结束', 'status', '1', null, '0', 'M', null, null, '0', '0', '{''0'':''投标中',''1'':''满标'',''2'':''未完成标'',''3'':''审核中',''4'':''还款中',''5'':''逾期'',''6'':''还款失败'',''9'':''成功结束''}', null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9612C3FD6EDB4941AB20C6DCFC50D590');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('140', '26', '项目所属国民经济行业分类，最少报到三级指标', 'industry', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DF28E9E4577841E7BD1F32293693EAF0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('141', '27', '产品ID', 'productId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '44953020752A464C9962E3AB7F9D9F53');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('142', '27', '所属平台', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0B4EFBF4AF7640EAB9FA1967ED44C484');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('143', '27', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '082DA2B73434412BB44798B39169695C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('144', '27', '产品名称', 'productName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D1AC50AB115A4074A5BA9E8BC86C31F3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('145', '27', '年化收益下限', 'yearProfitLower', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B9CE8F5A86F94306A31CAAB6473BA0E8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('146', '27', '年化收益上限', 'yearProfitUpper', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CB2666E203784ECAAD1257CB70E9DFEF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('147', '27', '最小投标额', 'minBidAmount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9D3D63BD861442D39498783714A2C1FA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('148', '27', '最大投标额', 'maxBidAmount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6029E28858CA48B7B99EA32978FFEFB2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('149', '27', '还款（回报）方式', 'repaymentMethod', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '00D3FA0D0B1A4D3F9399CDA0D6EE6577');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('150', '27', '发布时间', 'releaseTime', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BDF837D9F8DE436DB6A4F23DEF0B24D1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('151', '27', '状态  。0：注销，1：正常', 'status', '1', null, '0', 'M', null, null, '0', '0', '{0:''注销'',1:''正常''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1D4A8FF5F5CF457ABA0540E3AB842D19');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('152', '27', '下架时间', 'shelfTime', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0B753551B5EC4F4E837C213AEC52E663');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('153', '27', '项目所属国民经济行业分类', 'industry', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1B5EE32118B044D0B1B6F3DB87F831A4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('154', '27', '项目所属工商登记行业分类', 'classify', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '21F652B1BE0648ACB3083C5C5A1446D4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('155', '27', '年化利率', 'annualizedRates', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CF0AEF92DF73451BA01AB84FB113D8CD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('156', '27', '借款期限', 'borrowingTimes', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FA945C9ABA0A442BA0EDE2C23604D2D9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('157', '27', '产品类型', 'productType', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3C75AA05E26F420CA8B6920B85772A67');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('158', '27', '产品介绍', 'productIntro', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CCA31F3EFF454A6D99301AB5AB09262F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('159', '28', '项目ID', 'projectId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C5756B0957464178B49CDB071D19CCA2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('160', '28', '所属平台', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7078454513914AA6BC1B7ACCBAEFA3C3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('161', '28', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0491D64C6A2D43A6AF1AE3DED6E5B7E9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('162', '28', '抵押物名称', 'name', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '513AFAEC6E714412B9D05E4FDD00F3C2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('163', '28', '抵押物类型。1车、2房、3其他实物、4证券', 'type', '1', null, '0', 'M', null, null, '0', '0', '{1:''车',2:''房',3:''其他实物'',4:''证券''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '79552A14434D482BA71E8525114A79F7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('164', '28', '抵押物编号，比如房产证号、车辆发动机号', 'code', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CE3C2FDFF6F047119223DF5A558CCD01');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('165', '28', '估值。单位：万元', 'valuation', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F1AC36E6CD4E48F1BB1A3D63F14E6409');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('166', '28', '估值机构', 'valuationAgency', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7F7A363E98DF4C1F9346FEF723A34648');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('167', '28', '估值时间', 'valuationTime', '1', null, '0', 'TD', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CDEF449D51884059896B5FA630E54C06');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('168', '29', '所属平台', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '93A858AEB523454C949ABA2AC78D639E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('169', '29', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0A06BE2C1F2543B487E581090CBB6170');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('170', '29', '交易日期', 'tradeDate', '1', null, '0', 'TD', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '75567E0996A740FC8FE53D34DFFF9896');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('171', '29', '开户行', 'accountBank', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F0F5E15862974633BCA50C6956EF77BA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('172', '29', '账户', 'bankAccountNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0696F828F07445D595691598DCFEE68B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('173', '29', '账户名称', 'bankAccountName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9D145AA98ED14DE3933376CA4BA37BA7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('174', '29', '交易时间', 'tradingTime', '1', null, '0', 'T', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D1D64F9916654EA5B7DB3BBE435FF60A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('175', '29', '收入', 'income', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FEB3293B32C94356BE4E94ED654D9793');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('176', '29', '支出', 'spending', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B200EE76069B462CB7DAD8B2359F5DFC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('177', '29', '余额', 'balance', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'AC6534464AF244688FC729B5554C467A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('178', '29', '摘要', 'summary', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0B1D33B648B9406C98B8B45FE575AED4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('179', '29', '对方账号', 'otherAccount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BF3E6676DF8C4BE3B1D46056BBC4FA93');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('180', '29', '对方户名', 'accountName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9AA9357A4BA446CAA6E3ECAB83C31B46');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('181', '29', '用途', 'purpose', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '54244DCF9B1E40318619619F0A1935D9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('182', '29', '备注', 'note', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '103D014D05264D668C507F409A0229A6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('185', '34', '项目id', 'projectId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '14745F6FE647468CB22C7DC50112D5F5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('291', '44', '所在部门', 'department', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '58BFC64B2D9F4D139C3C779FC37CC25A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('292', '44', '担任职务', 'position', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '352156A9989843C9A9689B7D32D83763');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('293', '44', '入职时间', 'entryTime', '1', '0', '0', 'TD', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, 'EBA1C6BE91624051AF67CE3C7A1DB045');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('294', '44', '业务职能类型', 'workType', '0', '0', '0', 'M', null, null, '0', '0', '{''1'':''行政'',''2'':''技术',''3'':''风控'',''4'':''财务''}', '0', '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, '8276A229CEBA46538435512C6CCA7AC2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('295', '44', '人员类型', 'type', '1', '0', '0', 'M', null, null, '0', '0', '{''1'':''法人'',''2'':''董监高'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, 'E87CE414280D49B0AEA5AED052868521');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('296', '44', '所属平台id', 'platformId', '1', '0', '1', null, null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '258BDF687CA84AF18B44DC7F5FE97406');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('297', '45', '对应期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0D65D058C97C41D389EB3E05A5954E12');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('298', '45', '所属平台id', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4F513225C99F4268AD83E4D0151B6FA7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('299', '45', '姓名', 'name', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '49385BAA8E7E4D2BB56396DDAB2DE62F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('300', '45', '性别。 男 、女', 'sex', '1', '0', '0', 'M', null, null, '0', '0', '{''男':''1'',''女':''2''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '00401B7C039B4BD9AF289C02212B5E05');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('301', '45', '身份证号', 'idNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '29E6E9FE1CEA4920A03ED3DAB75CCE0F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('302', '45', '股东类型', 'type', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '701B2B42D1B842D0BC6D7A99A58A0CA7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('303', '45', '认缴金额', 'subscriptAmount', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B072A360E9004DD5AE8F363DB2506B2C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('304', '45', '出资比例', 'subscriptPercent', '1', null, '0', 'D', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9B8B3500A9C149599E938AAD2D80B50A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('305', '45', '出资日期', 'subscriptDate', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9391A63618254002A8B4E1312A43A508');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('306', '45', '股东状态', 'state', '1', '0', '0', 'M', null, null, '0', '0', '{''1'':''正常'',''0'':''撤资''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, 'BBE380301FB74039887A8C7692B69ED4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('307', '45', '状态变更时间', 'changeTime', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B448C55A21994C1593384C206DDE6353');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('308', '45', '实缴金额', 'subscriptActure', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E890CE791C604971B9C6A8F183E87726');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('309', '46', '对应期次', 'period', '1', null, '0', '1', null, null, '0', '12', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D03F0321C5EF4248B3AA7495ACA0E4E5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('310', '46', '所属平台id', 'platformId', '0', '0', '0', null, null, null, '1', '1', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3790DE0D709547BC8D256E0754F4094E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('311', '46', '姓名', 'name', '0', '1', '0', null, null, null, '0', '2', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A9254E6DF8444B10A76305F4D5A43AD7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('312', '46', '性别', 'sex', '0', '0', '0', 'M', null, null, '0', '3', '{''0'':''男',''1'':''女'}', '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BFC0C6497B5340D19B3FA69D17C4105B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('313', '46', '身份证号', 'idNumber', '0', '1', '0', null, null, null, '0', '4', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '70FB3B0E1A0A41F8849C90AA33004171');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('314', '46', '股东类型', 'type', '0', '0', '0', 'M', null, null, '1', '5', '{''0'':''自然人股东',''1'':''机构股东''}', '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DF996BD0CE3C4C89854E1BAD4DBD1881');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('315', '46', '认缴金额', 'subscriptAmount', '0', '0', '0', 'C', null, null, '0', '6', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9F0105E4903E4FCC84EC8B904BADA3D3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('316', '46', '出资比例', 'subscriptPercent', '1', '0', '0', null, null, null, '0', '7', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CAAC31E4BC0A42D7AD456329BEC2193C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('317', '46', '出资日期', 'subscriptDate', '1', '0', '0', 'T', null, null, '0', '8', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6DF9EF3279DA4DABAEC1563B18C3E1F8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('318', '46', '股东状态', 'state', '0', '0', '0', 'M', null, null, '0', '9', '{''1'':''正常'',''0'':''撤资''}', '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, 'D6A54BA770914651994CAC622730568A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('319', '46', '状态变更时间', 'changeTime', '1', '0', '0', 'T', null, null, '0', '10', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7B0CEF5D26404B0394D47CFABD5C43DC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('320', '46', '实缴金额', 'subscriptActure', '1', null, '0', 'C', null, null, '0', '11', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3EAE6933B76E4093BF6B6FD177B0E34C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('321', '47', '对应期次', 'period', '1', null, '0', '1', null, null, '0', '8', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'AEF0BC74C51C4E89B6F9F10104C884A5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('322', '47', '平台id', 'platformId', '0', '0', '0', null, null, null, '1', '1', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '722D7E1EABFE4B9DB15614A2B9107E65');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('323', '47', '机构名称', 'branchName', '0', '0', '0', null, null, null, '1', '2', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '31769DC82F4D40A7A51DA085352DD119');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('324', '47', '地址', 'address', '1', '0', '0', null, null, null, '0', '7', null, '1', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'AF52E2E7FFDA4A87B3100A2D2806844A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('325', '47', '负责人', 'linkPerson', '0', '0', '0', '1', null, null, '0', '5', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'AFFBA84CB1664C87A4824AE11ACD94AB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('326', '47', '联系电话', 'linkNumber', '0', '0', '0', '1', null, null, '0', '5', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '43D1891268304BCCAF5A556300002C36');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('327', '47', '工商注册号', 'registNumber', '0', '1', '0', '1', null, null, '1', '4', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '35D1E6311A614C5B82A401C1415EF86E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('328', '47', '机构代码', 'branchCode', '0', '1', '0', '1', null, null, '1', '2', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A42E436384074B5E8F889C358534E0B8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('329', '47', '经营项目', 'businessDesc', '1', '0', '0', '1', null, null, '0', '6', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '061D1F2AF12543B0A47ABDA318B1AAD4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('330', '48', '所属平台id', 'platformId', '0', '0', '0', null, null, null, '1', '1', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D05C64C890E64672A97FFEA28052E342');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('331', '48', '对应期次', 'period', '1', '0', '0', null, null, null, '0', '7', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F74A7371C2D347A19F9F8512147F4DFC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('332', '48', '合作机构名称', 'cooperationOrg', '0', '0', '0', null, null, null, '1', '2', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A9EBD6B9698643CEAA33A5B520E1DA63');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('333', '48', '组织机构代码', 'orgCode', '0', '0', '0', null, null, null, '1', '3', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7D1D506705B349E8ADC203A32D7E9740');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('334', '48', '工商注册号', 'registrationNumber', '0', '1', '0', null, null, null, '1', '4', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C086A1D7EDFA4348A1B5A32AE0BE4852');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('335', '48', '合作机构类型', 'cooperationType', '0', '0', '0', 'M', null, null, '1', '5', '{''1'':''担保公司'',''2'':''审计公司'',''3'':''系统提供商',''4'':''律师事务所'',''5'':''其他''}', '0', '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E8A5D95C7DF34B50B345A616D2A4A674');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('336', '48', '法人代表身份证号码', 'legalIDNumber', '0', '1', '0', null, null, null, '0', '6', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2747B201CAD44934BF8481D2AE0CDC7F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('338', '49', '平台名称', 'platformName', '0', '0', '0', null, null, null, '1', '16', null, '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '13CAB1AA6E5048E090A00D6914692AA2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('339', '49', '平台简称', 'platformShortName', '1', '0', '0', '1', null, null, '0', '17', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6ADDF0C0C6A24E4A9C56560E1AC448B2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('340', '49', '平台类型', 'platformType', '0', '0', '0', 'M', null, null, '1', '18', '{''0'':''p2p网络借贷'',''1'':''股权众筹'',''2'':''互联网支付',''3'':''网络小额贷款'',''4'':''互联网基金',''5'':''互联网保险',''6'':''互联网信托',''7'':''互联网消费金融'}', '0', '1', '1', '0', null, null, '{''0'':''p2p'',''1'':''众筹'',''2'':''第三方支付',''3'':''其他''}', '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, '6FA320AFC3CC4E21A07209332FF89C68');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('341', '49', '上线运营日期', 'onlineDate', '1', '0', '0', 'TD', null, null, '1', '19', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6C50823AE0724FD4BC2AFEB89EA6C70A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('342', '49', '平台访问地址', 'url', '1', '0', '0', '1', null, null, '0', '21', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '57658EDAEFFC41FDAD2563FFC6E814B1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('343', '49', '平台状态', 'status', '0', '0', '0', 'M', null, null, '0', '25', '{''0'':''在营/存续'',''1'':''注销'',''2'':''吊销''}', '0', '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '73300ED2002341DE93ACB0AE2E6418F8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('344', '49', '平台介绍', 'content', '1', '0', '0', '1', null, null, '0', '17', null, '1', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BA429D236EDC479BA5944299C9969BF1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('345', '49', '主营业务', 'business', '1', '0', '0', '1', null, null, '0', '18', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D8A79FCF8E5148CC869B801912F71C65');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('346', '49', '关闭或注销日期', 'closeDate', '1', '0', '0', 'TD', null, null, '0', '26', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '820701530BAC403DAD94D64780D08481');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('347', '49', '在金融办是否备案', 'isRecorded', '1', '0', '0', 'M', null, null, '0', '20', '{''1'':''是',''0'':''否'}', '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '057FC913618843F68EB3F16AA9BD097A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('348', '49', '备案日期', 'recordDate', '1', '0', '0', 'TD', null, null, '0', '20', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C38A7562E00E423687CB1E1C06A1D4E8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('349', '49', '备注', 'memo', '1', '0', '0', null, null, null, '0', '50', null, '1', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '80EBC5DFBFB14D8FA964BE0338BEFF6E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('350', '49', '企业名称', 'enterpriseName', '1', '0', '0', '1', null, null, '0', '1', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CFFD3E4E8CF24E8EB9A088AF189E78B8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1133', '1022', '军标代字', 'JBDZ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DAA08B7510214C8986B5F80C6AFF2844');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1134', '1022', '指挥所级别/单位级别/部队级别', 'BDJB', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '899E526B2ED546DCA42AC9D499791589');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1135', '1022', '所属军种', 'BDJZ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '9839D7F248C44DBD926163988006C7D9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1136', '1022', '所属战区', 'BDZQ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CD2BA6100CAE43C188184F7F88EEE9F6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1137', '1022', '拓展地名', 'TZDM', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7C013E0D80854AC6A2B445E3694B9E7E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1138', '1022', '部署类别', 'BSLB', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7A8101AD6A4B4AD48AD03940F366F06A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1139', '1022', '驻地经度', 'ZDJD', '1', '0', '0', null, '/^(-?180)$|^(-?([1-9]?[0-9]|1[0-7][0-9])(\.([0-5]|[0-5][0-9]|[0-5][0-9][0-5]|[0-5][0-9][0-5][0-9]))?)$/', '经度录入格式为：度度.分分秒秒!', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '81F54AC8F1214E7AA16F1D4B083B8E40');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1140', '1022', '驻地纬度', 'ZDWD', '1', '0', '0', null, '/^(-?90)$|^(-?([1-9]?[0-9]|1[0-7][0-9])(\.([0-5]|[0-5][0-9]|[0-5][0-9][0-5]|[0-5][0-9][0-5][0-9]))?)$/', '纬度录入格式为：度度.分分秒秒！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '21EB57A2FA474488B3C556ABCB321D76');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1141', '1022', '驻地高程', 'ZDGC', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A983E92136F04AC3915D8B18C414EAA5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1142', '1022', '历史沿革', 'LSYG', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B21BB4083BCF4F0C995DDAC88A0C4197');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1143', '1022', '部队类别', 'BDLB', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0B81B55A9CEE4560B4F73A0849CDB38D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1144', '1022', '部队编成类别', 'BCLB', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0A495707789343FB9F2AC889BAD36FEF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1145', '1022', '作战方向', 'ZLFX', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D70253425CA04CCCB95DB04194872F48');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1146', '1022', '战备等级', 'ZBDJ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3C10B12FB7AF42289D2A7DAA9D513CFA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1147', '1022', '训练种类', 'XLZL', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4A6383D4019841A9AC9521F6D21B791E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1148', '1022', '出动时间', 'CDSJ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '898539A7B02C4B3B906F998218841786');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1149', '1022', '指挥所维护单位/值班室维护单位/本级及下属单位情况', 'SSFDQK', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '469B00242888439FA2A4C9E85E9602DF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1129', '1022', '指挥所形态', 'ZHSXT', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2C23B80F8F7E47C2B1F295A12FBE17A0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1130', '1022', '工程形态', 'GCXT', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'ABD9EA63CC3440539E8510D47AC40795');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1131', '1022', '指挥所名称/单位名称/部队名称', 'SSBDFH', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0F6472DCE9CB4E78BB122C3182AE2B58');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1150', '1022', '担负任务', 'DFRW', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2D986EBA245A4DF28045AF2288A1ECBC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1151', '1022', '信息通信部门席位/主要领导', 'ZYLDLXFS', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2F26FB0D7E4F4A3A861D8262D490B785');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1152', '1022', '主要通联方式', 'ZYTLFS', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '9CF138C0A0D34D6F8D3677EF0467EA75');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1153', '1022', '执行任务情况', 'ZXRWQK', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8F5A0D570E2B4BAE863A13ACE3BD42EF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1154', '1022', 'IP地址范围', 'IPDZ', '1', '0', '0', null, '/^[\s\S]{0,500}$/', '长度不可以超过500位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '48BA76297DEE43E3A0D1833A66DFA9D9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1155', '1022', '最近一次更新时间', 'GXSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7C992059A1E24154A99D4C02190B19FD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1156', '1022', '指挥所简称/值班室名称/部队简称', 'BDMC', '1', '0', '0', null, '/^[\s\S]{0,127}$/', '长度不可以超过127位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D3B905B7EE5D4E55B9F63B1CE0D7C29C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1157', '1022', '部队内码', 'BDNM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0E1461CAD65142488093A754055DF66F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1175', '1017', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '537C370ADDC04E52A2233D187438E63D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1176', '1017', 'JIDS数据链系统情况说明', 'JIDSSJLXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4FDE26A67ACC4EA8BED8F2FEE2BB8790');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1177', '1017', '综合数据链系统情况说明', 'ZHSJLXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '29AAEDAB61144D79A89D423F2B6566EA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1178', '1017', '视频指挥系统情况说明', 'SPZHXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'AC2FCE6146534295B709C765A8BCED9C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1179', '1017', 'IP话音系统情况说明', 'IPHYXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '45146FAD3AF2430B988D211370A18C30');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1180', '1017', '电视电话会议系情况说明', 'DSDHHYXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A42DE4A92AFF4C38BDAAE02D3433DB2E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1181', '1017', '部队内码', 'BDNM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D782AD8FF41840EE9CF6DD0D451FF9D8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1126', '1022', '在位军官数', 'ZAIWJGS', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '9809AAB929D94A46A16672B304BB4233');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1127', '1022', '在位士官数', 'ZAIWSGS', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '407BC31B936B4D9393A72DDB21380CEB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1128', '1022', '在位义务兵数', 'ZAIWYWBS', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BB184EB3AB46419BB3CC4F317ED3B626');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1182', '1017', '指挥所信息系统运行状态', 'ZHSXXXTYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '58C639A9E9944045BA9B15707BE2373E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1183', '1017', '指挥文电运行状态', 'ZHWDYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FF75C9D4AE214F4A84B6BC39C736C93F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1184', '1017', 'JIDS数据链系统运行状态', 'JIDSSJLXTYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '619CD1DA0F39418CBB7D3C227A65D86E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1185', '1017', '综合数据链系统运行状态', 'ZHSJLXTYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '729BBF7F3BFE43EC89BFC7A3FD4F52AF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1186', '1017', '视频指挥系统运行状态', 'SPZHXTYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3B73F56ABF394702B118EB011871C169');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1187', '1017', 'IP话音系统运行状态', 'IPHYXTYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '15DC94462A3A4E92A1AAB85DA8CB6584');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1188', '1017', '电视电话会议系统运行状态', 'DSDHHYXTYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5ED78066425D472D968E8C6BEC61DF54');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1189', '1017', '指挥所信息系统情况说明', 'ZHSXXXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B18B60EFBD2141859C7C6087328E950C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1190', '1017', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8C2F24A5F1A748B387817F9FB26C1AF9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1191', '1017', '最近一次更新时间', 'GXSJ', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F194F2A4A5B14A8C98D4E40F99EEB875');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1192', '1023', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2510DB7874C24D9EA87C908B8980F0CF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1193', '1023', '任务部（分）队', 'RWBD', '1', '0', '0', null, '/^[\s\S]{0,200}$/', '长度不可以超过200位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '793678A8250C4662B90E5849481E0A79');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1196', '1023', '最近一次更新时间', 'GXSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F026A02F805744A4AE330903CC551BF2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('351', '49', '公司类型', 'enterpriseType', '1', '0', '0', 'M', null, null, '0', '9', '{''1'':''国有企业'',''2'':''集体企业'',''3'':''股份合作企业'',''4'':''国有联营企业'',''5'':''集体联营企业'',''6'':''国有与集体联营企业',''7'':''其他联营企业'',''8'':''国有独资公司'',''9'':''有限责任公司'',''10'':''股份有限公司'',''11'':''私营企业'',''12'':''港、澳、台商独资经营企业',''13'':''港、澳、台商投资股份有限公司',''14'':''港、澳、台商合资经营企业',''15'':''港、澳、台商合作经营企业',''16'':''中外合资经营企业'',''17'':''中外合作经营企业'',''18'':''外资企业'',''19'':''外商投资股份有限公司'',''20'':''其他企业'',''21'':''个体户',''22'':''个人合伙''}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CF707573B4C1417DB8EECDF8C93C5CBF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('352', '49', '工商注册号', 'regCode', '1', '0', '0', '1', null, null, '0', '3', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0C516C00C1CF4E4D96183B7EEE1633BF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('353', '49', '组织机构代码', 'organizationCode', '1', '0', '0', '1', null, null, '0', '4', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'AA5D975908BD4ABCB4E95F60AB144562');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('354', '49', '税务登记', 'taxCode', '1', '0', '0', '1', null, null, '0', '5', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CAA8C62CEC864416B6DECA52CD9C8522');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('355', '49', '注册资本(万元）', 'regCapital', '1', '0', '0', 'C', null, null, '0', '6', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6128BCBF9E8B4184A788DACF2C353E24');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('356', '49', '实缴注册资本', 'paidupCapital', '1', '0', '0', 'C', null, null, '0', '7', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0F2362A4C35B4DCAA7D9EABA63304176');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('357', '49', '注资背景', 'capitalBackground', '1', '0', '0', '1', null, null, '0', '6', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6CB1FB28167C4A4B9AFB7A758A792EF1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('358', '49', '经营范围', 'businessScope', '1', '0', '0', '1', '^[\s\S]{0,2000}$', '【经营范围】不能超过2000个字符串！<br/>', '0', '15', null, '1', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'aa1', '0', null, null, null, null, '3F9DC6E59F74452D9650667B6EB6C46E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('359', '49', '经营地址', 'addr', '1', '0', '0', '1', '^[\s\S]{0,200}$', '【经营地址】长度不可超过200个字符！<br/>', '0', '14', null, '1', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'aa1', '0', null, null, null, null, '43E3C59B03CF48658B642C7C634BA7FB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('360', '49', '法定代表人', 'legalPerson', '1', '0', '0', '1', null, null, '0', '7', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CA35D91868DC40409A9451589B314E21');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('361', '49', '企业成立时间', 'establishingDate', '1', '0', '0', 'TD', null, null, '0', '8', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CD8C1D82F36943558715114155CF146F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('362', '49', '营业期限开始时间', 'busnissBegin', '1', '0', '0', 'T', null, null, '0', '10', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DCD2B9FC552344A4B589E641B0E577C9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('363', '49', '营业期限结束时间', 'busnissEnd', '1', '0', '0', 'T', null, null, '0', '11', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B8B22F20B6AB433C87BA37D03E9D6287');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('364', '49', '托管机构名称', 'custodianBank', '1', '0', '0', '1', null, null, '0', '27', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '387F1F6C70654C4FBC06B9DFEE796B5E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('365', '49', '托管机构协议', 'agreement', '1', '0', '0', '1', null, null, '0', '28', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '355D31E95654421388F4B6C953F5047B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('366', '49', '开户机构', 'organizations', '1', '0', '0', '1', null, null, '0', '31', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BBDE283D6BAF4B85980E5A27C2B953E3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('367', '49', '账户名称', 'accountName', '1', '0', '0', '1', null, null, '0', '30', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D39381B6E2B84288B1305B838A42CD68');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('368', '49', '托管账号', 'custodianAccount', '1', '0', '0', '1', null, null, '0', '29', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E69902CC360345FBB98DC23B75A6B3B6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('369', '49', '托管合同生效时间', 'startDate', '1', '0', '0', 'T', null, null, '0', '32', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7F77AD0DBD7B435CAC74FCC5FC9C1623');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('370', '49', '托管合同结束时间', 'endDate', '1', '0', '0', 'T', null, null, '0', '33', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4625594EF1DA42E4B2BFC41C7FA7202C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('371', '50', 'SQL名称', 'sqlname', '0', '0', '0', null, null, null, '1', '1', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B7C5CBE2F9C94125B56B6428841F7DA8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('372', '50', 'SQL内容', 'sqlcontent', '0', '0', '0', null, null, null, '0', '8', null, '1', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EB98468159CF4527AA5A4414767DB5E1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('602', '51', '表名', 'tableName', '0', '0', '0', null, null, null, '1', null, null, null, '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'zhaosdb', '0', null, null, null, null, 'CCEB72FFBA3741F4A247FD280E182EFD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('603', '51', '表的英文名', 'tableEname', '0', null, '0', null, null, null, '1', null, null, null, '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'zhaosdb', '0', null, null, null, null, 'BDBED4CE772A461CABAB292D3719AF98');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('604', '52', '配置表ID', 'tableid', '1', '1', '0', null, null, null, '1', '1', null, null, '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D7268C5EF3364026A1A2A90E32E14E20');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('605', '52', '配置字段中文名', 'columnname', '1', null, '0', null, null, null, '1', '2', null, null, '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1BFC19463248470BBA9EB4A9DD0B8F48');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('606', '52', '配置字段英文名', 'columnename', '1', null, '0', null, null, null, '1', '3', null, null, '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'ECDAAAEB72BD4746A0284E7E86F926AC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('607', '52', '是否为空0否1是', 'isNull', '1', null, '0', 'M', null, null, '0', '4', '{0:''否',1:''是'}', null, '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6EDA9B8661D34D268C9D8EE2D54C0FC5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('608', '52', '不允许重复', 'isEqual', '1', null, '0', 'M', null, null, '0', '5', '{0:''否',1:''是'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '512E2C5928EF489EBAEE994F0BA0E891');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('609', '52', '是否为系统字段', 'isSystem', '1', null, '0', 'M', null, null, '0', '6', '{0:''否',1:''是'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '63B8AC609E6640D6AB32BA7F3D8FAEE3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('610', '52', '字段类型', 'dataType', '1', null, '0', 'M', null, null, '1', '7', ' {''S'':''字符串',''L'':''长整型',''I'':''整形'',''D'':''浮点类型'',''T'':''时间'',''TD'':''日期'',''M'':''枚举'',''F'':''附件'',''SF'':''身份证号码',''NM'':''枚举库',''MT'':''枚举方法'',''CT'':''中文日期'',''CL'':''自定义校验'}', null, '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FA416664778946D89D96532A77BAE045');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('611', '52', '正则表达式', 'matchInfo', '1', '1', '0', null, null, null, '0', '8', null, '1', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '21B96F6024024C498564EFA36A11A826');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('612', '52', '提示信息', 'alertInfo', '1', '1', '0', null, null, null, '0', '9', null, '1', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7692ED2638584765852354D7A98284FC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('613', '52', '允许为查询条件', 'isFind', '1', null, '0', 'M', null, null, '0', '10', '{0:''否',1:''是'}', null, '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '405EB4BC84F8464D97121459D396E5E0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('614', '52', '排列顺序', 'orderNum', '1', null, '0', null, null, null, '0', '7', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BD329A1068A94DC1ADF2223B7A2396CE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('615', '52', '枚举类型设置内容', 'menuType', '1', '1', '0', null, null, null, '0', '8', null, '1', '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '776B366C00364A3AB3D0CB0ECF7D0083');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('616', '52', '展示类型', 'disType', '1', null, '0', 'M', null, null, '0', '13', '{0:''文本框',1:''文本域',2:''枚举'',3:''复选框'',4:''其他''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B631C44648A1461C9661A497117E9FFF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('617', '52', '自定义内容', 'disContent', '1', null, '0', null, null, null, '0', '14', null, '1', '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1545DE3D40534FEFBE1E3286A5FF18C4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('618', '53', '主键', 'id', '0', null, '0', null, null, null, null, null, null, null, '0', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '34D677B6CA474CF6AAD768143A48D3AE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('619', '53', '平台id', 'platformId', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C701BC773C11454CA44F931FDC705E57');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('620', '53', '问题ID', 'questionId', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EC60BBAA1354446F8262E9005C55FC6C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('621', '53', '问题得分', 'score', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5CEBE5219F764D46AF8DB24463BA1FDB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('622', '53', '匹配程度', 'matchValue', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BBBEF70190894C9CBE6BF86844D5A6ED');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('623', '53', '调整后得分', 'adjustScore', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FE10593784AB44F79125DAB344D231F2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('624', '53', '调整原因', 'adjustReason', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '546A951865CB4A33A222832E72295A45');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('625', '53', '调整人', 'adjustPerson', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '258D01ECFCA54522BBF575153661FEE8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('626', '53', '调整时间', 'adjustTime', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '87525151AA2240B99C9EB27D5A4AF2BF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('627', '53', '处理方式', 'handleState', '1', '1', '0', 'M', null, null, null, null, '{0:''客户否决'',1:''人工排查''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B5ACF50A381B4BE2A22D68BC403D6354');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('628', '53', '处理原因', 'hendleReason', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '803484BA68344CE18D6751B02ABD68DD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('629', '53', '否决分', 'vetoScore', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0CD0AD19C1EC4919B20C951F248DBC54');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('630', '53', '处理时间', 'handleTime', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0179DC9A2B2843F4B238E15446B3DA65');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('631', '53', '问题得最终得分', 'finalScore', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D3005EF5E9224F53BCC4C9EC057BD01B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('632', '53', '备注', 'memo', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '007D076E9A7F48DA9178C43E23FED007');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('633', '53', '问题状态', 'questionState', '1', '1', '0', 'M', null, null, null, null, '{0:''未处理',1:''已处理'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '479296AD71864464B0CD4F18F8B12D8E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('634', '53', '计算标识', 'calculateType', '1', '1', '0', 'M', null, null, null, null, '{0:''自动'',1:''手动''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FE93098702A44128BBF0EF75524BF648');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('635', '53', '作为特征结果表外键', 'qResultId', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D4CAEAB8C46A4C70BEFC7F2C138225E2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('701', '56', '确认人员', 'confiromer', '0', null, '0', null, null, null, '0', '72', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E2B0F70B3E2E46A09F30ACFEE24224DD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('702', '56', '整改状态', 'status', '0', null, '0', 'M', null, null, '0', null, '{''1'':''未整改',''2'':''已整改'}', '0', '0', '1', '0', '0', '0', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5A9E6D87C18D4567A7D703850DD076D3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('704', '52', '修改时是否显示', 'modifyDisplay', '1', '0', '0', 'M', null, null, '0', '6', '{ 0:''否',1:''是'}', '0', '1', '1', '0', '1', '1', null, '0', TO_TIMESTAMP(' 2018-06-14 09:14:12', 'YYYY-MM-DD HH24:MI:SS:'), 'gly', null, 'gly', '0', null, null, null, null, '08246867749E445C9C0F60A8989DF4AC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('705', '52', '新增时是否显示', 'addDisplay', '1', '0', '0', 'M', null, null, '0', '6', '{ 0:''否',1:''是'}', '0', '1', '0', '0', '1', '1', null, '0', TO_TIMESTAMP(' 2018-06-14 09:00:37', 'YYYY-MM-DD HH24:MI:SS:'), 'gly', null, 'gly', '0', null, null, null, null, '81A5B74A706D4E6DAD2B88D1076BB6CF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('706', '56', null, 'nodatacolumn', '1', null, '0', null, null, null, '0', '8', null, '4', '1', '0', '0', '1', '1', '''<span style="font-size: 14px;font-weight: 900;margin-left: -44px;">风险信息</span>''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'ECF008C01C134D5495386152DD3AD722');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('707', '42', null, 'nodatacolumn', '1', null, '0', null, null, null, '0', '25', null, '4', '0', '1', '0', '1', '1', '''<span style="font-size: 14px;font-weight: 900;">托管机构信息</span>''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CF9AD72BD02C4699827983F560B99E1D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('708', '42', '关闭或注销日期', 'closeDate', '1', '0', '0', 'TD', null, null, '0', '26', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9F5248BC77974DE187B231F8DB7942DF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('709', '42', '托管机构名称', 'custodianBank', '1', '0', '0', '1', null, null, '0', '27', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '78FFFA95F9AD410589EEA28795F662F3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('710', '42', '托管机构协议', 'agreement', '1', '0', '0', '1', null, null, '0', '28', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '13F0E16054D4472EB5F718B221882C4B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('711', '42', '托管账号', 'custodianAccount', '1', '0', '0', '1', null, null, '0', '29', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FC49487B1377485FB7E607D6DBB12F8A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('712', '42', '账户名称', 'accountName', '1', '0', '0', '1', null, null, '0', '30', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D89E3AD7734B48DD9A4DECE6C4A6C176');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('713', '42', '开户机构', 'organizations', '1', '0', '0', '1', null, null, '0', '31', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4A19650418814FB082F4E2B8A49EAFFA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('714', '42', '托管合同生效时间', 'startDate', '1', '0', '0', 'T', null, null, '0', '32', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1FB57B6EE26E476595CE10CBA83365FA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('715', '42', '托管合同结束时间', 'endDate', '1', '0', '0', 'T', null, null, '0', '33', null, '0', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8C7A8B5F31A84C81BE016062EEE380E9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('716', '42', '保证金', 'cashDeposit', '1', null, '0', null, null, null, '0', '40', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E7BFDA00F6E44F179247A0018D5BADA0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('717', '42', '风控制度', 'riskControl', '1', null, '0', null, null, null, '0', '41', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E1721113B1AE459982991CC0592E6834');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('718', '42', '平台性质', 'platformNature', '1', null, '0', 'M', null, null, '0', '42', '{''1'':''信息中介'',''2'':''引入担保方',''3'':''线下业务线上放贷''}', '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1641D64BC0384B358BF070B173E276DE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('719', '42', '机构性质', 'custodianBackType', '1', null, '0', 'M', null, null, '0', '43', '{''0'':''银行'',''1'':''第三方支付'}', '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '96D123B2CDFA4B479A936B620CA1EED2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('720', '42', 'logo图片url', 'logoFilePath', '1', null, '0', null, null, null, '0', '44', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E0D1619772834CF59F06C32451D0AB88');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('721', '49', '监管等级', 'supervisionLevel', '1', '0', '0', 'M', null, null, '0', '19', '{''1'':''一般监管',''2'':''重点监管'',''3'':''无需关注''}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4F1ED60C394C421A8AC8A7788D39B501');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('722', '42', '区县', 'country', '1', null, '0', 'MT', null, null, '0', '45', null, '0', '1', '0', '0', '1', '1', null, '0', null, null, null, 'zhaosdb', '0', null, null, null, null, 'E1B6C6E8FD934C60BB660B8DB30365A9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('723', '42', '备注', 'memo', '1', '0', '0', null, null, null, '0', '50', null, '1', '1', '0', '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, '9EB0796D510C4005A2A9700938C97AA9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('724', '51', '主键ID', 'id', '1', null, '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'zhaosdb', null, 'gly', '0', null, null, null, null, '7A559E1A5E414954B10072F7C9D0E46E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('725', '58', '主键ID', 'id', '0', null, '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, 'zhaosdb', null, 'zhaosdb', '0', null, null, null, null, '6698A4BED02F4632A517D1BB6B0F6E87');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('726', '58', '平台ID', 'platformid', '0', null, '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'zhaosdb', null, 'zhang', '0', null, null, null, null, 'EEA4EB5F0B7B44FF957A1B670F3B3380');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('727', '58', '平台名称', 'platformName', '0', null, '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'zhaosdb', null, 'zhang', '0', null, null, null, null, 'A4002FF3D62541A0A21CEA938A6100E1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('728', '58', '模板ID', 'tableId', '0', null, '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, 'zhaosdb', null, 'zhaosdb', '0', null, null, null, null, 'B958970E82F14E45BC21693D0A6838F4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('729', '58', '模板名称', 'tableName', '0', null, '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'zhaosdb', null, 'zhaosdb', '0', null, null, null, null, 'F28B4B53D9474996B7DB7CB572BC86A0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('730', '58', '期次', 'period', '0', null, '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'zhaosdb', null, 'zhang', '0', null, null, null, null, '200D68C4E8D840AD869F1D071B3F0F18');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('731', '58', '是否上报', 'status', '0', null, '0', 'M', null, null, '0', null, '{ 0:''未上报',1:''已经上报''}', '0', '1', '0', '0', '1', '1', null, '0', null, 'zhaosdb', null, 'zhaosdb', '0', null, null, null, null, '672BD47357F246EDA5597D44D8865011');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('732', '58', '期次', 'period', '0', null, '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, 'zhaosdb', null, 'zhang', '0', null, null, null, null, '3CFED62919FF4C86B198384FD53A2EC3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('733', '43', '头像', 'photo', '1', null, '0', 'F', null, null, '0', '19', null, '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FFDC6DFD4EC440F59A6A5780B1B2BD12');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('734', '43', '电话号码', 'phoneNumber', '1', null, '0', null, null, null, '0', '17', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '194C395B983249AE882F69AAD0B936F8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('735', '43', '人员简介', 'intro', '1', null, '0', null, null, null, '0', '18', null, '1', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9776CE32966D4D8F8EA31461B3E1DBFC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('736', '59', '主键ID', 'id', '1', '0', '0', null, null, null, '0', null, null, '0', '0', '1', '0', '1', '0', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A7CC88C9894B41EBABC73563DE32DBC7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('737', '59', '表名', 'tableName', '0', '0', '0', null, null, null, '0', '1', null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5A6E2B57EEDC428A8BCCEBE58FA2454C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('738', '59', '表的英文名', 'tableEname', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '46288C404E864C0BAC9D4193221A7DFB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('739', '59', 'excel名称', 'excelName', '1', null, '0', null, null, null, '0', null, null, '0', '1', '0', '0', '0', '0', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E59612A0F75F46358189900E71A86696');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('740', '59', 'excel路径', 'excelPath', '1', null, '0', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '0', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '11180D813A1745AFA1F6BCE8B1A5DAD0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('741', '59', '是否生成excel', 'generatedFlag', '1', null, '0', 'M', null, null, '0', null, '{''0'':''未生成',''1'':''生成''}', '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0C735E5E4B054C69B3BAA78CF56C9040');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('742', '59', '保存excel数据的sql', 'insertSql', '1', '0', '0', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '0', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E842374FA58B46698BB00974A5B6BCDF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('743', '60', '主键ID', 'id', '1', null, '0', null, null, null, '0', null, null, '0', '0', '0', '0', '1', '0', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A61669823B7B4FE3B80CE9A1CF5B000B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('744', '60', '配置表ID', 'tableid', '0', null, '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7D0D57948CD04FE094329B8B34F211F4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('745', '60', '配置字段中文名', 'columnname', '0', null, '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '38136A814DB94AE5837703093C97A3DE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('746', '60', '配置字段英文名', 'columnename', '0', null, '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F3AD4AA3DD1740F6A9822540DF425848');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('747', '60', '是否为空', 'isNull', '0', null, '0', 'M', null, null, '0', null, '{ ''1'':''是',''0'':''否'}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BAA88089558442108E5984DAC44198AB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('748', '60', '是否允许重复', 'isEqual', '1', '0', '0', null, null, null, '0', null, '{1:''是',''0'':''否'}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3C7C23F9A51D46288AC71888DAF320C2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('749', '60', '是否为系统字段', 'isSystem', '1', '0', '0', 'M', null, null, '0', null, '{''0'':''否',''1'':''是'}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'AFD9FB5F7F5048C3B6DB04433252F602');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('750', '60', '字段类型', 'dataType', '1', null, '0', 'M', null, null, '1', null, '{ ''S'':''字符串',''L'':''长整型',''I'':''整形'',''D'':''浮点类型'',''T'':''时间'',''TD'':''日期'',''M'':''枚举'',''NM'':''枚举库',''ZDY'':''自定义方法'}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E6B0AD97D0EF448EA3C27452ECAD8676');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('751', '60', '正则表达式', 'matchInfo', '1', null, '0', null, null, null, '0', null, null, '1', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3183E29746884EE6815C5CAD643B1028');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('752', '60', '正则提示信息', 'alertInfo', '1', null, '0', null, null, null, '0', null, null, '1', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '18ED9ABAD69C43E1A919AFC699DEA41E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('753', '60', '枚举类型设置内容', 'menuType', '1', null, '0', null, null, null, '0', null, null, '1', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'ED93EE6CFA234FE39DAAF1BE6F97B2FB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('754', '60', '是否允许重复', 'isEqual', '0', null, '0', 'M', null, null, '0', null, '{ 1:''是【代表不能重复】',0:''否【代表可以重复】'}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7B7779C5612C428794E8D786652E99A4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('755', '60', '是否为系统字段', 'isSystem', '0', null, '0', 'M', null, '{0:''否',1:''是'}', '0', null, '{0:''否',1:''是'}', '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8854071282DD4A88A5921D62573F66BC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('756', '60', '允许为查询条件', 'isFind', '0', null, '0', 'M', null, null, '0', null, '{0:''否',1:''是'}', '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DD0DB487098A405884881E534AA6B411');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('757', '60', '查询时是否显示', 'findDisplay', '0', null, '0', 'M', null, null, '0', null, '{0:''否',1:''是'}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E8946AB30CD742448591F862CD37969A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('758', '60', '排列顺序', 'orderNum', '0', null, '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1F0B706236604E2C94B91E749149D554');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('760', '60', '展示类型', 'disType', '1', null, '0', 'M', null, null, '0', null, '{0:''文本框',1:''文本域',2:''枚举'',3:''复选框'',4:''其他''}', '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F44EAC9528334E9D9CCB00DF8EB4D571');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('761', '60', '自定义内容', 'disContent', '1', null, '0', null, null, null, '0', null, null, '1', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '76447B9D90DF49EF8FE4224008E609D1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('762', '61', '行政区划id', 'areaId', '1', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B504242B120C404BAFD1BE80D5E19374');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('763', '61', '行政区划名称', 'areaName', '1', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '76EBD379EB0B4AF3A4DAE60150575EA9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('764', '61', '区域级别', 'areaLevel', '1', '0', '0', 'M', null, null, '1', null, '{1:''省',2:''市',3:''区县''}', '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CF458749C0B44691B4EE091CBAF2C7CC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('765', '62', 'id', 'id', '0', null, '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '31EEB4E9153840608DDD01B9C2B38F95');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('767', '1001', '值班领导职务', 'ZBLDZW', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BABA17AB091F4A01AE1959E2D4587B5D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('768', '1001', '值班领导姓名', 'ZBLDXM', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '068322A213604193966AF2AF6FC99079');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('769', '1001', '值班员职务', 'ZBYZW', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D63F27F131BF4288BEF747DB4B4E47EB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('770', '1001', '值班员姓名', 'ZBYXM', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '753051539EC94F4E89A8EA4B4EF8EC3D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('771', '1001', '军衔编制', 'JXBZ', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '911994439BDE4FA4B89D6FF8B147832A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('772', '1001', '军衔编制在位人数', 'JXBZZW', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1C24D2F8673C45BC9011E457843B9B28');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('773', '1001', '士兵编制', 'SBBZ', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8908590DCB7A40C38571CFA284E74777');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('774', '1001', '士兵编制在位人数', 'SBBZZW', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A8EDC49368094FB3992DC1273DC450AD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('775', '1001', '实力数', 'SLS', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8F6E0459BB874750827D3761A6DB3C0B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('776', '1001', '现在数', 'XZS', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E35E9DAEFE144B248930E31511816C6F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('777', '1001', '送修待修数', 'SXDXS', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6CD3FA6537774A4C8F73556C84B38AB1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('778', '1001', '待报废数', 'DBFS', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5145D53D516A456FA2DAA9E883B8F314');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('779', '1001', '受检单位总数', 'SJDWZS', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '17B9A20D7B1548DEA207D505357ACB0C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('780', '1001', '当日检查数量', 'DRJCSL', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FFDFF2EA060F4739849B187E2E787A5A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('781', '1001', '合格数量', 'HGSL', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F696331D191949818ED23E06CE86CE24');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('782', '1001', '不合格数量', 'BHGSL', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B95FD3C00C5F48D8B652D30F0F919685');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('784', '1002', '任务名称', 'RWMC', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1138360F438D4BFD90B9ECDE531544FC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('785', '1002', '任务地域', 'RWDY', '0', '0', '0', 'NM', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7298B83ABEE54E69B05FF15B50E4EA10');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('786', '1002', '动用兵力人数', 'DYBLRS', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '40ADB6F26134420B9F890F01D5BFDD23');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('787', '1002', '动用车辆数量', 'DYCLSL', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '08EFEF699ED34EC5AC855D05191CD3A7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('788', '1002', '动用通指装备数量', 'DYTZZBSL', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '45C3D1065E7E440A9A7DE1D6D1B516E6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('789', '1002', '任务时间', 'RWSJ', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5A0D373915A5499DB8B9894B399EB5D9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('790', '1003', '故障属性', 'GZSX', '0', '0', '0', 'M', null, null, '0', null, '{''指控系统'':''指控系统'',''数据链':''数据链',''指挥视频'':''指挥视频'',''光缆网':''光缆网',''卫星网':''卫星网',''短波网':''短波网',''指挥专网'':''指挥专网'',''军综网':''军综网',''移动通信网':''移动通信网',''指挥网站'':''指挥网站'',''托管系统'':''托管系统'',''容灾备份'':''容灾备份'',''违规外联'':''违规外联'',''病毒事件'':''病毒事件'',''网络攻击'':''网络攻击'',''卫星监测'':''卫星监测'',''短波监测'':''短波监测'',''干扰查处'':''干扰查处''}', '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0A45A00F73D64D4D9AE6DE948B51660B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('791', '1003', '故障内容', 'GZNR', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C09B2ECE9B1040EEB020403BD5F7AED1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('792', '1003', '故障影响', 'GZYX', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DAD57E8689304BCF8BF2DADED7744468');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('793', '1003', '故障原因', 'GZYY', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A5BDF1B081594CECBC4EAB47DDF485F7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('794', '1003', '处置情况', 'CZQK', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '92D0BF575FD64900817DBEF5CC0BFFBC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('795', '1003', '维护单位', 'WHDW', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FAC9A1959FB0466E8948702B625A7AAB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('796', '1004', '任务名称', 'RWMC', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4BA86CBDAAD741838F13E54DE52DE0DF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('797', '1004', '任务兵力数量', 'RWBLSL', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '744112A99EFC450E924B9679302413E8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('798', '1004', '任务装备情况', 'RWZBQK', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B479FCD894EC4C538A1ADBFEAD86115D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('799', '1005', '演训名称', 'YXMC', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D52B953A270941269EF20799787081C0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('800', '1005', '参训主要领导', 'CXZYLD', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D2C04EC911804FA6A37C8E39958F3899');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('801', '1005', '演训时间', 'YXSJ', '0', '0', '0', 'S', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8203B72544BF45399E2A9B116918E0DF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('802', '1005', '参训兵力数量', 'CXBLSL', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F88B8B5FDF2F4B66A7F45CBA024C32C4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('803', '1005', '动用装备数量', 'DYZBSL', '0', '0', '0', 'I', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8B3BDD0B682E402783934E4340F68B47');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('804', '1001', '抽检ID', 'CJID', '1', '0', '1', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '33E006F904C246DD9554E0A064353BA1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('805', '1001', '内码', 'NM', '1', '0', '1', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '1', null, null, null, null, '51B0206C4335402994293E12F0326C07');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('806', '52', '是否为主键', 'ISKEY', '0', '0', '0', 'M', null, null, '0', null, '{0:''否',1:''是'}', '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A72ADAF8DB9E42C9A8FFDAA5E387409C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('878', '1011', '功能标识', 'GNBS', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DE96BCA8641B4C0DA756BA042094CF15');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('879', '1011', '功能标识中文', 'GNBSZW', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '867B1C302C4948719D532E6E7A07F5B7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('880', '1011', '功能表名称', 'GNBMC', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BB9A408D552B49F0B918A578AB28296E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('881', '1011', '单位内码', 'DWNM', '1', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '9495A4ECBF20417EB457C166E2E08A27');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('882', '1011', '单位名称', 'DWMC', '0', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F8FD64943F0C4AFA8C04EE3BE4854E72');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('883', '1011', '席位名', 'XWM', '0', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FC597345320F4BF7A5EEA7D9D603576C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('884', '1011', '序号', 'XH', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FBD2ADB9C3214546A6FCE8850B2A543F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('885', '1011', '导出模板名称', 'DCMB', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7DB6A96AEDB24F478E872433DFAE725E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('886', '1011', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D29A29A9FED7417DBE1AB1868E3EF902');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('887', '1010', '功能标识', 'GNBS', '0', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8EE0CA8DFA614D0786F6F2E6F02A9AC8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('888', '1010', '字段名', 'ZDM', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1958CDD98B1241BC903BE72C7E4FFD87');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('889', '1010', '字段名中文', 'ZDMZW', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C256AA32168E48BBA01106B4FBBCEB5D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('890', '1010', '字段长度', 'ZDCD', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'EBB3213DCB454FF5A5481F5BDBB47559');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('891', '1010', '字段类型', 'ZDLX', '1', '0', '0', 'M', null, null, '0', null, ' {''S'':''字符串',''L'':''长整型',''I'':''整形'',''D'':''浮点类型'',''T'':''时间'',''TD'':''日期'',''M'':''枚举'',''F'':''附件'',''SF'':''身份证号码',''NM'':''枚举库',''MT'':''枚举方法'',''CT'':''中文日期''}', '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '743BA4E62CCD4F9C9A16F7A937B25938');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('892', '1010', '非空标识', 'FKBS', '1', '0', '0', 'M', null, null, '0', null, '{''0'':''可控'',''1'':''非空''}', '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '801F6FB9A8A54073BE8E6B1FBF9188AB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('893', '1010', '汇总对应标识', 'HZDYBS', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '9649CC60B02A4BC387941AAE8E9387B9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('894', '1010', '列表界面是否显示', 'LBXSBS', '1', '0', '0', 'M', null, null, '0', null, '{''0'':''不显示',''1'':''显示''}', '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B842604C864747F2A0EC79EC2C540077');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('898', '1010', '单位名称', 'DWMC', '0', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2A39265E367045CD94830D317BBE8BFC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('899', '1010', '席位名', 'XWM', '0', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '17ED21D88E0F43AD9003928C6518512D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('900', '1010', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E336D296B25B4A56A2C2BA43A9831C48');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('901', '1010', '标识', 'BS', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, '{''0'':''全部'',''1'':''本单位'}', '0', null, null, null, null, '0', null, null, null, null, '63901D95A1524F7E9075B4AA153AD68A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('940', '1013', '接收单位', 'JSDW', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3772009D2DB8486DB96623AE50A43906');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('941', '1013', '审阅时间', 'HZSJ', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '177F39F85C4343E8965BB6FE06782399');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('942', '1013', '审阅情况', 'HZQK', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '648399CBF2AC4F2B8E72CF49A52AB011');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('943', '1013', '内码', 'NM', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '79864D030A2148C1B2206EFE29102CEE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('944', '1013', '发送单位', 'FSDW', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '146887495F9D4837BA65124B9932612F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('945', '1013', '发送日期', 'FSRQ', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4118A4420C344238A1AAA7429CD1BBE2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('946', '1013', '情况日报内码', 'QKRBNM', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CD5EC9DE36554A07A92CADC76F7CDFF8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1068', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0C538F6589F943F49F64B2D1DB2BDAC7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1069', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E7A6CAC4A5314EA2B6A0EBD982AB9B8B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1070', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '943D8E9B23194D83AE40FC2C77839B7A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1071', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FB1C0E251A8F4F3DA7C6DF0CA614E33A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1072', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6A6B79516C454A7198D74324C1014183');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1073', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '53C233A48B4E48B09B188237D617059B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1074', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '9A26B1D06FB544D195920D1B919648B2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1075', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A2B2D4684AAA4D8E8BBB18C956CB50D3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1076', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1DB092F5C6E146CCA731378BFDA34111');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1077', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'EC5733FDE794438D894BCBF87538B13F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1078', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '93E6DBBA55D041139DA82A6F2B10CFF6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1079', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CB4F8A12B4154938A4FA8A5F1274542F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1080', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C1DCAC97CE9A4CB4A1B273BCC1967BFC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1081', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B89BEBF90C9D4411ABCCC1A2D7A2CC4D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1082', '0', '指挥文电情况说明', 'ZHWDQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'AE6307EF7F5A4136AE2F7E0CE56FF62A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1100', '1022', '自动电话', 'ZDDH', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BD057AE54C6A4DC7B782B0FD914786AE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1101', '1022', '保密电话', 'BMDH', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '779966ACE2D84E45AA8790B232FD3162');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1102', '1022', 'IP电话', 'IPDH', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2C857675CAE14E2E8C878B5E80F9C2D7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1103', '1022', '席位传真', 'XWCZ', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '900688EB0B4A45D7B2782BF55138BED8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1104', '1022', '人工台', 'RGT', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '31BE6410B8424459898FC07D63EA49C7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1105', '1022', '人工台级别', 'RGTJB', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E970392D23CC4C33AEFBF72AD77AA105');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1106', '1022', '文电地址', 'WDDZ', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'EE94C845ED994F42B3A1009752D04E7F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1107', '1022', '保密机', 'BMJ', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8D47DD3B046C492D9C8F535FE00ECD9E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1108', '1022', '密钥', 'MY', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0695825622B04B3297D7793F873BA573');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1109', '1022', '部署位置', 'BSWZ', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '60549C6D378F4737902F8E730AC3B71E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1110', '1022', '备注', 'BZ', '1', '0', '0', null, '/^[\s\S]{0,500}$/', '长度不可以超过500位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '568892105DBB4D709DA5ADFECB05E5B9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1111', '1022', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2170AF03D1314E33A74497DEB315B3B4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1112', '1022', '用户标识', 'USERID', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B4F26127A1E848B9BF2599C5AE20CFB2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1113', '1022', '原番号', 'YFH', '1', '0', '0', null, '/^[\s\S]{0,127}$/', '长度不可以超过127位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1915FBA4046B4A10BD02C271B4E5A00A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1114', '1022', '编制军官数', 'BZJGS', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0274D77FDC244FD183DAC1E276E7F4B8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1115', '1022', '编制士官数', 'BZSGS', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3072D1F365594FF4880304DF1C9F52EA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1116', '1022', '编制义务兵数', 'BZYWBS', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '83282AE35CD84EF0BE26FD4141ADD921');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1117', '1022', '作战值班电话', 'ZZZBDH', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '948755F8FDA444DBA7955ADA04740C7A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1118', '1022', '作战文电地址', 'ZZWDDZ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5D25AAE37A2C4DA480F684A099AC61B5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1119', '1022', '原驻地', 'YZD', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E2CE96DA620E4F2E9466BFC4864AA832');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1120', '1022', '实有军官数', 'SYJGS', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C595FE7D87B64E859B4CACB0AEB64EE9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1121', '1022', '实有士官数', 'SYSGS', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CF611D78AAB24064AA4AF43740E3903F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1122', '1022', '实有义务兵数', 'SYYWBS', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '989F9A6DF91447618DD9B2AA0C6254F4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1123', '1022', '通信值班电话', 'TXZBDH', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FD34B81CE5AF46B49D93CEE026DFB68F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1124', '1022', '通信文电地址', 'TXWDDZ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'EE2C643408324337BF75CF2022CDDC71');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('895', '1010', '维护界面是否显示', 'WHXSBS', '0', '0', '0', 'M', null, null, '0', null, '{''0'':''不显示',''1'':''显示''}', '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '779877A0103248A193DFAB83C5CBEA74');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('896', '1010', '序号', 'XH', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FD87B2350EF041E48D9227A50EFCD7FE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('897', '1010', '单位内码', 'DWNM', '0', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F22F5C213A174A93B9A0CA452A58547A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1125', '1022', '指挥所驻地/单位驻地/部队驻地', 'XZD', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '50345B24844D4E3FB418D6C551183E15');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1132', '1022', '值班室简称', 'BDDH', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8444D18FF9674062B5678B756DE37E2A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1678', '1006', '频谱今日值班领导职务', 'PGJRZBLDZW', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6C3A84C67E3A43EBB54643CB0DFEA8CC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1679', '1006', '频谱今日值班领导姓名', 'PGJRZBLDXM', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '167BA3F012D5482DA9FBF9C89A5047EA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1680', '1006', '频谱今日值班员职务', 'PGJRZBYZW', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '769FFD0A661F42CC8E2CB8747A4BD923');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1681', '1006', '频谱今日值班员姓名', 'PGJRZBYXM', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C661BC74A0EC48079E8CC3A35BED3BB2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1682', '1006', '频谱明日值班领导职务', 'PGMRZBLDZW', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '31DAF189CCE340B8B1E6008FF1DF97E1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1683', '1006', '频谱明日值班领导姓名', 'PGMRZBLDXM', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B523B9489EC9409D99B0A9711EFF828B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1684', '1006', '频谱明日值班员职务', 'PGMRZBYZW', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '9AFAB74B854145999933728DA422A4F8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1685', '1006', '频谱明日值班员姓名', 'PGMRZBYXM', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1E7C3467BEB8458F92D2494792DBA652');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1429', '1006', '今日值班员职务', 'JRZBYZW', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', '8', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-5''>
	<div class=''form-group''>
		 <label class=''control-label''>
		 	<span>职务：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name=''JRZBY'' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1512', null, '8B2CF2AB30524A98B933CC384230ECC7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1430', '1006', '今日值班员姓名', 'JRZBYXM', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', '9', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-5''>
	<div class=''form-group''>
		 <label class=''control-label''>
		 	<span>姓名：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1512', null, '60CFCC90841B4003AE7984A68A5DBF1A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1431', '1006', '明日值班领导职务', 'MRZBLDZW', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', '10', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-5 JRZBLDZW''>
	<div class=''form-group''>
		 <label class=''control-label''>
		 	<span>职务：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name=''JRZBY'' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1513', null, '2009C96EB3874E6D9CF90A99747D9067');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1432', '1006', '明日值班领导姓名', 'MRZBLDXM', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', '11', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-5''>
	<div class=''form-group''>
		 <label class=''control-label''>
		 	<span>姓名：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1513', null, 'DA06A9B32A3B4D9C8EAE000468C17566');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1433', '1006', '明日值班员职务', 'MRZBYZW', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', '12', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-5 JRZBLDZW''>
	<div class=''form-group''>
		 <label class=''control-label''>
		 	<span>职务：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name=''JRZBY'' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1514', null, '8C24A35C30F6445997CAC97E01BC1FF0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1434', '1006', '明日值班员姓名', 'MRZBYXM', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', '13', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-5''>
	<div class=''form-group''>
		 <label class=''control-label''>
		 	<span>姓名：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1514', null, '46A627C8718C4B9398F44CF69C51D10D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1812', '1027', '战备检查检查合格单位数量', 'ZBJCJCHGDWSL', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'C5B58AA196AF4100B9B4389FEA6EE5C5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1813', '1027', '文电通联检查合格单位数量', 'WDTLJCHGDWSL', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '96625E3854634C1B80E52099F457863B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1814', '1027', '视频指挥检查合格单位数量', 'SPZHJCHGDWSL', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'F3F0F95E560D4BF2BB143B795626E4F4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1815', '50', '内码', 'NM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '1', null, null, null, null, '3573E4FF416046039FE3939FE5A2CB04');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1820', '1074', '重大任务保障情况', 'ZDRWBZQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', 'CD90062F341644C29CA519E8726DEB76');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1677', '1028', 'JS内容', 'CONTENTJS', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'AADACB20E0554FF8A5B62E3604C079E8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1821', '1074', '通指网系运行情况', 'TZWXYXQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '64EA962F603243B7AA5C86D58DD4CE4E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1449', '1007', '运行情况', 'YXQK', '1', '0', '0', null, null, null, '0', '30', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1515', null, '39D7CAAFEA62482D9485402C05602C69');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1450', '1007', '故障设备厂家', 'GZSBCJ', '1', '0', '0', null, '/^[\s\S]{0,200}$/', '长度不可以超过200位！', '0', '90', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
		 <label class=''col-md-5 control-label''>
		 	<span>故障设备厂家：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1515', null, 'EE085535F9E74FB9BD439B13C9435200');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('65', '21', '推荐人手机', 'recommendedPhone', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E9005C7ACB3D4EB4B69D81027689F7ED');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1822', '1074', '网络安全态势监控情况', 'WLAQTSJKQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', 'BF0B4BEFB26C454AA4439DED81CEB62D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1823', '1074', '电磁频谱管理情况', 'DCPPGLQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '7390D2D6BFFA45D5A4CDB9FC7DCE6E25');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1824', '1074', '综合信息服务情况', 'ZHXXFWQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '4F3D18D5C6E04C96AAEBBDDCB91760F5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('66', '21', '注册时间。yyyy-mm-dd hh:mm:ss', 'registrationTime', '1', null, '0', 'T', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, 'C8DC4786C0B9479EB6B9FA1F011C3D74');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('67', '21', '性别。男、女', 'gender', '1', null, '0', 'M', null, null, '0', '0', '{''男':''1'',''女':''2''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '05C32CAD37494A5D9FE8712A10E026FB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('68', '21', '国籍。中国、外国', 'nationality', '1', null, '0', 'M', null, null, '0', '0', '{''中国'':''1'',''外国'':''2''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A31BDAA1E5F04127915367329B8B0E44');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('69', '21', '民族。56个民族加其他', 'nation', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '30EA9999D3CD43BD9F67ADB314FD6877');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('70', '21', '生日', 'birthday', '1', null, '0', 'TD', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EE7C1E1ED08E44CA8FC82C2317C87909');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('71', '21', '常住所在地（省）', 'permanentProvince', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '70181E003BED4CD387B56C380A28E92D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('72', '21', '常住所在地（市）', 'permanentCity', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6E5A344C05D649119826205EFFBEABBE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('73', '21', '详细地址', 'address', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3598E05F8DF24C6B88E36B72C155CBFB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('74', '21', '风险偏好 1,高风险 2,低风险', 'riskLover', '1', null, '0', 'M', null, null, '0', '0', '{1:''高风险',2:''低风险'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F9B5D775A7A543ABBAA382586D5A821A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('75', '21', '婚姻状况。1未婚、2已婚、3离异', 'maritalStatus', '1', null, '0', 'M', null, null, '0', '0', '{1:''未婚'',2:''已婚'',3:''离异''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '54339BC6917C40B484871E3177F2E090');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('76', '21', '购房情况。1有、0无', 'houSesituation', '1', null, '0', 'M', null, null, '0', '0', '{1:''有',0:''无'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7D01D412122942D7B3AD00EDE7CE0BE9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('77', '21', '购车情况。1有、0无', 'carSesituation', '1', null, '0', 'M', null, null, '0', '0', '{1:''有',0:''无'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E91B7FDB374948F48970282EF8A07341');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('78', '21', '文化程度。1小学、2初中、3高中、4大专、5本科、6硕士、7博士', 'educationDegree', '1', null, '0', 'M', null, null, '0', '0', '{''1'':''小学'',''2'':''初中'',''3'':''高中'',''4'':''大专'',''5'':''本科'',''6'':''硕士'',''7'':''博士''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '237C2436520C477E969AD2E00F84CE45');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('79', '21', '企业名称', 'enterpriseName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F9E5DF4B642D49D8B8CB3CC384020F83');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('80', '21', '组织机构代码', 'organizationCode', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '899396AFF3A84FF2BA0E3AC78E83A493');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('81', '21', '工商注册号', 'egistrationNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0E854FF616DF43DB89EEDBA0A45B3CA4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('82', '22', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '81022CB28A0148CE92809A6C84338F5F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('62', '21', '身份证号', 'idCardNumber', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '69D39FF1832543C686C27017F50DD95D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('63', '21', '手机号码', 'phone', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D02DDAE0FDF942B0AA3C49A3236A184C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('64', '21', '邮箱', 'email', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '27374685CC794BA7873E0CA34B5B3C52');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('83', '22', '所属平台id', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EE75D85116774E3B94A33E6F17E46CD7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('84', '22', '托管银行或第三方支付机构名称', 'custodianBank', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '731C3CB5448944D9BE9782FD83CE12D2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('85', '22', '托管协议或合作协议。附件', 'agreement', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '85EEBF0ABC534B66A9D8A1CD258144A1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('86', '22', '开户机构', 'organizations', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7467D6C4FA34477D94961D2481384E86');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('87', '22', '账户名称', 'accountName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4A008DD6E7F4488CB2F764F5C0D5172F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('88', '22', '托管账号', 'custodianAccount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '50BE408CAFE249009A33CB4715C57F9A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('89', '22', '托管合同生效时间', 'startDate', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BF78BA5A88BC4AB5A0FCC88FA3BE6DB5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('90', '22', '托管合同截止时间', 'endDate', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '68E9AB3954674A4A8F475F5CEC2D74B6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('60', '21', '真实姓名', 'name', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BCB36267F0D049699C8397270B8B8892');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('91', '23', '银行卡id', 'bankcardId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '06D577E8E081464ABD486125BB5BA14B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('92', '23', '用户id', 'userId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B394B8F05F034FB0BA7F37461224EBC8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('93', '23', '所属平台id', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C1A3094B65254338934639A4ECDC71C1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('94', '23', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8FD7A7D719774F53AA2FB7A51261319B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('95', '23', '开户人姓名', 'accountName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F16C7246161845F1AB3834CBB684C407');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('96', '23', '开户银行', 'bankName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4D52FAE2F86E4842B19B0BFBA97A5EEB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('97', '23', '支行名称', 'bankBranchName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0C41316289EA4F4C88CDFCF5793167FD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('98', '23', '开户地区', 'openArea', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6E4BD5F23BB24230A50A2C3D2E32BB59');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('99', '23', '银行账号', 'bankAccount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A3C5BB66C8D54D5F8E7A659DA2F828EE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('100', '23', '绑定时间', 'bindingTime', '1', null, '0', 'T', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '38722677EEA24EBCBAE91433CC831BA9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('101', '24', '项目ID', 'projectId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CC8403EDD1164D5FAB66F272DB44A39A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('102', '24', '所属平台', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '71D57DAE96294C93A7314AC7A3D8F9A1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('103', '24', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8564A8F6D92C4CF5BA71B121B59141D2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('104', '24', '出资人ID', 'userId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9AA1BC6F9A9845A39186B75356B33237');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('105', '24', '出资人姓名', 'investmentName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'CD6B9C23E0844371A3D417A99449ACC1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('106', '24', '投资时间', 'investmentTime', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6E62D191C04D4BD8969FB998B8AC5F22');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('107', '24', '投入金额', 'investmentAmount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1C4E9EE7DD7841E499A4CDFE7608A5BE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('108', '24', '有效金额', 'validAmount', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7F14F2A0617447409F42A9F8C2D4C83C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('109', '25', '项目ID', 'projectId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9245B5AB2E264ADB8607EC6B070F559E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('110', '25', '所属平台', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9C26191BA54B47AF9B096D820E3111D3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('111', '25', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '09665AA0F73543DDAEE607BC8D3139AD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('112', '25', '融资人或融资企业ID', 'userId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1683F900091348209D011AB9B55902C2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('113', '25', '融资人姓名或融资企业名称', 'financingEnterprise', '1', null, '0', '1', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6A2216669C2E47C38CA9AF2199ADBB7F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('114', '25', '还款时间', 'repaymentTime', '1', null, '0', 'T', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EE0A9A515A5741F0B3514A1E33949749');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('115', '25', '还款金额', 'repaymentAmount', '1', null, '0', 'C', null, null, '0', '0', null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B9A5FE3387A041EBB4459D8C5F6EE416');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('116', '26', '项目ID', 'projectId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3CE01A441C74499A90A9E4635DA16BCE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('117', '26', '所属平台', 'platformId', '1', null, '1', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DA63E54F926F435E9BCA57375B63B987');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('118', '26', '产品id', 'productId', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '803643ECDCFE41ADA29ACBFD2F363362');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('119', '26', '上报期次', 'period', '1', null, '1', '1', null, null, '0', '0', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B311E22824DB41F6A2C966FD46864AB7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('120', '26', '年化收益', 'yearProfit', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '00C3AC8710B34C0B8CF15CC9CBF3A3F4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('121', '26', '项目名称', 'projectName', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5F37CEF12BEA4816BE8FFBA319710E96');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('125', '26', '还款（回报）方式', 'repaymentMode', '1', null, '0', '1', null, null, '0', '0', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4D4607775B69426EB5A9C15182CB606D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('290', '44', '政治面貌', 'politicalStatus', '1', null, '0', 'M', null, null, '0', '0', '{''1'':''群众'',''2'':''中共团员'',''3'':''中共党员'',''4'':''中共预备党员'',''5'':''其他''}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'zhangjl', '0', null, null, null, null, 'BA33656B10364B259A0E8D3071E267EF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1525', '1025', '指挥网站用户每日访问量', 'ZHWZYHFWS', '1', '0', '0', 'L', '/^[\s\S]{0,20}$/', '长度不可以超过20位！	', '0', '60', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
											<div class=''form-group''>
											 	<label class=''col-md-8 control-label''>
										 			<span>指挥网站用户每日访问量（次）：</span>
											 	</label>
											 	<div class=''col-md-4''>
										 		 	<input type=''text'' name='''' class=''form-control''>
												</div>
											</div>
										</div>', '0', null, null, null, null, '0', null, '1', '1529', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '255258EC8EFA44968631DD15035498BD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1526', '1025', '信息引接情况', 'XXJYQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '70', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
	 	<label class=''col-md-4 control-label''>
 			<span>信息引接情况：</span>
	 	</label>
	 	<div class=''col-md-8''>
 		 	<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1529', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '3559CC0994134A2B9BE8441D0F6081F4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1527', '1025', '专题信息服务情况', 'ZTXXFWQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '80', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
	 	<label class=''col-md-4 control-label''>
 			<span>专题信息服务情况：</span>
	 	</label>
	 	<div class=''col-md-8''>
 		 	<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1529', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '548D07481FD54EFFA4BE757BCED8E7D5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1751', '1070', 'undefined', 'GLNM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '089F5E434E0F4CA7ACACF732C9014A5C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1752', '1070', 'undefined', 'WJSY', '1', '0', '0', null, '/^[\s\S]{0,500}$/', '长度不可以超过500位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4D74D88A76FA443BA5ED272C64F6622F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1753', '1070', 'undefined', 'NM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '207BE57049834A5897AA42B2ABCFEF61');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1531', '1025', '信息通信作战数据每日采集量', 'XXTXZZSJ', '1', null, null, 'L', null, null, null, '21', null, null, '1', null, '0', '1', null, '<div class=''col-md-12''>
				<div class=''form-group''>
				 	<label class=''col-md-4 control-label''>
			 			<span>信息通信作战数据每日采集量（条/MB）：</span>
				 	</label>
				 	<div class=''col-md-2''>
			 		 	<input type=''text'' name='''' class=''form-control''>
					</div>
				</div>
			</div>', '0', null, 'test', null, null, '0', null, '1', '1530', 'function jsvalue(oldvalue,currvalue,input,dw){
  	if(currvalue==''''){
  				$(input).val(currvalue);
		}else{
			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));
		}
} ', '3AA95CF7687844C79F6DA7973395F190');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1754', '1070', 'undefined', 'SCSJ', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C6D64396CFC5439D920C4130D2DDE39F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1755', '1070', '文件名称', 'WJMC', '1', '0', '0', null, '/^[\s\S]{0,127}$/', '长度不可以超过127位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '90AB2E4C517B4AC790C5CCCB976C5582');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1756', '1070', '删除标记', 'SCBJ', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'AFA492964C15473F9F536E8E65EFEEC3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1766', '1072', 'ID', 'ID', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5AAB731A09E2400EB0E1951BB5B71CED');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1767', '1072', '回复内容', 'HF', '1', '0', '0', null, '/^[\s\S]{0,1500}$/', '长度不可以超过1500位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F6211ED541D64D1DBE11DE605F6A92D7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1768', '1072', 'undefined', 'HFID', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8461549A893445C5A9811CB5EB6396AE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1769', '1072', 'undefined', 'TIME', '1', '0', '0', 'T', '/^[\s\S]{0,3}$/', '长度不可以超过3位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0FD994FE57994097B75C5F671DA217DF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1749', '1068', '内容', 'NR', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '55094516522345089C6BDC3817735823');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1750', '1067', '内容', 'NR', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B2F8CF5CF35444398E4F6345C2EE1925');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1770', '1072', '用户名', 'USERNAME', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '685259E7F0704CACA71BD2C5A2898FDC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1771', '1072', 'undefined', 'USERID', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F334CBC36FBF450FA6FAB832936E1911');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1772', '1072', '回复对象', 'HFDX', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '45B36AD0DAB749689564A1FF2E48107D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1197', '1023', '部队内码', 'BDNM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '01735F41467D42AFAFE1A511C57F0468');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1198', '1023', '任务名称', 'RWDH', '0', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BA272E8C2DE04D2EABA196BBD2307312');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1199', '1023', '任务地域', 'RWDY', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4813AA9B68FB45E88A596BF89197129C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1200', '1023', '任务性质', 'RWXZ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C60564E30DEE4B58893F83356C6084F9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1201', '1023', '通信保障需求', 'TXXQ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '162E5E6E86AF4975A2EE7D8D8E5E1A43');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1202', '1023', '开始时间', 'KSSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CF588F2A37AF4F0BA3748EE756D24F98');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1203', '1023', '结束时间', 'JSSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CA1153132A5849DAA3CFC66B28F2220B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1204', '1023', '地域经度', 'DYJD', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3F0E0EDD4CC34682858CB28530DCE8FF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1205', '1023', '地域纬度', 'DYWD', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DDB1C9B301824EA4AC9217C37C1D6B40');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1206', '1023', '地域高程', 'DYGC', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '548A2426F43D49D594CDC9F8B91E5ECD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1207', '1023', '用户标识', 'USERID', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1BA40679703B4EBDB1E14DE80ED09D61');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1208', '1018', '指挥专网情况说明', 'ZHZWQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '013E142E3FE64236AC4EC801C3D15AE8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1195', '1023', '备注', 'BZ', '1', '0', '0', null, '/^[\s\S]{0,200}$/', '长度不可以超过200位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '66D09A4886D34C02BE0143712D69F666');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1209', '1018', '军综网情况说明', 'JZWQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F91B9ECF5AA6432BA1DD4C98286CF8F5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1210', '1018', '卫星网情况说明', 'WXWQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '46268B98903B42758C91CD3A3ECD0CE1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1211', '1018', '短波网情况说明', 'DBWQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D28DF9482C67467BA35D2D6D978F0D16');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1212', '1018', '自动电话网情况说明', 'ZDDHWQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6BF920D4A4354AB7A1362F628F820177');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1194', '1023', '任务保障情况', 'RWBZQK', '1', '0', '0', null, '/^[\s\S]{0,200}$/', '长度不可以超过200位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '373DA93D60DF463596A00A24CD6475F1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1213', '1018', '密话网情况说明', 'MHWQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C77EEB79D6964CFDB1FF65ABF763E3FA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1214', '1018', '人工电话网情况说明', 'RGDHWQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6635D1FEEC8A4E82AF53EC199A6DB1CA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1215', '1018', '军用移动通信系统情况说明', 'JYYDTXXTQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A70466BDD5B34224B9D5B0C7DE4BC548');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1216', '1018', '部队内码', 'BDNM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3B2DDEC4198C4788ACC9D3B25E9C5F6D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1217', '1018', '光缆网运行状态', 'GLWYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '316A9D0D3ECF4CF5AFB85B4F7B91B628');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1218', '1018', '指挥专网运行状态', 'ZHZWYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1E63C54830EA42F8833DD024DB02C7CF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1219', '1018', '军综网运行状态', 'JZWYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5A68EE269BA6411DBF5A2268FE0200AA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1220', '1018', '卫星网运行状态', 'WXWYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '587285EF64284AE4BE04814C32BA8E71');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1221', '1018', '短波网运行状态', 'DBWYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7DA5519AE5B44532B5112671066D90EA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1222', '1018', '自动电话网运行状态', 'ZDDHWYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DA9DAC3124314842ABF06DB2C30E52D8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1223', '1018', '密话网运行状态', 'MHWYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '956A2E7A5722452C872A19C979C57F89');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1224', '1018', '人工电话网运行状态', 'RGDHWYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '220AAB2789DD4C4CB75C7BC0A9B1F37E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1225', '1018', '军用移动通信系统运行状态', 'JYYDTXXTYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E8DF3B9BA3A94C49B48FA67A25A77422');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1226', '1018', '光缆网情况说明', 'GLWQKSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F443E15F907B4B9B88DBE4865878C6EF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1227', '1018', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1E940D8A669B4A27B75452F6363F1EB0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1228', '1018', '最近一次更新时间', 'GXSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1BD3C5D2BF3C4850AE405E59ABCAB3B5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1229', '1019', '部队内码', 'BDNM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0EEFFAEEF63E4390A669DCCB07391C28');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1230', '1019', '信息/数据中心运行状态', 'XXZXYXZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '62DEC2F3980B4111A808015B01495C67');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1231', '1019', '信息/数据中心可用存储总量', 'XXZXKYCCZL', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CB0CB76AA9BC4A93A9DCB22358969CC3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1232', '1019', '信息/数据中心当前数据总量', 'XXZXDQSJZL', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '987FB4D3E911499AA24A651120C8BC9A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1234', '1019', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D71B9D6846364C719DAC1C9BDFC33F94');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1235', '1019', '最近一次更新时间', 'GXSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '10641761FBFA49A19470AD49495B0A8A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1236', '1020', '军综网安全事件说明', 'JZWAQSJSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '68FB52626E924FB7A841D50188A22407');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1237', '1020', '指挥专网风险评估结论', 'ZHZWFXPGJL', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '57A4B0E082054FB9AE73B36F6C819307');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1238', '1020', '军综网安全防护状态', 'JZWAQFHZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6688AF722B374DA385D0AFC0E5797654');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1239', '1020', '军综网风险评估主机数量', 'JZWFXPGZJSL', '1', '0', '0', 'L', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '49015FBF643A4C0D9EE22E7663EC4285');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1240', '1020', '军综网风险评估结论', 'JZWFXPGJL', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4E01141EB57B45C085536C8B49DA78EB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1241', '1020', '指挥专网安全事件说明', 'ZHZWAQSJSM', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F8669CA6EDB54F7E959B2116A18320F3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1242', '1020', '内码', 'NM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C7ACAA6EC87C46969FAEAD7F76054778');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1243', '1020', '最近一次更新时间', 'GXSJ', '1', '0', '0', 'L', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F538E939041241CBBA74CD33E051B94E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1244', '1020', '部队内码', 'BDNM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '50D236340EE7459CAE952489A213A9EC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1245', '1020', '指挥专网安全防护状态', 'ZHZWAQFHZT', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F043CD2650C344A193B4670CCC656DD3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1246', '1020', '指挥专网风险评估主机数量', 'ZHZWFXPGZJSL', '1', '0', '0', 'L', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CF1447A7AF544462B515C1335EA22D03');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1247', '1021', '部队内码', 'BDNM', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8B9E7558292D40BAA5F6A6227F311D52');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('637', '52', '是否显示', 'isDisplay', '1', '1', '0', 'M', null, null, '0', '6', '{1:''是',0:''否'}', null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BEEE7F74FC584AD0A29EA81F92BE7FBB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('638', '50', 'where配置', 'sqlwhereColumn', '1', '1', '0', null, null, null, '0', '9', null, '1', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A8DFD276A6924A05AF37EC057FAEE7E5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('641', '54', 'id', 'id', '0', null, '0', null, null, null, '0', '7', null, '0', '0', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B883FACB66AA402685A13B7F57115CAC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('642', '54', '类型', 'type', '0', null, '0', 'M', '{''01'':''个人'',''02'':''企业''}', null, '0', '1', '{''01'':''个人'',''02'':''企业''}', '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1DC7D2E70E214A39A1776DE970C75930');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('643', '54', '姓名/企业名称', 'name', '0', null, '0', null, null, null, '0', '2', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '0BD7285E3A8045DCAE9906A369AA4DAA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('644', '54', '身份证号 / 工商注册号', 'idNumber', '0', null, '0', null, null, null, '0', '3', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FE4385102D1941A0AF193861B0D5514A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('645', '54', '借款金额（万）', 'borrowBanlance', '0', null, '0', 'D', null, null, '0', '4', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8E2C4C28735D4E8597D7A2FC358401C4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('646', '54', '借款时间', 'borrowTime', '0', null, '0', 'T', null, null, '0', '5', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8822AB3C4E9F47AFB54C4FCB74E10B60');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('647', '54', '借款平台', 'borrowPlatformId', '0', null, '0', null, null, null, '0', '6', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '732567FC8D1D45999D24CB72BE65A781');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('648', '55', 'id', 'id', '0', null, '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1DCF58D986394FF8B4C4CF42EB4CA5AC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('649', '55', '查询类型 1-借款余额查询 2-黑名单查询', 'type', '0', null, '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '63D9296787204BF7ACAA3633A01C0F94');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('650', '55', '查询名称', 'name', '0', null, '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '937E55C750D747C795707271BAC9A820');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('651', '55', '查询代码', 'code', '0', null, '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C39F3FEEE93B4A98B29B1294A4D4B812');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('652', '56', 'id', 'id', '0', null, '0', null, null, null, '0', '0', null, '0', '1', '0', '0', '0', '0', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4A68CE372D594E04A6D1E0EC65BF0040');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('653', '56', '发现风险部门', 'findRiskDept', '0', null, '0', null, null, null, '0', '10', null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D9F3F390C8114535909C9E5A3D3711BF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('654', '56', '发现时间', 'findTime', '0', null, '0', 'T', null, null, '0', '30', null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '709EC6D64C574865A5D33DF4971AA951');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('655', '56', '限定整改时间', 'limitTime', '0', null, '0', 'T', null, null, '0', '50', null, '0', '1', '1', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '79B1EC0FACDF41D0BF3C392483EA00B1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('657', '56', '整改完成时间', 'finishTime', '0', null, '0', 'T', null, null, '0', '71', null, '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '22F3993280084BE49A02E619CCEE8235');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('658', '56', '处置意见', 'suggestion', '0', null, '0', 'S', null, null, '0', '65', null, '1', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'FAD5468EE8B14630A68E6A324ABA9D5A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('661', '57', '黑名单类型', 'type', '0', '0', '0', 'M', null, null, '1', '3', '{''1'':''企业'',''2'':''个人''}', null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F4A4CAD8B0DE453188A3923BEEEDA916');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('662', '57', '姓名或企业名称', 'name', '0', '0', '0', null, null, null, '0', '1', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4F78BF600BDD4025BF10D4C9F72F9498');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('663', '57', '身份证号或工商注册号', 'idNumber', '0', '0', '0', null, null, null, '1', '2', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B97EA68C870E4E57AC8C1C53CED42E07');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('664', '57', '加入黑名单缘由', 'result', '0', '0', '0', null, null, null, '1', '4', null, null, '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1B29C9BF859D45E2A7B8AA9CEB087FA2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('665', '57', '案例内容', 'caseContent', '0', '0', '0', null, null, null, '0', '5', null, '1', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'BAC0BCCB53F548A6BB7A514E03726AED');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('666', '57', '登记时间', 'makeTime', '0', '0', '0', 'TD', null, null, '1', '6', null, null, '1', '1', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EC3C9D2D730342B2A5F081A54FC5403A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('636', '53', '评估时间', 'assessTime', '0', null, '0', null, null, null, null, null, null, null, '1', null, '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'A950F55C9C77434AA26A0AF34E2DF355');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('667', '57', '备注', 'memo', '0', '0', '0', null, null, null, '1', '7', null, '1', '1', '0', '0', null, null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8EE7FFF1D6F8484BA6568832116359DE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('668', '57', '主键', 'id', '0', '0', '0', null, null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '419036805168460C986D12A9D1B877D9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('669', '57', '黑名单登记单位', 'registUnit', '0', '0', '0', null, null, null, '1', '3', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'EF8F6A7C1098449E8ADBC7EBAF4073B4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('670', '56', '整改情况', 'conditions', '0', '0', '0', 'S', null, null, '0', '110', '{''01'':''未整改',''02'':''已整改'}', '1', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8D69D2A5049F40C1AFD6D04D6D0B5572');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('671', '56', '平台名称', 'platformId', '0', null, '0', null, null, null, '0', '1', null, '0', '0', '1', '0', '0', '0', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F8EEED89D34A40068E335B6BA4CF7C20');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('672', '50', '排序字段', 'orderby', '1', '1', '0', null, null, null, '0', '10', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DA1022F8EEE346C392089911BEF7F219');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('674', '56', null, 'nodatacolumn', '1', null, '0', null, null, null, '0', '40', null, '4', '1', '0', '0', '1', '1', '''<span style="font-size: 14px;font-weight: 900;margin-left: -44px;">处置情况</span>''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, '7F843C6D3B3D4C9BBA2CECEBDB5FB6BB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('675', '56', null, 'nodatacolumn', '1', null, '0', null, null, null, '0', '70', null, '4', '0', '0', '0', '1', '1', '''<span style="font-size: 14px;font-weight: 900;margin-left: -44px;">整改情况</span>''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'E1AB9D2E1A0A4D209700BC46FB705AE7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('676', '49', '统一社会信用代码', 'creditNum', '1', null, '0', null, null, null, '0', '2', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '4923D08D68C74E39A5BAAF41D5A41E0D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('677', '49', '保证金', 'cashDeposit', '1', null, '0', null, null, null, '0', '40', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9DBA3DE79C7C432DACCB61A6F9393FCC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('678', '49', '风控制度', 'riskControl', '1', null, '0', null, null, null, '0', '41', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '3D76641EB7124CFDBEAD9D9D3936B106');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('679', '49', '备案机构', 'recordOrganization', '1', null, '0', null, null, null, '0', '20', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2FB85F4162914665A97CBC2601F886EF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('680', '49', '备案编号', 'recordCode', '1', null, '0', null, null, null, '0', '20', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'DF14C44566D14F87AEABD919B79A51BD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('681', '49', 'icp备案号', 'icp', '1', null, '0', null, null, null, '0', '22', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '6F5BAB1F4BBB4A11AE0AAF875C20BCAA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('682', '49', 'icp经营许可号', 'icpManageNum', '1', null, '0', null, null, null, '0', '23', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '25E2AF14992A4008936EBB65D4FE8F7A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('683', '49', '平台性质', 'platformNature', '1', null, '0', 'M', null, null, '0', '42', '{''1'':''信息中介'',''2'':''引入担保方',''3'':''线下业务线上放贷''}', '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'F762A8D4AF5141498489BEAB7C10349A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('684', '49', '机构性质', 'custodianBackType', '1', null, '0', 'M', null, null, '0', '43', '{''0'':''银行'',''1'':''第三方支付'}', '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '53F83DEC2EFE4EFC88573050021DFD15');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('685', '49', 'logo图片url', 'logoFilePath', '1', null, '0', null, null, null, '0', '44', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '696AE986363441C5B8A7C10ACB7D013E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('686', '49', '所在省', 'province', '1', null, '0', null, '^[0-9]*$', '【所在省】请输入数字！', '0', '12', null, '0', '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D229C816163C4DE3A1DEAEB5AE33321D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('687', '49', '所在市', 'city', '1', null, '0', null, '^[0-9]*$', '【所在市】请输入数字', '0', '13', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2608DBEA1DB7449991076E9C54FB0038');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('688', '49', '区县', 'country', '1', null, '0', null, '^[0-9]*$', '【区县】请输入数字', '0', '45', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '30B00AAF4AD84DFB80E21262FCB52A3C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('689', '49', null, 'nodatacolumn', '1', null, '0', null, null, null, '0', '0', null, '4', '0', '0', '0', '1', '1', '''<span class="" style="font-size: 14px;font-weight: 900;">企业信息</span>''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, '59F91988053E4A84A081F8BDF0C99648');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('690', '49', null, 'nodatacolumn', '1', null, '0', null, null, null, '0', '15', null, '4', '0', '0', '0', '1', '1', '''<span style="font-size: 14px;font-weight: 900;">平台信息</span>''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D790EA4923EF4D25B433266496D57C2C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('691', '49', null, 'nodatacolumn', '1', null, '0', null, null, null, '0', '25', null, '4', '0', '0', '0', '1', '1', '''<span style="font-size: 14px;font-weight: 900;">托管机构信息</span>''', '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C5FD52E2285F442FBAC7C1752B08DFA2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('692', '50', '方法名称', 'sqltitle', '0', null, '0', null, null, null, '0', '0', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'D3486903DD924D3387B6EE15F76D9DC0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('694', '56', '风险来源', 'riskSource', '0', null, '0', 'M', '{''1'':''系统检测',''2'':''投诉举报'',''3'':''人工排查''}', null, '0', '20', '{''1'':''系统检测',''2'':''投诉举报'',''3'':''人工排查''}', '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'B7B1BA32BA9C440387E851A8BA544178');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('695', '56', '风险名称', 'riskName', '0', null, '0', null, null, null, '0', '9', null, '0', '1', '1', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '1385DFDF4CE14368B09503D88AB6FE80');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('696', '56', '出现次数', 'riskcount', '0', null, '0', null, null, null, '0', '130', null, '0', '0', '1', '0', '0', '0', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '8485415D4E8542DF8328E3A145C88C86');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('697', '56', '处置人员', 'processer', '0', null, '0', null, null, null, '0', '41', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '5D7FB3A82F224B72859876145EDF30C4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('698', '56', '风险概况', 'riskSurvey', '0', null, '0', null, null, null, '0', '35', null, '1', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '2335CE0E0F20429FB0F203868B7F41F0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('699', '56', '证据信息留档备查', 'evidence', '0', null, '0', 'F', null, null, '0', '60', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '52A13097DCFF4496882FCEF4544FFD87');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('700', '56', '整改信息留档备查', 'change', '0', null, '0', 'F', null, null, '0', '80', null, '0', '1', '0', '0', '1', null, null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, 'C94F77ADB9934055956A24FA08341731');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1', '38', '黑名单类型', 'type', '0', null, '0', 'M', null, null, '0', '0', '{1:企业,2:个人}', null, '1', '0', '0', '1', '1', null, '0', null, 'gly', null, 'gly', '0', null, null, null, null, '9EEA6F70FF31465DB0334AC397B3D563');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1641', '1039', '重大活动信息通信保障', 'ZDHDXXTXBZ', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '850A53A6923F4AC09E167C6109407791');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1642', '1039', '重点方向信息通信保障', 'ZDFXXXTXBZ', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '9619423281E943A8A28A679546BFE575');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1643', '1039', '重大会议信息通信保障', 'ZDHYXXTXBZ', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '7213DCE4A2AA4D7D9BFA7239552FB036');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1644', '1039', '海外任务信息通信保障', 'HWRWXXTXBZ', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '38536968435E47E2A97B17B9CA43B433');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1645', '1039', '其他情况', 'ZBQTQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', 'BDDAEF9E5A11480FA6E75E939F6872E7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1646', '1040', '阻断、割接、专线延伸等情况', 'ZDGJZXYSQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '6D4A8782CFF141C3B43925888860D460');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1647', '1040', '重点网系日工作量', 'ZDWXRGZL', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', 'AE85C8E6E501438286B52EDBA52F699B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1648', '1040', '网络安防情况', 'WLAFQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '1E003095D17248BA9C88C18458921EF3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1649', '1041', '上级检查情况', 'SJJCQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '6AF48E83B336495388BAB0C4A17F880D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1650', '1041', '本级检查情况', 'BJJCQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', 'AB2C65A78ED047B08809AEDF696D1D07');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1651', '1042', '军事工作', 'JSGZ', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', 'A7ACADB98FCF47EC9D86F108349D7615');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1652', '1042', '政治工作', 'ZZGZ', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '8BF3E7F836A84786A85FBE8F66D4C1DF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1653', '1042', '后装保障工作', 'HZBZGZ', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', 'C43EFEDBCC7C42DEAADEC116B7377692');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1654', '1047', '灾害情况', 'ZHQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', 'A75C9AC380D4411DA38C1CF31973C7A2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1655', '1047', '部队及通指装备出动情况', 'BDJTZZBCDQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '407FFD821C5E4C84BAD950E2B2AA8A28');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1656', '1047', '通信组织情况', 'TXZZQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '27438C3A367A4314855648235C3D7FDA');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1657', '1047', '本单位通指网系受损情况', 'BDWTZWXSSQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '58CE41C786C5447C8B16989F722A7DCB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1658', '1046', '地区', 'DQ', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CA2282C8422C428293067AFB2F3B286D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1659', '1046', '当日天气情况', 'DRTQQK', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2FE67ED77DC7405F96A43685C1B1C827');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1660', '1046', '明日天气情况', 'MRTQQK', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6A44E130C9AF486AB9F0619A216CE336');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1661', '1046', '灾损情况', 'ZSQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '71F4045DA4A14F78AE5E5C352324056D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1662', '1053', '其他情况', 'QTQK', null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, '0', null, 'test', null, null, '0', null, null, null, null, 'A44695650ECF485790512CB390C3AEF4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1663', '1028', '功能标识', 'GNBS', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '335CD7612C26423E8CCDF051B925A55D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1664', '1028', '字段名', 'COLUMNNAME', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B2DB04D0A0A348B782EE5BA4D8051772');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1665', '1028', '字段名中文', 'COLUMNENAME', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BF4DC52A2D714603BAC7F0F71E9634F7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1666', '1028', '树结构的ID', 'ID', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '75B4CAF1E5634D93BF4AB4C66B933274');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1667', '1028', '是否选择（0未选择，1选择）', 'ISCHECK', '1', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DD68C0F9284B4B00A94BAA6FACE9339B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1668', '1028', '序号', 'XH', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '22D3138A27E841118C2E92E26B0AD94F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1669', '1028', '单位内码', 'DWNM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '54F89BF9B3924971B9F328AB43230BA2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1670', '1028', '单位名称', 'DWMC', '1', '0', '0', null, '/^[\s\S]{0,127}$/', '长度不可以超过127位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F18FB2B4BCA1448A909E9FB715FE5455');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1671', '1028', '席位名', 'XWM', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '90B6EE8BFB854A398D39C86214053935');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1672', '1028', '内码', 'NM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FBE638A8012749FAB991E658159A47CC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1673', '1028', '标识，0 代表全部，1代表本单位添加的', 'BS', '1', '0', '0', null, '/^[\s\S]{0,1}$/', '长度不可以超过1位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5F532E79833B4158B341EA3008B0C305');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1674', '1028', '父id', 'PID', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '09694B7EC8DB4DC3B21EFA1899475239');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1675', '1028', '是否为叶子节点 10 是，20 否', 'ISLEAF', '1', '0', '0', null, '/^[\s\S]{0,5}$/', '长度不可以超过5位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0887BB85704E4B46842F6A008C05FF2B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1453', '1007', '故障网络代号/节点/名称', 'WLGZ', '1', '0', '0', null, '/^[\s\S]{0,200}$/', '长度不可以超过200位！', '0', '40', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
		 <label class=''col-md-5 control-label''>
		 	<span>故障网络代号/节点/名称：</span>
		 </label>
		 <div class=''col-md-7''>
	 		<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1515', null, '1D6CC17739924EEBAEBAC45DB7024EC7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1456', '1007', '故障影响', 'GZYX', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '50', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>故障影响：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1515', null, 'DF1F4D3C81D0424E91C786C89D376D1B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1457', '1007', '故障原因', 'GZYY', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '60', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>故障原因：</span>
		 </label>
		 <div class=''col-md-9''>
		 	<textarea rows='''' cols='''' class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1515', null, 'A72AA5B34D3A4BA58C30B6BFD00DB506');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1458', '1007', '处置情况', 'CZQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '70', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>处置情况：</span>
		 </label>
		 <div class=''col-md-9''>
		 	<textarea rows='''' cols='''' class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1515', null, '5B7E350851AF4A79A5AC9BA6472F3E3D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1459', '1007', '维护单位', 'WHDW', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '80', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
		 <label class=''col-md-5 control-label''>
		 	<span>维护单位：</span>
		 </label>
		 <div class=''col-md-7''>
		 	<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1515', null, '870E28B341474616BB9D7A1108DEBE89');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1461', '1007', '故障属性', 'GZSX', '1', '0', '0', null, 'var regexp=/^[\s\S]{0,50}$/;
if(!value){return true;}  	return regexp.test(value);', null, '0', '20', null, '0', '1', '0', '0', '0', null, null, '0', null, null, null, null, '0', null, '0', '1515', null, '7150DEEBC96A45849CC651741D7EB122');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1474', '1026', '安全态势', 'AQTS', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', '20', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>安全态势：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<select name=''JZWYXZT'' class=''form-control''>
		<option value=''''>请选择</option><option value=''1''>良好</option>
<option value=''2''>一般</option>
<option value=''3''>严重</option>	</select>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1558', null, '22F99FD81DF54762A7D3A95DCFF7F152');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1475', '1026', '安全事件', 'AQSJ', '1', '0', '0', null, '/^[\s\S]{0,200}$/', '长度不可以超过200位！', '0', '30', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-2 control-label''>
 			<span>安全事件：</span>
	 	</label>
	 	<div class=''col-md-10''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1558', null, '55DDE394E76448C1876F328E2F55C359');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1476', '1026', '事件原因', 'SJYY', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '40', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>事件原因：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1558', null, '5BD398DD1171405CB14E91AE9E444C8D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1477', '1026', '责任单位', 'ZRDW', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '50', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>责任单位：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<input type=''text'' name='''' class=''form-control''/>
		 </div>
	</div>
</div>
', '0', null, null, null, null, '0', null, '1', '1558', null, '3A7F3CF4761E41B8B5C215A9297709B0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1478', '1026', '处置情况', 'CZQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '60', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>处置情况：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1558', null, 'AE9AB0D133F14CD994A162AABB0EE546');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1479', '1014', '故障原因及处置情况', 'GZYYJCZQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '50', null, '0', '1', '0', '0', '1', null, '<div class=''single_box_con col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label tal''>
		 	<input type=''checkbox'' id=''jrzbld'' name=''jrzbld'' >
		 	<span>故障原因及处置情况：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1532', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '92B0D402910E49B5AC9C42360BD2FA9F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1481', '1014', '用频装备检测情况', 'YPZBJCQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '90', null, '0', '1', '0', '0', '1', null, '<div class=''single_box_con col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label tal''>
		 	<input type=''checkbox'' id=''jrzbld'' name=''jrzbld'' >
		 	<span>用频装备检测情况：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1532', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '8E9A100CE21C418598CA072EC47E2E81');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1482', '1014', '频率预测预报', 'PLYCYB', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '100', null, '0', '1', '0', '0', '1', null, '<div class=''single_box_con col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label tal''>
		 	<input type=''checkbox'' id=''jrzbld'' name=''jrzbld'' >
		 	<span>频率预测预报：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1532', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '599D56A7617D4A799C47066380BCC5D0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1483', '1014', '重大任务频管保障', 'ZDRWPGBZ', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '110', null, '0', '1', '0', '0', '1', null, '<div class=''single_box_con  col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label tal''>
		 	<input type=''checkbox'' id=''jrzbld'' name=''jrzbld'' >
		 	<span>重大任务频管保障：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1532', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '5AF943AE6F9C4C6D87EDEF6E8C5B5343');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1485', '1014', '短波监测站', 'DBJCZ', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '31', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>短波监测站：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text''  class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1535', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'D2B06DDF9F54427B9709BB3B638A048F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1486', '1014', '超短波监测站', 'CDBJCZ', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '32', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>超短波监测站：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text''  class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1535', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'E63FF869B04448B68499A153F0C6A6D6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1487', '1014', '卫星监测站', 'WXJCZ', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '33', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>卫星监测站：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text''  class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1535', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '175D0E1E8BAF4AF6939974B5FB5F738F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1488', '1014', '短波探测站', 'DBTCZ', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '34', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>短波探测站：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text''  class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1535', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '868D3D85D057420DBE97CD94C3450AB6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1489', '1014', '电离层闪烁监测站', 'DLCSSJCZ', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '35', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>电离层闪烁监测站：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text''  class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1535', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '35D59AB7B6904D208E19039FD6B5F82B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1490', '1014', '机动/便携设备', 'JDBXSB', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '36', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>机动/便携装备：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text''  class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '1535', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '42B1C2254B354715BE64B8882CFC8076');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1491', '1014', '日常战备工作情况', 'RCZBGZQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '60', null, '0', '1', '0', '0', '1', null, '<div class=''single_box_con col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label tal''>
		 	<input type=''checkbox'' id=''jrzbld'' name=''jrzbld'' >
		 	<span>日常战备监测情况：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1532', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', 'F60B1F3B682B471C9903F93B7E5CE36A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1492', '1014', '电磁环境监测情况', 'DCHJJCQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '80', null, '0', '1', '0', '0', '1', null, '<div class=''single_box_con col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label tal''>
		 	<input type=''checkbox'' id=''jrzbld'' name=''jrzbld'' >
		 	<span>电磁环境监测情况：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1532', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '6E3598441B50414B804A707EA9A20E4C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1493', '1014', '用频干扰查处情况', 'PYGRCCQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '70', null, '0', '1', '0', '0', '1', null, '<div class=''single_box_con col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label tal''>
		 	<input type=''checkbox'' id=''jrzbld'' name=''jrzbld'' >
		 	<span>用频干扰查处情况：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1532', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', 'D8A1DB27A2A24AACB420A932EF6E496C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1498', '1027', '战备检查检查单位数量', 'ZBJCJCDWSL', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '21', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1538', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '924F62015226419A9034F429578AD3F9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1499', '1027', '战备检查检查不合格单位数量', 'ZBJCJCBHGDWSL', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '22', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1538', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '7A6078CFBE724CB9B55060143DBBE60A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1500', '1027', '战备检查不合格原因', 'ZBJCBHGYY', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '23', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1538', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '4C9B856CC05B4959AFCE645153320C29');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1713', '1059', '席位名称', 'XLZL', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A5B0022D9CAB4907BBECA7822AC10463');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1509', '52', '是否为叶子节点0否1是', 'ISLEAF', '1', '0', '0', 'M', null, null, '0', null, '{''0'':''否',''1'':''是'}', '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BA7FCC4D80E349B18E6337575EF3F826');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1510', '52', '父级ID', 'PID', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '9C7FE77F14D74BAD934F49C6CF8B581A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1714', '1059', '终端IP地址', 'CDSJ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6F61E51FDDD543A0AC26D32D6D086DB5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1715', '1059', '终端Mac地址', 'ZDMACDZ', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7A0E571DC4CF4928B93F52C207CD8F12');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1716', '1058', '系统维护人员', 'TXSD', '0', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '85F74C93159D4054A3D5270D5A9ABC11');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1717', '1058', '系统维护人员联系方式', 'KTRL', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '989ECFD8374E48ACBF6C9CA598DC2D1E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1718', '1061', '关联ID', 'JSTXID', '0', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '66BC3666B6D547E1BE587AE8AE246488');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1719', '1061', '发布人', 'FBR', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '998BD709E920447D97FEA9A1AFB40124');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1517', '1006', '战备值勤情况', 'ZBZQLL', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '200', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12 leaf_con''>
				<div class=''form-group''>
					 <label class=''col-md-3 control-label''>
					 	<span>本级应急信息通信部(分)队：</span>
					 </label>
					 <div class=''col-md-9''>
				 		<textarea class=''form-control''>', '0', null, null, null, null, '0', null, '1', '1517', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', 'DF65B611AB224AD4AEE1CB2DB3842CE6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1720', '1061', '发布日期', 'FBRQ', '0', '0', '0', 'T', '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FF0FDB082F46465DA7C8DFEE39E70542');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1721', '1061', '发布对象', 'FBDX', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F0E9F07A9EF7436086396EA1D30F0351');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1524', '1025', '指挥网站信息每日发布量', 'ZHWZXXFBS', '1', '0', '0', 'L', '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', '50', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
											<div class=''form-group''>
											 	<label class=''col-md-8 control-label''>
										 			<span>指挥网站信息每日发布量（条/MB）：</span>
											 	</label>
											 	<div class=''col-md-4''>
										 		 	<input type=''text'' name='''' class=''form-control''>
												</div>
											</div>
										</div>', '0', null, null, null, null, '0', null, '1', '1529', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'EB54DAEAA4F94A8AA2F059AEC45941E7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1712', '1059', '系统部署点位', 'ZBDJ', '0', '0', '0', null, '/^[\s\S]{0,10}$/', '长度不可以超过10位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C638FDC59B5842E2ACB401170C248BB2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1722', '1061', '内码', 'ID', '0', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C194022F6830428B98480830A6C0AAAD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1723', '1061', '回复人', 'HFR', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '460B0387C7C14B9FB91A89B5878A783E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1724', '1061', '回复时间', 'HFSJ', '1', '0', '0', 'T', '/^[\s\S]{0,3}$/', '长度不可以超过3位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E340D0612318469C9B6053658260A8EF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1725', '1062', '消息ID', 'ID', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FBB00324A46D46D8A1EC06614C58A08E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1726', '1062', '接收时间', 'FBSJ', '1', '0', '0', 'T', null, null, '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5269D24EBC454684BC5E5D72D899B5C2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1727', '1062', '发送单位', 'TCR', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F75826F190F7463BA8B44695B6677629');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1728', '1062', '类别', 'LB', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DCB1EAB87D414CC5853001BDA24DD502');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1729', '1062', '当前状态', 'DQZT', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7EEA0CA86A3347BDAFDF6E97AA539EDC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1730', '1062', '内容', 'NR', '0', '0', '0', null, '/^[\s\S]{0,1500}$/', '长度不可以超过1500位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '972770E13AC045CF8E82112F2E761A23');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1731', '1062', '标题', 'BT', '0', '0', '0', null, '/^[\s\S]{0,150}$/', '长度不可以超过150位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BF7042B03DEE4EE5A56D7F4836D92338');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1732', '1062', '用户标识', 'USERID', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4F47AB939A644257897A577F3F990DC9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1733', '1062', '字体格式', 'ZTGS', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1A57F71612514378AA24EDD70476807F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1734', '1062', '记录标识', 'BS', '1', '0', '0', null, '/^[\s\S]{0,0}$/', '长度不可以超过0位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C0F288CA32C14887B439278E298C0C0D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1735', '1062', '回复人', 'HFR', '1', '0', '0', null, '/^[\s\S]{0,20}$/', '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '20D1B2F1A768452A88369293CEC8F0E8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1736', '1062', '回复时间', 'HFSJ', '1', '0', '0', 'T', '/^[\s\S]{0,3}$/', '长度不可以超过3位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6BEA66F18ED5422083D0C2859E989AA8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1737', '1063', '关联id', 'ID', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2543E5D8CAEA47D9B1C171C2C51B1D6D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1738', '1063', '文件地址', 'WJSY', '1', '0', '0', null, '/^[\s\S]{0,500}$/', '长度不可以超过500位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1BA04692272C44F0BD832C69A43B27B8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1739', '1063', '内码', 'NM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1F5F1A0369D44326841EF4E7678F6342');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1740', '1063', '上传时间', 'SCSJ', '1', '0', '0', 'T', '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D867FB884813473CABB491B6FBA6AED1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1590', '1032', '通信时间', 'TXSJ', '1', '0', '0', 'L', null, null, '0', '100', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>通信时间（分钟）：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>
', '0', null, null, null, null, '0', null, '1', '100013', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'A7ED4972F3544DBD8B9D7771EE062FF1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1591', '1032', '方案完成率', 'FAWCL', '1', '0', '0', 'L', null, null, '0', '110', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>方案完成率：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '100013', null, '5CEA2594205740C6BAD77C8DDFAFEA7B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1592', '1032', '导调情况次数', 'DTQKCS', '1', '0', '0', 'L', null, null, '0', '120', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>次数：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '100014', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '2128E558D40D4ACFA4552AA6D77D6623');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1593', '1032', '导调情况完成次数', 'DTQKWCCS', '1', '0', '0', 'L', null, null, '0', '130', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>完成次数：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '100014', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'E5D9754ED98B4385B7C134CC51300929');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1594', '1033', '参训单位', 'CXDW', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '10', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>参训单位：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>
', '0', null, null, null, null, '0', null, '1', '10004', null, '00E7E8D40FE346688C48E1033009590E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1595', '1033', '参训台站', 'CXTZ', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '20', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>参训台站：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10004', null, '3BEB3D7B81A34A6C9681FA033D0824E2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1596', '1033', '训练内容', 'XLNR', '1', '0', '0', null, '/^[\s\S]{0,250}$/', '长度不可以超过250位！', '0', '30', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>训练内容：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''></textarea>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10004', null, '99E990379A1749EC986DF5E71BF3AA4F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1597', '1033', '监测地域', 'JCDY', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '40', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>监测地域：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10004', null, '9F62CE11AD204EC9B2D55F6A7DA3CF1A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1598', '1033', '监测频段', 'JCPD', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '50', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>监测频段：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10004', null, '77EEC5486A064DAEABDCD8A42BD6B9FD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1599', '1033', '受检装备', 'SJZB', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '60', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>受检装备（检测工作）：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''></textarea>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10004', null, 'E786EA972D8A455982E7707B106A8DA2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1600', '1033', '组训人', 'ZXR', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '70', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>组训人：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>
', '0', null, null, null, null, '0', null, '1', '10004', null, '1451697CB403488196626E435D29F86E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1601', '1033', '联系电话', 'LXDH', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '80', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>联系电话：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10004', null, '28778D99B0984D37B796CE0EAB808773');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1602', '1034', '文电收发次数', 'WDSFCS', '1', '0', '0', 'L', null, null, '0', '10', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>文电收发(次)：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10005', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'DE42B8866AC04C558464F1A7606676C8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1603', '1034', '固定节点站要素', 'GDJDZYS', '1', '0', '0', 'L', null, null, '0', '20', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>固定节点站要素(个)：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10005', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '28A13DCDA7AF4F71B73AF5B3D1FF13F3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1604', '1034', '固定指挥所要素', 'GDZHSYS', '1', '0', '0', 'L', null, null, '0', '30', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>固定指挥所要素(个)：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10005', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '91D143C47C1B499D98D8B1ED69CEF34E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1605', '1034', '机动指控要素', 'JDZKYS', '1', '0', '0', 'L', null, null, '0', '40', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>机动指控要素(个)：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10005', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '74833E775B1F4161A39B244B83C3D207');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1711', '1060', '备注', 'BZ', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '20AF6CE8384F4F31A03932C4DA30247F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1741', '1063', '文件名称', 'WJMC', '1', '0', '0', null, '/^[\s\S]{0,127}$/', '长度不可以超过127位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D8B10009B888493781EF4F0DCA04F5F2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1742', '1064', '关联id', 'ID', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'BB0E30103FDD43489284C7F22527A68D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1743', '1064', '用户名', 'USERID', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C630F1734C6B485DBFBC9599DD591D31');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1744', '1064', '内码', 'NM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CF40344212C74E0FBFA1D877DD87E34C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1745', '1066', '类型', 'LX', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DA4F0C39612D40DA96008FAC2888AA88');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1746', '1066', '内容', 'NR', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4115817EA8984980BCB23A901527778D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1747', '1069', '类型', 'LX', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3371205B94CC4FF48817519BC4562464');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1748', '1069', '内容', 'NR', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '31BAE76E5F6E4261932BCD16C1A12E77');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1757', '1071', 'ID', 'ID', '1', '0', '0', 'S', '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '30990AA1FDC74B22B12E2C0CC81B286B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1758', '1071', '登录部队内码', 'USERBDNM', '1', '0', '0', 'S', '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '02769405BB62460E9D175215E17E3A08');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1759', '1071', '内容', 'NR', '0', '0', '0', 'S', '/^[\s\S]{0,1500}$/', '长度不可以超过1500位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '251B856B10C04CF09200831F84EFF079');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1760', '1071', '时间', 'FBSJ', '0', '0', '0', 'T', '/^[\s\S]{0,3}$/', null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '576244B3AAC54FB0A5C6EC8E0A746026');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1761', '1071', '提出人', 'TCR', '1', '0', '0', 'S', '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F73080961BCA41EBA9C5CC7B86405C26');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1762', '1071', '类别', 'LB', '0', '0', '0', 'S', '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '19183E6E8F1D4D25B3F0B09511A78F4E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1763', '1071', '当前状态', 'DQZT', '1', '0', '0', 'S', '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3322422C3EE347E7B702D56CB41EE261');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1764', '1071', '标题', 'BT', '0', '0', '0', 'S', '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5189426370794C1088DA2D04D9227258');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1765', '1071', '字体格式', 'ZTGS', '1', '0', '0', 'S', '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B2EA641C0CE44089975689DBCBBA5154');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1806', '1008', '情况说明：障碍现象、影响及处置情况', 'QKSM', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '9254E3ECD910449290C8B3181E648989');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1807', '1008', '任务类别：', 'RWLB', '1', '0', '0', 'CL', 'var inputs= $( $field).closest(''.info_con'').find(''[type=text],textarea,select'').not($field).not(''[name=SBDWMC],[name=XH]'');
var flag=true;
$.each(inputs,function(index,item){
   if($(item).val()!=''''){
      flag=false;
   }
});
if(value){return true;}
return flag;', '请选择！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8ED059816A864B8F9514B708FF8246D6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1808', '1008', '关联内码', 'GLNM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '01928847F46E4A548C99512AF0D1EADC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1809', '1008', '任务名称', 'RWMC', '1', '0', '0', 'CL', 'var inputs= $( $field).closest(''.info_con'').find(''[type=text],textarea,select'').not($field).not(''[name=SBDWMC],[name=XH]'');
var flag=true;
$.each(inputs,function(index,item){
   if($(item).val()!=''''){
      flag=false;
   }
});
var re=/^[\s\S]{0,100}$/;
if(!value){return true&&flag;}  	
return re.test(value);', '不可为空并且长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DD7A163C9BDD46F1BC86B3F6C07CBDD1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1810', '1008', '保障情况/总体情况', 'BZQK', '1', '0', '0', 'CL', 'var inputs= $( $field).closest(''.info_con'').find(''[type=text],textarea,select'').not($field).not(''[name=SBDWMC],[name=XH]'');
var flag=true;
$.each(inputs,function(index,item){
   if($(item).val()!=''''){
      flag=false;
   }
});
if(value){return true;}
return flag;', '请选择！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '057B96A842B648578131453758CB3ADB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1811', '1008', '内码', 'NM', '1', '0', '0', null, '/^[\s\S]{0,16}$/', '长度不可以超过16位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E374B81B611440D881AF7BD283A96C9F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1818', '1073', '指挥专网情况', 'ZHZWQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '16C55F5E36864F499321D34E6D3BAAB0');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1819', '1073', '军事综合信息网情况', 'JSZHXXWQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', 'CCBA185738CB47A789BD37E1872F679B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1793', '1008', '序号', 'XH', '1', '0', '0', 'L', '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'AD66C41788D3430685373377248721CB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1794', '1008', '上报单位名称', 'SBDWMC', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '48AF0469A6994B05AAC3EE8B213E3BD2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1795', '1008', '保障对象', 'BZDX', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '39D761AE94DA476EB401A6622E2D9B04');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1796', '1008', '任务地域', 'RWDY', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '541BBD4631E24F3498EF1E72F3F137E1');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1797', '1008', '起始时间', 'QSSJ', '1', '0', '0', 'T', null, '长度不可以超过3位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F3ADFC65DA224B98B7CC49153C015141');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1798', '1008', '截止时间', 'JZSJ', '1', '0', '0', 'T', null, '长度不可以超过3位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '677EC1BC14FF4BDDA21460157521D852');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1799', '1008', '协作单位', 'XZDW', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'EBBF40F9280C4E4A8D2498D93242B320');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1800', '1008', '网系组织情况', 'WXZZQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2FC130E7CB3F49818B118DA5F507A804');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1801', '1008', '当日保障情况', 'DRBZQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F6F6911B495A4117BD6E5E956B8AB8BF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1802', '1008', '本级重点关注事项', 'BJZDGZSX', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '50130C093C4D43B1BB6726942B02E323');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1803', '1008', '需军委联指关注事项', 'XJWLZGZSX', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '68A85631E3734821B16563A3E618C8E7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1804', '1008', '主要手段', 'ZYSD', '1', '0', '0', null, '/^[\s\S]{0,200}$/', '长度不可以超过200位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '769FD8DA2A4C4AC49E5C6FF1F8916A97');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1805', '1008', '备用手段', 'BYSD', '1', '0', '0', null, '/^[\s\S]{0,200}$/', '长度不可以超过200位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '741CA53971FF4F9FA87B0104EC093488');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1606', '1034', '参训席位', 'CXXW', '1', '0', '0', 'L', null, null, '0', '11', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>参训席位(个)：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10005', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '3608B0E5D2F14A91A86CC02B56ADB4AF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1607', '1035', '参训单位', 'CXDW', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '10', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>参训单位：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>
', '0', null, null, null, null, '0', null, '1', '10006', null, '7A9C4579FDD84B0A812C250329979047');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1608', '1035', '参训要素', 'CXYS', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '20', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-6''>
	<div class=''form-group''>
	 	<label class=''col-md-5 control-label''>
 			<span>参训要素：</span>
	 	</label>
	 	<div class=''col-md-7''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>
', '0', null, null, null, null, '0', null, '1', '10006', null, 'CA72826E6C864624A04B80DD6FDAF047');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1609', '1035', '训练内容', 'XLNR', '1', '0', '0', null, '/^[\s\S]{0,250}$/', '长度不可以超过250位！', '0', '30', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>训练内容：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''></textarea>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10006', null, '278A9185481044918152AC44B9B93158');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1610', '1035', '组训人', 'ZXR', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '40', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>组训人：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10006', null, 'B9C1D56E44394602A62A86CD47A1CA97');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1611', '1035', '参训人员', 'CXRY', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '50', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>参训人员：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10006', null, '3DEEA04081B64D86BBDCCF4A553644F3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1612', '1035', '训练形式', 'XLXS', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '60', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>训练形式：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10006', null, '3508E15B32B249EAB0B66F6E7ECA8019');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1613', '1035', '问题及建议', 'WTJJY', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', '70', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12''>
	<div class=''form-group''>
		 <label class=''col-md-3 control-label''>
		 	<span>问题及建议：</span>
		 </label>
		 <div class=''col-md-9''>
	 		<textarea class=''form-control''></textarea>
		 </div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '10006', null, 'E34BF6E9815D462CB21D7683B03C67EE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1614', '1029', '保存级别 1 主表 ；2-子单信息 ；3-子多信息', 'SAVEJB', '1', '0', '0', null, '/^[\s\S]{0,5}$/', '长度不可以超过5位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '25E24FDDD32342518FCDCDC7056D5036');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1615', '1030', '删除减', 'DEL', null, null, null, null, null, null, null, '30', null, null, '1', null, '0', '1', null, '<div class=''col-md-1 btn-con''>
	<span class=''delBtn'' onclick=''$(this).parent().parent().remove()''><img src=''static/img/btn-del.png''></span>
</div>', '0', null, 'test', null, null, '0', null, '1', '100003', null, 'E90B89AE71E143A9AF7B2A6775C82C20');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1616', '1031', '删除减', 'DEL', null, null, null, null, null, null, null, '30', null, null, '1', null, '0', '1', null, '<div class=''col-md-1 btn-con''>
	<span class=''delBtn'' onclick=''$(this).parent().parent().remove()''><img src=''static/img/btn-del.png''></span>
</div>', '0', null, 'test', null, null, '0', null, '1', '100007', null, '30C604607DC241D697D03ACD1CC1BB60');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1617', '1033', '删除减', 'DEL', null, null, null, null, null, null, null, '90', null, null, '1', null, '0', '1', null, '<div class=''adBtns''>
	<span class=''delBtn'' onclick=''$(this).parent().parent().remove()''><img src=''static/img/btn-del.png''></span>
</div>', '0', null, 'test', null, null, '0', null, '1', '10004', null, 'E944ABEC922F4484B17378FD0EF3C354');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1618', '1035', '删除减', 'DEL', null, null, null, null, null, null, null, '80', null, null, '1', null, '0', '1', null, '<div class=''adBtns''>
	<span class=''delBtn'' onclick=''$(this).parent().parent().remove()''><img src=''static/img/btn-del.png''></span>
</div>', '0', null, 'test', null, null, '0', null, '1', '10006', null, '0C132A471AF24E1188CA48DA5D07EF20');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1619', '1036', '短波通信装备合计', 'DBTXHJ1', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '403B4BBA1B5A458A81F480A7F0B93A78');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1620', '1036', '短波通信兵力合计', 'DBTXHJ2', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '09F1C6994CE544FBBEB37EECC3E44E2D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1621', '1036', '卫星通信装备合计', 'WXTXHJ1', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '82934FB7BD7A4AEE9363130B6D9FD928');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1622', '1036', '卫星通信兵力合计', 'WXTXHJ2', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A954F00AEAC64EFAB7AC237BF72695E3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1623', '1036', '频谱管控装备合计', 'PPGKHJ1', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1E102CFD1DEB4B89BFC5A72C42A9FB7D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1624', '1036', '频谱管控兵力合计', 'PPGKHJ2', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '878DCE38AD4F4558BB37B0995FBB0A18');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1625', '1036', '指控系统装备合计', 'ZKXTHJ1', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6E45CDFBDBB34434A3FA5315591BCFF7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1626', '1036', '指控系统兵力合计', 'ZKXTHJ2', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '757E6755783144A1ABE36B79DC0D3A26');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1627', '1036', '作战视频装备合计', 'ZZSPHJ1', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D63769B7813E4026BCC6D15F34BEFB18');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1628', '1036', '作战视频兵力合计', 'ZZSPHJ2', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '538929CE8E0845818ED7116B4691483E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1629', '1036', '其他情况', 'QTQK', '1', '0', '0', null, '/^[\s\S]{0,1000}$/', '长度不可以超过1000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '939A7A110E1C4D93A7268037621FCF8B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1630', '50', '主键ID', 'ID', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DE406D0AE5374624A7BA51F83D315E84');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1631', '1037', '时间', 'SJ', '1', '0', '0', 'T', null, null, '0', '10', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1002', null, 'E6BA64BB01964D10ADACC950EBAF4109');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1632', '1037', '单位', 'DW', '1', '0', '0', null, '/^[\s\S]{0,200}$/', '长度不可以超过200位！', '0', '20', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1002', null, '66DFB800CFB24825818F8C982A0C007D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1633', '1037', '人员', 'RY', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', '30', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1002', null, '970EFCCD64D4425992692AC217741DA3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1634', '1037', '内容', 'NR', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '40', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1002', null, '4E645DA444C846BA816B8DE4EFB0E6E5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1635', '1037', '处理情况', 'CLQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '50', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1002', null, 'DD4551C1FB5F4EF68B44010AF91CC57F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1636', '1038', '首长在位情况', 'SZZWQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '10', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '1245928A7F8F4F50B75413DC7ABF463E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1637', '1038', '人员情况', 'RYQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '20', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '7AFC784E303B4F72936B8A326E1F795D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1638', '1038', '车辆使用情况', 'CLSYQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '30', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '4DA0B5E01F814CCB900968F5C7877158');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1639', '1038', '装备变动情况', 'ZBBDQK', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '40', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', 'BF7986C6AF9C4A79AFD58F797C4CD18F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1640', '1039', '军委联指中心保障', 'JWLZZXBZ', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, 'function jsvalue(oldvalue,currvalue,input,dw){
		if(oldvalue==''''){
			$(input).val(dw+'':''+currvalue+'''');
		}else{
		  oldvalue+=''\n'';
			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');
		}
}', '38AA4560DE754C53A88E8B6AD207A056');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1791', '1009', '上报单位名称', 'SBDWMC', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4F79172917EB404793976EC136FB16CC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1792', '1026', '上报单位名称', 'SBDWMC', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FB4B08845B9B4972B22F398C7920E3CD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1686', '1054', '席位电话', 'LXFS', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CC63F5C704AF4C74BFEEED8784A0C60F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1687', '1054', '传真电话', 'CZDH', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '50B7346DB0B845E68E3C352F7CFADF3D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1688', '1054', '文电地址', 'WDDZ', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D37A810DCF594ED7AEC1C3292C10F6CB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1689', '1054', '其他联系方式', 'QTLXFS', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0265D64321004D9C94AEDE29D6FC5669');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1690', '1054', '席位', 'DW', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '01597F903E214DF59A88A5F2F9E1E5DE');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1691', '1055', '值班力量', 'TXLL', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B403F88B6419456E92D3E2CD498D779D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1692', '1055', '编制军官', 'BZJG', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '0FB67F79F81549EEB6C0991FE42FB9D9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1693', '1055', '实有军官', 'SYJG', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '703F261E87D3445D9503583E888AD600');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1694', '1055', '值班军官数', 'KCDJG', '1', '0', '0', 'L', '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FB2E8C61FAC4488E80BFE98F0C7FE19E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1695', '1055', '编制士官', 'BZSG', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '3871511284BA4D079F785AC86D745BD4');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1696', '1055', '实有士官', 'SYSG', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'AE042636D28E48F98ED24D8DF4C0FE9B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1697', '1055', '值班士官数', 'KCDSG', '1', '0', '0', 'L', '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '6B64861C642546A7BF85CAD2E0C5EC40');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1698', '1055', '编制义务兵', 'BZYWB', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'C832A09729904F30AAE47B20397B94E9');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1699', '1055', '实有义务兵', 'SYYWB', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '07D1C01BA6AA453DB379CC0381D7E21E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1700', '1055', '值班义务兵数', 'KCDYWB', '1', '0', '0', 'L', '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CE2212BAD4E54B37998AC6D94F0E4C46');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1701', '1055', '编制文职', 'BZWZ', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '03811A005E474BE4B45E1CEF18AE61FB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1702', '1055', '实有文职', 'SYWZ', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D2E8CBA95C3841F2B433B13BED3A62DC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1703', '1055', '可出动文职', 'KCDWZ', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'F29255A3C69F4F6D83AFEBD62F376637');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1704', '1055', '战备等级', 'ZBDJ', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '044BC5C3C567415299076CFBA0C7581A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1705', '1055', '训练种类', 'XLZL', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E9FADFB422C14F9DBC3DE042111724D6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1706', '1055', '出动时间', 'CDSJ', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'A10913531D834D6A8CC729CEC7013867');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1707', '1055', '保障对象', 'BZDX', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '8063E047BD634A14A21FDCEDA0C982E7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1708', '1056', '值班装备名称', 'ZBZBMC', '1', '0', '0', null, '/^[\s\S]{0,100}$/', '长度不可以超过100位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'D5661FD7A1DF4CD0945F7EDA9ED9212A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1709', '1056', '值班装备类型', 'ZBZBLX', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '361895EE44C64EF3AA97E9C8B1650138');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1710', '1056', '值班装备数量', 'ZBZBSL', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5E31F8F3C9464B23A53AE67B09D7645F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1774', '1007', '上报单位名称', 'SBDWMC', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1AB2C37F911641E3AF3E6D5FB3EF7C1D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1775', '1007', '起始时间', 'QSSJ', '1', '0', '0', null, null, '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4217CBB611E5484992BC833BF3B10C06');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1776', '1007', '截止时间', 'JZSJ', '1', '0', '0', null, null, '长度不可以超过20位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2B343697C3D24D0F96697061E90E0F6D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1777', '1007', '类型:区分网络运维保障情况和指挥信息系统情况', 'LX', '1', '0', '0', null, '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '44999F4D7BE44DBB91CE6E330999DAA6');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1778', '1071', '值班电话', 'ZBDH', '1', '0', '0', 'S', '/[0-9()\-]$/', '请输入正确的格式如：010-12345678', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5B26F5628A3041E99E98AB0B15991ABB');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1779', '1071', '值班人员', 'FBRY', '1', '0', '0', 'S', '/^[\s\S]{0,40}$/', '长度不可以超过40位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '1D1278E1AFFB41AFA78995D196352F72');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1539', '1027', '文电通联检查单位数量', 'WDTLJCDWSL', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '31', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1546', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '6F99D240350040C6A93152C59DEEC934');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1540', '1027', '文电通联检查不合格单位数量', 'WDTLJCBHGDWSL', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '32', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1546', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '8C2FDAE59B9149918D59E3804A090A3E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1541', '1027', '文电通联不合格原因', 'WDTLBHGYY', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '33', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1546', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '0A5BCCBAAE994CE7B068BBDC961AEE83');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1542', '1027', '视频指挥检查单位数量', 'SPZHJCDWSL', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '41', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1545', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'BFF246BFE80C4E2BB0F223537ADC7F7B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1543', '1027', '视频指挥检查不合格单位数量', 'SPZHJCBHGDWSL', '1', '0', '0', 'L', '/^[\s\S]{0,8}$/', '长度不可以超过8位！', '0', '42', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1545', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '1547B90EF936484CAB7F5FF6DF03324B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1544', '1027', '视频指挥不合格原因', 'SPZHBHGYY', '1', '0', '0', null, '/^[\s\S]{0,2000}$/', '长度不可以超过2000位！', '0', '43', null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, '1', '1545', 'function jsvalue(oldvalue,currvalue,input,dw){		if(oldvalue==''''){			$(input).val(dw+'':''+currvalue+'''');		}else{		  oldvalue+=''\n'';			$(input).val(oldvalue+''''+dw+'':''+currvalue+'''');		}}', '123CC273032841B687B1BD8AB8948165');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1825', '1006', '今日值班领导电话', 'JRZBLDDH', '1', '0', '0', null, '/[0-9()\-]$/', '请输入正确的格式如：010-12345678', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '97A445605C454209BC1111BD3C4A105A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1826', '1006', '今日值班员电话', 'JRZBYDH', '1', '0', '0', null, '/[0-9()\-]$/', '请输入正确的格式如：010-12345678', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '112DFD6897494033A46861ECE5BE264C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1827', '1006', '明日值班领导电话', 'MRZBLDDH', '1', '0', '0', null, '/[0-9()\-]$/', '请输入正确的格式如：010-12345678', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'E2D44DCC03EB491799CB3D3498AE9B71');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1828', '1006', '明日值班员电话', 'MRZBYDH', '1', '0', '0', null, '/[0-9()\-]$/', '请输入正确的格式如：010-12345678', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B88B6AABF89F43F68F1DFC596936ABF7');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1559', '52', 'js内容', 'CONTENTJS', '1', '0', '0', null, '/^[\s\S]{0,500}$/', '长度不可以超过500位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '08E414F3B79C4C04B0AB4B2DF495C113');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1560', '1029', '内码', 'NM', '1', '0', '0', null, null, '长度不可以超过16位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '1', null, null, null, null, 'B5A58D2ED7A2457CB83A9034C29323DC');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1561', '1029', '模块类型', 'MKLX', '1', '0', '0', null, '/^[\s\S]{0,25}$/', '长度不可以超过25位！', '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '52C4825268CE47ED952810E844DD2BC3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1562', '1029', '模块名称', 'MKMC', '1', '0', '0', null, '/^[\s\S]{0,50}$/', '长度不可以超过50位！', '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '2AA18F42432240A2A0BD68958CF97505');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1563', '1029', '是否为叶子节点 1是；0否', 'ISLEAF', '1', '0', '0', null, '/^[\s\S]{0,2}$/', '长度不可以超过2位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '84806E1FCC9E474E9A8905D6BBC18695');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1564', '1029', '序号', 'XH', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'DA2C2B01602D4E719D271AF31C85D47B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1565', '1029', '父节点', 'PID', '1', '0', '0', null, '/^[\s\S]{0,11}$/', '长度不可以超过11位！', '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '7D82EA99931F49379C445086ECA8116C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1566', '1029', '单位名称', 'DWMC', '1', '0', '0', null, null, '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '40A4A1E59FA04D70A83D04FD4A36693B');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1567', '1029', '席位名称', 'XWM', '1', '0', '0', null, null, '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '22B766C353104D6694D091ABD5096560');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1568', '1029', '登录ID', 'USERID', '1', '0', '0', null, null, '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '4D982886073645BFAF99485FF1B945E8');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1569', '1029', '部队内码', 'BDNM', '1', '0', '0', null, null, '长度不可以超过25位！', '0', null, null, '0', '1', '0', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '794B135B778D44109B5A69486DA69D7E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1570', '52', '主键ID', 'ID', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '1', null, null, null, null, 'CA102AA09F43440980231E0E063FD254');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1571', '52', '查询时是否显示 0-否，1-是', 'FINDDISPLAY', '1', '0', '0', 'M', null, null, '0', null, '{0:''否',1:''是'}', '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '5E4D1B09DF15494FB9FCDE1F038E8098');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1572', '1029', '英文名称', 'YWMC', '1', '0', '0', null, null, '长度不可以超过25位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'CDB9DBB07501418EBF332D3E33E5699A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1573', '1029', '对应表名', 'TBNAME', '1', '0', '0', null, null, '长度不可以超过25位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'B972DD0313404DB5AE2277B86296268A');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1574', '1029', 'html内容', 'CONTENT', '1', '0', '0', null, null, '长度不可以超过500位！', '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '08B65E4F945943D4A285A50E73C6F69E');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1575', '1029', '所属模板类型', 'BELONGMODAL', '1', '0', '0', null, null, null, '1', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, 'FF3F3237D90E4607A930AA4E17207C72');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1576', '1029', 'JS展示', 'DISJS', '1', '0', '0', null, null, null, '0', null, null, '0', '1', '1', '0', '1', null, null, '0', null, null, null, null, '0', null, null, null, null, '38EBE6D5B100413AAF63C65DA013B975');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1577', '1030', '装备名称', 'ZBMC', '1', '0', '0', 'M', null, null, '0', '10', null, '0', '1', '0', '0', '1', null, '<div class=''form-group col-md-7''>
			 <label class=''col-md-4 control-label''>
				<span>装备（设）备名称：</span>
			 </label>
			 <div class=''col-md-8''>
				<select class=''form-control''></select>
			 </div>
		</div>', '0', null, null, null, null, '0', null, '1', '100003', null, 'D9D9454F38F04BE684CD66275933A0AD');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1578', '1030', '数量', 'SL', '1', '0', '0', 'L', null, null, '0', '20', null, '0', '1', '0', '0', '1', null, '<div class=''form-group col-md-4''>
	 <label class=''col-md-4 control-label''>
		<span>数量：</span>
	 </label>
	 <div class=''col-md-8''>
		<input type=''text'' class=''form-control'' />
	 </div>

</div>', '0', null, null, null, null, '0', null, '1', '100003', null, '7B41508483D94FEFABEBE08844B5CA64');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1579', '1031', '人员类别', 'RYLB', '1', '0', '0', 'M', null, null, '0', '10', null, '0', '1', '0', '0', '1', null, '<div class=''form-group col-md-7''>
	 <label class=''col-md-4 control-label''>
		<span>人员类别：</span>
	 </label>
	 <div class=''col-md-8''>
		<select class=''form-control''></select>
	 </div>
</div>
', '0', null, null, null, null, '0', null, '1', '100007', null, 'B01CDBD211BF4EF8ADA19C0DE805C902');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1580', '1031', '动用兵力', 'DYBL', '1', '0', '0', 'L', null, null, '0', '20', null, '0', '1', '0', '0', '1', null, '<div class=''form-group col-md-4''>
	 <label class=''col-md-4 control-label''>
		<span>动用兵力：</span>
	 </label>
	 <div class=''col-md-8''>
		<input type=''text'' class=''form-control'' />
	 </div>

</div>', '0', null, null, null, null, '0', null, '1', '100007', null, '9948B99AB6864230A019BABCD24D4A46');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1581', '1032', '电报份数', 'DBFS', '1', '0', '0', 'L', null, null, '0', '10', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 		<i class=''lableI''>电报：</i>

		<span>份数</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '100011', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '8FB01B8528DE41138CDF6E7265D2F1E2');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1582', '1032', '电报组数', 'DBZS', '1', '0', '0', 'L', null, null, '0', '20', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>组数</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '100011', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '1259231FBF5E47B5A74CF41B7BC8605F');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1583', '1032', '电报完成率', 'DBWCL', '1', '0', '0', 'L', null, null, '0', '30', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>完成率</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '100011', null, '6673E53F05D44341B67A63456791135D');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1584', '1032', '数据报页数', 'SJBYS', '1', '0', '0', 'L', null, null, '0', '40', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
	 		<i class=''lableI''>数据报：</i>
			<span>？？
 页</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '100011', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '78CB06C0355E407FBE297CE88DAF06EF');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1585', '1032', '数据报完成率', 'SJBWCL', '1', '0', '0', 'L', null, null, '0', '50', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>完成率</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '100011', null, '4BB96D14F52D4A42BD17C8A22B129DD5');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1586', '1032', '信号个数', 'XHGS', '1', '0', '0', 'L', null, null, '0', '60', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-12 pl0''>
	<div class=''col-md-4''>
		<div class=''form-group''>
		 	<label class=''col-md-6 control-label''>
		 		<i class=''lableI''>信号：</i>
	 			<span>？？个</span>
		 	</label>
		 	<div class=''col-md-6''>
	 		 	<input type=''text'' name='''' class=''form-control''/>
			</div>
		</div>
	</div>
</div>', '0', null, null, null, null, '0', null, '1', '100011', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', 'BCCEC63250104875B95DE2FE52071EB3');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1587', '1032', '应沟通联络次数', 'YGTLLCS', '1', '0', '0', 'L', null, null, '0', '70', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>应沟通联络次数：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>
', '0', null, null, null, null, '0', null, '1', '100012', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '7D96C4F10BCF45098C2B766C3C52FD36');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1588', '1032', '时限内沟通次数', 'SXNGTCS', '1', '0', '0', 'L', null, null, '0', '80', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>时限内沟通次数：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>
', '0', null, null, null, null, '0', null, '1', '100012', 'function jsvalue(oldvalue,currvalue,input,dw){  	if(currvalue==''''){  				$(input).val(currvalue);		}else{			$(input).val(''''+(Number(currvalue)+Number(oldvalue)));		}} ', '63C0157ABC774C379B8F6004B8F6CA9C');
INSERT INTO "FWTX_ZZZB"."S_BASECOLUMN_CONFIG" VALUES ('1589', '1032', '沟通率', 'GTL', '1', '0', '0', 'L', null, null, '0', '90', null, '0', '1', '0', '0', '1', null, '<div class=''col-md-4''>
	<div class=''form-group''>
	 	<label class=''col-md-6 control-label''>
 			<span>沟通率：</span>
	 	</label>
	 	<div class=''col-md-6''>
 		 	<input type=''text'' name='''' class=''form-control''/>
		</div>
	</div>
</div>
', '0', null, null, null, null, '0', null, '1', '100012', null, 'BF170072ECAC470B87CE03743040BF70');

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
-- Records of S_BASETABLE_CONFIG
-- ----------------------------
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1067', '104通指网系运行情况', 'TBZB_MRQKRB_TZWXYXQK_XTJD', '0', null, 'test', null, null, '4FED69128F4E4487858BECC38D7EAAF9');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1065', '部队信息表', 'ZB_BD', '0', null, 'test', null, null, '24093EEA65174A3A8A3A3F7ACB5D5D70');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1066', '104重保任务情况', 'TBZB_MRQKRB_ZDRWBZ_XTJD', '0', null, 'test', null, null, 'AC57AF97A35E4B0F90F7F04D4718589E');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1068', '104信息安防情况', 'TBZB_MRQKRB_XXAFQK_XTJD', '0', null, 'test', null, null, 'D5970F80DF214680BBD8621F441616AA');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1069', '104重点工作进展情况', 'TBZB_MRQKRB_ZDGZJZQK_XTJD', '0', null, 'test', null, null, '4D7901512A064169AA97B20F46B5E216');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1070', '104附件', 'TBZB_MRQKRB_FJ', '0', null, 'test', null, null, '6DDB58C100264420A9419BF9840CDBD9');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1072', '需求建议回复表', 'T_YJJYHF', '0', null, 'test', null, null, '1222131E269A472EA5E66124F272BB68');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1057', '战备值班系统信息表', 'ZB_BD_XX_TXBZXX', '0', null, 'test', null, null, '4ABF132379DB473789C0BA525A8D6456');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1058', '战备值班系统维护', 'ZB_BD_XX_TXSD', '0', null, 'test', null, null, '2489C7442704447195AA4B8FA4C95A42');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1059', '战备值班系统部署', 'ZB_BD_XX_ZBDJ', '0', null, 'test', null, null, '27A638CB26574F0283E32540F99F7BD1');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1074', '全军信息通信战备值勤情况', 'TBZB_MRQKRB_ZBZQQK', '0', null, 'test', null, null, '98ED8569CCB945B88AF27282DEBCA292');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1054', '值勤信息-all', 'ZB_BGPX', '0', null, 'test', null, null, 'EBDFDC1DCEBF4556B3ABD98AE969E2D0');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1055', '值班兵力', 'ZB_BD_XX_TXZBBL', '0', null, 'test', null, null, '60D6664A35494C8DB5A1C33DC76868F5');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1056', '值班装备', 'ZB_BD_XX_ZBZBMC', '0', null, 'test', null, null, 'C465DC2F81124F988862F4C593C636A0');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1061', '发布情况表', 'T_JSTX_FBQK', '0', null, 'test', null, null, 'D1816DDDD3054496AC5444BBEBE54DCC');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1062', '值班邮箱主表', 'T_JSTX', '0', null, 'test', null, null, '2D591A2F7960410585E230C084F81300');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1063', '值班邮箱附件表', 'JSTX_FJ', '0', null, 'test', null, null, 'AADF6EE41D6D4D05A618E285F338BE05');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1064', '值班邮箱权限表', 'JSTX_QX', '0', null, 'test', null, null, '5F9CBDC78B8D4336B3944D0B555E3479');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1053', '其他情况', 'TBZB_QTQK', '0', null, 'test', null, null, '410F35C9AA3D4FDBA30FC2413A4F8C80');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1002', '兵力调用', 'T_XBLR_BLDYQK', '0', null, 'test', null, null, 'BB995217E88849478BE77F222A418D33');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1003', '信息通信保障', 'T_XBLR_XXTXBZQK', '0', null, 'test', null, null, 'C9BC278043EF4C48B5717369B8A78AF4');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1004', '重保任务', 'T_XBLR_ZBRWQK', '0', null, 'test', null, null, '5404DE5DCBA44D2B957334257EDD3D3B');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1005', '战备演训', 'T_XBLR_ZBYX', '0', null, 'test', null, null, '80DF47863E934AA9A8711D8A26A1B2DA');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('50', 'sql信息管理表', 'S_MANAGER_SQLINFO', '0', null, 'gly', null, 'gly', '50F2BDE1EFA1406E91144B4F77F124A7');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('51', '基本配置信息表', 'S_BASETABLE_CONFIG', '0', null, 'gly', null, 'gly', 'AFC335B1CAEF4526B1FEA30693FD9C6E');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('52', '基本配置属性表', 'S_BASECOLUMN_CONFIG', '0', null, 'gly', null, 'gly', '4CB7FD57D50942B094640A8FDCD1A8D3');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('58', '上报数据配置表', 's_report_config', '0', null, 'zhaosdb', null, 'zhaosdb', 'D810BFB011954BA7B86B4FE08ECC3A89');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('59', '数据填报模板配置表', 's_excel_tableinfo', '0', null, 'gly', null, 'gly', '38194C43EC8146A7869D18020392444D');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('60', '数据填报模板配置属性表', 's_excel_column', '0', null, 'gly', null, 'gly', '21619EE4DBDA4316AE5051F1FB5F6017');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1001', '新版录入', 'T_XBLR', '0', null, 'test', null, null, '7CB93192735244A3B71705C43EFB5865');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('62', '用户信息表', 's_user_info', '0', null, 'test', null, 'test', 'F5D7BDEE41C840309597377811A44DB6');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1010', '配置报表属性', 'ZB_S_RES_COLUMN_NEW', '0', null, 'test', null, null, '6073694956884F18BE944CF93261BD05');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1011', '配置报表主表', 'ZB_S_RES_TABLE_NEW', '0', null, 'test', null, null, 'BE392406D30F4A829A589405A41C07C0');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1047', '自然灾害通信保障情况', 'TBZB_MRQKRB_ZRZHTXBZQK', '0', null, 'test', null, null, '13B025A0EC3043ACAB4D96A29D91536A');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1006', '每日情况日报', 'TBZB_MRQKRB', '0', null, 'test', null, null, 'AB8EC5E11B1B4AE384C0908AB88CAB66');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1007', '每日情况日报-通信网络情况', 'TBZB_MRQKRB_TXWLQK', '0', null, 'test', null, null, 'FD99B40E3AAE4506AFB42EBD8E6DFA59');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1008', '每日情况日报-重保任务情况', 'TBZB_MRQKRB_ZBRWQK', '0', null, 'test', null, null, '0FF2CCAA3B804964B96D0CC5DBD5B13C');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1009', '每日情况日报-其他情况', 'TBZB_MRQKRB_QTQK', '0', null, 'test', null, null, 'EA65B9A9F8CB40D2A8540E0B35290CF1');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1013', '已阅发送情况日报表', 'TBZB_DDZBRZ_FSQK', '0', null, 'test', null, null, 'D7844B0982D340FA8F0B345CBF9335DA');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1014', '频谱管控情况', 'TBZB_MRQKRB_PPGKQK', '0', null, 'test', null, null, 'CA8F2925070F412EA8C4E3EF00BAB9FB');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1012', '用户信息表', 't_user', '0', null, 'test', null, null, 'D4A17E1169A04DB9A4824245473E19AD');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1015', '附加信息表', 'TBZB_MRQKRB_KZQK', '0', null, 'test', null, null, '4F0EC8E85AE64A558516E8E009014427');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1018', '网系战备-通讯网络信息', 'ZB_BD_XX_WXZBXX_TXWLQK', '0', null, 'test', null, null, 'BD72CA89B0794D8CBC53D1A102647BBA');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1019', '网系战备情况-信息管理情况', 'ZB_BD_XX_WXZBXX_XXGLQK', '0', null, 'test', null, null, '897B170FA2B446B6BDA37610D66F418F');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1020', '网系战备-网系安全情况', 'ZB_BD_XX_WXZBXX_WXAQQK', '0', null, 'test', null, null, '011429EAC85B42D2B041C495867D1337');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1021', '网系战备-频谱管控情况', 'ZB_BD_XX_WXZBXX_PPGKQK', '0', null, 'test', null, null, '612DEBF1EC4845B8ABFB5BAFFA2FB63C');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1023', '值班序列-重保任务', 'ZB_BD_XX_ZDRWXX', '0', null, 'test', null, null, 'F42A13924F914AE6AEFFBDF753554977');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1028', '模板配置信息', 'S_MODAL_CONFIG', '0', null, 'test', null, null, '06703751420D422FAD715EC4AA85AFC5');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1030', '人装动用情况-专业项目', 'TBZB_BZLXRB_ZB', '0', null, 'test', null, null, 'BA6B37F6D2CD476CA44B38CDF65F267F');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1031', '人装动用情况-兵力动用情况', 'TBZB_BZLXRB_BL', '0', null, 'test', null, null, '3738E2CE35B64BAF8680142E17ABB323');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1032', '通联情况统计-短波通信', 'TBZB_BZLXRB_TLQK_DBTX', '0', null, 'test', null, null, '1E3147ECC694459B8D5AEC7CC2D65523');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1033', '通联情况统计-频谱管控', 'TBZB_BZLXRB_TLQK_PPGK', '0', null, 'test', null, null, 'B0F508C86A4A45DA95F3B9D31B98155A');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1034', '通联情况统计-指控系统', 'TBZB_BZLXRB_TLQK_ZKXT', '0', null, 'test', null, null, '62B3AFBD41874BA98A10CACE11E14602');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1035', '通联情况统计-信息服务', 'TBZB_BZLXRB_TLQK_XXFW', '0', null, 'test', null, null, '6DB41809FB2147298DDF790366A928D6');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1016', '网络战备-指挥支援情况', 'ZB_BD_XX_WXZBXX_ZHZYQK', '0', null, 'test', null, null, '1D455DF579E64D8F93B35192D208977E');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1017', '网络战备-指挥支援情况-状态表', 'ZB_BD_XX_WXZBXX_ZHZYQK_LS', '0', null, 'test', null, null, 'EB66100E2BE34AA28350431C10830DD3');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1024', '值班序列-基本信息-所属部队信息', 'ZB_BD_XX_KZ', '0', null, 'test', null, null, '30EACAC005A14BFFB4A42B017F6BD664');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1029', '模板类型', 'S_MODAL_TYPE', '0', null, 'test', null, null, '10641BD055174A879ED02ED7AAF7915D');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1036', '编组联训值班情况', 'TBZB_BZLXRB', '0', null, 'test', null, null, '6B1D518F24C3442EB19C62CBF3F12EB6');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1022', '值勤单位序列-基本信息', 'ZB_BD_XX', '0', null, 'test', null, null, '95E798E577344FFA8B02125B0BA066BF');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1025', '每日情况日报-信息管理情况', 'TBZB_MRQKRB_XXGLQK', '0', null, 'test', null, null, '8ABA2991CE014D29A4FF707A2662AF5C');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1026', '每日情况日报-网系安全情况', 'TBZB_MRQKRB_WXAQQK', '0', null, 'test', null, null, '015DBEBACA564F77B987196B388D0EC3');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1027', '每日情况日报-检查测试情况', 'TBZB_MRQKRB_JCCSQK', '0', null, 'test', null, null, '3DD24C3D9D10429AAA3C41541441FC70');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1037', '上级通知', 'TBZB_MRQKRB_SJTZZS', '0', null, 'test', null, null, 'A0D92ECC0A034CC8A82CF749E80632A0');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1038', '人员装备动态', 'TBZB_MRQKRB_RYZBDT', '0', null, 'test', null, null, 'EF0789A75B0146AA934FEB73F6DB29F6');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1039', '重保任务情况', 'TBZB_MRQKRB_ZDRWBZ', '0', null, 'test', null, null, '1444FD7EA5DD4322B94E1FE04B28F917');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1040', '通指网系运行情况', 'TBZB_MRQKRB_TZWXYXQK', '0', null, 'test', null, null, '35475A078BC942FD8FA4F01E49631290');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1041', '检查情况', 'TBZB_MRQKRB_JCQK', '0', null, 'test', null, null, 'E914D0FE83CA444D831D91CF83EE0A32');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1042', '部队动态', 'TBZB_MRQKRB_DQGZDT', '0', null, 'test', null, null, '1A286A16E56E411BBC95D432377F350D');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1046', '部队驻地及灾损情况', 'TBZB_MRQKRB_BDZDTQZSQK', '0', null, 'test', null, null, '25E04A79922C4A28A452C5FA070C0D8E');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1073', '风险评估情况', 'TBZB_MRQKRB_WXAQFXPGQK', '0', null, 'test', null, null, 'A210604B8FEB491FAE9E0094094E70AA');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1060', '值勤序列备注', 'ZB_BD_XX_BZ', '0', null, 'test', null, null, '58F08E7B03A84142B758CFBFF14CEEE0');
INSERT INTO "FWTX_ZZZB"."S_BASETABLE_CONFIG" VALUES ('1071', 'T_YJJY', 'T_YJJY', '0', null, 'test', null, null, 'E89D3E92EA284F2EA9FD11AA4A5A72E6');

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
-- Records of S_MANAGER_SQLINFO
-- ----------------------------
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('69', '查询发送日期和接收单位-编组联训', 'findSendInfosList_bzlx', null, 'SBSJ desc', ' select TO_CHAR(FSRQ,''yyyy-mm-dd hh24:mi:ss'') FSRQ,FSDW,HZQK,TO_CHAR(HZSJ,''yyyy-mm-dd hh24:mi:ss'') HZSJ,JSDW from tbzb_ddzbrz_fsqk a
where  eXISTS (SELECT 1 from TBZB_BZLXRB b WHERE a.QKRBNM=b.GLNM  and b.nm=#{paramMap.NM}) order by FSRQ desc', null, '0', null, 'test', null, null, '68505123EFC74096830D7936ED59D3A9');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('57', '值班序列-查询公共枚举值', 'findShareMenuList', null, null, 'select nr,xh,nm as userid from zb_jcsj where lx=#{paramMap.LX} order by xh', null, '0', null, 'test', null, null, '1A203B121E9D4E848116FE1346A36064');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('58', '查询值班序列-重保任务信息', 'findZbxlZbrwList', null, null, 'SELECT
BDNM,RWDH,RWDY,RWXZ,TXXQ,to_char(KSSJ,''yyyy-mm-dd hh24:mi:ss'') KSSJ,
to_char(JSSJ,''yyyy-mm-dd hh24:mi:ss'') JSSJ,DYJD,DYWD,DYGC,USERID,NM,RWBD,RWBZQK,BZ,to_char(GXSJ,''yyyy-mm-dd hh24:mi:ss'') GXSJ
FROM  ZB_BD_XX_ZDRWXX', null, '0', null, 'test', null, null, 'CBBF4403DF9849A7B7E87370BA7CB9A2');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('61', '查询是否允许修改的属性数量', 'findModifyColumsCount', null, null, 'SELECT count(1) FROM S_BASECOLUMN_CONFIG ', null, '0', null, 'test', null, null, '266D7C338AC64ECEB33C09BADF7D0AC2');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('63', '每日情况日报校验信息', 'findMrqkValidtorInfo', null, null, 'SELECT * from S_BASECOLUMN_CONFIG where TABLEID IN(''1006'',''1007'',''1008'',''1014'',''1025'',''1026'',''1027'',''1009'')', null, '0', null, 'test', null, null, 'A0BAE523586A4F43B2F5203F1CE81F18');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('65', '查询基础操作表信息集合数量', 'findBaseInfoOperateListCount', null, null, 'select count(1) from ${paramMap.TABLENAME}', null, '0', null, 'test', null, null, '2DCE24FBBB744929AF86664D2E488B18');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('70', '查询当日的接收日报-编联', 'findMrqkrbHuiZongList_bzlx', null, null, 'SELECT TO_CHAR (b.rq, ''YYYY-MM-DD'') AS RQ, b.DWMC,
	b.NM, 	ROWNUM AS XH, TO_CHAR ( b.SBSJ, ''yyyy-mm-dd hh24:mi:ss'' ) AS sbsj, b.SBDWXW,
	CASE WHEN b.SFSB = ''1'' THEN ''已上报' ELSE 	''未上报' END AS SFSB,
 b.JSDW, b.SBDW,b.GLNM FROM zb_s_zbxl_dw A, TBZB_BZLXRB b
WHERE 	A.userid =#{paramMap.USERID} AND A.userid = b.userid (+) AND A .wqbz = 4 AND b.sfsb (+) = 1 AND rq LIKE SYSDATE
AND A .dwnm = b.sbdwnm (+) ORDER BY 	A .xh', null, '0', null, 'test', null, null, 'B8563B82E1DB482E8253D10E7FF87ED7');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('71', '查询数据测试', 'testFindData', null, null, 'select * from S_BASETABLE_CONFIG', null, '0', null, 'test', null, null, 'F42DBFD834654F32A6181DBFF46F47D8');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('59', '根据表名查询属性信息', 'findColumnsByTableName', null, null, 'SELECT * from S_BASECOLUMN_CONFIG where TABLEID in ( SELECT ID from S_BASETABLE_CONFIG where TABLEENAME=#{paramMap.NAME}) order BY ORDERNUM', null, '0', null, 'test', null, null, '40279A1242C94111AFCB3AFCEBBAB587');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('64', '查询基础操作表信息集合', 'findBaseInfoOperateList', null, null, 'select * from ${paramMap.TABLENAME}', null, '0', null, 'test', null, null, 'FD395B9F51A44C379209735CF8242A3F');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('86', '查询值班邮箱发送列表发送消息列表', 'findZbmailFsjlList', null, null, 'select SUBSTR(fbdx,0,INSTR(fbdx,''-'')-1) as jsdw,SUBSTR(fbdx,INSTR(fbdx,''-'')+1) as jsxw ,jstxid,TO_CHAR(hfsj,''YYYY-MM-DD HH24:mi:ss'') AS hfsj,fbrq,case when HFSJ is NULL then ''未回执' ELSE ''已回执' end as hzzt from T_JSTX_FBQK where  jstxid=#{paramMap.ID} ', null, '0', null, 'test', null, null, 'C37D38F457E3421E9D4B0414DB915B36');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('88', '新版需求建议功能查询sql', 'findXqjyNewList', null, 'FBSJ DESC', 'select ID,BT,DQZT,to_char(fbsj,''yyyy-mm-dd HH24:mi:ss'') as FBSJ,LB,NR,TCR,USERBDNM,ZTGS FROM T_YJJY  where 1=1 and(to_char(fbsj,''yyyy-mm-dd HH24:mi:ss'' ) like ''%''||#{paramMap.searchlike}||''%'' or TCR LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR BT LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR DQZT LIKE ''%'' || #{ paramMap.searchlike }|| ''%'')', null, '0', null, 'test', null, null, '82FB01B204144507907E6CBC757E9E27');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('89', '新版需求建议功能分页查询总条数', 'findXqjyNewListCount', null, null, 'select count(1) FROM T_YJJY  where 1=1 and(to_char(fbsj,''yyyy-mm-dd HH24:mi:ss'' ) like ''%''||#{paramMap.searchlike}||''%'' or TCR LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR BT LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR DQZT LIKE ''%'' || #{ paramMap.searchlike }|| ''%'') ', null, '0', null, 'test', null, null, '16A9D7A54ED64BC4BBC65CF982FEFDE2');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('90', '查询需求建议信息', 'findXqjyInfoByCond', null, null, 'SELECT id,to_char(fbsj,''yyyy-mm-dd HH24:mi:ss'') as fbsj,tcr,lb,dqzt,nr,bt,ZBDH,ztgs,FBRY,USERBDNM from T_YJJY', null, '0', null, 'test', null, null, '71AF59A352474225B02A7F97DD8BF125');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('94', '新版值班安排人员管理查询sql', 'findRyManageNewList', null, 'gjrynm', 'select dw,xm,xb,zw,mz,gjrynm,jx,syn_nm nm from kjzzzbgx.zhkz_zb_ry_fl a where flag=1 and fl=''部位人员''', null, '0', null, 'test', null, null, '8AB0652EA5AA4A6DA3851333AC32E718');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('95', '新版值班安排人员管理查询数据总条数', 'findRyManageNewListCount', null, null, 'select count(1)  from kjzzzbgx.zhkz_zb_ry_fl a where flag=1 and fl=''部位人员''', null, '0', null, 'test', null, null, '31278B944BD247B29F2C4278815D249E');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('96', '新版值班安排功能人员管理查询人员职务', 'findZbapRyMagZwNewList', null, 'XH', 'SELECT DISTINCT ZW as name, XH as code from zb_s_fdry_zw_wh', null, '0', null, 'test', null, null, '7FEC00BA5F75483382C7A05912F45738');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('97', '新版值班安排功能人员管理查询人员民族', 'findZbapRyMagMzNewList', null, null, 'SELECT DISTINCT MC as name, MZNM as code from zzbz_s_ty_mz order by XH asc', null, '0', null, 'test', null, null, 'BA8D74C42B5E49BE9ED1E305118E7E42');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('98', '新版值班安排功能人员管理查询人员性别', 'findZbapRyMagXbNewList', null, null, 'SELECT DISTINCT MC as name, XBNM as code from zzbz_s_ty_xb order by XH asc', null, '0', null, 'test', null, null, '676EF94363A44C88B4387E2FDFB5FEE2');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('99', '新版值班安排功能人员管理查询人员文化程度', 'findZbapRyMagWhcdNewList', null, null, 'SELECT DISTINCT MC as name, WHCDNM as code from zzbz_s_ty_whcd order by XH asc', null, '0', null, 'test', null, null, '4AA582B268144E1B805D490649019B7D');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('100', '新版值班安排功能人员管理查询人员军衔', 'findZbapRyMagJxNewList', null, null, 'SELECT DISTINCT MC as name, jxnm as code from zzbz_s_ty_jx order by XH asc', null, '0', null, 'test', null, null, '1D1E833C67424A8DB73451ACBE0DAECB');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('101', '新版值班安排功能人员管理查询人员政治面貌', 'findZbapRyMagZzmmNewList', null, null, 'SELECT DISTINCT MC as name, ZZMMNM as code from zzbz_s_ty_zzmm order by XH asc', null, '0', null, 'test', null, null, '6D2DA4D6785149AAB273151CB7ECF0AE');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('102', '新版值班安排功能人员管理查询人员姓名', 'findZbapRyMagNameNewList', null, 'gjrynm', 'select xm,syn_nm nm from kjzzzbgx.zhkz_zb_ry_fl a where flag=1 and fl=''部位人员''', null, '0', null, 'test', null, null, 'A9F7392BEC984EBDBA37EB94ACB4462A');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('103', '查询历史配置信息', 'findConfigHistoryListInfo', null, null, 'SELECT * from S_MODAL_CONFIG_HISTORY where DWNM=#{paramMap.DWNM}  and GNBS=#{paramMap.GNBS} and  xwm=#{paramMap.XWM} and VERSION=#{paramMap.VERSION} order by xh', null, '0', null, 'test', null, null, '8E95DE265BC64E0DB14B9F257E4E6BC9');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('104', '根据单位内码席位查询联系方式', 'findLxfsByXwNm', null, null, 'SELECT b.lxfs lxfs from TBZB_MRQKRB a left join ZB_BGPX b on a.sbdwnm=b.userid and a.sbdwxw=b.dw', null, '0', null, 'test', null, null, '77732EA8AD6A411797659945D66C62A1');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('105', '升级查询席位和单位内码', 'updaeFindDwnmAndXwm', null, null, 'SELECT DISTINCT gnbs,dwnm,xwm from S_MODAL_CONFIG', null, '0', null, 'test', null, null, '96EC302AEF164FF19001FABC2DC80B38');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('108', '获取单位值班安排', 'getDwZbList', null, null, 'select to_char(b.rq,''yyyy-MM-dd'') rq,a.dw,b.zb,b.fb,b.zbzw,b.syn_nm as synnm,b.fbzw,b.sfcd, b.userid userid,b.zbsz from zb_bgpx a ,
(select * from kjzzzbgx.zhkz_zb_fdzb where dwnm=#{paramMap.BDNM} and (rq > to_date(#{paramMap.START},''yyyy-MM-dd hh24:mi:ss'') and rq< to_date(#{paramMap.END},''yyyy-MM-dd hh24:mi:ss''))) b
 where a.userid=#{paramMap.BDNM} and a.dw=b.dw order by rq', null, null, null, null, null, null, '5auo9nd18ym8nxtz2qxsylyaxxh75z');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('109', '获取值班列表信息', 'getOnDutyList', null, null, 'SELECT sfcd,syn_nm synnm,fb,to_char(rq,''yyyy-MM-dd'')  rq,userid,zb from kjzzzbgx.zhkz_zb_fdzb where (rq BETWEEN to_date(#{paramMap.START},''yyyy-MM-dd hh24:mi:ss'') and to_date(#{paramMap.END},''yyyy-MM-dd hh24:mi:ss'')) and userid=#{paramMap.USERID}', null, null, null, null, null, null, '6pup8s1s56g6ja7tdvk6fsjb8c1qno');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('85', '查询值班邮箱信息', 'findZBEmailInfo', null, null, 'SELECT id,to_char(fbsj,''yyyy-mm-dd HH24:mi:ss'') as fbsj,tcr,lb,dqzt,nr,bt,userid,ztgs,bs,hfr,hfsj from t_jstx', null, '0', null, 'test', null, null, '2E87B6F5843F4A6F88D1029A7200484B');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('87', '查询常用联系人', 'findUseMostUserForEmail', null, null, 'SELECT num ,fbdx from(SELECT count(b.fbdx) as num,b.fbdx from T_JSTX t  LEFT JOIN  T_JSTX_FBQK b on t.id=b.JSTXID where fbr=#{paramMap.xwm}  GROUP BY b.fbdx) 
order by num desc', null, '0', null, 'test', null, null, '8CBD32FEF30142E5B879FBF7642AF8B7');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('93', '需求建议功能发布单位联想查询sql', 'findXqjyLxQueryByTcr', null, null, 'select DISTINCT(tcr) from T_YJJY', null, '0', null, 'test', null, null, '278D67D01BA74562BE731AF14CF00832');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('104', '查询每日情况上级通知', 'findMrqkSjtz', '109', null, 'SELECT glnm,nm,userid,to_char(sj,''yyyy-mm-dd HH24:mi:ss'') as sj ,dw,ry,nr,clqk,scbj from TBZB_MRQKRB_SJTZZS', null, '0', null, null, null, null, 'x62ovgdm6tlvk2tsz3ug43a665f3o7');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('105', '重保任务', 'findMrqkZbrw', '108', null, 'SELECT glnm,nm,userid,ZYSD,BYSD,QKSM,RWLB,RWMC,BZQK,SBDWMC,BZDX,RWDY,to_char(QSSJ,''yyyy-mm-dd HH24:mi:ss'') as QSSJ,to_char(JZSJ,''yyyy-mm-dd HH24:mi:ss'') as JZSJ,XZDW,WXZZQK,DRBZQK,BJZDGZSX,XJWLZGZSX,xh from TBZB_MRQKRB_ZBRWQK ', null, '0', null, null, null, null, '5dxg8inifbc88iozxfjlxdr3div2q2');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('106', '网络运维', 'findMrqkTxwl', '107', null, 'SELECT GLNM,WLGZ, QSSJ,JZSJ,GZYX,GZYY,CZQK,WHDW,NM,GZSX,LX,YXQK,GZSBCJ,USERID,SCBJ,XH,SBDWMC from  TBZB_MRQKRB_TXWLQK ', null, '0', null, null, null, null, 'f33z1hsuw7jif942rux9mlqwzbh3on');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('107', '查询最近的上报历史记录信息', 'findHaveReportHistoryNearest', null, null, 'SELECT nm,SBSJ,SBDWNM,JSDWNM from (SELECT rq,SFSB,nm,SBSJ,SBDWNM,JSDWNM,scbj from TBZB_MRQKRB a where to_char(rq,''yyyy-mm-dd'')=TO_CHAR(SYSDATE,''yyyy-mm-dd'') and sfsb=1 and scbj=1 
AND  EXISTS(SELECT nm,sbdwnm,jsdwnm from TBZB_MRQKRB b where nm=${paramMap.NM} and a.sbdwnm=b.sbdwnm and a.jsdwnm=b.jsdwnm )
order by sbsj desc) where ROWNUM <2', null, null, null, null, null, null, '6zwu1new5tay41k7lx4rl2a5bvfy6t');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('78', '查询值勤信息', 'findZQXXInfos', null, null, ' select a.rq jrrq,b.rq mrrq,a.dwnm,a.userid,a.dw,a.jrzb,b.mrzb,c.lxfs,c.czdh,c.wddz,c.qtlxfs 
 from (select to_char(rq,''yyyy-mm-dd'') rq,dwnm,userid,dw,zb||''''||zbzw jrzb from kjzzzbgx.zhkz_zb_fdzb where  
 rq=to_date(#{paramMap.RQ},''yyyy-mm-dd'')) a,(select to_char(rq,''yyyy-mm-dd'') rq,dwnm,userid,dw,zb||'' ''||zbzw mrzb  
 from kjzzzbgx.zhkz_zb_fdzb where rq=to_date(#{paramMap.RQ},''yyyy-mm-dd'')+1) b,zb_bgpx c where 
 a.userid=b.userid and a.dwnm=b.dwnm and a.dwnm = #{paramMap.BDNM} and a.dw=b.dw and a.dwnm=c.userid and a.dw=c.dw order by c.userid,c.p_id', null, '0', null, 'test', null, null, '08BE51C92E494FA48AB7624758E882F9');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('79', '新版查询值班邮箱接收列表', 'findZbmaiReceivelNewList', null, ' fbsj desc ', 'select DISTINCT(A.ID),to_char(a.FBSJ,''YYYY-MM-DD HH24:mi:ss'')  as  fbsj,a.TCR,a.BT,a.NR,a.BS,c.FBR,c.HFR,a.USERID,d.BDFH,b.nm,
case when c.HFSJ is NULL then ''未回执' ELSE ''已回执' end as hzzt from t_jstx A,jstx_qx b,t_jstx_fbqk c,zb_bd D 
where A.ID = b. ID AND c.jstxid(+)= A.ID and D.bdnm(+)=substr(A.userid,1 ,instr(A.userid,''['',-1)-1)
 and  b.USERID like ''%''||#{paramMap.USERID}||''%''  and c.fbdx=#{paramMap.FBDX} 
and( to_char(a.fbsj,''yyyy-mm-dd HH24:mi:ss'' ) like ''%''||#{paramMap.searchlike}||''%'' or A.TCR LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR A.BT LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR A.DQZT LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR A.LB LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR A.NR LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' )', null, '0', null, 'test', null, null, '9A5971C693FD422D9C9C7AD790312A61');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('80', '新版值班邮箱接收列表数据总数', 'findZbmaiReceivelNewListCount', null, null, 'select count(DISTINCT(A.ID)) from t_jstx A,jstx_qx b,t_jstx_fbqk c,zb_bd D where A.ID=b. ID AND c.jstxid(+)=A.ID and D.bdnm(+)=substr(A.userid,1 ,instr(A.userid,''['',-1)-1) and c.fbdx=#{paramMap.FBDX} 
 and b.USERID like ''%''||#{paramMap.USERID}||''%''  and(to_char(A.fbsj,''yyyy-mm-dd HH24:mi:ss'' ) like ''%''||#{paramMap.searchlike}||''%'' OR A.TCR LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR A.BT LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR A.DQZT LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR A.LB LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' OR A.NR LIKE ''%'' || #{ paramMap.searchlike }|| ''%'' )	', null, '0', null, 'test', null, null, '6CA6254BBB85486687D89233E512D66D');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('81', '新版查询值班邮箱发送列表', 'findZbmailHaveSendNewList', null, 'fbsj DESC   ', 'select a.id,TO_CHAR(a.fbsj,''YYYY-MM-DD HH24:mi:ss'') as fbsj,a.tcr,a.nr,a.bt,a.userid,a.bs ,( select count(1) from T_JSTX_FBQK b where a.id=b.jstxid) as fsjl
from t_jstx a where  a.BS like ''%''||#{paramMap.BS}||''%'' and  a.USERID=#{paramMap.userid}  and(a.tcr like ''%''||#{paramMap.searchlike}||''%'' or a.nr like ''%''||#{paramMap.searchlike}||''%'' or to_char(a.fbsj,''yyyy-mm-dd HH24:mi:ss'' ) like ''%''||#{paramMap.searchlike}||''%'' or a.bt like ''%''||#{paramMap.searchlike}||''%'')', null, '0', null, 'test', null, null, '5AF7DB867100477DAECBE10A4DA4E2A1');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('82', '新版查询值班邮箱发送列表总数', 'findZbmailHaveSendNewListCount', null, null, 'select count(a.id) from t_jstx a where  a.BS like ''%''||#{paramMap.BS}||''%'' and  a.USERID like ''%''||#{paramMap.userid}||''%'' and(a.tcr like ''%''||#{paramMap.searchlike}||''%'' or a.nr like ''%''||#{paramMap.searchlike}||''%'' or to_char(a.fbsj,''yyyy-mm-dd HH24:mi:ss'' ) like ''%''||#{paramMap.searchlike}||''%'' or a.bt like ''%''||#{paramMap.searchlike}||''%'')
', null, '0', null, 'test', null, null, 'D26941C5359B49749455272C3F79B647');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('83', '新版查询值班邮箱未发送列表', 'findZbmailNOSendNewList', null, 'FBSJ desc', 'select  ID ,TO_CHAR(FBSJ,''YYYY-MM-DD HH24:mi:ss'') FBSJ, TCR ,BT ,BS,NR, HFSJ from T_JSTX  where  (to_char(fbsj,''yyyy-mm-dd HH24:mi:ss'' ) like ''%''||#{paramMap.searchlike}||''%''  or TCR  like ''%''||#{paramMap.searchlike}||''%''  or BT  like ''%''||#{paramMap.searchlike}||''%''  or DQZT  like ''%''||#{paramMap.searchlike}||''%'' or LB  like ''%''||#{paramMap.searchlike}||''%'' or NR  like ''%''||#{paramMap.searchlike}||''%'' )', null, '0', null, 'test', null, null, '09C5A9606FE94840814AD75CE90A1611');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('84', '新版查询值班邮箱未发送列表总条数', 'findZbmailNOSendNewListCount', null, null, 'select  count(1)  from T_JSTX  where ( to_char(fbsj,''yyyy-mm-dd HH24:mi:ss'' ) like ''%''||#{paramMap.searchlike}||''%''  or TCR  like ''%''||#{paramMap.searchlike}||''%''  or BT  like ''%''||#{paramMap.searchlike}||''%''  or DQZT  like ''%''||#{paramMap.searchlike}||''%'' or LB  like ''%''||#{paramMap.searchlike}||''%'' or NR  like ''%''||#{paramMap.searchlike}||''%'' )', null, '0', null, 'test', null, null, '5544408B2BB241D6B9455E567C80449F');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('91', '查询需求建议回复', 'findXqjyHfById', null, 'TIME', 'select id,hf,hfid,TO_CHAR(TIME,''yyyy-mm-dd HH24:mi:ss'') AS TIME,username,userid,hfdx from T_YJJYHF ', null, '0', null, 'test', null, null, '61C194BDA9364D3388BE6D07E92D24A0');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('92', '需求建议查询回复条数', 'findXqjyHfListCount', null, null, 'select count(1)  jlts from T_YJJYHF 
', null, '0', null, 'test', null, null, 'DC13ECFAEA274B6DBE1506396A46826E');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('52', '查询当日的接收日报', 'findMrqkrbHuiZongList', null, null, 'SELECT TO_CHAR (b.rq, ''YYYY-MM-DD'') AS RQ, b.DWMC,
	b.NM, b.JRZBYZW, b.MRZBYXM, 	ROWNUM AS XH, TO_CHAR ( b.SBSJ, ''yyyy-mm-dd hh24:mi:ss'' ) AS sbsj, b.SBDWXW,
	CASE WHEN b.SFSB = ''1'' THEN ''已上报' ELSE 	''未上报' END AS SFSB,
 b.JSDW, b.JRZBYXM,  b.SBDW,b.GLNM,b.MBLX FROM zb_s_zbxl_dw A, tbzb_mrqkrb b
WHERE 	a.userid=#{paramMap.USERID}  and b.jsdwnm(+)=#{paramMap.JSDWNM} and b.mblx=#{paramMap.MBLX} AND A .wqbz = 4 AND b.sfsb (+) = 1 AND rq LIKE SYSDATE
AND A.dwnm = b.sbdwnm (+) and scbj=0 ORDER BY 	A .xh', null, '0', null, 'test', null, null, '0842EA292B814566A48535D236B7D1B0');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('76', '根据条件查询是否存在对应的数据', 'findExistData', null, null, 'SELECT SBDWNM from TBZB_MRQKRB where to_char(rq,''yyyy-mm-dd'')= #{paramMap.RQ}   and ( sfsb=0 )  and DWNM= #{paramMap.SBDWNM} and mblx= #{paramMap.MBLX} and SCBJ=0', null, '0', null, 'test', null, null, '87798B52CC084D4EA251EAEC5B03ECE0');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('73', '查询模板类型', 'findModalTypeLists', null, 'gnbs', 'SELECT DISTINCT gnbszw as name, gnbs as code from ZB_S_RES_TABLE_NEW ', null, '0', null, 'test', null, null, '9396482C0C5A49688A9BA497C080BBFD');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('77', '查询接收日报信息数据总数', 'findMrqkrbReciveListCount', null, null, 'select count(1) from zb_s_zbxl_dw a,tbzb_mrqkrb b where  a.userid=#{paramMap.USERID}  and b.jsdwnm(+)=#{paramMap.JSDWNM} and a.wqbz=4 and b.sfsb(+)=1 and scbj(+)=0  and rq(+) like to_date(#{paramMap.RQ},''yyyy-mm-dd'') and a.dwnm=b.sbdwnm(+)  and b.mblx(+) = #{paramMap.MBLX}', null, '0', null, 'test', null, null, 'E3AB5931CB8143A8B6FC8D60279DD14F');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('72', '查询当前日期是否存在', 'findExistsCurrDate', null, null, 'SELECT SBDWNM from TBZB_MRQKRB where to_char(rq,''yyyy-mm-dd'')= to_char(SYSDATE,''yyyy-mm-dd'')  and sfsb=0   and DWNM= #{paramMap.SBDWNM} and mblx= #{paramMap.MBLX} and SCBJ=0', null, '0', null, 'test', null, null, 'AE5F4C43AC74425EB655B939416F1DBC');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('74', '新版查询情况日报发送列表', 'findMrqkrbNewList', null, null, 'SELECT VERSION, TO_CHAR(rq,''YYYY-MM-DD'') AS RQ,NM,JRZBYZW,MRZBYXM,MBLX,rownum as XH,SBDWXW,
CASE WHEN SFSB=''1'' THEN ''已上报' ELSE ''未上报' END AS SFSB,JRZBYXM,SBDW,PGJRZBYXM,PGMRZBYXM ,
DWMC,JSDW,TO_CHAR(SBSJ,''yyyy-mm-dd hh24:mi:ss'') as sbsj,
CASE WHEN SFYY=''1'' THEN ''已阅'' ELSE ''未阅'' END as SFYY,
CASE WHEN SFHZ=''1'' THEN ''已回执' ELSE ''未回执' END as SFHZ,gnbszw,
(SELECT CASE WHEN count(1)=0 THEN ''无' ELSE count(1)||'''' END from TBZB_MRQKRB tm where tm.SBDWNM=x.SBDWNM and tm.JSDWNM=x.JSDWNM and TM.RQ=x.rq and TM.mblx=x.MBLX) as FSJL,
(SELECT wm_concat(TO_CHAR(SBSJ,''yyyy-mm-dd hh24:mi:ss'')) from (SELECT SBSJ,SBDWNM,JSDWNM,RQ,MBLX from TBZB_MRQKRB  order by sbsj  desc,rq DESC) tm where tm.SBDWNM=x.SBDWNM and tm.JSDWNM=x.JSDWNM and TM.RQ=x.rq and TM.mblx=x.MBLX ) as FSCONTENT,(SELECT wm_concat (SBDWXW) FROM(SELECT SBDWXW, SBDWNM, JSDWNM, RQ, MBLX	FROM TBZB_MRQKRB ORDER BY	 sbsj DESC, rq DESC) tm	WHERE tm.SBDWNM = x.SBDWNM	AND tm.JSDWNM = x.JSDWNM	AND TM.RQ = x.rq	AND TM.mblx = x.MBLX) AS SBDWXWLIST FROM TBZB_MRQKRB x JOIN (select DISTINCT gnbs,gnbszw from ZB_S_RES_TABLE_NEW) b  on x.MBLX=b.GNBS
where DWNM=#{paramMap.SBDWNM} and (sfsb=''0''  or sfsb=''1'') and SCBJ=0 and ( SBDWXW like ''%''||#{paramMap.searchlike}||''%''   or JRZBYXM LIKE ''%''||#{paramMap.searchlike}||''%'' or MRZBYXM like ''%''||#{paramMap.searchlike}||''%'' or TO_CHAR(rq, ''YYYY-MM-DD'') like ''%''||#{paramMap.searchlike}||''%'' or gnbszw like ''%''||#{paramMap.searchlike}||''%'' or JSDW like ''%''||#{paramMap.searchlike}||''%'')  ORDER BY	rq desc , sbsj desc', null, '0', null, 'test', null, null, '4759AD0D6A084F419E9C2FC266EE2F50');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('75', '新版发送列表数据总数', 'findMrqkrbNewListCount', null, null, 'SELECT count(1) FROM TBZB_MRQKRB x JOIN (select DISTINCT gnbs,gnbszw from ZB_S_RES_TABLE_NEW) b  on x.MBLX=b.GNBS
where DWNM=#{paramMap.SBDWNM} and (sfsb=''0''  or sfsb=''1'') and SCBJ=0 and ( DWMC like ''%''||#{paramMap.searchlike}||''%''    or JRZBYXM LIKE ''%''||#{paramMap.searchlike}||''%'' or MRZBYXM like ''%''||#{paramMap.searchlike}||''%'' or TO_CHAR(rq, ''YYYY-MM-DD'') like ''%''||#{paramMap.searchlike}||''%'' or gnbszw like ''%''||#{paramMap.searchlike}||''%'' or JSDW like ''%''||#{paramMap.searchlike}||''%'') ORDER BY rq DESC,sbsj DESC', null, '0', null, 'test', null, null, '787962882F854FA4AB68EAC82410E101');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('56', '查询枚举列表', 'findMenuList', null, null, 'select nr,xh,userid from zb_jcsj where lx=#{paramMap.LX} order by xh', null, '0', null, 'test', null, null, '57AC36BA35844EA08495619958EAF332');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('46', '查询接收日报信息', 'findMrqkrbReciveList', null, null, 'select VERSION, case when b.sfyy=1 THEN ''已阅'' ELSE ''未阅'' END as sfyy , a.dwmc,a.dwnm,to_char(b.rq,''yyyy-mm-dd'') rq,b.jrzbyxm,b.mrzbyxm,b.nm,b.userid,b.sbdw,b.jsdw,case when b.mblx is null then '''' else b.mblx end mblx,to_char(b.sbsj,''yyyy-mm-dd hh24:mi:ss'') sbsj,
case when b.rq is null then ''未上报' else ''已上报' end sbzt,a.xh,b.sbdwnm,b.sbdwxw,b.glnm ,
CASE WHEN SFHZ=''1'' THEN ''已回执' ELSE ''未回执' END as SFHZ,
(SELECT CASE WHEN count(1)=0 THEN ''无' ELSE count(1)||'''' END from TBZB_MRQKRB tm where tm.SBDWNM=b.SBDWNM and tm.JSDWNM=b.JSDWNM and TM.RQ=b.rq and TM.mblx=b.MBLX) as FSJL,
(SELECT wm_concat(TO_CHAR(SBSJ,''yyyy-mm-dd hh24:mi:ss'')) from (SELECT SBSJ,SBDWNM,JSDWNM,RQ,MBLX from TBZB_MRQKRB  order by sbsj desc) tm where tm.SBDWNM=b.SBDWNM and tm.JSDWNM=b.JSDWNM and TM.RQ=b.rq and TM.mblx=b.MBLX ) as FSCONTENT , (SELECT wm_concat (SBDWXW) FROM(SELECT SBDWXW, SBDWNM, JSDWNM, RQ, MBLX	FROM TBZB_MRQKRB ORDER BY	 sbsj DESC, rq DESC) tm	WHERE tm.SBDWNM = b.SBDWNM	AND tm.JSDWNM = b.JSDWNM	AND TM.RQ = b.rq	AND TM.mblx = b.MBLX) AS SBDWXWLIST
from zb_s_zbxl_dw a,tbzb_mrqkrb b where  a.userid=#{paramMap.USERID}  and b.jsdwnm(+)=#{paramMap.JSDWNM} and a.wqbz=4 and b.sfsb(+)=1 and scbj(+)=0  and rq(+) like to_date(#{paramMap.RQ},''yyyy-mm-dd'') and a.dwnm=b.sbdwnm(+)  and b.mblx(+) = #{paramMap.MBLX}   order by a.xh', null, '0', null, 'test', null, null, '45D5BEA4FABD48C9936E089E1EF214E4');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('34', '备案查询', 'findServerecord', ' {''platformType'':''b.platformType'',''startApplyTime'':''applyTimeMinNum'',''endApplyTime'':''applyTimeMaxNum'',''platformName'':''a.platformName'',''startOperateTime'':''c.operateTimeMinNum'',''endOperateTime'':''c.operateTimeMaxNum''}', null, ' select a.id,a.applyNo,type,a.content,applyTime,a.platformName,a.applyName,applyState,b.platformType,
(select count(1) from s_estimateresult c where c.applyNo=a.id) as questionNum,
(select count(1) from s_recordevaluation) as totalQuestionNum,operateTime as finishTime
 from s_serverecord a
left join s_platform_info b on a.platformId=b.platformid
left join s_serverecordapplyinfo c on a.id=c.serveRecordID and c.listStates=''04''', null, '0', null, 'gly', null, 'gly', '0C3CF615D3024CF4AA8C183BA6EEEACB');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('35', '备案查询数量', 'findServerecordCount', '  {''platformType'':''b.platformType'',''startApplyTime'':''applyTimeMin'',''endApplyTime'':''applyTimeMax'',''platformName'':''a.platformName''}', null, ' select count(a.id)
 from s_serverecord a
left join s_platform_info b on a.platformId=b.platformid
left join s_serverecordapplyinfo c on a.id=c.serveRecordID and c.listStates=''04''', null, '0', null, 'gly', null, 'gly', '1EE456FD557F458293389E8C14B911A5');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('54', '通信保障情况故障查询方法', 'findTxbzqkByGlnm', null, null, 'select * from  TBZB_MRQKRB_TXWLQK where GZSX=''10'' and GLNM=#{paramMap.GLNM}', null, '0', null, 'test', null, null, '316D815A76994304805F1D3FB917A54B');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('55', '查询支援-通信保障情况', 'findZYTxbzqkByGlnm', null, null, 'select * from  TBZB_MRQKRB_TXWLQK where GZSX=''20'' and GLNM=#{paramMap.GLNM}', null, '0', null, 'test', null, null, '3D3F43F7763C48C0BF3B57D6CAC7A151');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('42', '查询属性中最大的id', 'findMaxID', null, null, 'SELECT max(id)+1 as id from ${paramMap.tablename}', null, '0', null, 'test', null, 'test', 'C55AE99522CE44F3BB8443B5E5E2CDFE');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('2', null, 'findTableInfoByPageCount', null, null, ' SELECT count(id)
FROM s_basetable_config ', null, '0', null, 'gly', null, 'gly', '22FB157102C840359AC7D2C3ECA3CA44');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('47', '根据关联内码查询需要更新的日报信息', 'findSendListByGLNM', null, ' FSRQ DESC', 'SELECT * FROM tbzb_ddzbrz_fsqk ', null, '0', null, 'test', null, null, 'E545B21169B34CB3967CEA3E890F85FC');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('48', '查询今日领导值班信息', 'findJrldList', null, null, 'select rq,zb,zbzw from kjzzzbgx.zhkz_zb_fdzb where (rq like sysdate ) and dwnm=#{paramMap.DWNM} and dw=(select dw from zb_bgpx where userid=#{paramMap.USERID} and p_id=1)', null, '0', null, 'test', null, null, '51F574416FC640B3878E88E699576929');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('49', '查询明日领导值班信息', 'findMrldList', null, null, 'select rq,zb,zbzw from kjzzzbgx.zhkz_zb_fdzb where (rq like sysdate+1 ) and dwnm=#{paramMap.DWNM} and dw=(select dw from zb_bgpx where userid=#{paramMap.USERID} and p_id=1)', null, '0', null, 'test', null, null, 'DC89E71213784B928C9947245D61922A');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('50', '查询今日值班员信息', 'findJrzbList', null, null, 'select rq,zb,zbzw from kjzzzbgx.zhkz_zb_fdzb where (rq like sysdate ) and dwnm=#{paramMap.DWNM}  and dw=#{paramMap.DW} ', null, '0', null, 'test', null, null, 'B3CA53F495CD4AFDA3A0B5B5A6F3A80D');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('21', null, 'saveQueryLog', ' ', null, ' insert into s_query_log (type, name, code, delFlag, createTime, creator, updateTime, updator)
values (#{map.type},#{map.name},#{map.code},#{map.delFlag},#{map.createTime},#{map.creator},#{map.updateTime},#{map.updator})', null, '0', null, 'gly', null, 'gly', 'CB6EE15530B94B3AB8C5B3E453B5BF5F');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('68', '查询接收日报信息-编组联训', 'findMrqkrbReciveList_bzlx', null, null, 'select case when b.sfyy=1 THEN ''已阅'' ELSE ''未阅'' END as sfyy , a.dwmc,a.dwnm,to_char(b.rq,''yyyy-mm-dd'') rq,b.nm,b.userid,b.sbdw,b.jsdw,to_char(b.sbsj,''yyyy-mm-dd hh24:mi:ss'') sbsj,
      case when b.rq is null then ''未上报' else ''已上报' end sbzt,a.xh,b.sbdwnm,b.sbdwxw,b.glnm from zb_s_zbxl_dw a,TBZB_BZLXRB b where  a.userid=#{paramMap.USERID}  and a.userid=b.userid(+) and a.wqbz=4 and b.sfsb(+)=1 and rq(+) like to_date(#{paramMap.RQ},''yyyy-mm-dd'')
      and a.dwnm=b.sbdwnm(+)  order by a.xh', null, '0', null, 'test', null, null, '9CB95C8E5E3D4F2C9F7808BB8CFF4CD3');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('3', null, 'findTableInfoByPage', null, null, ' SELECT id,tableName, tableEname FROM s_basetable_config ', null, '0', null, 'gly', null, 'gly', 'A620FCD5E32A4BA7AA01FBB687612289');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('4', '查询待生成的表的字段', 'findBaseColumnInfo', null, null, 'SELECT b.comments AS title,a.COLUMN_NAME AS NAME,a.DATA_TYPE as datatype,a.data_length as maxlength
 from all_tab_columns a
left join user_col_comments b on a.table_name=b.table_name and a.COLUMN_name=b.column_name
where a.table_name=#{paramMap.tablename}
		 AND NOT EXISTS ( select 1 from s_basecolumn_config c where a.COLUMN_NAME=c.columnename
			and tableid in (
					SELECT ID AS tableid
					FROM s_basetable_config
					WHERE tableEname =#{paramMap.tablename}
			)
		)', null, '0', null, 'gly', null, 'lee', '94BDA9AAA4E24E588145CE367D454841');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('5', null, 'findSqlInfoByTableID', null, null, 'select * from s_basecolumn_config  where tableid=#{map.tableid} order by orderNum', null, '0', null, 'gly', null, 'gly', '398CC65132604BCAB98BDDE9523311BC');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('7', null, 'findQuestionResultInfoCount', ' ', null, ' select count(a.id)  from s_question_result a left join s_platform_info b on a.platformId=b.platformid left join s_question c on a.questionId=c.qid', null, '0', null, 'gly', null, 'gly', 'BF6EA5C9C50A49E989A4D727327357D7');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('10', null, 'processQuestionInfo', ' ', null, ' UPDATE
    s_question_result
SET
    handleReason = #{map.handleReason},
    handleTime =#{map.handleTime},
    handleState=#{map.handleState},
    questionState=#{map.questionState},
    updateTime = #{map.updateTime},
    updator = #{map.updator}
WHERE
    id =#{map.id}', null, '0', null, 'gly', null, 'gly', '1428647F8EFD4C15B97312AE6AD8F0F4');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('22', null, 'queryHot', ' ', null, ' select name from s_query_log where type=2 group by name  order by count(name) desc limit 0,5', null, '0', null, 'gly', null, 'gly', '4D2FE2D59A464A988CDD2ABA34C4517C');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('51', '查询明日值班员信息', 'findMrzbList', null, null, 'select rq,zb,zbzw from kjzzzbgx.zhkz_zb_fdzb where (rq like sysdate+1 ) and dwnm=#{paramMap.DWNM}  and dw=#{paramMap.DW} ', null, '0', null, 'test', null, null, 'E86502F1D36A4E2296B3F34C37D3EF6F');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('26', null, 'findAutoCompletePlatFormName', ' ', null, ' select platformName as lastName from s_platform_info a  where platformName like ''%${map.keyword}%''', null, '0', null, 'gly', null, 'gly', 'D75B19E98F1641E1AD620BA679C54265');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('44', '查询每日情况日报信息', 'findMrqkrbList', null, 'RQ desc', 'SELECT  TO_CHAR(rq,''YYYY-MM-DD'') AS RQ,DWMC,NM,JRZBYZW,MRZBYXM,MBLX,rownum as XH,TO_CHAR(SBSJ,''yyyy-mm-dd hh24:mi:ss'') as sbsj,SBDWXW,
CASE WHEN SFSB=''1'' THEN ''已上报' ELSE ''未上报' END AS SFSB,JSDW,JRZBYXM,SBDW,PGJRZBYXM,PGMRZBYXM FROM TBZB_MRQKRB n
where n.DWNM=#{paramMap.SBDWNM} and (n.sfsb=''0''  or n.sfsb=''2'') and n.SCBJ=0 and ( n.DWMC like ''%''||#{paramMap.searchlike}||''%'' or n.JRZBYXM LIKE ''%''||#{paramMap.searchlike}||''%''
or n.MRZBYXM like ''%''||#{paramMap.searchlike}||''%'' or TO_CHAR(n.rq, ''YYYY-MM-DD'') like ''%''||#{paramMap.searchlike}||''%'') ', null, '0', null, 'test', null, null, '0C0FEE37F5F740FE983EDA0E68D00845');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('53', '查询每日情况日报信息数量', 'findMrqkrbListCount', null, null, 'SELECT count(1)  FROM TBZB_MRQKRB n
where n.DWNM=#{paramMap.SBDWNM} and (n.sfsb=''0''  or n.sfsb=''2'' )  and n.SCBJ=0 and ( n.DWMC like ''%''||#{paramMap.searchlike}||''%'' or n.JRZBYXM LIKE ''%''||#{paramMap.searchlike}||''%''
or n.MRZBYXM like ''%''||#{paramMap.searchlike}||''%'' or TO_CHAR(n.rq, ''YYYY-MM-DD'') like ''%''||#{paramMap.searchlike}||''%'' ) ', null, '0', null, 'test', null, null, 'BDC6378BCE084389BC6B122DC038028A');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('43', '查询配置属性信息', 'findConfigList', null, null, 'select zdm, WHXSBS, b.nr as ename, a.xh
  from ZB_S_RES_COLUMN_NEW a
  left join zb_jcsj b
    on a.zdm = b.USERID
 WHERE DWNM = #{paramMap.DWNM}
   and GNBS = ''qkrb''
   and XWM =  #{paramMap.XWM}
union all
select USERID as zdm, ''0'' as WHXSBS, nr as ename, cast(XH as varchar2(4)) xh
  from zb_jcsj
 where lx = ''情况日报''
   and NOT EXISTS (select 1
          from ZB_S_RES_COLUMN_NEW
         WHERE ZB_S_RES_COLUMN_NEW.zdm = zb_jcsj.USERID
           AND DWNM = #{paramMap.DWNM}
           and GNBS = ''qkrb''
           and XWM = #{paramMap.XWM})
order BY xh
', null, '0', null, 'test', null, null, 'A3849E8F1D7145F5B02118D23000588B');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('62', '查询配置模板信息新版', 'findConfigListInfo', null, null, 'SELECT * from S_MODAL_CONFIG where DWNM=#{paramMap.DWNM}  and GNBS=#{paramMap.GNBS} and  xwm=#{paramMap.XWM} order by xh', null, '0', null, 'test', null, null, '9635C5A10472432AAE3FEFA7366F0A61');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('66', '查询每日情况日报信息-编组联训', 'findMrqkrbList_bzlx', null, 'RQ desc', 'SELECT  TO_CHAR(rq,''YYYY-MM-DD'') AS RQ,DWMC,NM,rownum as XH,TO_CHAR(SBSJ,''yyyy-mm-dd hh24:mi:ss'') as sbsj,SBDWXW,
CASE WHEN SFSB=''1'' THEN ''已上报' ELSE ''未上报' END AS SFSB,JSDW,SBDW FROM TBZB_BZLXRB
where USERID=#{paramMap.USERID} and sfsb=''0'' and ( DWMC like ''%''||#{paramMap.searchlike}||''%'' or  TO_CHAR(rq, ''YYYY-MM-DD'') like ''%''||#{paramMap.searchlike}||''%'' ) ', null, '0', null, 'test', null, null, '95C00DE418134A50AB1F0152590819F2');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('45', '查询发送日期和接收单位', 'findSendInfosList', null, 'SBSJ desc', 'select TO_CHAR(FSRQ,''yyyy-mm-dd hh24:mi:ss'') FSRQ,FSDW,HZQK,TO_CHAR(HZSJ,''yyyy-mm-dd hh24:mi:ss'') HZSJ,JSDW from tbzb_ddzbrz_fsqk a
where  eXISTS (SELECT 1 from TBZB_MRQKRB b WHERE a.QKRBNM=b.NM  and b.nm=#{paramMap.NM}) order by FSRQ desc', null, '0', null, 'test', null, null, '17F18EE2C68B44729ED76906D8A107C1');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('60', '查询是否允许修改的属性', 'findModifyColums', null, null, 'SELECT * FROM S_BASECOLUMN_CONFIG ', null, '0', null, 'test', null, null, '545691500FF746C38445AFCDF95A3DD1');
INSERT INTO "FWTX_ZZZB"."S_MANAGER_SQLINFO" VALUES ('67', '查询每日情况日报信息-编组联训数量', 'findMrqkrbList_bzlxCount', null, null, 'SELECT count(1)  FROM TBZB_BZLXRB
where USERID=#{paramMap.USERID} and sfsb=''0'' and ( DWMC like ''%''||#{paramMap.searchlike}||''%'' or  TO_CHAR(rq, ''YYYY-MM-DD'') like ''%''||#{paramMap.searchlike}||''%'' ) ', null, '0', null, 'test', null, null, 'A08E1CBB1DA04607AD54DDD9D794F624');

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
