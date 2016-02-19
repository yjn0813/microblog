<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="Entity.Userinfo"%>
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

		<title>搜索结果</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
      function abc(a,b){
        document.forms[1].follow_id.value =a;
        document.forms[1].status.value =b;
        document.forms[1].submit();
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
	left: 200px;
	min-width: 600px;
	width: auto;
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
.followButton {
	margin-top:5px;
	font-size:2px;
	font-weight:bolder;
	color: #fff;
	border-radius: 4px;
	width:52px;
	height:25px;
	text-shadow: 0 -1px 1px rgba(0, 0, 0, .25);
	background-color: #FFA00A;
	border-color: #FFB847;
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
							<h3 class="header-title">
								搜索结果
							</h3>
						</div>
						<HR id="divide-line" align="center" color=#E6E6E6 SIZE=1 style="position:relative;top: -10px;min-width=650;width: auto;">

					</div>

					<div class="stream-container">
					<form action="follow.do" name="followForm" method="post">
					<input type="hidden" name="follow_id">
					<input type="hidden" name="status">
					<input type="hidden" name="ID" value="${user.ID}">

						<table>
							<tr>
								<% ArrayList<Userinfo> list =(ArrayList<Userinfo>)request.getAttribute("userList");
								for (int i=0;i<list.size();i++) {%>
								
									<td rowspan="3" align="left">

										<img class="profile-img" alt="" src="files/<%=list.get(i).getPhoto() %>"
											style="width: 70px; height: 70px;">
									</td>

									<td rowspan="3" align="left">
										<font size="3"><strong><%=list.get(i).getID() %>
										</strong> </font>
								<div>
								
								<%if ("已关注".equals(list.get(i).getStatus())){
								%>								
								<input type="button" class="followButton" value="<%=list.get(i).getStatus() %>" disabled="true"/>									
								<%} else {%>								
								<input type="button" class="followButton" value="<%=list.get(i).getStatus() %>" onclick="abc('<%=list.get(i).getID() %>','已关注')">
								
								<%}	%>	
								</div>
														
								<%}
								
								%>
															
							</tr>
						</table>
						</form>
					</div>
				</div>
			</div> 
		</font>
	</body>
</html>
