<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="Business.*"%>
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

		<title>显示微博</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript">
		$(function(){
	    $(".comments").click(function(){
		var block = $(".comments-area").eq($(".comments").index(this));
		if(block.is(":visible")){
			block.hide();
			$(this).children().text("评论")
			}else{
			block.show();
			$(this).children().text("评论")	
			}		
		})
	})
	function checkDel(article_id) {
		if (window.confirm("是否删除 ？")) {
			window.location.href = "deleteArticle.do?article_id=" + article_id;
		}
	}
</script>
<style type="text/css">
.header-title{
	position: inherit;
	top: 5px;
	margin-left: 5px;
}
.list li{
	float:right;
	margin: 10px 5px 0 0;
	padding: 0 5px 0 0;
	
}
.list1{
	position:relative;
	top:-10px;
	left:-20px;
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

	<body>
		<font face="微软雅黑"> 
		<div class="content-header">
				<div class="header-inner">
				<h3 class="header-title">我的微博</h3>
				</div>
				<HR id="divide-line" align="center" width=700 color=#E6E6E6 SIZE=1 style="position: absolute; top: 35px">
		</div>
			
		<c:forEach var="article" items="${requestScope.articleList}">

				<table width="95%">
					<tr>
						<td rowspan="3" width="20px">
							<img class="profile-img" alt="" src="files/${user.ID}.jpg"
								style="width: 70px; height: 70px;">
						</td>
					</tr>
					<tr>
						<td class="profile-detail">
							<font size="3"><strong>${sessionScope.user.ID}
							</strong>
							</font>
						</td>
					</tr>
					<tr>
					
						<td class="article_content" colspan="2">
							${article.article_content}
						</td>
					</tr>
					<tr>
						<td class="articlePic" colspan="2"
							style="position: relative; left: 76px;">
							<a href="files/${article.articlePic}" target="_blank"><img width="200px" src="files/${article.articlePic}" /></a>
						</td>

					</tr>
				</table>
			<ul class="list" style="list-style: none;">
					<li class="list1"><a href="javascript:checkDel('${article.article_id}')"><font size="2">删除</font></a></li>
			</ul>
				<hr width=95% size=1 color=#E6E6E6>
			</c:forEach> 
			
			</font>
	</body>

</html>
