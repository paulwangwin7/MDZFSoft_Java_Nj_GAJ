<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.manager.pub.util.*, com.manager.pub.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心统计报表</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/all.css" />
<jsp:include page="common/tag.jsp" />
<script type="text/javascript" src="<%=basePath%>js/jquery_dialog.js"></script>
<script type="text/javascript" src="<%=basePath %>pagejs/dateUtil.js"></script>
<script type="text/javascript" src="<%=basePath %>js/adddate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#dialog").click(function(){
	$.weeboxs.open('.boxcontent', {title:'统计表报',contentType:'selector'});
});})

var yearArray = getYearArrChar8("<%=DateUtils.getChar8()%>");
var nowMonth = "<%=DateUtils.getChar8().substring(4,6)%>";

</script>
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
						<ul class="Js_tab tab_list">
							<li class="tab_item current" onclick="showFrame('1')">
								派出所统计
							</li>
							<li class="tab_item" onclick="showFrame('3')">警员统计</li>
							<li class="tab_item" onclick="showFrame('4')">视频分类</li>
							<li class="tab_item" onclick="showFrame('5')">规范化考评</li>
							<li class="tab_item" onclick="showFrame('6')">接处警比对</li>
						</ul>
						<ul class="tab_conlist">
							<li class="tab_conitem current">
							<div class="gray_bor_bg">
								<h5 class="gray_blod_word">组合条件搜索</h5>
									派出所统计
								<div class="search_form">
									<div class="mt_10">
<form id="childTreeForm" action="<%=basePath %>servletAction.do?method=uploadLog_byTree1" method="post" target="rootTree">
									<select class="input_79x19" id="req_tree1_searchType" name="tree1_searchType">
									<option value="1">按年统计</option><option value="2">按月统计</option>
									</select>&nbsp;&nbsp;
									<br/>
									<select id="req_tree1_year" name="tree1_year" class="input_79x19"></select>
									<select id="req_tree1_month" name="tree1_month" class="input_79x19" style="display:none"></select>
									<br/>
									<input type="submit" class="blue_mod_btn" value="统&nbsp;计" />
</form>
<script>
//数据初始化
jQuery(function($) {
	for(i=0; i<yearArray.length; i++)
	{
		var appendStr = "<option value='"+yearArray[i]+"'";
		if((i+1)==yearArray.length)
		{
			appendStr += " selected";
		}
		appendStr += ">"+yearArray[i]+"</option>";
		$("#req_tree1_year").append(appendStr);
	}
	for(i=1; i<=12; i++)
	{
		var monthStr = (i<10)?("0"+i):i;
		var appendStr = "<option value='"+monthStr+"'";
		if(monthStr==nowMonth)
		{
			appendStr += " selected";
		}
		appendStr += ">"+monthStr+"</option>";
		$("#req_tree1_month").append(appendStr);
	}

	$("#req_tree1_searchType").change(function(){
		if($(this).val()=="1")
		{
			$("#req_tree1_month").css("display", "none");
		}
		else
		{
			$("#req_tree1_month").css("display", "block");
		}
	});
});
</script>
									
									</div>
								</div>
							</div>
							</li>
							<li class="tab_conitem">
							<div class="gray_bor_bg">
								<h5 class="gray_blod_word">组合条件搜索</h5>
<div class="error msg" id="analysisUploadMsg" style="display:none" onclick="hideObj('analysisUploadMsg')">Message if login failed</div>
								警员统计
<form id="byUserForm" action="<%=basePath %>servletAction.do?method=uploadLog_byUser" method="post" target="personal">
<input type="hidden" id="upload_editId" name="user_userId" />
								<div class="search_form">
									<div class="mt_10">
									<label>警员:</label>
									<input type="text" id="editName" name="user_name" value="" class="input_79x19" readonly onclick="userChoose()" />
									<label>按年份:</label>
									<select style="width:144px" name="user_searchType" id="req_user_searchType">
										<option value="1">按年统计</option>
										<option value="2">按月统计</option>
									</select>
									<br/>
									<select id="req_user_year" name="user_year" style="width:144px"></select>
									<select id="req_user_month" name="user_month" style="width:144px; display:none"></select>
									<br/>
									<input type="button" onclick="byUserSub()" class="blue_mod_btn" value="统&nbsp;计" />
									</div>
								</div>
