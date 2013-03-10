---------------------------------------------------
-- Export file for user NJMD                     --
-- Created by Administrator on 2013/3/8, 9:42:02 --
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
  is '日志记录表';
comment on column FRAME_LOG.LOG_ID
  is 'ID,主键';
comment on column FRAME_LOG.CREATE_TIME
  is '日志记录时间';
comment on column FRAME_LOG.USER_ID
  is '被记录人id';
comment on column FRAME_LOG.USER_CODE
  is '被记录人账号';
comment on column FRAME_LOG.TREE_ID
  is '被记录人部门id';
comment on column FRAME_LOG.TREE_NAME
  is '被记录人部门';
comment on column FRAME_LOG.ROLE_ID
  is '被记录人角色id';
comment on column FRAME_LOG.ROLE_NAME
  is '被记录人角色';
comment on column FRAME_LOG.LOG_DESC
  is '日志记录内容';
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
  is '菜单项';
comment on column FRAME_MENU.MENU_ID
  is 'ID,主键';
comment on column FRAME_MENU.MENU_NAME
  is '菜单项名称';
comment on column FRAME_MENU.MENU_SORT
  is '显示优先级';
comment on column FRAME_MENU.MENU_STATE
  is '状态：A-有效；U-无效';
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
  is '公告表';
comment on column FRAME_NOTICE.NOTICE_ID
  is 'ID,主键';
comment on column FRAME_NOTICE.NOTICE_TITLE
  is '公告标题';
comment on column FRAME_NOTICE.NOTICE_CONTENT
  is '公告内容';
comment on column FRAME_NOTICE.NOTICE_TYPE
  is '公告类型：1-首页公告；2-消息公告;';
comment on column FRAME_NOTICE.CREATE_TIME
  is '公告发布时间';
comment on column FRAME_NOTICE.NOTICE_BEGIN
  is '公告开始时间';
comment on column FRAME_NOTICE.NOTICE_END
  is '公告结束时间';
comment on column FRAME_NOTICE.USER_ID
  is '公共发布人id';
comment on column FRAME_NOTICE.TREE_ID_LIST
  is '部门列表';
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
  is '用户角色';
comment on column FRAME_ROLE.ROLE_ID
  is 'ID,主键';
comment on column FRAME_ROLE.ROLE_NAME
  is '角色名称';
comment on column FRAME_ROLE.ROLE_DESC
  is '角色描述';
comment on column FRAME_ROLE.ROLE_STATE
  is '状态：A-有效；U-无效';
comment on column FRAME_ROLE.CREATE_USER
  is '创建人userid';
comment on column FRAME_ROLE.CREATE_TIME
  is '创建时间';
comment on column FRAME_ROLE.TREE_ID
  is '所属部门';
comment on column FRAME_ROLE.URL_ID_LIST
  is '功能url列表标识 （如：1,2,3,...,）';
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
  is '服务器状况';
comment on column FRAME_SERVERINFO.SERVERINFO_ID
  is 'ID,主键';
comment on column FRAME_SERVERINFO.RATIO_CPU
  is 'CPU占用率';
comment on column FRAME_SERVERINFO.RATIO_MEMORY
  is '内存占用率';
comment on column FRAME_SERVERINFO.USE_MEMORY
  is '内存使用（单位：kb）';
comment on column FRAME_SERVERINFO.RATIO_HARDDISK
  is '硬盘占用率';
comment on column FRAME_SERVERINFO.USE_HARDDISK
  is '硬盘使用（单位：gb）';
comment on column FRAME_SERVERINFO.LETTER
  is '硬盘盘符';
comment on column FRAME_SERVERINFO.CREATE_TIME
  is '记录时间';
comment on column FRAME_SERVERINFO.SAVE_IP
  is '服务器IP';
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
  is '部门级别规划表';
comment on column FRAME_TREE.TREE_ID
  is 'ID,主键';
comment on column FRAME_TREE.TREE_NAME
  is '部门名称';
comment on column FRAME_TREE.TREE_DESC
  is '部门描述';
comment on column FRAME_TREE.TREE_STATE
  is '状态：A-有效；U-无效';
comment on column FRAME_TREE.CREATE_USER
  is '创建人userid';
comment on column FRAME_TREE.CREATE_TIME
  is '创建时间';
comment on column FRAME_TREE.PARENT_TREE_ID
  is '所属部门 （一级部门时为0）';
