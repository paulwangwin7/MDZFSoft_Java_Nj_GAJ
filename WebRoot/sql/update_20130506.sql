prompt PL/SQL Developer import file
prompt Created on 2013��5��6�� by Administrator
set feedback off
set define off
prompt Loading FRAME_URL...
delete from frame_url;
commit;
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (12, 'downfile', '�ļ�����', '�ļ�����', 'A', 3, 3, 'tab_down');
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
insert into FRAME_URL (URL_ID, URL_VALUE, URL_NAME, URL_DESC, URL_STATE, PARENT_MENU_ID, URL_SORT, URL_TAB)
values (11, 'userAction.do?method=uploadListTable', '����ͳ��', '����ͳ��', 'U', 4, 3, 'tab_bbtj');
commit;
prompt 12 records loaded
set feedback on
set define on
prompt Done.
