<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.manager.pub.util.*, com.manager.pub.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	List<UploadForm> uploadFormList = null;
	int thispagecute = 1;
	try
	{
		com.manager.pub.bean.Page pageRst = (com.manager.pub.bean.Page)request.getAttribute(Constants.PAGE_INFORMATION);
		thispagecute = pageRst.getPageCute();
		uploadFormList = (List<UploadForm>)(pageRst.getListObject());
	}
	catch(Exception ex)
	{
	}
	
String nullRemarkCheck = request.getParameter("nullRemark")==null?"":(request.getParameter("nullRemark").equals("")?"":"checked");
String nullPoliceCodeCheck = request.getParameter("nullPoliceCode")==null?"":(request.getParameter("nullPoliceCode").equals("")?"":"checked");
String nullPoliceDescCheck = request.getParameter("nullPoliceDesc")==null?"":(request.getParameter("nullPoliceDesc").equals("")?"":"checked");
%>
<div id="hiddenObjForm">
<input type="hidden" id="beginTime_" value="<%=request.getParameter("beginTime")==null?"":request.getParameter("beginTime") %>"/>
<input type="hidden" id="endTime_" value="<%=request.getParameter("endTime")==null?"":request.getParameter("endTime") %>"/>
<input type="hidden" id="fileRemark_" value="<%=request.getParameter("fileRemark")==null?"":request.getParameter("fileRemark") %>"/>
<input type="hidden" id="policeCode_" value="<%=request.getParameter("policeCode")==null?"":request.getParameter("policeCode") %>"/>
<input type="hidden" id="policeDesc_" value="<%=request.getParameter("policeDesc")==null?"":request.getParameter("policeDesc") %>"/>
<input type="hidden" id="nullRemark_" value="<%=request.getParameter("nullRemark")==null?"":request.getParameter("nullRemark") %>"/>
<input type="hidden" id="nullPoliceCode_" value="<%=request.getParameter("nullPoliceCode")==null?"":request.getParameter("nullPoliceCode") %>"/>
<input type="hidden" id="nullPoliceDesc_" value="<%=request.getParameter("nullPoliceDesc")==null?"":request.getParameter("nullPoliceDesc") %>"/>
</div>

