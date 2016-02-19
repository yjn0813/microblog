<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加会员详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" media="screen,projection,tv"
			href="css/home.css" />


<style type="text/css">
	.header {
	margin-left: 260px;
}
.center{
	width: 800px;
	height:380px;
	margin-top: 30px;
	margin-left:260px;
	background: white no-repeat;
	border: 2px solid #efefef;
	-webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 60px rgba(0, 0, 0, 0.1) inset;
	-moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 60px rgba(0, 0, 0, 0.1) inset; 
	-o-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 60px rgba(0, 0, 0, 0.1) inset;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 60px rgba(0, 0, 0, 0.1) inset;
	
}

.center-title{
	position: absolute;
	top:-60px;
	left:20px;
    font-size: 22px;
    color: #333;
    text-indent: -70px;
}	
.memberAdd-form{
	position: absolute;
	top: 160px;
	left: 330px;
}
.regist-button{
	position: absolute;
	top: 270px;
	left: 60px;
}
.pic{
	position: absolute;
	top: 150px;
	left: 700px;
	
}
	</style>
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
		var mail=document.memberAddFrom.mail.value;
		var address=document.memberAddFrom.address.value;
		var birthday=document.memberAddFrom.birthday.value;
		var profile=document.memberAddFrom.profile.value;
	if(mail==""){
		alert("请输入邮箱！");
		

document.memberAddFrom.mail.focus();
		return false;
	}
	
	if(address==""){
		alert("请输入地址！");
		

document.memberAddFrom.address.focus();
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
	if((document.memberAddFrom.sex

[0].checked)==false
         &&(document.memberAddFrom.sex

[1].checked)==false){
         alert("请选择性别！");
         return false;
     }
     
     
	document.memberAddFrom.submit();
	return true;
}

</script>
  </head>

		<body style="background: url('img/bg_repeat_reg.png') repeat-x scroll 0 0 #C8E1F0;">
		 <font face="微软雅黑">
			<div style="background: url('img/bg_reg.png') no-repeat scroll center top transparent;">
				<div class="header">
					<a href=""><img alt="" src="img/logo.png"> </a>
				</div>
			<div class="center">
			
			<div class="memberAdd-form">
			<html:form method="post" action="memberAdd.do" enctype="multipart/form-data">
			<h2 class="center-title">用户<input type="text" name="ID" value="${requestScope.ID}" readonly="readonly" style="width: 90px;">请您完善资料以便获得更多体验</h2>
							<table>
							<tr>
							<td>邮箱：</td>
							<td><input type="text" name="mail" maxlength="20"></td>
							</tr>
							<tr>
							<td>性别：</td>
							<td><input type="radio" name="sex" value="男" checked="checked"/>男
							<input type="radio" name="sex" value="女"/>女
							</td>
							</tr>
							<tr>
							<td>上传头像：</td>
							<td><html:file property="file"></html:file></td>
							</tr>
							<tr>
							<td>所在地</td>
							<td><select name="address">
							<option selected="selected">大连</option>
							<option>北京</option>
							<option>上海</option>
							<option>深圳</option>
							<option>重庆</option>
							<option>沈阳</option>
							</select> </td>
							
							</tr>
							<tr>
							<td>出生日期：</td>
							<td><input type="text" name="birthday" maxlength="10" onfocus="showCalendar(this)"/>YYYY-MM-DD</td>
							</tr>
							<tr>
							<td>血型：</td>
							<td><select name="blood">
							<option selected="selected">A</option>
							<option>B</option>
							<option>AB</option>
							<option>O</option>
							</select></td>
							</tr>
							<tr>
							<td>个人简介：</td>
							<td><textarea name="profile" rows="5" cols="20" style= "overflow:hidden; resize:none; "></textarea><span class="notice">※请不要超过70个字</span></td>
							</tr>
							</table>
							
							<div class="regist-button">
							<input type="image" alt="会员注册" src="img/regist-button1.gif"
				onmouseover="this.src='img/regist-button2.gif'"
				onmouseout="this.src='img/regist-button1.gif'" onclick="allIsnull()">
									</div>
						</html:form>
	    	</div>
			<div class="pic"><img alt="" src="img/cats2.jpg"/></div>
			</div>
			</div>
			</font>
  </body>

</html:html>
