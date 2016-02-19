<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Business.*"%>
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

		<title>显示关注人的微博</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="css/theme2.css" media="all">
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
	
</script>
<style type="text/css">
.header-title{
	position: inherit;
	top: 5px;
	margin-left: 5px;
}
.comments-area {
	z-index: 7000;
	width: 120px;
	color: #999;
}

.comments {
	z-index: 8000;
	float:right;
	padding-right: 30px;
	height: 30px;
	cursor: pointer;
}

.list li{
	float:right;
	margin: 10px 15px 0 0;
	padding: 0 5px 0 0;
	
}
.list1{
	position:relative;
	left:20px;
}
.list2{
	position:relative;
	top:5px;
	left:30px;
	line-height:10px;
	border-right-width: 1px;
	border-right-style: solid;
	border-color: #AEAEAE;

}
.comments-area{
	margin-top:50px;
	margin-right:190px;
	float:right;
	display:none
}
.commentButton{
	position: relative;
	top: 5px;
	left: 327px;
	color: #fff;
	border-radius: 4px;
	width:45px;
	height:22px;
	text-shadow: 0 -1px 1px rgba(0, 0, 0, .25);
	background-color: #019ad2;
	background-repeat: repeat-x;
	border-color: #057ed0;
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
				<h3 class="header-title">关注的微博</h3>
				</div>
				<HR id="divide-line" align="center" width=706 color=#E6E6E6 SIZE=1 style="position:absolute; top: 35px">
		</div>
		<c:forEach var="followsArticleList" items="${requestScope.followsArticleList}" varStatus="idx">
					<table width="95%">
					<tr>
						<td rowspan="3" width="20px">
							<img class="profile-img" alt="" src="files/${followsArticleList.photo}"
								style="width: 70px; height: 70px;">
						</td>
					</tr>
					<tr>
						<td class="profile-detail">
							<font size="3"><strong>${followsArticleList.follow_id}
							</strong>
							</font>
						</td>
					</tr>
					<tr>
						<td class="article_content" colspan="2">
							${followsArticleList.article_content}
						</td>
					</tr>
					<tr>
						<td class="articlePic" colspan="2"
							style="position: relative; left: 76px;">
							<a href="files/${followsArticleList.articlePic}" target="_blank"><img width="200px" src="files/${followsArticleList.articlePic}"/></a>
							
						</td>

					</tr>
			</table>
			<ul class="list" style="list-style: none;">
					
					<li class="list1"><a href="#" onclick="return false" class="comments"><font size="2">评论</font></a></li>
					<li class="list2"><a href="articleDetail.do?article_id=${followsArticleList.article_id}" class="addForward">
					<font size="2">转发</font></a></li>
					
			</ul>	
				<div class="comments-area">
				
					<form action="addComments.do" name="commentsAddForm" method="post">
						<input type="hidden" name="ID" value="${user.ID}">
						<input type="hidden" name="comments_id" value='<%=BaseBusyness.getStringID()%>'>
						<input type="hidden" name="article_id" value="${followsArticleList.article_id}">
						<textarea rows="1" cols="50" name="comments_content" style="overflow: hidden; resize: none;"></textarea>
						<input type="submit" class="commentButton" value="评论">
					</form>
				</div>
				<hr width=95% size=1 color=#E6E6E6>
			
			</c:forEach> 
		</font>
</body>

</html>
