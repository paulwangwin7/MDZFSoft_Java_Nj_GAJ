/****** ˵��
	��ϵͳ����sqlֱ������
 ******/
 ---------------------------------------------------
-- Export file for user NJMD                     --
-- Created by Administrator on 2013/3/18, 9:42:02 --
---------------------------------------------------

spool createObj.log

prompt
prompt Creating table FRAME_LOG
prompt ========================
prompt
create table FRAME_LOG
(
  LOG_ID      NUMBER(10) not null,
  CREATE_TIME VARCHAR2(14),
  USER_ID     NUMBER(10),
  USER_CODE   VARCHAR2(50),
  TREE_ID     NUMBER(10),
  TREE_NAME   VARCHAR2(200),
  ROLE_ID     NUMBER(10),
  ROLE_NAME   VARCHAR2(200),
  LOG_DESC    VARCHAR2(2000),
  IP_ADD      VARCHAR2(100)
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
comment on table FRAME_LOG
  is '��־��¼��';
comment on column FRAME_LOG.LOG_ID
  is 'ID,����';
comment on column FRAME_LOG.CREATE_TIME
  is '��־��¼ʱ��';
comment on column FRAME_LOG.USER_ID
  is '����¼��id';
comment on column FRAME_LOG.USER_CODE
  is '����¼���˺�';
comment on column FRAME_LOG.TREE_ID
  is '����¼�˲���id';
comment on column FRAME_LOG.TREE_NAME
  is '����¼�˲���';
comment on column FRAME_LOG.ROLE_ID
  is '����¼�˽�ɫid';
comment on column FRAME_LOG.ROLE_NAME
  is '����¼�˽�ɫ';
comment on column FRAME_LOG.LOG_DESC
  is '��־��¼����';
comment on column FRAME_LOG.IP_ADD
  is 'IP';
alter table FRAME_LOG
  add constraint PK_FRAME_LOG primary key (LOG_ID)
  using index 
  tablespace NJMD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FRAME_MENU
prompt =========================
prompt
create table FRAME_MENU
(
  MENU_ID    NUMBER(10) not null,
  MENU_NAME  VARCHAR2(50),
  MENU_SORT  NUMBER(3),
  MENU_STATE CHAR(1) default 'A'
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
comment on table FRAME_MENU
  is '�˵���';
comment on column FRAME_MENU.MENU_ID
  is 'ID,����';
comment on column FRAME_MENU.MENU_NAME
  is '�˵�������';
comment on column FRAME_MENU.MENU_SORT
  is '��ʾ���ȼ�';
comment on column FRAME_MENU.MENU_STATE
  is '״̬��A-��Ч��U-��Ч';
alter table FRAME_MENU
  add constraint PK_FRAME_MENU primary key (MENU_ID)
  using index 
  tablespace NJMD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FRAME_MENU
  add constraint CKC_MENU_STATE_FRAME_ME
  check (MENU_STATE is null or (MENU_STATE in ('A','U')));

prompt
prompt Creating table FRAME_NOTICE
prompt ===========================
prompt
create table FRAME_NOTICE
(
  NOTICE_ID      NUMBER(10) not null,
  NOTICE_TITLE   VARCHAR2(60),
  NOTICE_CONTENT VARCHAR2(1000),
  NOTICE_TYPE    CHAR(1),
  CREATE_TIME    VARCHAR2(14),
  NOTICE_BEGIN   VARCHAR2(12),
  NOTICE_END     VARCHAR2(12),
  USER_ID        NUMBER(10),
  TREE_ID_LIST   VARCHAR2(100)
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
comment on table FRAME_NOTICE
  is '�����';
comment on column FRAME_NOTICE.NOTICE_ID
  is 'ID,����';
comment on column FRAME_NOTICE.NOTICE_TITLE
  is '�������';
comment on column FRAME_NOTICE.NOTICE_CONTENT
  is '��������';
comment on column FRAME_NOTICE.NOTICE_TYPE
  is '�������ͣ�1-��ҳ���棻2-��Ϣ����;';
comment on column FRAME_NOTICE.CREATE_TIME
  is '���淢��ʱ��';
comment on column FRAME_NOTICE.NOTICE_BEGIN
  is '���濪ʼʱ��';
comment on column FRAME_NOTICE.NOTICE_END
  is '�������ʱ��';
comment on column FRAME_NOTICE.USER_ID
  is '����������id';
comment on column FRAME_NOTICE.TREE_ID_LIST
  is '�����б�';
alter table FRAME_NOTICE
  add constraint PK_FRAME_NOTICE primary key (NOTICE_ID)
  using index 
  tablespace NJMD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FRAME_REMARK
prompt ===========================
prompt
create table FRAME_REMARK
(
  REMARK_ID      NUMBER(10),
  REMARK_TABLE   VARCHAR2(100),
  REMARK_CONTENT VARCHAR2(100),
  CREATE_TIME    VARCHAR2(14)
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

prompt
prompt Creating table FRAME_ROLE
prompt =========================
prompt
create table FRAME_ROLE
(
  ROLE_ID     NUMBER(10) not null,
  ROLE_NAME   VARCHAR2(50),
  ROLE_DESC   VARCHAR2(200),
  ROLE_STATE  CHAR(1) default 'A',
  CREATE_USER NUMBER(10),
  CREATE_TIME VARCHAR2(14),
  TREE_ID     NUMBER(10),
  URL_ID_LIST VARCHAR2(200)
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
comment on table FRAME_ROLE
  is '�û���ɫ';
comment on column FRAME_ROLE.ROLE_ID
  is 'ID,����';
comment on column FRAME_ROLE.ROLE_NAME
  is '��ɫ����';
comment on column FRAME_ROLE.ROLE_DESC
  is '��ɫ����';
comment on column FRAME_ROLE.ROLE_STATE
  is '״̬��A-��Ч��U-��Ч';
comment on column FRAME_ROLE.CREATE_USER
  is '������userid';
comment on column FRAME_ROLE.CREATE_TIME
  is '����ʱ��';
comment on column FRAME_ROLE.TREE_ID
  is '��������';
comment on column FRAME_ROLE.URL_ID_LIST
  is '����url�б��ʶ ���磺1,2,3,...,��';
alter table FRAME_ROLE
  add constraint PK_FRAME_ROLE primary key (ROLE_ID)
  using index 
  tablespace NJMD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FRAME_ROLE
  add constraint CKC_ROLE_STATE_FRAME_RO
  check (ROLE_STATE is null or (ROLE_STATE in ('A','U')));

prompt
prompt Creating table FRAME_SERVERINFO
prompt ===============================
prompt
create table FRAME_SERVERINFO
(
  SERVERINFO_ID  NUMBER(10) not null,
  RATIO_CPU      NUMBER(3),
  RATIO_MEMORY   NUMBER(3),
  USE_MEMORY     VARCHAR2(20),
  RATIO_HARDDISK NUMBER(3),
  USE_HARDDISK   VARCHAR2(20),
  LETTER         CHAR(1),
  CREATE_TIME    VARCHAR2(14),
  SAVE_IP        VARCHAR2(15)
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
comment on table FRAME_SERVERINFO
  is '������״��';
comment on column FRAME_SERVERINFO.SERVERINFO_ID
  is 'ID,����';
comment on column FRAME_SERVERINFO.RATIO_CPU
  is 'CPUռ����';
comment on column FRAME_SERVERINFO.RATIO_MEMORY
  is '�ڴ�ռ����';
comment on column FRAME_SERVERINFO.USE_MEMORY
  is '�ڴ�ʹ�ã���λ��kb��';
comment on column FRAME_SERVERINFO.RATIO_HARDDISK
  is 'Ӳ��ռ����';
comment on column FRAME_SERVERINFO.USE_HARDDISK
  is 'Ӳ��ʹ�ã���λ��gb��';
comment on column FRAME_SERVERINFO.LETTER
  is 'Ӳ���̷�';
comment on column FRAME_SERVERINFO.CREATE_TIME
  is '��¼ʱ��';
comment on column FRAME_SERVERINFO.SAVE_IP
  is '������IP';
alter table FRAME_SERVERINFO
  add constraint PK_FRAME_SERVERINFO primary key (SERVERINFO_ID)
  using index 
  tablespace NJMD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FRAME_TREE
prompt =========================
prompt
create table FRAME_TREE
(
  TREE_ID        NUMBER(10) not null,
  TREE_NAME      VARCHAR2(50),
  TREE_DESC      VARCHAR2(200),
  TREE_STATE     CHAR(1) default 'A',
  CREATE_USER    NUMBER(10),
  CREATE_TIME    VARCHAR2(14),
  PARENT_TREE_ID NUMBER(10),
  ORDER_BY       NUMBER(3)
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
comment on table FRAME_TREE
  is '���ż���滮��';
comment on column FRAME_TREE.TREE_ID
  is 'ID,����';
comment on column FRAME_TREE.TREE_NAME
  is '��������';
comment on column FRAME_TREE.TREE_DESC
  is '��������';
comment on column FRAME_TREE.TREE_STATE
  is '״̬��A-��Ч��U-��Ч';
comment on column FRAME_TREE.CREATE_USER
  is '������userid';
comment on column FRAME_TREE.CREATE_TIME
  is '����ʱ��';
comment on column FRAME_TREE.PARENT_TREE_ID
  is '�������� ��һ������ʱΪ0��';
comment on column FRAME_TREE.ORDER_BY
  is '����';
alter table FRAME_TREE
  add constraint PK_TREE_ID primary key (TREE_ID)
  using index 
  tablespace NJMD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

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
  FLV_PATH        VARCHAR2(200)
  POLICE_CODE	  VARCHAR2(30),
  POLICE_DESC	  VARCHAR2(4000),
  TAKE_TIME		  VARCHAR2(14),
  POLICE_TIME	  VARCHAR2(14),
  USE_TIME		  NUMBER(10)
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

prompt
prompt Creating table FRAME_UPLOAD_111
prompt ===============================
prompt
create table FRAME_UPLOAD_111
(
  UPLOAD_ID       NUMBER(10) not null,
  USER_ID         NUMBER(10),
  EDIT_ID         NUMBER(10),
  UPLOAD_NAME     VARCHAR2(100),
  PLAY_PATH       VARCHAR2(200),
  FILE_CREATETIME VARCHAR2(14),
  SHOW_PATH       VARCHAR2(200),
  UPLOAD_TIME     VARCHAR2(14),
  FILE_STATE      CHAR(1) default 'A',
  TREE2_ID        NUMBER(10),
  TREE1_ID        NUMBER(10),
  TREE_NAME       VARCHAR2(100),
  FILE_STATS      CHAR(1) default 0,
  FILE_REMARK     VARCHAR2(2000),
  IP_ADDR         VARCHAR2(15),
  REAL_PATH       VARCHAR2(50),
  FLV_PATH        VARCHAR2(200)
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
comment on table FRAME_UPLOAD_111
  is '�ϴ��ļ���';
comment on column FRAME_UPLOAD_111.UPLOAD_ID
  is 'ID,����';
comment on column FRAME_UPLOAD_111.USER_ID
  is '�ϴ���ID';
comment on column FRAME_UPLOAD_111.EDIT_ID
  is '�ɼ���ID';
comment on column FRAME_UPLOAD_111.UPLOAD_NAME
  is '�ϴ��ļ���';
comment on column FRAME_UPLOAD_111.PLAY_PATH
  is '�ļ����ŵ�ַ';
comment on column FRAME_UPLOAD_111.FILE_CREATETIME
  is '�ļ�����ʱ��';
comment on column FRAME_UPLOAD_111.SHOW_PATH
  is 'Ԥ����ַ';
comment on column FRAME_UPLOAD_111.UPLOAD_TIME
  is '�ļ��ϴ�ʱ��';
comment on column FRAME_UPLOAD_111.FILE_STATE
  is 'A-��Ч��U-��Ч��F-���ڣ� C-δ������ P-�������';
comment on column FRAME_UPLOAD_111.TREE2_ID
  is '�ϴ��˲���id';
comment on column FRAME_UPLOAD_111.TREE1_ID
  is '�ϴ����ϼ�����id';
comment on column FRAME_UPLOAD_111.TREE_NAME
  is '�ϴ��˲�������';
comment on column FRAME_UPLOAD_111.FILE_STATS
  is '�ļ��ϴ���Ҫ�� 0-��ͨ��1-��Ҫ';
comment on column FRAME_UPLOAD_111.FILE_REMARK
  is '�ļ���ע˵��';
comment on column FRAME_UPLOAD_111.IP_ADDR
  is '�ϴ���IP��ַ';
comment on column FRAME_UPLOAD_111.REAL_PATH
  is '����ǰ׺';
comment on column FRAME_UPLOAD_111.FLV_PATH
  is 'flv�ļ����ŵ�ַ';
alter table FRAME_UPLOAD_111
  add constraint PK_FRAME_UPLOAD primary key (UPLOAD_ID)
  using index 
  tablespace NJMD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FRAME_UPLOAD_111
  add constraint CKC_FILE_STATE_FRAME_UP
  check (FILE_STATE is null or ( FILE_STATE in ('A','U','F','C','P') ));

prompt
prompt Creating table FRAME_URL
prompt ========================
prompt
create table FRAME_URL
(
  URL_ID         NUMBER(10) not null,
  URL_VALUE      VARCHAR2(200),
  URL_NAME       VARCHAR2(50),
  URL_DESC       VARCHAR2(200),
  URL_STATE      CHAR(1) default 'A',
  PARENT_MENU_ID NUMBER(10),
  URL_SORT       NUMBER(3),
  URL_TAB        VARCHAR2(15)
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
comment on table FRAME_URL
  is '���ܵ�ַ';
comment on column FRAME_URL.URL_ID
  is 'ID,����';
comment on column FRAME_URL.URL_VALUE
  is 'URL��ַ';
comment on column FRAME_URL.URL_NAME
  is 'URL����';
comment on column FRAME_URL.URL_STATE
  is '״̬��A-��Ч��U-��Ч';
comment on column FRAME_URL.PARENT_MENU_ID
  is '�����˵�';
comment on column FRAME_URL.URL_SORT
  is 'Tab��ǩ��';
alter table FRAME_URL
  add constraint PK_FRAME_URL primary key (URL_ID)
  using index 
  tablespace NJMD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FRAME_URL
  add constraint CKC_URL_STATE_FRAME_UR
  check (URL_STATE is null or (URL_STATE in ('A','U')));

prompt
prompt Creating table FRAME_USER
prompt =========================
prompt
create table FRAME_USER
(
  USER_ID     NUMBER(10) not null,
  LOGIN_NAME  VARCHAR2(20),
  LOGIN_PSWD  VARCHAR2(20),
  USER_NAME   VARCHAR2(20),
  USER_CODE   VARCHAR2(30),
  SEX         CHAR(1),
  USER_IDCARD VARCHAR2(20),
  CARD_TYPEID NUMBER(10),
  CARD_CODE   VARCHAR2(50),
  TREE_ID     NUMBER(10),
  ROLE_ID     NUMBER(10),
  CREATE_TIME VARCHAR2(14),
  USER_STATE  CHAR(1) default 'A'
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
comment on table FRAME_USER
  is '�û���';
comment on column FRAME_USER.USER_ID
  is 'ID,����';
comment on column FRAME_USER.LOGIN_NAME
  is '��¼�˺�';
comment on column FRAME_USER.LOGIN_PSWD
  is '��¼����';
comment on column FRAME_USER.USER_NAME
  is '��ʵ����';
comment on column FRAME_USER.USER_CODE
  is '����';
comment on column FRAME_USER.SEX
  is '�Ա�';
comment on column FRAME_USER.USER_IDCARD
  is '���֤';
comment on column FRAME_USER.CARD_TYPEID
  is '����֤������';
comment on column FRAME_USER.CARD_CODE
  is '����֤����';
comment on column FRAME_USER.TREE_ID
  is '��������';
comment on column FRAME_USER.ROLE_ID
  is '������ɫ';
comment on column FRAME_USER.CREATE_TIME
  is 'ע��ʱ��';
comment on column FRAME_USER.USER_STATE
  is '״̬��A-��Ч��U-��Ч';
alter table FRAME_USER
  add constraint USER_ID primary key (USER_ID)
  using index 
  tablespace NJMD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQ_LOG_ID
prompt ============================
prompt
create sequence SEQ_LOG_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MENU_ID
prompt =============================
prompt
create sequence SEQ_MENU_ID
minvalue 1
maxvalue 9999999999
start with 10
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_NOTICE_ID
prompt ===============================
prompt
create sequence SEQ_NOTICE_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_REMARK_ID
prompt ===============================
prompt
create sequence SEQ_REMARK_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLE_ID
prompt =============================
prompt
create sequence SEQ_ROLE_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SERVERINFO_ID
prompt ===================================
prompt
create sequence SEQ_SERVERINFO_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TREE_ID
prompt =============================
prompt
create sequence SEQ_TREE_ID
minvalue 1
maxvalue 1
start with 261
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_UPLOAD_ID
prompt ===============================
prompt
create sequence SEQ_UPLOAD_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_URL_ID
prompt ============================
prompt
create sequence SEQ_URL_ID
minvalue 1
maxvalue 999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USER_ID
prompt =============================
prompt
create sequence SEQ_USER_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;


spool off




commit;





prompt PL/SQL Developer import file
prompt Created on 2013��3��8�� by Administrator
set feedback off
set define off
prompt Loading FRAME_MENU...
insert into FRAME_MENU (MENU_ID, MENU_NAME, MENU_SORT, MENU_STATE)
values (1, 'Ȩ�޹���', 1, 'A');
insert into FRAME_MENU (MENU_ID, MENU_NAME, MENU_SORT, MENU_STATE)
values (2, '�û�����', 2, 'A');
insert into FRAME_MENU (MENU_ID, MENU_NAME, MENU_SORT, MENU_STATE)
values (3, '�ļ�����', 3, 'A');
insert into FRAME_MENU (MENU_ID, MENU_NAME, MENU_SORT, MENU_STATE)
values (4, '��־��ѯ', 4, 'A');
commit;
prompt Loading FRAME_URL...
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (1, 'userAction.do?method=treeManager', '���Ź���', '���Ź���', 'A', 1, 1, 'tab_bmgl');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (3, 'userAction.do?method=userManagerToAdd', '�û�ע��', '�û�ע��', 'A', 2, 1, 'tab_yhzc');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (4, 'userAction.do?method=userManager', '�û���ѯ', '�û���ѯ', 'A', 2, 2, 'tab_yhcx');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (5, 'jsp/user/fileManagerAdd.jsp', '�ļ��ϴ�', '�ļ��ϴ�', 'A', 3, 1, 'tab_wjsc');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (6, 'userAction.do?method=uploadLog', '�ϴ������ѯ', '�ϴ������ѯ', 'A', 4, 1, 'tab_scrz');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (7, 'userAction.do?method=userActionLogManager', '�û�������ѯ', '�û�����', 'A', 4, 2, 'tab_czrz');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (8, 'userAction.do?method=uploadFileShow', '�ļ��鿴', '�ļ��鿴', 'A', 3, 2, 'tab_czrz');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (9, 'sysAction.do?method=noticeManager', '�������', '�������', 'A', 1, 3, 'tab_ggfb');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (10, 'userAction.do?method=expiredFileList', '�ļ�ɾ��', '�ļ�ɾ��', 'A', 3, 3, 'tab_wjsc');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (2, 'userAction.do?method=roleManager', '��ɫ����', '��ɫ����', 'A', 2, 3, 'tab_jsgl');
insert into frame_url values('11','userAction.do?method=uploadListTable','����ͳ��','����ͳ��','A','4','3','tab_bbtj');
commit;
prompt 10 records loaded
prompt Loading FRAME_USER...
insert into FRAME_USER (USER_ID, LOGIN_NAME, LOGIN_PSWD, USER_NAME, USER_CODE, SEX, USER_IDCARD, CARD_TYPEID, CARD_CODE, TREE_ID, ROLE_ID, CREATE_TIME, USER_STATE)
values (0, 'admin', '121212', 'ϵͳ����Ա', '000000', 'M', null, 0, null, 0, 0, '20120116144925', 'A');
commit;
set feedback on
set define on
prompt Done.
