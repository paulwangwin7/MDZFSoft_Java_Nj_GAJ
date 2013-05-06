<%@ page language="java" import="java.util.*,com.manager.pub.util.*,com.manager.pub.bean.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String beginTime = "";
if(request.getParameter("beginTime")!=null) {
	beginTime = request.getParameter("beginTime");
}
if(request.getParameter("beginTime_")!=null) {
	beginTime = request.getParameter("beginTime_");
}
String endTime = "";
if(request.getParameter("endTime")!=null) {
	endTime = request.getParameter("endTime");
}
if(request.getParameter("endTime_")!=null) {
	endTime = request.getParameter("endTime_");
}
String useTimeBegin = request.getParameter("useTimeBegin")==null?"":request.getParameter("useTimeBegin");
String useTimeEnd = request.getParameter("useTimeEnd")==null?"":request.getParameter("useTimeEnd");
%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/all.css"/>
<%!
public int[] getCount(Long treeId, Long typeId, List<UploadForm> list){
	int count[] = new int[2];
	int count_0 = 0;
	List indexList = new ArrayList();
	Map temp = new HashMap();
	if(list!=null && list.size()>0) {
		int i = 0;
		for(UploadForm upload: list) {
			if(treeId.equals(upload.getTree2Id()) && typeId.equals(upload.getPoliceType())) {
				count_0 += 1;
				indexList.add(i);
				temp.put(upload.getPoliceCode(),"");
			}
			i++;
		}
	}
	for(int i=indexList.size()-1; i>=0; i--) {
		list.remove(Integer.parseInt(indexList.get(i).toString()));
	}
	count[0] = count_0;
	count[1] = temp.size();
	return count;
}
%>
<%
List<UploadForm> list = null;
if(request.getAttribute(Constants.JSP_UPLOAD_LIST)!=null) {
	list = (List<UploadForm>)request.getAttribute(Constants.JSP_UPLOAD_LIST);
}
List treeListObject = (List)request.getAttribute(Constants.JSP_TREE_LIST);
List<TreeForm> treeList = new ArrayList<TreeForm>();
for(int i=0; i<treeListObject.size(); i++) {
	List object = (List)treeListObject.get(i);
	treeList.add((TreeForm)object.get(0));
	List<TreeForm> formList = (List<TreeForm>)object.get(1);
	for(TreeForm treeForm: formList) {
		treeList.add(treeForm);
	}
}
List<PoliceTypeForm> typeList = (List<PoliceTypeForm>)request.getAttribute("PoliceType");
%>
<table class="common_table">
<tr><th>部门</th>
<%
	for(PoliceTypeForm type: typeList) {
%>
<th><%=type.getTypeName() %></th>
<%
	}
%>
</tr>
<%
	for(TreeForm tree: treeList) {
%>
<tr>
<td><%=tree.getTreeName() %></td>
<%
		for(PoliceTypeForm type: typeList) {
%>
<td>
<a href="javascript:void(0)" onclick="showDetail('<%=tree.getTreeId() %>','<%=type.getTypeId() %>')">
<%
			int[] count = getCount(tree.getTreeId(), type.getTypeId(), list);
			out.print(count[0]);
			if(type.getTypeId()==1) {
				out.print("("+count[1]+")");
			}
		
%>
</a>
</td>
<%
		}
%>
</tr>
<%
	}
%>
</table>
<form id="detailForm" action="<%=basePath %>userAction.do?method=statisticDetail" method="post" target="_blank">
<input type="text" name="beginTime" value="<%=beginTime %>"/>
<input type="text" name="endTime" value="<%=endTime %>"/>
<input type="text" name="useTimeBegin" value="<%=useTimeBegin %>"/>
<input type="text" name="useTimeEnd" value="<%=useTimeEnd %>"/>
<input type="text" name="treeId" id="treeId" value=""/>
<input type="text" name="typeId" id="typeId" value=""/>
</form>
<script>
function showDetail(treeId, typeId){
	document.getElementById('treeId').value=treeId;
	document.getElementById('typeId').value=typeId;
	document.getElementById('detailForm').submit();
}
</script>