<%@ page import="com.jspsmart.upload.*,com.manager.pub.bean.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.manager.pub.util.DateUtils"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String fileName = "";
%>
<html>
<head>
<title>CH9 - Jspsmart2.jsp</title>
<script src="<%=basePath %>js/jquery.js"></script>
<script src="<%=basePath %>pagejs/common.js"></script>
</head>
<body>
<h2><div id="msgDiv"></div></h2>

<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload"/>
<%
//计算文件上传个数
int count=0;

//SmartUpload的初始化，使用这个jspsmart一定要在一开始就这样声明
mySmartUpload.initialize(pageContext);

//依据form的内容上传
mySmartUpload.upload();

String uploadTimeBegin = mySmartUpload.getRequest().getParameter("uploadTimeBegin")==null?"":mySmartUpload.getRequest().getParameter("uploadTimeBegin");
String uploadTimeEnd = mySmartUpload.getRequest().getParameter("uploadTimeEnd")==null?"":mySmartUpload.getRequest().getParameter("uploadTimeEnd");
String policeTimeBegin = mySmartUpload.getRequest().getParameter("policeTimeBegin")==null?"":mySmartUpload.getRequest().getParameter("policeTimeBegin");
String policeTimeEnd = mySmartUpload.getRequest().getParameter("policeTimeEnd")==null?"":mySmartUpload.getRequest().getParameter("policeTimeEnd");
String TreeStr = mySmartUpload.getRequest().getParameter("contrastTree");
//将上传的文件一个一个取出来处理
for (int i=0;i<mySmartUpload.getFiles().getCount();i++)
{
//取出一个文件
com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);

//如果文件存在，则做存档操作
if (!myFile.isMissing()) {

//将文件存放于绝对路径的位置
//out.println("SystemConfig.getSystemConfig().getFileRoot()======="+SystemConfig.getSystemConfig().getFileRoot()+"<br/>");
fileName = com.manager.pub.util.DateUtils.getChar14();
fileName += "_"+new java.util.Date().getTime();
fileName += "."+myFile.getFileExt();
String saveAs = SystemConfig.getSystemConfig().getFileRoot();
fileName = "xls/" + DateUtils.getChar8() +"/"+fileName;
java.io.File dir = new java.io.File(saveAs);
if (!dir.exists()){dir.mkdirs();};
myFile.saveAs(saveAs + fileName, mySmartUpload.SAVE_PHYSICAL);


//显示此上传文件的详细信息
//out.println("FieldName = " + myFile.getFieldName() + "<BR>");
//out.println("Size = " + myFile.getSize() + "<BR>");
////out.println("FileName = " + myFile.getFileName() + "<BR>");
//out.println("FileName = " + fileName + "<BR>");
//out.println("FileExt = " + myFile.getFileExt() + "<BR>");
//out.println("FilePathName = " + myFile.getFilePathName() + "<BR>");
//out.println("ContentType = " + myFile.getContentType() + "<BR>");
//out.println("ContentDisp = " + myFile.getContentDisp() +"<BR>");
//out.println("TypeMIME = " + myFile.getTypeMIME() +"<BR>");
//out.println("SubTypeMIME = " + myFile.getSubTypeMIME() + "<BR>");
count ++;
}
}

// 显示应该上传的文件数目
//out.println("<BR>" + mySmartUpload.getFiles().getCount() + " files could be uploaded.<BR>");

// 显示成功上传的文件数目
//out.println(count + "file(s) uploaded.");
%>
<script>
$.ajax({
	url:contextPath()+'userAction.do?method=contrast',
	type: 'post',
	dataType: 'json',
	cache: false,
	async: false,
	data: {"fileName":"<%=fileName%>","treeId":"<%=TreeStr%>","uploadTimeBegin":"<%=uploadTimeBegin%>","uploadTimeEnd":"<%=uploadTimeEnd%>","policeTimeBegin":"<%=policeTimeBegin%>","policeTimeEnd":"<%=policeTimeEnd%>"},
	success:function(res){
		if(res != null)
		{
			if(res.retCode==0)
			{
				//alert(res.retObj);
				$('#msgDiv').html('<a href="'+res.retObj+'" target="_blank">下载</a>');
			}
		}
	},
	error:function(){
		//alert('统计失败！');
		$('#msgDiv').html('统计失败！');
	}
});
</script>
</body>
</html>