</form>
<div id="userChooseDiv" icon="icon-save" style="display:none" class="boxcontent">
<div class="gray_bor_bg">
<div class="error msg" id="userChooseMsg" style="display:none" onclick="hideObj('userChooseMsg')">Message if login failed</div>
							<h5 class="gray_blod_word">组合条件搜索</h5>
							<div class="search_form">
					<form id="userManagerForm" name="userManagerForm" target="userChooseIframe" action="<%=basePath %>userAction.do?method=userSelect" method="post">
								<label>姓名：</label><input type="text" name="user_name" value="" class="input_79x19"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<label>警员编号：</label><input type="text" name="user_code" value="" class="input_79x19"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<label>所属部门：</label>
										<select name="query_treeId" class="input_130x20">
											<option value=""> -- </option>
<%
	List list_totalTree = (List)request.getAttribute(Constants.JSP_TREE_LIST);
	if(list_totalTree!=null && list_totalTree.size()>0)
	{
		for(int i=0; i<list_totalTree.size(); i++)//一级部门循环
		{
			TreeForm rootTreeForm = (TreeForm)((List)(list_totalTree.get(i))).get(0);
			List<TreeForm> treeFormList = ((List<TreeForm>)((List)(list_totalTree.get(i))).get(1));
%>
											<option value="<%=rootTreeForm.getTreeId() %>"><%=rootTreeForm.getTreeName() %></option>
<%
			for(int j=0; j<treeFormList.size(); j++)//二级部门循环
			{
%>
											<option value="<%=treeFormList.get(j).getTreeId() %>">&nbsp;<%=treeFormList.get(j).getTreeName() %></option>
<%
			}
		}
	}
%>
										</select>
								<input type="submit" class="blue_mod_btn" value="搜 &nbsp;索" />
								<a id="closeDialog" style="display:none" href="javascript:void(0)" class="Js_closePar blue_mod_btn" class="">取&nbsp;&nbsp;消</a>
					</form>
							</div>
						</div>
						<iframe src="" name="userChooseIframe" width="578" height="330" frameborder="0" scrolling="no"></iframe>
</div>
							</div>
							</li>
							<li class="tab_conitem">
							<div class="gray_bor_bg">
								<h5 class="gray_blod_word">组合条件搜索</h5>
									视频分类统计
								<div class="search_form">
									<div class="mt_10">
<form id="statisticForm" action="<%=basePath %>userAction.do?method=statistic" method="post" target="statistic">
上传时间：<input class="input_168x19" id="beginTime" type="text" value="" maxlength=14 name="beginTime" onclick="SelectDate(this,'yyyyMMddhhmmss')" readonly />
&nbsp;&nbsp;-&nbsp;&nbsp;
<input type="text" id="endTime" class="input_168x19" value="" maxlength=14 name="endTime" onclick="SelectDate(this,'yyyyMMddhhmmss')" readonly />
<a id="datetype" href="javascript:void(0)">切换至手写</a>
									<br/>
									<input type="button" class="blue_mod_btn" onclick="statistic_()" value="统&nbsp;计" />
</form>
									</div>
								</div>
							</div>
<script>
var shouxie = true;
jQuery(function($) {
	$('#datetype').click(function(){
		if(shouxie){
			$(this).html('切换至选择');
			$('#beginTime').attr('onclick','');
			$('#endTime').attr('onclick','');
			$('#beginTime').attr('readonly',false);
			$('#endTime').attr('readonly',false);
		} else {
			$(this).html('切换至手写');
			document.getElementById('beginTime').onclick = function(){
				SelectDate(document.getElementById('beginTime'),'yyyyMMddhhmmss');
			};
			document.getElementById('endTime').onclick = function(){
				SelectDate(document.getElementById('endTime'),'yyyyMMddhhmmss');
			};
			$('#beginTime').attr('readonly',true);
			$('#endTime').attr('readonly',true);
		}
		shouxie = !shouxie;
	});
});

