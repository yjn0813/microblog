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
    
    <title>收到的评论</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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

.header-title{
	position: relative;
	top: -5px;
	left: 15px;
}
.content-main {
	position: absolute;
	top: 72px;
	left: 390px;
	width: 650px;
	line-height: 16px;
	border-radius: 6px;
	text-shadow: 0 1px 0 #fff;
	border: 5px dashed #D5F1FF;
	background-color: white;
}

.ca-menu li{
    position: relative;
	display: inline-block;
	min-width: 30px;
	max-width: 300px;
	word-break: break-all;
	word-wrap: break-word;
	min-height: 22px;
	background: #B7DA2B;
	border-radius: 15px;
	margin-bottom: 20px;
	padding: 6px 8px;
	-webkit-box-shadow: 0px 1px 2px black, inset 0px 4px 4px rgba(0, 0, 0, .3), inset 0px -4px 4px rgba(255, 255, 255, .5);
	-moz-shadow: 0px 1px 2px #000, inset 0px 4px 4px rgba(0,0,0,.3), inset 0px -4px 4px rgba(255,255,255,.5);
	box-shadow: 0px 1px 2px black, inset 0px 4px 4px rgba(0, 0, 0, .3), inset 0px -4px 4px rgba(255, 255, 255, .5);
}
.ca-menu1::before {
content: '';
display: block;
font-size: 0;
width: 0;
height: 0;
border-width: 6px;
position: absolute;
bottom: -12px;
left: 12px;
border-color: #4A4C50 transparent transparent #4A4C50;
border-style: solid dashed dashed solid;
}
.ca-menu1::after {
content: '';
display: block;
font-size: 0;
position: absolute;
bottom: -9px;
left: 13px;
width: 0;
height: 0;
border-width: 5px;
border-color: #E8E8E8 transparent transparent #E8E8E8;
border-style: solid dashed dashed solid;
}
.ca-menu1{
	position: relative;
	top:60px;
	left:200px;
}
.ca-menu2{
	position: relative;
	top:150px;
	left:930px;
}
.ca-menu2::before {
content: '';
display: block;
font-size: 0;
width: 0;
height: 0;
border-width: 6px;
position: absolute;
bottom: -12px;
right: 10px;
border-color: #4A4C50 #4A4C50 transparent transparent;
border-style: solid dashed dashed solid;
}
.ca-menu2::after {
content: '';
display: block;
font-size: 0;
position: absolute;
bottom: -9px;
right: 11px;
width: 0;
height: 0;
border-width: 5px;
border-color: #E8E8E8 #E8E8E8 transparent transparent;
border-style: solid dashed dashed solid;
}
.ca-menu a:hover,a:visited:hover{
	text-decoration: none;
}
.ca-menu li:hover{
    background: #E8E8E8;
}
.ca-menu li:hover .ca-icon{
    font-size: 40px;
    color: #259add;
    opacity: 0.8;
    text-shadow: 0px 0px 13px #fff;
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
			<div class="blue">
				<div id="slatenav">
					<div class="header">
						<img alt="" src="img/logo_small.png">
					</div>
					<ul>
						<li>
							<a href="Homepage.jsp">首页</a>
						</li>
						<li>
							<a href="queryForwardArticles.do?userid=${sessionScope.user.ID}">@我</a>
						</li>
						<li>
							<a href="queryMyComments.do?userid=${sessionScope.user.ID}" class="current">评论</a>
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
				<div class="left-menu">
				<ul class="ca-menu">
				<li class="ca-menu1"><a href="queryMyComments.do">我发出的评论</a></li>
				<li class="ca-menu2"><a href="queryRecievedComments.do">收到的评论</a></li>
				</ul>
				</div>
				<div class="content-main">
				<div class="content-header">
				<div class="header-inner">
				<h3 class="header-title">收到的评论</h3>
				</div>
				<HR id="divide-line" align="center" width=650 color=#E6E6E6 SIZE=1 style="position:absolute; top: 37px">
				</div> 
			<c:forEach var="commentsList" items="${requestScope.commentsList}">
				<table width="70%">
				<tr>
				<td width="1%"></td>
						<td class="article_content" colspan="3">
							${commentsList.article_content}
						</td>
					</tr>
					<tr>
					<td width="1%"></td>
						<td class="articlePic" colspan="2" width="10%">
							<a href="files/${commentsList.article_pic}" target="_blank"><img width="200px" src="files/${commentsList.article_pic}" /></a>
						</td>

					</tr>
					</table>
			<c:forEach var="commentDetail" items="${commentsList.commentDetail}">
					<table width="100%">
					<tr>
				<td width="4%"></td>
						<td rowspan="2" width="5%">
							<img class="profile-img" src="files/${commentDetail.photo}"
								style="width: 40px; height: 40px;">
						</td>
					</tr>
					<tr>
					<td width="3%"></td>
						<td class="profile-detail" width="5%">
							<font size="2" color="#0A8CD2"><strong>${commentDetail.ID}
							</strong></font></td>
					<td width="3%"><font size="2">说：</font></td>
						
						<td class="comments_content" colspan="2">
							<font size="2">${commentDetail.comments_content}</font>
						</td>
					</tr>
					
					</table>
			</c:forEach>
					<hr width=95% size=1 color=#E6E6E6>
					
				</c:forEach>
				</div>
				
				</div>
			
			</font>
  </body>
</html>