<div class="gray_bor_bg">
<div class="search_form">
<form action="<%=basePath %>userAction.do?method=uploadFileShow" method="post">
<p>
上传时间:&nbsp;
<input type="text" id="beginTime" name="beginTime" value="<%=request.getParameter("beginTime")==null?"":request.getParameter("beginTime") %>" onclick="SelectDate(this,'yyyyMMddhhmmss')" readonly />
&nbsp;&nbsp;-&nbsp;&nbsp;
<input type="text" id="endTime" name="endTime" value="<%=request.getParameter("endTime")==null?"":request.getParameter("endTime") %>" onclick="SelectDate(this,'yyyyMMddhhmmss')" readonly />
</p>
<p>
文件备注:&nbsp;
<input type="text" name="fileRemark" id="fileRemark" value="<%=request.getParameter("fileRemark")==null?"":request.getParameter("fileRemark") %>">
<input type="checkbox" value="1" name="nullRemark" id="nullRemark" onclick="isObjNull(this, 'fileRemark')" <%=nullRemarkCheck %>/>为空
</p>
<p>
接警编号:&nbsp;
<input id="policeCode" type="text" name="policeCode" value="<%=request.getParameter("policeCode")==null?"":request.getParameter("policeCode") %>"/>
<input type="checkbox" value="1" name="nullPoliceCode" id="nullPoliceCode" onclick="isObjNull(this, 'policeCode')" <%=nullPoliceCodeCheck %>/>为空
</p>
<p>
简要警情:&nbsp;
<input id="policeDesc" type="text" name="policeDesc" value="<%=request.getParameter("policeDesc")==null?"":request.getParameter("policeDesc") %>"/>
<input type="checkbox" value="1" name="nullPoliceDesc" id="nullPoliceDesc" onclick="isObjNull(this, 'policeDesc')" <%=nullPoliceDescCheck %>/>为空
</p>
<input type="button" class="blue_mod_btn" value="检&nbsp;索" onclick="formsubmit()"/>
</form>
</div>
</div>
<div class=" mt_10">
	<ul class="upload_list">
	<%
	if(uploadFormList!=null)
	{
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
			String fileState = "有效";
			if(uploadForm.getFileState().equals("U"))
			{
				fileState = "无效";
			}
			else if(uploadForm.getFileState().equals("F"))
			{
				fileState = "过期";
			}
			if(uploadForm!=null)
			{
	%>
	<li class="upload_item_">
		<a href="javascript:void(0)" rel="facebox" onclick="showUploadDetail('<%=i %>')">
		<img src="<%=uploadForm.getFileSavePath() %>/upload/files/<%=uploadForm.getShowPath()%>" width="96" height="96" />
		</a>
		<div class="links">
			<%=uploadForm.getFileStats().equals("0")?"":"<img src='images/red-star.png' width='11px' height='10px' style='postion:static; top:-50%; left:-50%'/>" %>&nbsp;
			<a href="javascript:void(0)" rel="facebox" onclick="showUploadDetail('<%=i %>')">详情</a>
			<input type="hidden" id="img_<%=i %>" value="<%=uploadForm.getFileSavePath() %>/upload/files/<%=uploadForm.getShowPath()%>" />
			<input type="hidden" id="type_<%=i %>" value="<%=fileType %>" />
			<input type="hidden" id="name_<%=i %>" value="<%=uploadForm.getUploadName() %>" />
			<input type="hidden" id="uploadTime_<%=i %>" value="<%=DateUtils.formatChar14Time(uploadForm.getUploadTime()==null?"":uploadForm.getUploadTime()) %>" />
			<input type="hidden" id="user_<%=i %>" value="<%=uploadForm.getUserName() %>" />
			<input type="hidden" id="edit_<%=i %>" value="<%=uploadForm.getEditName() %>" />
			<input type="hidden" id="createTime_<%=i %>" value="<%=DateUtils.formatChar14Time(uploadForm.getFileCreatetime()==null?"":uploadForm.getFileCreatetime()) %>" />
			<input type="hidden" id="state_<%=i %>" value="<%=fileState %>" />
			<input type="hidden" id="stats_<%=i %>" value="<%=uploadForm.getFileStats().equals("0")?"普通":"重要★" %>" />
			<input type="hidden" id="fileId_<%=i %>" value="<%=uploadForm.getUploadId() %>" />
			<input type="hidden" id="_file_remark_<%=i %>" value="<%=uploadForm.getFileRemark()==null?"":uploadForm.getFileRemark() %>" />
			<input type="hidden" id="police_code_<%=i %>" value="<%=uploadForm.getPoliceCode()==null?"":uploadForm.getPoliceCode() %>" />
			<input type="hidden" id="police_desc_<%=i %>" value="<%=uploadForm.getPoliceDesc()==null?"":uploadForm.getPoliceDesc() %>" />
			<input type="hidden" id="take_time_<%=i %>" value="<%=uploadForm.getTakeTime()==null?"":uploadForm.getTakeTime() %>" />
			<input type="hidden" id="police_time_<%=i %>" value="<%=uploadForm.getPoliceTime()==null?"":uploadForm.getPoliceTime() %>" />
			<input type="hidden" id="useTime_<%=i %>" value="<%=uploadForm.getUseTime()==null?"":uploadForm.getUseTime() %>" />
			<input type="hidden" id="policeType_<%=i %>" value="<%=uploadForm.getPoliceType()==null?"":uploadForm.getPoliceType() %>" />
		</div>
	</li>
	<%
			}
		}
	}
	%>
</ul>
</div>
<div id="uploadDetail" style="display:none">
<hr>
<TABLE>
	<tr>
		<td>
			上传详情：
		</td>
		<td align="right">
		<button type="button" class="button" onclick="hideObj('uploadDetail')">隐藏详情</button>
		</td>
	</tr>
