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
    
    <title>查看个人资料</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/wpCalendar.js" charset="utf-8"></script>
<script type="text/javascript">
	//验证日期类型
function checkDate(da){
	var b=/((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;
	if(!b.test(da)){
		return false;
	}else{
		return true;
	}
}
//验证是否输入
	function allIsnull(){
		var mail=document.updateMemberDetailForm.mail.value;
		var address=document.updateMemberDetailForm.address.value;
		var birthday=document.memberAddFrom.birthday.value;
		var profile=document.updateMemberDetailForm.profile.value;
	if(mail==""){
		alert("请输入邮箱！");
		

document.updateMemberDetailForm.mail.focus();
		return false;
	}
	
	if(address==""){
		alert("请输入地址！");
		

document.updateMemberDetailForm.address.focus();
		return false;
	}
	
	//验证日期类型
	if(birthday!=""&&birthday.length>0){
		if(!checkDate(birthday)){
			alert("日期格式不正确，请按照YYYY-MM-DD或YYYY/MM/DD或 YYYY-M-D或 YYYY/M/D输入！");
			document.memberAddFrom.birthday.value="";
			document.memberAddFrom.birthday.focus();
			return false;
		}
	}
	
	if(profile==""){
		alert("请输入个人简介！"); 
		

document.memberAddFrom.profile.focus();
		return false;
	}
	
	//验证单选框
	if((document.updateMemberDetailForm.sex

[0].checked)==false
         &&(document.updateMemberDetailForm.sex

[1].checked)==false){
         alert("请选择性别！");
         return false;
     }
     
     
	document.updateMemberDetailForm.submit();
	return true;
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
}

.searchText:focus {
	color: #0A0A0A;
	background-color: white;
}

.search_btn {
	display: inline-block;
	margin-top: -10px;
	margin-left: -21px;
	vertical-align: middle;
}
.center{
	width: 800px;
	height:380px;
	margin-top: 60px;
	margin-left:310px;
	background: white no-repeat;
	border: 2px solid #efefef;
	-webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 60px rgba(0, 0, 0, 0.1) inset;
	-moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 60px rgba(0, 0, 0, 0.1) inset; 
	-o-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 60px rgba(0, 0, 0, 0.1) inset;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 60px rgba(0, 0, 0, 0.1) inset;
	
}

.center-title{
	position: absolute;
	top:-65px;
	left:110px;
    text-indent: -70px;
}	
.memberUpdate-form{
	position: absolute;
	top: 140px;
	left: 350px;
}
.memberUpdateForm{
	position: relative;
	top: 20px;
	left: -10px;
}
.update-button{
	position: absolute;
	top: 270px;
	left: 60px;
}
.pic{
	position: absolute;
	top: 160px;
	left: 700px;
	
}
</style>
  </head>
  <body style="background: url('img/bg_repeat_reg.png') repeat-x scroll 0 0 #C8E1F0; margin: 0 0">
    <font face="微软雅黑">
		
		<div class="blue" style="background: url('img/bg_reg.png') no-repeat scroll center top transparent;">
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
						<input type="text" name="search" class="searchText"/>
						<input type="image" src="img/search-icon.png" class="search_btn"/>
					</form>

				</div>
				<div class="center">
			
			<div class="memberUpdate-form">
			
			<form action="updateMemberDetail.do" name="updateMemberDetailForm" method="post" enctype="multipart/form-data" class="memberUpdateForm">
			<h2 class="center-title"><input type="text" name="ID" value="${user.ID}" readonly="readonly" style="width: 90px;">资料页</h2>
			<table>
							<tr>
							<td>邮箱：</td>
							<td><input type="text" name="mail" maxlength="20" value="${requestScope.detailmember.mail}"></td>
							</tr>
							<tr>
							<td>性别：</td>
							<td><input type="radio" name="sex" value="男" ${requestScope.detailmember.sex=="男" ? "checked='checked'" : ""}/>男
							<input type="radio" name="sex" value="女" ${requestScope.detailmember.sex=="女" ? "checked='checked'" : ""}/>女
							</td>
							</tr>
							<tr>
							<td>头像：</td>
							<td><input type="file" name="file"></td>
							</tr>
							<tr>
							<td>所在地</td>
							<td><select name="address">
							<option value="大连" <c:if test="${requestScope.detailmember.address=='大连'}"> selected </c:if> >大连</option>
							<option value="北京" <c:if test="${requestScope.detailmember.address=='北京'}"> selected </c:if> >北京</option>
							<option value="上海" <c:if test="${requestScope.detailmember.address=='上海'}"> selected </c:if> >上海</option>
							<option value="深圳" <c:if test="${requestScope.detailmember.address=='深圳'}"> selected </c:if> >深圳</option>
							<option value="重庆" <c:if test="${requestScope.detailmember.address=='重庆'}"> selected </c:if> >重庆</option>
							<option value="沈阳" <c:if test="${requestScope.detailmember.address=='沈阳'}"> selected </c:if> >沈阳</option>
							</select></td>
							
							</tr>
							<tr>
							<td>出生日期：</td>
							<td><input type="text" name="birthday" maxlength="10" value="${requestScope.detailmember.birthday}" onfocus="showCalendar(this)" />YYYY-MM-DD</td>
							</tr>
							<tr>
							<td>血型：</td>
							<td><select name="blood">
							<option value="A" <c:if test="${requestScope.detailmember.address=='A'}"> selected </c:if> >A</option>
							<option value="B" <c:if test="${requestScope.detailmember.address=='B'}"> selected </c:if> >B</option>
							<option value="AB" <c:if test="${requestScope.detailmember.address=='AB'}"> selected </c:if> >AB</option>
							<option value="O" <c:if test="${requestScope.detailmember.address=='O'}"> selected </c:if> >O</option>
							</select></td>
							</tr>
							<tr>
							<td>个人简介：</td>
							<td><textarea name="profile" rows="5" cols="20" style= "overflow:hidden; resize:none; ">${requestScope.detailmember.profile}</textarea><span class="notice">※请不要超过70个字</span>
							</td>
							</tr>
							</table>
							
							<div class="update-button">
							<input type="image" alt="修改" src="img/update-button1.gif"
				onmouseover="this.src='img/update-button2.gif'"
				onmouseout="this.src='img/update-button1.gif'" onclick="allIsnull()">
									</div>
						</form>
	    </div>
			<div class="pic"><img src="img/MemberDetail.jpg" width="300px"/></div>
			</div>
				</div>
  </font>
   </body>
</html>
