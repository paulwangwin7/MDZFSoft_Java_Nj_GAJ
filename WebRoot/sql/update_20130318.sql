/****** 说明
	如系统于2013年3月18日就已搭建，那么执行这个sql
 ******/
-----------------------------------------------------
-- Export file for user NJMD                     --
-- Created by Administrator on 2013/3/10, 15:46:34 --
-----------------------------------------------------
ALTER TABLE frame_upload ADD USE_TIME NUMBER(10);
commit;
insert into frame_url values('11','userAction.do?method=uploadListTable','报表统计','报表统计','A','4','3','tab_bbtj');
commit;