/****** ˵��
	��ϵͳ��2013��3��11�վ��Ѵ����ôִ�����sql��frame_upload���ݽ�����գ������ñ���
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
  is 'ID,����';
comment on column FRAME_UPLOAD.USER_ID
  is '�ϴ���ID';
comment on column FRAME_UPLOAD.EDIT_ID
  is '�ɼ���ID';
comment on column FRAME_UPLOAD.UPLOAD_NAME
  is '�ϴ��ļ���';
comment on column FRAME_UPLOAD.PLAY_PATH
  is '�ļ����ŵ�ַ';
comment on column FRAME_UPLOAD.FILE_CREATETIME
  is '�ļ�����ʱ��';
comment on column FRAME_UPLOAD.SHOW_PATH
  is 'Ԥ����ַ';
comment on column FRAME_UPLOAD.UPLOAD_TIME
  is '�ļ��ϴ�ʱ��';
comment on column FRAME_UPLOAD.FILE_STATE
  is 'A-��Ч��U-��Ч��F-���ڣ� C-δ������ P-�������';
comment on column FRAME_UPLOAD.TREE2_ID
  is '�ϴ��˲���id';
comment on column FRAME_UPLOAD.TREE1_ID
  is '�ϴ����ϼ�����id';
comment on column FRAME_UPLOAD.TREE_NAME
  is '�ϴ��˲�������';
comment on column FRAME_UPLOAD.FILE_STATS
  is '�ļ��ϴ���Ҫ�� 0-��ͨ��1-��Ҫ';
comment on column FRAME_UPLOAD.FILE_REMARK
  is '�ļ���ע˵��';
comment on column FRAME_UPLOAD.IP_ADDR
  is '�ϴ���IP��ַ';
comment on column FRAME_UPLOAD.REAL_PATH
  is '����ǰ׺';
comment on column FRAME_UPLOAD.FLV_PATH
  is 'flv�ļ����ŵ�ַ';
comment on column FRAME_UPLOAD.POLICE_CODE
  is '�Ӿ����';
comment on column FRAME_UPLOAD.POLICE_DESC
  is '�Ӿ�����';
comment on column FRAME_UPLOAD.TAKE_TIME
  is '¼��ʱ��';
comment on column FRAME_UPLOAD.POLICE_TIME
  is '����ʱ��';


spool off
