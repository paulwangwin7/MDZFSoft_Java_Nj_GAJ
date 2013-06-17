<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.manager.pub.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object>  results= (Map<String,Object>)request.getAttribute("jjxxDetail");

if(results!=null)
{
Map<String,Object> jjxxDetails=(HashMap<String,Object>)results.get("results");
%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/all.css"/>
<table width="100%" class="common_table">
  <tr>
  <th width="90px">接警时间</th>
  <td><%=jjxxDetails.get("JJSJ")  %></td>
  </tr>
  <tr>
  <th width="90px">接警编号</th>
  <td><%=jjxxDetails.get("JJBH") %></td>
  </tr>
  <tr>
  <th>报警人</th>
  <td><%=jjxxDetails.get("BJR") %></td>
  </tr>
  <tr>
  <th>报警电话</th>
  <td><%=jjxxDetails.get("BJDH") %></td>
  </tr>
  <tr>
  <th>接警人姓名</th>
  <td><%=jjxxDetails.get("JJRXM") %></td>
  </tr>
  <tr>
  <th>处警类别</th>
  <td><%=jjxxDetails.get("CJLB") %></td>
  </tr>
  <tr>
  <th>处警人</th>
  <td><%
  List cjrs=(List)jjxxDetails.get("CJR");
  StringBuffer sb=new StringBuffer();
  for(int i=0;i<cjrs.size();i++){
  	sb.append(cjrs.get(i)).append(",");
  }
  if(sb.length()>0)
  	sb.deleteCharAt(sb.length()-1);
  	
  out.print(sb.toString());
   %></td>
  </tr>
  <tr>
  <th>简要警情及<br/>处理结果</th>
  <td><%=jjxxDetails.get("CLJGNR") %></td>
  </tr>
</table>
<%
}
%>