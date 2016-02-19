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

		<title>我的微博</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="css/theme.css" media="all">
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/charcount.js"></script>
		<script type="text/javascript">
		jQuery(document).ready(function($) {
			$('.theme-newArticle').click(function(){
			$('.theme-popover-mask').fadeIn(100);
			$('.theme-popover').slideDown(200);
		})
			$('.theme-poptit .close').click(function(){
			$('.theme-popover-mask').fadeOut(100);
			$('.theme-popover').slideUp(200);
	})

})
$(document).ready(function(){	
		//default usage
		$("#message").charCount();
		
	});
	
	//检查是否输入
	function allIsNull(){
		var article_content=document.newArticleForm.article_content.value;
		if(article_content==""){
			alert("微博内容不能为空！");
			document.newArticleForm.article_content.focus();
			return false;
		}
				document.newArticleForm.submit();
		return true;
	}

	function SetRightHeight(){
		var right=document.getElementById("right");
		if (document.getElementById){
		if (right && !window.opera){
		if (right.contentDocument && right.contentDocument.body.offsetHeight)
		right.height = right.contentDocument.body.offsetHeight+20; 
		else if(right.Document && right.Document.body.scrollHeight)
		right.height = right.Document.body.scrollHeight;
		}
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
.exit{
	position: absolute;
	left: 1085px;
}
.newArticle {
	position: absolute;
	margin-left: 350px;
}

.blue #slatenav ul li a:hover,.blue #slatenav ul li a.current {
	color: #fff;
	background: transparent url(img/blueslate_backgroundOVER.gif) no-repeat
		top center;
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
}

.searchText:focus {
	color: #0A0A0A;
	background-color: white;
}

.search_btn {
	display: inline-block;
	margin-top: -11px;
	margin-left: -25px;
	vertical-align: middle;
}

.mini-profile {
	font-size: 12px;
	background-color: white;
}

.module {
	position: relative;
	top: 30px;
	left:90px; 
	line-height : 16px;
	border-radius: 6px;
	text-shadow: 0 1px 0 #fff;
	border: 5px dashed #D5F1FF;
	width: 250px;
	height: 146px;
	

}
.profile-img{
	position: absolute;
	top: 16px;
	left: 16px;
	float:left;
	width: 80px;
	height: 80px;
	background: white no-repeat;
	border: 3px solid #efefef;
	
	
	
}
.profile-detail {
	position: absolute;
	top: 20px;
	left: 110px;
	color: black;
	text-decoration: none;
	
}
.profile-update{
	position: absolute;
	top: 45px;
	left: 110px;
	color:#C5C1AA;
	text-decoration: none;
}
.profile-list{
	position: absolute;
	top: 90px;
	left: -24px;
	list-style: none;
	overflow: hidden;
}
.flex-module-inner ul{
	list-style: none;
	text-indent: 20px;
	margin-top: 40px;	
}
.flex-module-inner li{
	float: left;
	margin: 0 25px 10px -15px;
}
.profile-list li {
	float: left;
	margin: 10 5px 0 0;
	padding: 0 5px 0 0;
	border-right-width: 1px;
	border-right-style: solid;
	border-color: #E6E6E6;
}
.profile-list li span{
	float: left;
}
.profile-list li.list3{
	border-right-width: 0;


}

li a {
	color: black;
	text-decoration: none;
}
.trends{
	position: absolute;
	top: 183px;
	left:-4px;
	height:300px;
	background-color: white;
}
.flex-module-header{
	position: absolute;
	top: -2px;
	left: 12px;
}
.content-main{
	position: absolute;
	top: 72px;
	left:390px;
	width:710px;
	line-height: 16px;
	border-radius: 6px;
	text-shadow: 0 1px 0 #fff;
	border: 5px dashed #D5F1FF;
	background-color: white;
}

.header-title{
	position: inherit;
	top: 5px;
	margin-left: 21px;
}

a:hover,a:visited:hover {
	color: #0A8CD2;
	text-decoration: underline;
}


</style>

	</head>
		<body style="background: url('img/bg_repeat_reg.png') repeat-x scroll 0 0 #C8E1F0; margin: 0 0">
		<%
		if(session.getAttribute("user")==null){
        response.sendRedirect("Login.jsp");
   }
   %>
		<font face="微软雅黑">
		<div class="blue" style="background: url('img/bg_reg_home.png') no-repeat scroll center top transparent;">
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
							<a href="queryMyComments.do?userid=${sessionScope.user.ID}">评论</a>
						</li>
						<li>
							<a href="My.jsp" class="current">我</a>
						</li>
						<li>
							<a class="newArticle newArticle-primary newArticle-large theme-newArticle" href="javascript:;">写微博</a>
						</li>
						<li class="exit">
							<a href="exit.do">退出</a>
						</li>
					</ul>
			
					<form action="search.do" name="searchForm" method="post">
						<input type="text" name="search" class="searchText"/>
						<input type="image" src="img/search-icon.png" class="search_btn"/>
					</form>
			
				</div>
				
	 <div class="theme-popover">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3 class="theme-title">有什么新鲜事？</h3>
     </div>
     <div class="theme-popbod dform">
  
           <form action="newArticle.do" name="newArticleForm" class="theme-signin" method="post" enctype="multipart/form-data">
           <input type="hidden" name="ID" value="${sessionScope.ID}">
           <input type="hidden" name="article_id" value='<%=BaseBusyness.getStringID()%>'>
           <textarea name="article_content" rows="6" cols="60" id="message" class="textareaInput" style= "overflow:hidden; resize:none; "></textarea>
           <input type="file" name="file">
           <input type="button" class="submit-button" value="发微博" onclick="allIsNull()">
           </form>
    
     </div>
     </div>
     <div class="theme-popover-mask"></div>
				<div class="dashboard">
					<div class="module mini-profile">
						<div class="profile-summary">
							
							<strong><font size="3">
							<img class="profile-img" alt="" src="files/${user.ID}.jpg">
							<a href="" class="profile-detail">${sessionScope.user.ID}</a> 
							</font></strong>
							<font size="2"><a href="memberDetail.do" class="profile-update">查看个人资料</a></font>
							
						</div>
						<div class="mini-profile-stats-container">
							<ul class="profile-list">
								<li class="list1">
									<a href="My.jsp"><font size="4">${num.article_num}</font>
									<span>微博</span></a>
								</li>
								
								<li class="list2">
									<a href="queryFollows.do"><font size="4">${num.follow_num}</font>
									<span>关注</span></a>
									
								</li>
								<li class="list3">
									<a href="queryFans.do"><font size="4">${num.fan_num}</font>
									<span>粉丝</span></a>
									
								</li>
							</ul>
						</div>
						<div class="module trends">
						<div class="flex-module trends-inner">
						<div class="flex-module trends-container">
						<div class="flex-module-header">
						<h3>公告栏</h3>
						</div>
						<div class="flex-module-inner">
						<ul>
						<li><font size="2" color="black">${notice.notice_content}</font></li>
						<li><font size="2" color="black">*★,°*:.☆\(￣▽￣)/$:*.°★* 。</font></li>
						<li><img alt="" src="img/cat.jpg" width="150px"></li>
						</ul>
						</div>
						</div>
						</div>
						</div>
					</div>
				</div>
				
				<div class="content-main">
				
				<div class="stream-container">
				
				<iframe onload="Javascript:SetRightHeight(this)" src="queryMyArticles.do" id="right" name="right" width="100%" scrolling="no" frameborder="0" class="iframe-articles"></iframe>
				
				</div>
				
				
				</div>
				</div>
			</font>
		</body> 
		
</html>