<TR>
<TD WIDTH=400PX>
<table width="100%" align="center" border="0">
	<tr>
		<td width="20%">
			<img id="img_" src="" width="120" height="120" /><br/>
		</td>
		<td>
			<table>
				<tr style="display:none">
					<td align="right">到达时间</td>
					<td>：</td>
					<td id="useTime_"></td>
				</tr>
				<tr>
					<td align="right">文件类别</td>
					<td>：</td>
					<td id="type_"></td>
				</tr>
				<tr>
					<td align="right">文&nbsp;件&nbsp;名</td>
					<td>：</td>
					<td id="name_"></td>
				</tr>
				<tr>
					<td align="right">上传时间</td>
					<td>：</td>
					<td id="uploadTime_"></td>
				</tr>
				<tr>
					<td align="right">上传人</td>
					<td>：</td>
					<td id="user_"></td>
				</tr>
				<tr>
					<td align="right">录制人</td>
					<td>：</td>
					<td id="edit_"></td>
				</tr>
				<tr>
					<td align="right">创建时间</td>
					<td>：</td>
					<td id="createTime_"></td>
				</tr>
				<tr>
					<td align="right">文件状态</td>
					<td>：</td>
					<td id="state_"></td>
				</tr>
				<tr style="display:none">
					<td align="right">文件重要性</td>
					<td>：</td>
					<td id="stats_"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr style="display:none">
		<td colspan="2">
		<b>
		<font color="red">
			<button type="button" class="blue_mod_btn" onclick="uploadFileStats('1')">"重要★"</button>
			<button type="button" class="blue_mod_btn" onclick="uploadFileStats('0')">"普通"</button>
		</font>
		</b>
		</td>
	</tr>
</table>
</TD>
<TD align="left" valign="top">
<table width="400px">
<tr>
<td>
<table>
<tr>
<td>视频类型：&nbsp;&nbsp;</td>
<td><jsp:include page="common/policeType.jsp"></jsp:include></td>
</tr>
<tr style="display:none">
<td>录制时间：</td>
<td><input name="_take_time_" id="_take_time_" style="width:170px" onclick="SelectDate(this,'yyyyMMddhhmmss')" readonly /></td>
</tr>
<tr>
<td>接警编号：</td>
<td><input name="_police_code_" id="_police_code_" style="width:170px" maxlength="30" /></td>
</tr>
<tr>
<td>接警时间：</td>
<td><input name="_police_time_" id="_police_time_" style="width:170px" /></td>
</tr>
<tr>
<td>文件备注：</td>
<td><textarea name="_file_remark_" id="_file_remark_" style="width:200px;height:50px" /></textarea></td>
</tr>
<tr>
<td>简要警情及<br/>处警结果：</td>
<td><textarea name="_police_desc_" id="_police_desc_" style="width:200px;height:50px" /></textarea></td>
<tr>
<tr>
<td colspan="2"><button type="button" class="blue_mod_btn" onclick="uploadFileRemark()">设 置</button></td>
</tr>
</table>
</td>
</tr>
</table>
</TD>
</TR>
</TABLE>
</div>

<div class="tablefooter clearfix">
<jsp:include page="common/page.jsp?function=mineUpload_"></jsp:include>
</div>
<form name="uploadFileStatsForm" id="uploadFileStatsForm" action="userAction.do?method=uploadFileStats" method="post">
<input type="hidden" name="fileId" id="_fileId_" />
<input type="hidden" name="stats" id="_stats_" />
<!--input type="hidden" name="file_remark" value="这个文件很重要" id="_file_remark_" /-->
</form>
<script>
function uploadFileStats(statsVal)
{
jQuery(function($) {
	$('#_stats_').val(statsVal);
	$.ajax({
		url:contextPath()+'servletAction.do?method=uploadFileStats',
		type: 'post',
		dataType: 'json',
		cache: false,
		async: false,
		data: {"fileId":$("#_fileId_").val(),"stats":$("#_stats_").val()},
		success:function(res){
			if(res != null)
			{
				if(res.retCode!=0)
				{
					alert(res.msg);
				}
				else
				{
					alert(res.msg);
					mineUpload('<%=thispagecute%>');
				}
			}
			else{
				showMsg("请求失败，返回结果null", 1);
			}
		},
		error:function(){
			showMsg("请求失败 error function", 1);
		}
	});
});
}

