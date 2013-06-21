<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.manager.pub.bean.*, com.manager.pub.util.*, java.util.*" %>
<%!
public boolean canDown(Object roleFormSession) {
	boolean can = false;
	RoleForm roleForm = null;
	if(roleFormSession!=null) {
		try {
			roleForm = (RoleForm)roleFormSession;
			String[] urls = roleForm.getUrlIdList().split(",");
			for(String url: urls) {
				if(url.equals("12")){//下载权限
					can = true;
				}
			}
		} catch(Exception ex) {
			can = false;
		}
	}
	return can;
}
%>
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
<title>----</title>
<jsp:include page="common/tag.jsp" />
<script type="text/javascript" src="<%=basePath %>js/jquery_dialog.js"></script>
<script type="text/javascript" src="<%=basePath %>pagejs/uploadManager.js"></script>
<script type="text/javascript" src="<%=basePath %>js/adddate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#dialog").click(function(){
	$.weeboxs.open('.boxcontent', {title:'统计表报',contentType:'selector'});
});})



</script>
</head>

<body>

	<!--header=============================================begin-->
<jsp:include page="common/header.jsp" />
	<!--content============================================begin-->
	<div id="container">
		<div class="layout clearfix">
			<div class="white_p10">
					<h4 class="content_hd long_content_hd">文件查看</h4>
					<div class="content_bd">
						<div class="gray_bor_bg">
							<h5 class="gray_blod_word">组合条件搜索</h5>
						</div>
						<div class=" mt_10">
							<ul class="upload_list">
							<%
							if(uploadFormList!=null && uploadFormList.size()>0)
							{
								for(int i=0; i<uploadFormList.size(); i++)
								{
									UploadForm uploadForm = uploadFormList.get(i);
							%>
								<li class="upload_item">
									<div class="upload_img">
										<%
											if(uploadForm.getPlayPath()!=null && uploadForm.getPlayPath().length()>4) {
												if(uploadForm.getPlayPath().substring(uploadForm.getPlayPath().length()-4).toLowerCase().equals(".jpg"))
												{
										%>
										<a href="javascript:imageDialogShow('<%=uploadForm.getFileSavePath()+uploadForm.getPlayPath() %>','','查看图片');" >
										<img src="<%=uploadForm.getFileSavePath()+uploadForm.getShowPath() %>" alt="" width="160px" height="160px" />
										</a>
										<%
												}
												else if(uploadForm.getPlayPath().substring(uploadForm.getPlayPath().length()-4).toLowerCase().equals(".wav"))
												{
													if(uploadForm.getFileState().equals("A")) {
										%>
										<a href="javascript:playWavDialogShow('<%=uploadForm.getFileSavePath()+uploadForm.getPlayPath() %>','','播放音频');" >
										<%
													}
										%>
										<img title="<%=uploadForm.getFileRemark()==null?"":uploadForm.getFileRemark() %>" src="<%=uploadForm.getFileSavePath()+uploadForm.getShowPath() %>" alt="" width="160px" height="160px" />
										<%
													if(uploadForm.getFileState().equals("A")) {
										%>
										</a>
										<%
													}
												}
												else//mp4
												{
													if(uploadForm.getFileState().equals("A")) {
										%>
										<a href="javascript:playFlvDialogShow('<%=uploadForm.getFileSavePath()+uploadForm.getFlvPath() %>','','播放视频');" >
										<%
													}
										%>
										<img title="<%=uploadForm.getFileRemark()==null?"":uploadForm.getFileRemark() %>" src="<%=uploadForm.getFileSavePath()+uploadForm.getShowPath() %>" alt="" width="160px" height="160px" />
										<%
													if(uploadForm.getFileState().equals("A")) {
										%>
										</a>
										<%
													}
												}
											}
										%>
									</div>
									<div title="<%=uploadForm.getUploadName() %>" class="upload_descript" style="width:140px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
										<%=uploadForm.getUploadName() %>
									</div>
									<div class="upload_opterdetails">
										<ul>
											<!--li>
												<span class="hd">上传时间</span>
												<span class="bd"><%=Constants.timeFormat(uploadForm.getUploadTime(), "1").substring(2,16) %></span>
											</li-->
											<li>
												<span class="hd" style="display:block;width:148px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" title="接警编号：<%=uploadForm.getPoliceCode()==null?"":uploadForm.getPoliceCode() %>">
												接警编号：
												<%=uploadForm.getPoliceCode()==null?"":uploadForm.getPoliceCode() %>
												</span>
											</li>
								<%
									if(userForm!=null && userForm.getUserId()==0) {
								%>
											<li>
												<span class="hd">到达时间：</span>
												<span class="bd"><%
												if(uploadForm.getUseTime()!=null && uploadForm.getUseTime()>0) {
													out.print(uploadForm.getUseTime()+"分钟");
												}
												%></span>
											</li>
											<li>
												<span class="hd">录制时间：</span>
												<span class="bd"><%
												if(uploadForm.getTakeTime()!=null && uploadForm.getTakeTime().length()==14) {
													String takeTimeFormat = Constants.timeFormat(uploadForm.getTakeTime(), "1");
													out.print(takeTimeFormat.length()>16?takeTimeFormat.substring(2,16):takeTimeFormat);
												}
												%></span>
											</li>
								<%
									}
								%>
											<li>
												<span class="hd">接警时间：</span>
												<span class="bd"><%
												if(uploadForm.getPoliceTime()!=null && uploadForm.getPoliceTime().length()==14) {
													String policeTimeFormat = Constants.timeFormat(uploadForm.getPoliceTime(), "1");
													out.print(policeTimeFormat.length()>16?policeTimeFormat.substring(2,16):policeTimeFormat);
												}
												%></span>
											</li>
											<li>
												<span class="hd">处警民警：</span>
												<span class="bd"><%=uploadForm.getEditName() %></span>
											</li>
											<li>
												<span class="hd">上传民警：</span>
												<span class="bd"><%=uploadForm.getUserName() %></span>
											</li>
										</ul>
									</div>
									<div class="clearfix mt_10">
										<!--a href="" class="fl cancle">取消</a-->
										<%
											if(userForm!=null && userForm.getUserId()==0) {
										%>
										<a href="javascript:detailShow('<%=uploadForm.getUploadId() %>')" class="blue_mod_btn fr" style="width:30px">详情</a>
										<%
											}
										%>
										<%
											if(canDown(request.getSession().getAttribute(Constants.SESSION_ROLE_FORM))) {
										%>
										<a href="<%=uploadForm.getFileSavePath()+uploadForm.getPlayPath() %>" target="_blank" class="blue_mod_btn fr" style="width:30px">下载</a>
										<%
											}
										%>
										<%
											if(uploadForm.getPlayPath()!=null && uploadForm.getPlayPath().length()>4) {
												if(uploadForm.getPlayPath().substring(uploadForm.getPlayPath().length()-4).toLowerCase().equals(".jpg"))
												{
										%>
										<a href="javascript:imageDialogShow('<%=uploadForm.getFileSavePath()+uploadForm.getPlayPath() %>','','查看图片');" class="blue_mod_btn fr">查看图片</a>
										<%
												}
												else if(uploadForm.getPlayPath().substring(uploadForm.getPlayPath().length()-4).toLowerCase().equals(".wav"))
												{
													if(uploadForm.getFileState().equals("A")) {
										%>
										<a href="javascript:playWavDialogShow('<%=uploadForm.getFileSavePath()+uploadForm.getPlayPath() %>','','播放音频');" class="blue_mod_btn fr">播放音频</a>
										<%
													} else {
										%>
										<a href="javascript:alert('视频正在剪辑中，请稍后');" class="blue_mod_btn fr">剪辑中...</a>
										<%
													}
												}
												else//mp4
												{
													if(uploadForm.getFileState().equals("A")) {
										%>
										<a href="javascript:playFlvDialogShow('<%=uploadForm.getFileSavePath()+uploadForm.getFlvPath() %>','','播放视频');" class="blue_mod_btn fr">播放视频</a>
										<%
													} else {
										%>
										<a href="javascript:alert('视频正在剪辑中，请稍后');" class="blue_mod_btn fr">剪辑中...</a>
										<%
													}
												}
											}
										%>
									</div>
								</li>
							<%
								}
							}
							%>
							</ul>
