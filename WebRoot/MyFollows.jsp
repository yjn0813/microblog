<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>我的关注管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	function checkDel(follow_id) {
		if (window.confirm("是否删除 ？")) {
			window.location.href = "deleteFollow.do?follow_id=" + follow_id;
		}
	}
</script>

		<style type="text/css">
.header {
	margin-left: 135px;
}

.blue #slatenav {
	position: relative;
	height: 42px;
	display: block;
	font-size: 15px;
	font-weight: bold;
	background: transparent url(img/blueslate_background.gif) repeat-x top
		left;
	font-family: Arial, Verdana, Helvitica, sans-serif;
	text-transform: uppercase;
}

.blue #slatenav ul {
	margin: -35 365px;
	padding: 0;
	list-style-type: none;
	width: auto;
	line-height: 12px;
}

.blue #slatenav ul li {
	display: block;
	float: left;
	margin: -3 1px 0 0;
}

.blue #slatenav ul li a {
	display: block;
	float: left;
	color: #D5F1FF;
	text-decoration: none;
	padding: 14px 22px 0 22px;
	float: left;
	text-decoration: none;
	height: 23px;
}

.blue #slatenav ul li a:hover,.blue #slatenav ul li a.current {
	color: #fff;
	background: transparent url(img/blueslate_backgroundOVER.gif) no-repeat
		top center;
}
.exit{
	position: absolute;
	left: 1010px;
}
.searchText {
	background-color: #D5F1FF;
	border: 1px;
	-webkit-border-radius: 20px;
	outline-style: none;
	-webkit-appearance: none;
	padding: 10px;
	width: 150px;
	height: 10px;
	margin-left: 850px;
	margin-top: 5px;
	color: gray;
}

.searchText:focus {
	color: #0A0A0A;
	background-color: white;
}

.search_btn {
	display: inline-block;
	margin-top: -10px;
	margin-left: -22px;
	vertical-align: middle;
}

.content-main {
	position: absolute;
	top: 72px;
	left: 345px;
	min-width: 600px;
	width: auto;
	height: auto;
	line-height: 16px;
	border-radius: 6px;
	text-shadow: 0 1px 0 #fff;
	border: 5px dashed #D5F1FF;
	background-color: white;
}
.header-title{
	position: relative;
	top: -5px;
	left: 15px;
}
a {
	color: black;
	text-decoration: none;
}

a:hover,a:visited:hover {
	color: #0A8CD2;
	text-decoration: underline;
}
</style>
	</head>

	<body
		style="background: url('img/bg_repeat_reg.png') repeat-x scroll 0 0 #C8E1F0; margin: 0 0">
		<font face="微软雅黑">
			<div class="blue"
				style="background: url('img/bg_reg.png') no-repeat scroll center top transparent;">
				<div id="slatenav">
					<div class="header">
						<img alt="" src="img/logo_small.png">
					</div>
					<ul>
						<li>
							<a href="Homepage.jsp" class="current">首页</a>
						</li>
						<li>
							<a href="queryForwardArticles.do?userid=${sessionScope.user.ID}">@我</a>
						</li>
						<li>
							<a href="queryMyComments.do?userid=${sessionScope.user.ID}">评论</a>
						</li>
						<li>
							<a href="My.jsp">我</a>
						</li>
						<li class="exit">
							<a href="exit.do">退出</a>
						</li>
					</ul>
					<form action="search.do" name="searchForm" method="post">
						<input type="text" name="search" class="searchText" />
						<input type="image" src="img/search-icon.png" class="search_btn" />
					</form>
				</div>
				<div class="content-main">
					<div class="content-header">
				<div class="header-inner">
				<h3 class="header-title">我关注的人</h3>
				</div>
				<HR id="divide-line" align="center" width=726 color=#E6E6E6 SIZE=1 style="position:absolute; top: 35px">
		        </div>
						<c:forEach var="followList" items="${requestScope.followList}">
							<table width="100%">
							
							<tr>
							
								<td rowspan="3" align="left" width="10%">

									<img class="profile-img" alt="" src="files/${followList.photo}"
										style="width: 70px; height: 70px;">
								</td>
								
							</tr>
							<tr>
								<td align="left">
									<font size="4"><strong>${followList.follow_id}
									</strong> </font>

								</td>
								<td width="10%" rowspan="2">
								<a href="javascript:checkDel('${followList.follow_id}')"><font size="2">删除</font></a>
								</td>
							</tr>
							
							<tr>
								<td align="left">
									<font size="3">简介：<a href="">${followList.profile}</a>
									</font>
								</td>
								</tr>
								
								</table>
						</c:forEach>
				</div>
		</div> </font>
	</body>
</html>
