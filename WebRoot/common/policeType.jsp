<%@ page language="java" import="java.util.*,com.manager.pub.bean.*" pageEncoding="UTF-8"%>
<%
String onchangeFunc = request.getParameter("onchangeFunc")==null?"":request.getParameter("onchangeFunc");
%>
<select id="policeType" name="policeType" onchange="<%=onchangeFunc %>">
<%
	String reqTypeId = request.getParameter("policeType")==null?"":request.getParameter("policeType");
	boolean showAll = request.getParameter("showAll")==null?false:true;
	boolean noSelect = request.getParameter("noSelect")==null?false:true;
	if(showAll) {
%>
<option value="">全 部</option>
<%
	}
	if(noSelect) {
%>
<option value="-1">未选择</option>
<%
	}
%>
</select>
<script>
policeTypeSelect("<%=reqTypeId %>");
</script>