<form action="<%=basePath %>userAction.do?method=statisticDetail" method="post" id="hidUploadForm">
<input type="hidden" name="pageCute" id="pageCute" />
<input type="hidden" name="beginTime" value="<%=request.getParameter("beginTime")==null?"":request.getParameter("beginTime") %>"/>
<input type="hidden" name="endTime" value="<%=request.getParameter("endTime")==null?"":request.getParameter("endTime") %>"/>
<input type="hidden" name="useTimeBegin" value="<%=request.getParameter("useTimeBegin")==null?"":request.getParameter("useTimeBegin") %>"/>
<input type="hidden" name="useTimeEnd" value="<%=request.getParameter("useTimeEnd")==null?"":request.getParameter("useTimeEnd") %>"/>
<input type="hidden" name="treeId" id="treeId" value="<%=request.getParameter("treeId") %>"/>
<input type="hidden" name="typeId" id="typeId" value="<%=request.getParameter("typeId") %>"/>
<input type="hidden" name="policeTimeBegin" value="<%=request.getParameter("policeTimeBegin")==null?"":request.getParameter("policeTimeBegin") %>"/>
<input type="hidden" name="policeTimeEnd" value="<%=request.getParameter("policeTimeEnd")==null?"":request.getParameter("policeTimeEnd") %>"/>
<script>
function showUpload(pageCute)
{
	$('#pageCute').val(pageCute);
	$('#hidUploadForm').submit();
}
</script>
							<table align="center"><tr><td><jsp:include page="common/page.jsp?function=showUpload"></jsp:include></td></tr></table>
						</div>
						<div class=" mt_10 pb_200">
							
						</div>
					</div>
				</div>
			</div>
	</div>
