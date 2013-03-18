<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.manager.pub.bean.*" %>
<%
UploadForm uploadForm = null;
String fileImgPath = "";
String playVodPath = "";
if(request.getAttribute("fileDetail")!=null)
{
	uploadForm = (UploadForm)request.getAttribute("fileDetail");
}
if(uploadForm!=null)
{
%>
<table width="100%" border="1">
  <tr>
  <td width="90px"><b>文&nbsp;件&nbsp;名</b></td>
  <td><%=uploadForm.getUploadName() %></td>
  </tr>
  <tr>
  <td><b>上&nbsp;传&nbsp;人</b></td>
  <td><%=uploadForm.getUserName() %>（<%=uploadForm.getTreeName() %>）</td>
  </tr>
  <tr>
  <td><b>上传时间</b></td>
  <td><%=uploadForm.getUploadTime() %></td>
  </tr>
  <tr>
  <td><b>录&nbsp;制&nbsp;人</b></td>
  <td><%=uploadForm.getEditName() %></td>
  </tr>
  <tr>
  <td><b>文件备注</b></td>
  <td><%=uploadForm.getFileRemark()==null?"":uploadForm.getFileRemark() %></td>
  </tr>
  <tr>
  <td><b>接警编号</b></td>
  <td><%=uploadForm.getPoliceCode()==null?"":uploadForm.getPoliceCode() %></td>
  </tr>
  <tr>
  <td><b>简要警情</b></td>
  <td><%=uploadForm.getPoliceDesc()==null?"":uploadForm.getPoliceDesc() %></td>
  </tr>
  <tr>
  <td><b>接警时间</b></td>
  <td><%=uploadForm.getPoliceTime()==null?"":uploadForm.getPoliceTime() %></td>
  </tr>
  <tr>
  <td><b>录制时间</b></td>
  <td><%=uploadForm.getTakeTime()==null?"":uploadForm.getTakeTime() %></td>
  </tr>
  <tr>
  <td><b>到达时间</b></td>
  <td><%=uploadForm.getUseTime()==null?"":uploadForm.getUseTime()+" 分钟" %></td>
  </tr>
</table>
<%
}
%>