<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ModifyNoticeboard.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <table bordercolor="#FFC125" width="80%" bgcolor="#FFFFE0" align="center">
     <tr bgcolor="#FFC125">
        <td align="center" width="70%"><strong>公告栏内容</strong></td>
        <td align="center" width="10%"><strong>操作</strong></td>
     </tr>
 <c:forEach var="notice" items="${requestScope.notice}">
  <tr>
  <td align="center">${notice.noticeboard}</td>
  <td align="center"><a href="detailNoticeboard.do?noticeboard=${notice.noticeboard}">修改</a></td>
  </tr>
 </c:forEach>
  </table>
  </body>
</html>
