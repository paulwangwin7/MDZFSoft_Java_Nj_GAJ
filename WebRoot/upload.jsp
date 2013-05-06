<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Jspsmart.html </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
 
<h2>文件上传范例 - jspSmart </h2>
 
<form name="Form1" enctype="multipart/form-data" method="post" action="jspUpload.jsp">
<p>上传文件 1： <input type="file" name="File1" size="20" maxlength="20"></p>
<p>上传文件 2： <input type="file" name="File2" size="20" maxlength="20"></p>
<input type="text" name="fuck" value="hello world!" />
<input type="text" name="you" value="hello world!" /><br/>
<input type="submit" value="上传">
<input type="reset" value="清除">
</form>

</body>
</html>