<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UpdateNoticeboard.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
//验证是否输入
	function allIsnull(){
		var notice_content=document.updateNoticeboardForm.notice_content.value;
		if(notice_content==""){
		alert("请输入公告栏内容！");
		document.updateNoticeboardForm.noticeboard_content.focus();
		return false;
	}
	document.updateNoticeboardForm.submit();
	return true;
}
</script>
  </head>
  
  <body>
  
    <form action="updateNoticeboard.do" method="post" name="updateNoticeboardForm">
   <table bordercolor="#FFC125" width="80%" bgcolor="#FFFFE0" align="center">
    <tr bgcolor="#FFC125">
   <td align="center"><strong>修改公告栏</strong></td>
   </tr>
   <tr>
   <td align="center">
    <input type="hidden" name="notice_id" value="${requestScope.notice.notice_id}">
    <textarea name="notice_content" rows="5" cols="50" style= "overflow:hidden; resize:none; ">${requestScope.notice.notice_content}</textarea>
   </td>
    </tr>
    <tr>
    <td align="center">
    <input type="button" value="提交" onclick="allIsnull()">
   </td>
    </tr>
    </table>
    </form>
  
  </body>
</html>