<div id="imgShowDiv" icon="icon-save" style="display:none" class="boxcontent">
<img id="imgObj" src="" />
</div>
<div id="playShowDiv" icon="icon-save" style="display:none" class="boxcontent">
<object id="video" name="video" width="640" height="480" border="0" classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA">
<param name="ShowDisplay" value="0">
<param name="ShowControls" value="1">
<param name="AutoStart" value="1">
<param name="AutoRewind" value="0">
<param name="PlayCount" value="-1">
<param name="Appearance" value="0" value="">
<param name="BorderStyle" value="0" value="">
<param name="MovieWindowHeight" value="570">
<param name="MovieWindowWidth" value="440">
<param name="FileName" value="" id="playObj">
<embed id="videoObj" width="570" height="440" border="0" showdisplay="0" showcontrols="1" autostart="1" autorewind="0" playcount="-1" moviewindowheight="570" moviewindowwidth="440" filename="" src=""> 
</embed>
</object>
</div>
<div id="playFlvDiv" icon="icon-save" style="display:none" class="boxcontent">
<object id="flv" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" height="640" width="480"> 
<param name="movie" id="flvplayObj" value="vcastr22.swf?vcastr_file="> 
<param name="quality" value="high"> 
<param name="allowFullScreen" value="true" /> 
<embed id="flvvideoObj" src="vcastr22.swf?vcastr_file=" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" 
type="application/x-shockwave-flash" width="640" height="480"> 
</embed> 
</object>
</div>
<div id="playFlvFrame" icon="icon-save" style="display:none" class="boxcontent">
<iframe src="" name="flvplay" frameborder="0" width="560" height="420" scrolling="no"></iframe>
</div>
<div id="playWavFrame" icon="icon-save" style="display:none" class="boxcontent">
<iframe src="" name="wavplay" frameborder="0" width="420" height="100" scrolling="no"></iframe>
</div>
<div id="userChooseDiv" icon="icon-save" style="display:none" class="boxcontent">

<script>
function closeDialog()
{
	$('#closeDialog').click();
}
</script>
<jsp:include page="common/footer.jsp" />
<script type="text/javascript" src="js/all.js"></script>
<form id="playFlvDivForm" action="videoPlayer/play.jsp" method="post" target="flvplay">
<input type="hidden" id="flvPath" name="flvPath" />
</form>
<form id="playWavDivForm" action="wavplay.jsp" method="post" target="wavplay">
<input type="hidden" id="wavPath" name="wavPath" />
</form>
</body>
</html>
