<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

		<title>添加转发内容</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
<style type="text/css">
.forwardButton{
	position:absolute;
	top:85px;
	left:398px;
	color: #fff;
	border-radius: 4px;
	width:55px;
	height:25px;
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
			<form action="addForward.do" name="addForwardDetailForm" method="post">
				<table width="50%">
					<tr>
						<td>
							<input type="hidden" name="forward_id" value='<%=BaseBusyness.getStringID()%>'>
							<input type="hidden" name="ID" value="${user.ID}">
							<input type="hidden" name="article_id" value="${requestScope.articleDetail.article_id}">
							<textarea name="forward_content" rows="4" cols="60"
								class="textareaInput" style="overflow: hidden; resize: none;">转发微博</textarea>
						</td>
					</tr>
					<tr>
						<td align="right">
						<input type="submit" class="forwardButton" value="转发">
						</td>
					</tr>
				</table>
			</form>
			<table width="100%">

				<tr>
					<td rowspan="3" width="20px">
						<img class="profile-img" alt=""
							src="files/${requestScope.articleDetail.photo}"
							style="width: 70px; height: 70px;">
					</td>
				</tr>
				<tr>
					<td class="profile-detail">
						<font size="3"><strong><a href="">${requestScope.articleDetail.ID}</a>
						</strong> </font>
					</td>
				</tr>
				<tr>
					<td class="article_content" colspan="2">
						${requestScope.articleDetail.article_content}
					</td>
				</tr>
				<tr>
					<td class="articlePic" colspan="2"
						style="position: relative; left: 76px;">
						<a href="files/${requestScope.articleDetail.articlePic}"
							target="_blank"><img width="200px"
								src="files/${requestScope.articleDetail.articlePic}" />
						</a>

					</td>

				</tr>
			</table> </font>
	</body>
</html>
