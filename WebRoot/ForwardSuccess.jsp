<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>转发成功</title>
    
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
	<h3 class="header-title">转发</h3>
	</div>
	<HR id="divide-line" align="center" width=706 color=#E6E6E6 SIZE=1 style="position:absolute; top: 35px">
		</div>
    	转发成功！请点击导航栏中的&ldquo;<font color="#ff0000">@我</font>&rdquo;查看转发的微博=￣&omega;￣=
  </font>
  </body>
</html>