comment on column FRAME_TREE.ORDER_BY
  is '排序';
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
  is '上传文件表';
comment on column FRAME_UPLOAD_111.UPLOAD_ID
  is 'ID,主键';
comment on column FRAME_UPLOAD_111.USER_ID
  is '上传人ID';
comment on column FRAME_UPLOAD_111.EDIT_ID
  is '采集人ID';
comment on column FRAME_UPLOAD_111.UPLOAD_NAME
  is '上传文件名';
comment on column FRAME_UPLOAD_111.PLAY_PATH
  is '文件播放地址';
comment on column FRAME_UPLOAD_111.FILE_CREATETIME
  is '文件创建时间';
comment on column FRAME_UPLOAD_111.SHOW_PATH
  is '预览地址';
comment on column FRAME_UPLOAD_111.UPLOAD_TIME
  is '文件上传时间';
comment on column FRAME_UPLOAD_111.FILE_STATE
  is 'A-有效；U-无效；F-过期； C-未剪辑； P-剪辑完成';
comment on column FRAME_UPLOAD_111.TREE2_ID
  is '上传人部门id';
comment on column FRAME_UPLOAD_111.TREE1_ID
  is '上传人上级部门id';
comment on column FRAME_UPLOAD_111.TREE_NAME
  is '上传人部门名称';
comment on column FRAME_UPLOAD_111.FILE_STATS
  is '文件上传重要性 0-普通；1-重要';
comment on column FRAME_UPLOAD_111.FILE_REMARK
  is '文件备注说明';
comment on column FRAME_UPLOAD_111.IP_ADDR
  is '上传人IP地址';
comment on column FRAME_UPLOAD_111.REAL_PATH
  is '播放前缀';
comment on column FRAME_UPLOAD_111.FLV_PATH
  is 'flv文件播放地址';
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
  is '功能地址';
comment on column FRAME_URL.URL_ID
  is 'ID,主键';
comment on column FRAME_URL.URL_VALUE
  is 'URL地址';
comment on column FRAME_URL.URL_NAME
  is 'URL名称';
comment on column FRAME_URL.URL_STATE
  is '状态：A-有效；U-无效';
comment on column FRAME_URL.PARENT_MENU_ID
  is '所属菜单';
comment on column FRAME_URL.URL_SORT
  is 'Tab标签名';
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
  is '用户表';
comment on column FRAME_USER.USER_ID
  is 'ID,主键';
comment on column FRAME_USER.LOGIN_NAME
  is '登录账号';
comment on column FRAME_USER.LOGIN_PSWD
  is '登录密码';
comment on column FRAME_USER.USER_NAME
  is '真实姓名';
comment on column FRAME_USER.USER_CODE
  is '工号';
comment on column FRAME_USER.SEX
  is '性别';
comment on column FRAME_USER.USER_IDCARD
  is '身份证';
comment on column FRAME_USER.CARD_TYPEID
  is '其他证件类型';
comment on column FRAME_USER.CARD_CODE
  is '其他证件号';
comment on column FRAME_USER.TREE_ID
  is '所属部门';
comment on column FRAME_USER.ROLE_ID
  is '所属角色';
comment on column FRAME_USER.CREATE_TIME
  is '注册时间';
comment on column FRAME_USER.USER_STATE
  is '状态：A-有效；U-无效';
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
prompt Creating sequence SEQ_CHAT_LOG
prompt ==============================
prompt
create sequence SEQ_CHAT_LOG
minvalue 1
maxvalue 99999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_FIRENDS
prompt =============================
prompt
create sequence SEQ_FIRENDS
minvalue 1
maxvalue 99999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_LOG_ID
prompt ============================
prompt
create sequence SEQ_LOG_ID
minvalue 1
maxvalue 9999999999
start with 1983
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MENU_ID
prompt =============================
prompt
create sequence SEQ_MENU_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_NOTICE_ID
prompt ===============================
prompt
create sequence SEQ_NOTICE_ID
minvalue 1
maxvalue 9999999999
start with 202
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
start with 81
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SERVERINFO_ID
prompt ===================================
prompt
create sequence SEQ_SERVERINFO_ID
minvalue 1
maxvalue 9999999999
start with 1561
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TREE_ID
prompt =============================
prompt
create sequence SEQ_TREE_ID
minvalue 1
maxvalue 9999999999
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
start with 54681
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
start with 302
increment by 1
cache 20;


spool off
