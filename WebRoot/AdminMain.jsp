<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>热气球微博后台管理主页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

#top {
	position: absolute;
	top: 20px;
	left: 420px;
}

#up1{
	position: absolute;
	top: 93px;
	left: 300px;
		
}
#up2{
	position: absolute;
	top: 90px;
	left: 470px;
}
#up3{
	position: absolute;
	top: 90px;
	left: 640px;
}
#up4{
	position: absolute;
	top: 90px;
	left: 810px;
}
#up5{
	position: absolute;
	top: 104px;
	left: 955px;
}
#down{
	position: absolute;
	top: 170px;
	left: 210px;
	width: 850px;
	height: 400px;
}

a:hover,a:visited:hover {
	color: red;
	text-decoration: underline;
}


</style>
<script type="text/javascript">
	function showHide(objname) {
		//只对主菜单设置cookie
		var obj = document.getElementById(objname);
		if (objname.indexOf('_1') < 0 || objname.indexOf('_10') > 0) {
			if (obj.style.display == 'block' || obj.style.display == '')
				obj.style.display = 'none';
			else
				obj.style.display = 'block';
			return true;
		}
		//正常设置cookie
		var ckstr = getCookie('menuitems');
		var ckstrs = null;
		var okstr = '';
		var ischange = false;
		if (ckstr == null)
			ckstr = '';
		ckstrs = ckstr.split(',');
		objname = objname.replace('items', '');
		if (obj.style.display == 'block' || obj.style.display == '') {
			obj.style.display = 'none';
			for ( var i = 0; i < ckstrs.length; i++) {
				if (ckstrs[i] == '')
					continue;
				if (ckstrs[i] == objname) {
					ischange = true;
				} else
					okstr += (okstr == '' ? ckstrs[i] : ',' + ckstrs[i]);
			}
			if (ischange)
				setCookie('menuitems', okstr, 7);
		} else {
			obj.style.display = 'block';
			ischange = true;
			for ( var i = 0; i < ckstrs.length; i++) {
				if (ckstrs[i] == objname) {
					ischange = false;
					break;
				}
			}
			if (ischange) {
				ckstr = (ckstr == null ? objname : ckstr + ',' + objname);
				setCookie('menuitems', ckstr, 7);
			}
		}
	}
	//读写cookie函数
	function getCookie(c_name) {
		if (document.cookie.length > 0) {
			c_start = document.cookie.indexOf(c_name + "=")
			if (c_start != -1) {
				c_start = c_start + c_name.length + 1;
				c_end = document.cookie.indexOf(";", c_start);
				if (c_end == -1) {
					c_end = document.cookie.length;
				}
				return unescape(document.cookie.substring(c_start, c_end));
			}
		}
		return null
	}
	function setCookie(c_name, value, expiredays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + expiredays);
		document.cookie = c_name
				+ "="
				+ escape(value)
				+ ((expiredays == null) ? "" : ";expires="
						+ exdate.toGMTString()); //使设置的有效时间正确。增加toGMTString()
	}
	
	
</script>
  </head>
  <font face="微软雅黑">
  <body background="img/adminbg.jpg">
  <%
  if(session.getAttribute("user")==null){
   response.sendRedirect("Login.jsp");
   }
   %>
	<div id="top">
		<center>
			<img alt="" src="img/admin.png">
		</center>
	</div>

		<dl id="up1">
			<dt onClick='showHide("items1_1")'>
				<b>微博管理</b>
			</dt>
			<dd style='display:none' id='items1_1'>
				<table>
					<tr>
						<td><a href="queryAllArticles.do" target="right"
							style="text-decoration: none">查看微博</a>
						</td>
					</tr>
					
					<tr>
						<td><a href="queryAllArticles.do?flag=adminDelArticle" target="right"
							style="text-decoration: none">删除微博</a>
						</td>
					</tr>
					

				</table>
			</dd>
		</dl>
		<dl id="up2">
			<dt onClick='showHide("items1_2")'>
				<b>用户管理</b>
			</dt>
			<dd style='display:none' id='items1_2'>
				<table>
					<tr>
						<td><a href="queryUsers.do"  target="right"
							style="text-decoration: none">查看用户</a>
						</td>
					</tr>
					
					<tr>
						<td><a href="queryUsers.do?flag=delUser"  target="right"
							style="text-decoration: none">删除用户</a>
						</td>
					</tr>
					
				</table>
			</dd>
		</dl>
			<dl id="up3">
			<dt onClick='showHide("items1_3")'>
				<b>评论管理</b>
			</dt>
			<dd style='display:none' id='items1_3'>
				<table>
					<tr>
						<td><a href="queryAllComments.do"  target="right"
							style="text-decoration: none">查看评论</a>
						</td>
					</tr>
					
					<tr>
						<td><a href="queryAllComments.do?flag=delComment"  target="right"
							style="text-decoration: none">删除评论</a>
						</td>
					</tr>
					
					
				</table>
			</dd>
		</dl>
		<dl id="up4">
			<dt onClick='showHide("items1_4")'>
				<b>公告栏管理</b>
			</dt>
			<dd style='display:none' id='items1_4'>
				<table>
					<tr>
						<td><a href="detailNoticeboard.do?notice_id=1" target="right"
							style="text-decoration: none">查看公告栏</a>
						</td>
					</tr>
					<tr>
						<td><a href="detailNoticeboard.do?notice_id=1&flag=update" target="right"
							style="text-decoration: none">修改公告栏</a>
						</td>
					</tr>
					
				</table>
			</dd>
		</dl>
	<div id="up5">
				<a href="exit.do" style="text-decoration: none;">注销</a>
						
		</div>

	<div id="down">
		<iframe src="queryUsers.do" name="right" width="100%" height="100%"
			frameborder="0"> </iframe>
	</div>

  </body>
   </font>
</html>
