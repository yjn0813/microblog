<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String flag = (String) request.getAttribute("flag");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
	<head>
		<base href="<%=basePath%>">

		<title>注册画面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
//创建ajax
	function createXMLHttpRequest() {
	var xmlreq=false;
	if(window.XMLHttpRequest){
		xmlreq=new XMLHttpRequest();
	}
	else if(window.ActiveXObject){
		try{
			xmlreq=new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e1){
			try{
				xmlreq=new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e2){
				
			}
		}
	}
	return xmlreq;
}

	//输入姓名后，调用该方法，判断用户名是否可用
	function nameIsNull(){
		var id=document.registForm.ID.value;
		if(id==""){
			alert("<bean:message key="iderror"/>");
			document.registForm.ID.focus();
			return false;
		}
		var request=createXMLHttpRequest();//创建ajax
		request.open("post","regist.do?ID="+id+"&flag=0");
		request.send();
		//当readyState属性改变时的事件处理
		request.onreadystatechange=function(){
			if(request.readyState==4){//响应完成
				if(request.status==200){//一切顺利
					var value=request.responseText;//从服务器获得响应信息
					document.all.unc.innerHTML=value;//改变控件unc的值
				}
			}
		}
	}
	function allIsNull(){
		var id=document.registForm.ID.value;
		var pwd=document.registForm.PW.value;
		var repwd=document.registForm.PW_CFM.value;
		
		if(id==""){
			alert("<bean:message key="iderror"/>");
			document.registForm.ID.focus();
			return false;
		}
		
		if(pwd==""){
			alert("<bean:message key="passwordInput1"/>");
			document.registForm.PW.focus();
			return false;
		}
		if(repwd==""){
			alert("<bean:message key="passwordInput2"/>");
			document.registForm.PW_CFM.focus();
			return false;
		}
		if(pwd!=repwd){
			alert("<bean:message key="passwordInput3"/>");
			document.registForm.PW.value="";
			document.registForm.PW_CFM.value="";
			document.registForm.PW_CFM.focus();
			return false;
		}
		
		
		document.registForm.submit();
		return true;
	}
	
</script>
<style type="text/css">
.header {
	position: relative;
	top: 10px;
	left: 260px;
}
.center{
	width: 800px;
	height:380px;
	margin-top: 20px;
	margin-left:260px;
	background: white url("img/bg_vline.png") no-repeat 580px 18;
	border-radius: 10px;
}
.regist-title{
	margin-top:45px;
	margin-left: 120px;
	display: inline-block;
    font-size: 22px;
    color: #333;
	line-height: 33px;
}
.regist-form {
	margin-top: -5px;
	margin-left: 37px;
	width: 500px;
	height: 270px;
}

.id {
	padding-top: 20px;
	padding-left: -20px;
}
.id i{
	color: red;
	font-family: inherit;
	padding-right: 4px;
}
.pw1 {
	padding-top: 25px;
	margin-left: -16px;
}
.pw1 i{
	color: red;
	font-family: inherit;
	padding-right: 4px;
}
.pw2 {
	padding-top: 25px;
	margin-left: -16px;
}
.pw2 i{
	color: red;
	font-family: inherit;
	padding-right: 4px;
}


a:hover {
	text-decoration: underline;
}

a {
	color: #0A8CD2;
	text-decoration: none;
}
.next-button{
	margin-top: 25px;
	padding-left: 90px;
}
.right{
	margin-top: -300px;
	margin-left: 610px;
}
.pic{
	margin-top: 45px;
}
.footer{
	width:740px;
	height:10px;
	margin-top: 5px;
	margin-left: 260px;
	padding: 15px 30px 30px;
	background: url("img/footer_top_bg.jpg") no-repeat center top #F7F7F8;
	text-align: center;
}
.footer a{
	color: gray;
}

a:hover, a:visited:hover {
color: #0A8CD2;
text-decoration: underline;
}

.footer i{
	margin: 0 10px;
	color: gray;
}
.language{
	margin-left: 12px;
}
</style>

	</head>

	
		<body style="background: url('img/bg_repeat_reg.png') repeat-x scroll 0 0 #C8E1F0; margin: -5 0">
		<font face="微软雅黑">
			<div style="background: url('img/bg_reg.png') no-repeat scroll center top transparent">
				<div class="header">
					<a href=""><img alt="" src="img/logo.png"> </a>
				</div>
			<div class="center">
			<div class="left">
			<h2 class="regist-title"><bean:message key="apply"/></h2>
			<div class="regist-form">
			<html:form method="post" action="regist.do?flag=1">
							<div class="id">
								<i>*</i><font><strong><bean:message key="id"/></strong> </font>
								<input type="text" name="ID" maxlength="20" style="width: 160px; height: 26px" onblur="nameIsNull()">
								<font color="red" size="-1" id="unc"></font>
							</div>
							<div class="pw1">
								<i>*</i><font><strong><bean:message key="password1"/></strong> </font>
								<input type="password" name="PW" value="" maxlength="20"
										style="width: 160px; height: 26px" /><font size="2"><span >※<bean:message key="notice" /></span></font>
							</div>
							<div class="pw2">
								<i>*</i><font><strong><bean:message key="password2"/></strong> </font>
								<input type="password" name="PW_CFM" value="" maxlength="20"
										style="width: 160px; height: 26px" />
							</div>
							<input type="hidden" name="article_num" value="0"/>
							<input type="hidden" name="follow_num" value="0"/>
							<input type="hidden" name="fan_num" value="0"/>
							<input type="hidden" name="comment_num" value="0"/>
							<input type="hidden" name="forward_num" value="0"/>
							<div class="next-button">
							<input type="image" alt="下一步" src=<bean:message key="next-button1"/>
				onmouseover="this.src='<bean:message key="next-button2"/>'"
				onmouseout="this.src='<bean:message key="next-button1"/>'" onclick="allIsNull()">
									</div>
						</html:form>
	    	</div>
			</div>
			<div class="right">
			<h4 class="login-text"><bean:message key="haveAaccount"/><a href="Login.jsp"><bean:message key="toLogin"/></a></h4>
			<div class="pic"><img alt="" src="img/cats.jpg"/></div>
			</div>
			</div>
			<div class="footer">
				
				<font size="2"><a href="Help.jsp" target="_blank"><bean:message key="help"/></a>
				<i>\</i>
				<a href="Verified.jsp" target="_blank"><bean:message key="identification"/></a>
				<i>\</i>
				<a href="Open.jsp" target="_blank"><bean:message key="openPlatform"/></a>
				<i>\</i>
				<a href="Guide.jsp" target="_blank"><bean:message key="guide"/></a></font>
				<select class="language" onchange="location.href=this.value">
				<%if(flag!=null && "1".equals(flag)){%>				
				<option value="japanese.do"><bean:message key="japanese"/></option>
				<option value="chinese.do"><bean:message key="chinese"/></option>
				<%}else{%>
				<option value="chinese.do"><bean:message key="chinese"/></option>
				<option value="japanese.do"><bean:message key="japanese"/></option>
				<%}%>
				</select>
				</div>
			</div>
</font>
</body>
	
</html:html>
