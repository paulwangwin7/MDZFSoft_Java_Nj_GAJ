/****** 说明
	如系统于2013年3月11日就已搭建，那么执行这个sql后，frame_upload数据将被清空，请做好备份
 ******/
-----------------------------------------------------
-- Export file for user NJMD                     --
-- Created by Administrator on 2013/3/10, 15:46:34 --
-----------------------------------------------------
drop table FRAME_UPLOAD;


spool createObj111.log

prompt
prompt Creating table FRAME_UPLOAD
prompt ===========================
prompt
create table FRAME_UPLOAD
(
  UPLOAD_ID       NUMBER(10) not null,
  USER_ID         NUMBER(10),
  EDIT_ID         NUMBER(10),
  UPLOAD_NAME     VARCHAR2(100),
  PLAY_PATH       VARCHAR2(200),
  FILE_CREATETIME VARCHAR2(14),
  SHOW_PATH       VARCHAR2(200),
  UPLOAD_TIME     VARCHAR2(14),
  FILE_STATE      CHAR(1),
  TREE2_ID        NUMBER(10),
  TREE1_ID        NUMBER(10),
  TREE_NAME       VARCHAR2(100),
  FILE_STATS      CHAR(1),
  FILE_REMARK     VARCHAR2(2000),
  IP_ADDR         VARCHAR2(15),
  REAL_PATH       VARCHAR2(50),
  FLV_PATH        VARCHAR2(200),
  POLICE_CODE     VARCHAR2(30),
  POLICE_DESC     VARCHAR2(4000),
  TAKE_TIME       VARCHAR2(14),
  POLICE_TIME     VARCHAR2(14)
)
tablespace NJMD
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column FRAME_UPLOAD.UPLOAD_ID
  is 'ID,主键';
comment on column FRAME_UPLOAD.USER_ID
  is '上传人ID';
comment on column FRAME_UPLOAD.EDIT_ID
  is '采集人ID';
comment on column FRAME_UPLOAD.UPLOAD_NAME
  is '上传文件名';
comment on column FRAME_UPLOAD.PLAY_PATH
  is '文件播放地址';
comment on column FRAME_UPLOAD.FILE_CREATETIME
  is '文件创建时间';
comment on column FRAME_UPLOAD.SHOW_PATH
  is '预览地址';
comment on column FRAME_UPLOAD.UPLOAD_TIME
  is '文件上传时间';
comment on column FRAME_UPLOAD.FILE_STATE
  is 'A-有效；U-无效；F-过期； C-未剪辑； P-剪辑完成';
comment on column FRAME_UPLOAD.TREE2_ID
  is '上传人部门id';
comment on column FRAME_UPLOAD.TREE1_ID
  is '上传人上级部门id';
comment on column FRAME_UPLOAD.TREE_NAME
  is '上传人部门名称';
comment on column FRAME_UPLOAD.FILE_STATS
  is '文件上传重要性 0-普通；1-重要';
comment on column FRAME_UPLOAD.FILE_REMARK
  is '文件备注说明';
comment on column FRAME_UPLOAD.IP_ADDR
  is '上传人IP地址';
comment on column FRAME_UPLOAD.REAL_PATH
  is '播放前缀';
comment on column FRAME_UPLOAD.FLV_PATH
  is 'flv文件播放地址';
comment on column FRAME_UPLOAD.POLICE_CODE
  is '接警编号';
comment on column FRAME_UPLOAD.POLICE_DESC
  is '接警描述';
comment on column FRAME_UPLOAD.TAKE_TIME
  is '录制时间';
comment on column FRAME_UPLOAD.POLICE_TIME
  is '出警时间';


spool off
