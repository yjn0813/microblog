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
    
    <title>My JSP 'QueryUsers.jsp' starting page</title>
    
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
    <table bordercolor="#FFC125" width="50%" bgcolor="#FFFFE0" align="center">
     <tr bgcolor="#FFC125">
        <td align="center" width="15%"><strong>用户头像</strong></td>
        <td align="center" width="50%"><strong>用户ID</strong></td>
        <td align="center"><strong>操作</strong></td>
        
     </tr>
  
  <c:forEach var="userlist" items="${requestScope.userlist}">
  <tr>
  <td align="center" width="15%"><img width="100" src="files/${userlist.photo}"></td>
  <td align="center" width="50%"><font size="4"><strong>${userlist.ID}</strong></font></td>
  <td align="center"><a href="detailUser.do?userid=${userlist.ID}" target="_blank">详细信息</a></td>
  </tr>
  </c:forEach>

  </table>
  </body>
</html>
