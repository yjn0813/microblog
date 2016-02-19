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
    
    <title>My JSP 'QueryAllArticles.jsp' starting page</title>
    
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
    <table bordercolor="#FFC125" width="100%" bgcolor="#FFFFE0" align="center">
     <tr bgcolor="#FFC125">
        <td align="center" width="15%"><strong>用户ID</strong></td>
        <td align="center" width="20%"><strong>微博ID</strong></td>
        <td align="center" width="30%"><strong>微博配图</strong></td>
        <td align="center" width="35%"><strong>微博内容</strong></td>
      </tr>
  
  <c:forEach var="allArticles" items="${requestScope.allArticlelist}">
  <tr>
   <td align="center" width="15%"><font size="4"><strong>${allArticles.ID}</strong></font></td>
   <td align="center" width="20%">${allArticles.article_id}</td>
   <td align="center" width="30%"><img width="120" src="files/${allArticles.articlePic}"></td>
   <td align="center" width="35%">${allArticles.article_content}</td>
  </tr>
  </c:forEach>

  </table>
  </body>
</html>
