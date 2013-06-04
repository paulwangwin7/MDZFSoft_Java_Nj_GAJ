<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.manager.pub.bean.*, com.manager.pub.util.*, java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserForm userForm = null;
if(request.getSession().getAttribute(Constants.SESSION_USER_FORM)!=null) {
	userForm = (UserForm)request.getSession().getAttribute(Constants.SESSION_USER_FORM);
}
	com.manager.pub.bean.Page pageRst = null;
	List<UploadForm> uploadFormList = null;
	if(request.getAttribute(Constants.PAGE_INFORMATION)!=null)
	{
		pageRst = (com.manager.pub.bean.Page)request.getAttribute(Constants.PAGE_INFORMATION);
		uploadFormList = (List<UploadForm>)pageRst.getListObject();
	}
String uploadUserName = request.getParameter("uploadUser")==null?"":request.getParameter("uploadUser");
String createUserName = request.getParameter("uploadCreate")==null?"":request.getParameter("uploadCreate");


String fileStatsVal = request.getParameter("fileStats")==null?"":request.getParameter("fileStats");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>统计报表</title>
<jsp:include page="common/tag.jsp" />
<script type="text/javascript" src="<%=basePath %>js/jquery_dialog.js"></script>
<script type="text/javascript" src="<%=basePath %>js/adddate.js"></script>
</head>
<body>

	<!--header=============================================begin-->
<jsp:include page="common/header.jsp" />
<script>var menuIndex = 4;</script>
<jsp:include page="common/menu.jsp" />
	<!--content============================================begin-->
	<div id="container">
		<div class="layout clearfix">
			<div class="white_p10">
					<h4 class="content_hd long_content_hd">统计报表</h4>
					<div class="content_bd">
						<div class="gray_bor_bg">
							<h5 class="gray_blod_word">组合条件搜索</h5>
							<div class="search_form">
<form id="uploadManagerForm" action="<%=basePath %>userAction.do?method=uploadListTable" onsubmit="return uploadManagerFormSubmit()" method="post">
<input type="hidden" name="uploadUserId" id="upload_userId" value="<%=request.getParameter("uploadUserId")==null?"":request.getParameter("uploadUserId") %>" />
<input type="hidden" name="fileCreateUserId" id="upload_editId" value="<%=request.getParameter("fileCreateUserId")==null?"":request.getParameter("fileCreateUserId") %>" />
								<div class="mt_10">
								<label>上传时间:</label>
									<input class="input_168x19" id="beginTime" type="text" name="beginTime" value="<%=request.getParameter("beginTime")==null?"":request.getParameter("beginTime") %>" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" readonly />&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" id="endTime" class="input_168x19" name="endTime" value="<%=request.getParameter("endTime")==null?"":request.getParameter("endTime") %>" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" readonly />
								<input type="submit" class="blue_mod_btn" value="搜 &nbsp;索" />
								</div>
</form>
							</div>
							
						</div>
						<div class=" mt_10">
						<table class="common_table">
						<tr>
						<th width="220">上传文件名</th>
						<th width="70">文件类型</th>
						<th width="80">上传时间</th>
						<th width="60">上传民警</th>
						<th width="60">处警民警</th>
						<th>接警编号</th>
						<th width="80">接警时间</th>
						<th width="80">录制时间</th>
						<th width="80">到达时间<br/>&lt;分钟&gt;</th>
						</tr>
						<%
							if(uploadFormList!=null && uploadFormList.size()>0) {
								for(int i=0; i<uploadFormList.size(); i++)
								{
									UploadForm uploadForm = uploadFormList.get(i);
									String fileType = "图片";
									if(uploadForm.getPlayPath().substring(uploadForm.getPlayPath().length()-3,uploadForm.getPlayPath().length()).equals("mp4"))
									{
										fileType = "视频";
									}
									if(uploadForm.getPlayPath().substring(uploadForm.getPlayPath().length()-3,uploadForm.getPlayPath().length()).equals("wav"))
									{
										fileType = "音频";
									}
						%>
						<tr>
						<td><%=uploadForm.getUploadName() %></td>
						<td><%=fileType %></td>
						<td><%=DateUtils.formatChar14Time(uploadForm.getUploadTime()==null?"":uploadForm.getUploadTime()) %></td>
						<td title="<%=uploadForm.getTreeName() %>"><%=uploadForm.getUserName() %></td>
						<td><%=uploadForm.getEditName() %></td>
						<td><%=uploadForm.getPoliceCode()==null?"":uploadForm.getPoliceCode() %></td>
						<td><%=DateUtils.formatChar14Time(uploadForm.getPoliceTime()==null?"":uploadForm.getPoliceTime()) %></td>
						<td><%=DateUtils.formatChar14Time(uploadForm.getTakeTime()==null?"":uploadForm.getTakeTime()) %></td>
						<td><%=uploadForm.getUseTime()==null?"":uploadForm.getUseTime() %></td>
						</tr>
						<%
								}
							}
						%>
						</table>
<form action="<%=basePath %>userAction.do?method=uploadListTable" method="post" id="hidUploadForm">
<input type="hidden" name="pageCute" id="uploadTable_pageCute" />
<input type="hidden" name="beginTime" value="<%=request.getParameter("beginTime")==null?"":request.getParameter("beginTime") %>" />
<input type="hidden" name="endTime" value="<%=request.getParameter("endTime")==null?"":request.getParameter("endTime") %>" />
</form>
<script>
function showUploadTable(pageCute)
{
	$('#uploadTable_pageCute').val(pageCute);
	$('#hidUploadForm').submit();
}
</script>
							<table align="center"><tr><td><jsp:include page="common/page.jsp?function=showUploadTable"></jsp:include></td></tr></table>
						</div>
						<div class=" mt_10 pb_200">
							
						</div>
					</div>
				</div>
			</div>
	</div>
<jsp:include page="common/footer.jsp" />
</body>
</html>