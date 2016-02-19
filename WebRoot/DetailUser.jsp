<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

		<title>My JSP 'DetailUser.jsp' starting page</title>

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
				<td align="center" width="15%">
					<strong>用户头像</strong>
				</td>
				<td align="center" width="10%">
					<strong>用户ID</strong>
				</td>
				<td align="center">
					<strong>邮箱</strong>
				</td>
				<td align="center">
					<strong>性别</strong>
				</td>
				<td align="center">
					<strong>地址</strong>
				</td>
				<td align="center">
					<strong>生日</strong>
				</td>
				<td align="center">
					<strong>血型</strong>
				</td>
				<td align="center" width="30%">
					<strong>个人简介</strong>
				</td>


			</tr>
			<tr>
					<td align="center" width="15%">
						<strong><img width="70" src="files/${detailUser.photo}">
						</strong>
					</td>
					<td align="center" width="10%">
						<font size="4"><strong>${detailUser.ID}</strong>
						</font>
					</td>
					<td align="center">
						<strong>${detailUser.mail}</strong>
					</td>
					<td align="center">
						<strong>${detailUser.sex}</strong>
					</td>
					<td align="center">
						<strong>${detailUser.address}</strong>
					</td>
					<td align="center">
						<strong>${detailUser.birthday}</strong>
					</td>
					<td align="center">
						<strong>${detailUser.blood}</strong>
					</td>
					<td align="center" width="30%">
						<strong>${detailUser.profile}</strong>
					</td>
				</tr>

		</table>
	</body>
</html>