function statistic_() {
jQuery(function($) {
	var bTime = $('#beginTime').val();
	var eTime = $('#endTime').val();
	if(bTime.length==eTime.length) {
		if(bTime.length==0) {
			$('#statisticForm').submit();
		} else if(bTime.length==14) {
			if(isNaN(bTime) || isNaN(eTime)) {
				alert('请检查上传时间信息是否正确！');
			} else {
				$('#statisticForm').submit();
			}
		}
	} else {
		alert('上传时间信息不全！');
	}
});
}
</script>
							</li>
							<li class="tab_conitem">
							<div class="gray_bor_bg">
								<h5 class="gray_blod_word">组合条件搜索</h5>
									执法规范化考评
								<div class="search_form">
									<div class="mt_10">
<form id="statisticCheckForm" action="<%=basePath %>userAction.do?method=statisticCheck" method="post" target="statisticCheck">
上传时间：<input class="input_168x19" id="beginTime_" type="text" name="beginTime_" onclick="SelectDate(this,'yyyyMMddhhmmss')" readonly />
&nbsp;&nbsp;-&nbsp;&nbsp;
<input type="text" id="endTime_" class="input_168x19" name="endTime_" onclick="SelectDate(this,'yyyyMMddhhmmss')" readonly />
<a id="datetype_" href="javascript:void(0)">切换至手写</a>
									<br/>
到达时间：<input class="input_38x19" id="useTimeBegin" type="text" name="useTimeBegin" />
&nbsp;-&nbsp;
<input type="text" id="useTimeEnd" class="input_38x19" name="useTimeEnd" />&nbsp;分钟
									<br/>
									<input type="button" class="blue_mod_btn" onclick="statisticCheck_()" value="考&nbsp;评" />
</form>
									</div>
								</div>
							</div>
<script>
var shouxie_ = true;
jQuery(function($) {
	$('#datetype_').click(function(){
		if(shouxie_){
			$(this).html('切换至选择');
			$('#beginTime_').attr('onclick','');
			$('#endTime_').attr('onclick','');
			$('#beginTime_').attr('readonly',false);
			$('#endTime_').attr('readonly',false);
		} else {
			$(this).html('切换至手写');
			document.getElementById('beginTime_').onclick = function(){
				SelectDate(document.getElementById('beginTime_'),'yyyyMMddhhmmss');
			};
			document.getElementById('endTime_').onclick = function(){
				SelectDate(document.getElementById('endTime_'),'yyyyMMddhhmmss');
			};
			$('#beginTime_').attr('readonly',true);
			$('#endTime_').attr('readonly',true);
		}
		shouxie_ = !shouxie_;
	});
});

function statisticCheck_() {
jQuery(function($) {
	var bTime = $('#beginTime_').val();
	var eTime = $('#endTime_').val();
	if(bTime.length==eTime.length) {
		if(bTime.length==0) {
			$('#statisticCheckForm').submit();
		} else if(bTime.length==14) {
			if(isNaN(bTime) || isNaN(eTime)) {
				alert('请检查上传时间信息是否正确！');
			} else {
				$('#statisticCheckForm').submit();
			}
		}
	} else {
		alert('上传时间信息不全！');
	}
});
}
</script>
							</li>
							<li class="tab_conitem">
							<div class="gray_bor_bg">
								<h5 class="gray_blod_word">组合条件搜索</h5>
									110接处警比对
								<div class="search_form">
									<div class="mt_10">
<form id="contrastForm" action="<%=basePath %>jspUpload.jsp" enctype="multipart/form-data" method="post" target="contrast">
<p>选择部门：<select name="contrastTree" id="contrastTree" class="input_130x20">
										<option value=""> -- </option>
<%
	if(list_totalTree!=null && list_totalTree.size()>0)
	{
		for(int i=0; i<list_totalTree.size(); i++)//一级部门循环
		{
			TreeForm rootTreeForm = (TreeForm)((List)(list_totalTree.get(i))).get(0);
			List<TreeForm> treeFormList = ((List<TreeForm>)((List)(list_totalTree.get(i))).get(1));
%>
										<option value="<%=rootTreeForm.getTreeId() %>"><%=rootTreeForm.getTreeName() %></option>
<%
			for(int j=0; j<treeFormList.size(); j++)//二级部门循环
			{
%>
										<option value="<%=treeFormList.get(j).getTreeId() %>">&nbsp;<%=treeFormList.get(j).getTreeName() %></option>
<%
			}
		}
	}
%>
									</select>