function uploadFileRemark()
{
jQuery(function($) {
var policeTime = $('#_police_time_').val();
if(policeTime.length>0)
{
	policeTime = policeTime.replace("年","").replace("月","").replace("日","").replace("时","").replace("分","").replace("秒",""); 
	if(policeTime.length!=14) {
		alert("请检查您输入的接警时间是否正确！");
		return;
	}
}
	if($('#policeType').val()=='1') {
		//if($('#_take_time_').val().length=='')
		//{
		//	alert('录制时间必须选择');
		//	return;
		//}
		if($('#_police_code_').val().length=='')
		{
			alert('接警编号必须填写');
			return;
		}
		if($('#_police_time_').val().length=='')
		{
			alert('接警时间必须选择');
			return;
		}
		if(($("#_file_remark_").html()).length>1000)
		{
			alert('文件备注请将文字保持在1000个字以内！');
			return;
		}
		if(($("#_police_desc_").html()).length>2000)
		{
			alert('简要警情请将文字保持在2000个字以内！');
			return;
		}
	}
	$.ajax({
		url:contextPath()+'servletAction.do?method=uploadFileRemark',
		type: 'post',
		dataType: 'json',
		cache: false,
		async: false,
		data: {"fileId":$("#_fileId_").val(),"file_remark":$("#_file_remark_").val(),"police_code":$("#_police_code_").val(),"police_time":policeTime,"police_desc":$("#_police_desc_").val(),"_take_time_":$("#_take_time_").val(),"policeType":$("#policeType").val()},
		success:function(res){
			if(res != null)
			{
				if(res.retCode!=0)
				{
					alert(res.msg);
				}
				else
				{
					alert(res.msg);
					mineUpload('<%=thispagecute%>');
				}
			}
			else{
				showMsg("请求失败，返回结果null", 1);
			}
		},
		error:function(){
			showMsg("请求失败 error function", 1);
		}
	});
});
}


/**
 * 查看文件详情
 * @param forIndex 循环下标
 */
function showUploadDetail(forIndex, editAction) {
jQuery(function($) {
	$("#policeType").find("option[value='"+$('#policeType_'+forIndex).val()+"']").attr("selected",true);
	$("#useTime_").html($("#useTime_"+forIndex).val());
	if($("#useTime_").html()!="") {
		$("#useTime_").html($("#useTime_").html()+" 分钟");
	}
	$("#img_").attr("src", $("#img_"+forIndex).val());
	$("#type_").html($("#type_"+forIndex).val());
	$("#name_").html($("#name_"+forIndex).val());
	$("#uploadTime_").html($("#uploadTime_"+forIndex).val());
	$("#user_").html($("#user_"+forIndex).val());
	$("#edit_").html($("#edit_"+forIndex).val());
	$("#createTime_").html($("#createTime_"+forIndex).val());
	$("#_take_time_").val($("#take_time_"+forIndex).val());
	$("#state_").html($("#state_"+forIndex).val());
	$("#stats_").html($("#stats_"+forIndex).val());
	$("#_file_remark_").val($("#_file_remark_"+forIndex).val());
	var policeTime = $("#police_time_"+forIndex).val();
	if(policeTime.length==14) {
		$("#_police_time_").val(policeTime.substring(0,4)+"年"+policeTime.substring(4,6)+"月"+policeTime.substring(6,8)+"日"+policeTime.substring(8,10)+"时"+policeTime.substring(10,12)+"分"+policeTime.substring(12,14)+"秒");
	}
	$("#_police_code_").val($("#police_code_"+forIndex).val());
	$("#_police_desc_").html($("#police_desc_"+forIndex).val());
	//$("#_file_remark_").val($("#_file_remark_"+forIndex).val());
	if($("#stats_"+forIndex).val()=="重要★")
	{
		$("#stats_").html("<font color='red'>"+$("#stats_"+forIndex).val()+"</font>");
	}
	$("#_fileId_").val($("#fileId_"+forIndex).val());
	showObj("uploadDetail");
});
}

function isObjNull(obj,objName){
jQuery(function($) {
	if(obj.checked){
		$('#'+objName).val('');
	}
});
}

function formsubmit(){
jQuery(function($) {
	var nullRemarkStr = $('#nullRemark').attr('checked')?'1':'';
	var nullPoliceCodeStr = $('#nullPoliceCode').attr('checked')?'1':'';
	var nullPoliceDescStr = $('#nullPoliceDesc').attr('checked')?'1':'';
	mineUpload('1', $('#beginTime').val(), $('#endTime').val(), $('#fileRemark').val(), $('#policeCode').val(), $('#policeDesc').val(), nullRemarkStr, nullPoliceCodeStr, nullPoliceDescStr);
});
}
function mineUpload_(pagecute){
	var nullRemarkStr = $('#nullRemark_').val();
	var nullPoliceCodeStr = $('#nullPoliceCode_').val();
	var nullPoliceDescStr = $('#nullPoliceDesc_').val();
	mineUpload(pagecute, $('#beginTime_').val(), $('#endTime_').val(), $('#fileRemark_').val(), $('#policeCode_').val(), $('#policeDesc_').val(), nullRemarkStr, nullPoliceCodeStr, nullPoliceDescStr);
}
</script>