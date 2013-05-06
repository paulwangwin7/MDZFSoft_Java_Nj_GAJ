prompt PL/SQL Developer import file
prompt Created on 2013年5月6日 by Administrator
set feedback off
set define off
prompt Loading FRAME_URL...
delete from frame_url;
commit;
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (12, 'downfile', '文件下载', '文件下载', 'A', 3, 3, 'tab_down');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (1, 'userAction.do?method=treeManager', '部门管理', '部门管理', 'A', 1, 1, 'tab_bmgl');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (3, 'userAction.do?method=userManagerToAdd', '用户注册', '用户注册', 'A', 2, 1, 'tab_yhzc');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (4, 'userAction.do?method=userManager', '用户查询', '用户查询', 'A', 2, 2, 'tab_yhcx');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (5, 'jsp/user/fileManagerAdd.jsp', '文件上传', '文件上传', 'A', 3, 1, 'tab_wjsc');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (6, 'userAction.do?method=uploadLog', '上传报表查询', '上传报表查询', 'A', 4, 1, 'tab_scrz');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (7, 'userAction.do?method=userActionLogManager', '用户操作查询', '用户操作', 'A', 4, 2, 'tab_czrz');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (8, 'userAction.do?method=uploadFileShow', '文件查看', '文件查看', 'A', 3, 2, 'tab_czrz');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (9, 'sysAction.do?method=noticeManager', '公告管理', '公告管理', 'A', 1, 3, 'tab_ggfb');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (10, 'userAction.do?method=expiredFileList', '文件删除', '文件删除', 'A', 3, 3, 'tab_wjsc');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (2, 'userAction.do?method=roleManager', '角色管理', '角色管理', 'A', 2, 3, 'tab_jsgl');
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (11, 'userAction.do?method=uploadListTable', '报表统计', '报表统计', 'U', 4, 3, 'tab_bbtj');
commit;
prompt 12 records loaded
set feedback on
set define on
prompt Done.
