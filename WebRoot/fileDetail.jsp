<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.manager.pub.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<PoliceTypeForm> list = null;
Map map = new HashMap();
if(request.getAttribute("policeType")!=null)
{
	list = (List<PoliceTypeForm>)request.getAttribute("policeType");
	System.out.println("===="+list.size());
	for(PoliceTypeForm form : list)
	{
		map.put(form.getTypeId(), form.getTypeName());
		System.out.println("===="+form.getTypeId()+"===="+form.getTypeName());
	}
}
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
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/all.css"/>
<table width="100%" class="common_table">
  <tr>
  <th width="90px">文&nbsp;件&nbsp;名</th>
  <td><%=uploadForm.getUploadName() %></td>
  </tr>
  <tr>
  <th width="90px">文件类型</th>
  <td><%=map.get(uploadForm.getPoliceType()) %></td>
  </tr>
  <tr>
  <th>上传民警</th>
  <td><%=uploadForm.getUserName() %>（<%=uploadForm.getTreeName() %>）</td>
  </tr>
  <tr>
  <th>上传时间</th>
  <td><%=uploadForm.getUploadTime() %></td>
  </tr>
  <tr>
  <th>处警民警</th>
  <td><%=uploadForm.getEditName() %></td>
  </tr>
  <tr>
  <th>文件备注</th>
  <td><%=uploadForm.getFileRemark()==null?"":uploadForm.getFileRemark() %></td>
  </tr>
  <tr>
  <th>接警编号</th>
  <td><%=uploadForm.getPoliceCode()==null?"":uploadForm.getPoliceCode() %></td>
  </tr>
  <tr>
  <th>简要警情</th>
  <td><%=uploadForm.getPoliceDesc()==null?"":uploadForm.getPoliceDesc() %></td>
  </tr>
  <tr>
  <th>接警时间</th>
  <td><%=uploadForm.getPoliceTime()==null?"":uploadForm.getPoliceTime() %></td>
  </tr>
  <tr>
  <th>录制时间</th>
  <td><%=uploadForm.getTakeTime()==null?"":uploadForm.getTakeTime() %></td>
  </tr>
  <tr>
  <th>到达时间</th>
  <td><%=uploadForm.getUseTime()==null?"":uploadForm.getUseTime()+" 分钟" %></td>
  </tr>
</table>
<%
}
%>