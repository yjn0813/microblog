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
    
    <title>评论完成</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	.header-title{
	position: inherit;
	top: 5px;
	margin-left: 5px;
}
	</style>

  </head>
  
  <body>
  <font face="微软雅黑"> 
  <div class="content-header">
				<div class="header-inner">
				<h3 class="header-title">提交的评论</h3>
				</div>
				<HR id="divide-line" align="center" width=706 color=#E6E6E6 SIZE=1 style="position:absolute; top: 35px">
		</div>
 <c:forEach var="confirmList" items="${requestScope.confirmList}">
				<table width="100%">
					<tr>
						<td rowspan="2" width="10%">
							<img class="profile-img" alt="" src="files/${confirmList.photo}"
								style="width: 70px; height: 70px;">
						</td>
					</tr>
					<tr>
						<td class="profile-detail" width="5%">
							<font size="4" color="#0A8CD2"><strong>${confirmList.ID}
							</strong></font>
						</td>
						<td width="5%">说：</td>
						<td class="article_content" colspan="2">
							${confirmList.comments_content}
						</td>
					</tr>
					
					</table>
				</c:forEach>
			</font>	
  </body>
</html>