</p>
<p>上传时间：<input class="input_168x19" id="contrastTimeBegin" type="text" name="contrastTimeBegin" onclick="SelectDate(this,'yyyyMMdd')" readonly />
&nbsp;-&nbsp;<input class="input_168x19" id="contrastTimeEnd" type="text" name="contrastTimeEnd" onclick="SelectDate(this,'yyyyMMdd')" readonly />
</p>
<p>上传文件： <input class="input_168x19" type="file" id="File1" name="File1" size="20" maxlength="20"></p>
<input type="button" class="blue_mod_btn" onclick="contrast_()" value="比&nbsp;对" />
</form>
									</div>
								</div>
							</div>
<script>
function contrast_() {
jQuery(function($) {
	var contrastTree = $('#contrastTree').val();
	var contrastTimeBegin = $('#contrastTimeBegin').val();
	var contrastTimeEnd = $('#contrastTimeEnd').val();
	var File1 = $('#File1').val();
	if(contrastTree=='') {
		alert('请选择部门');
	} else if(contrastTimeBegin=='' || contrastTimeEnd=='') {
		alert('请选择上传时间');
	} else if() {
		alert('起始时间不得小于结束时间');
	}else if(File1=='') {
		alert('请选择上传文件');
	} else {
		$('#contrastForm').submit();
	}
});
}
</script>
							</li>
						</ul>
<script>
//数据初始化
jQuery(function($) {
	for(i=0; i<yearArray.length; i++)
	{
		var appendStr = "<option value='"+yearArray[i]+"'";
		if((i+1)==yearArray.length)
		{
			appendStr += " selected";
		}
		appendStr += ">"+yearArray[i]+"</option>";
		$("#req_user_year").append(appendStr);
	}
	for(i=1; i<=12; i++)
	{
		var monthStr = (i<10)?("0"+i):i;
		var appendStr = "<option value='"+monthStr+"'";
		if(monthStr==nowMonth)
		{
			appendStr += " selected";
		}
		appendStr += ">"+monthStr+"</option>";
		$("#req_user_month").append(appendStr);
	}

	$("#req_user_searchType").change(function(){
		if($(this).val()=="1")
		{
			$("#req_user_month").css("display", "none");
		}
		else
		{
			$("#req_user_month").css("display", "block");
		}
	});
});

function byUserSub()
{
jQuery(function($) {
	hideObj("analysisUploadMsg");
	if($("#editName").val().length>0)
	{
		$("#byUserForm").submit();
	}
	else
	{
		showMsgObj('analysisUploadMsg', '请选择警员', 2);
	}
});	
}

/**
 * 用户选择
 * @param assignmentId 
 * @param assignmentName 
 * @param dialogTitle 弹出层的标题
 */
function userChoose(assignmentId, assignmentName, dialogTitle, onlyRoot)
{
jQuery(function($) {
	$.weeboxs.open('#userChooseDiv', {title:dialogTitle, contentType:'selector', width:'600', height:'450'});
});
}
function closeDialog()
{
	$('#closeDialog').click();
}
</script>
<script>
function showFrame(frameIndex)
{
	hideObj('frame_1',0);
	hideObj('frame_2',0);
	hideObj('frame_3',0);
	hideObj('frame_4',0);
	hideObj('frame_5',0);
	hideObj('frame_6',0);
	showObj('frame_'+frameIndex);
}
</script>
<iframe id="frame_1" name="rootTree" src="" width="916px" height="610px" frameborder="0" scrolling="no"></iframe>
<iframe style="display:none" id="frame_2" name="childTree" src="" width="916px" height="410px" frameborder="0" scrolling="no"></iframe>
<iframe style="display:none" id="frame_3" name="personal" src="" width="916px" height="410px" frameborder="0" scrolling="no"></iframe>
<iframe style="display:none" id="frame_4" name="statistic" src="" width="916px" height="610px" frameborder="0" scrolling="yes"></iframe>
<iframe style="display:none" id="frame_5" name="statisticCheck" src="" width="916px" height="610px" frameborder="0" scrolling="yes"></iframe>
<iframe style="display:none" id="frame_6" name="contrast" src="" width="916px" height="410px" frameborder="0" scrolling="no"></iframe>
						<div class=" mt_10 pb_200">
							
						</div>
					</div>
				</div>
		</div>
	</div>
<jsp:include page="common/footer.jsp" />
<script type="text/javascript" src="js/all.js"></script>
</body>
</html>
