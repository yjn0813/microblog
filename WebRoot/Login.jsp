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

		<title>登陆画面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	//检查用户名和密码是否为空
	function allIsNull(){
		var id=document.loginForm.ID.value;
		var pwd=document.loginForm.PW.value;
		if(id==""){
			alert("<bean:message key="iderror"/>");
			document.loginForm.ID.focus();
			return false;
		}
		if(pwd==""){
			alert("<bean:message key="passwordInput1"/>");
			document.loginForm.PW.focus();
			return false;
		}
		
		return true;
	}
	
	//刷新验证码
	function refreshCode(){
       document.getElementById("code").src = "checkCodeImg.jsp?t="+Math.random();
    }
</script>
<style type="text/css">
.header {
	position: relative;
	top: 10px;
	left: 260px;
}

.center-line {
	margin-top: -1px;
	margin-left: 260px;
}

.topboard {
	margin-top: 15px;
	margin-left: 260px;
}

.right-img {
	margin-top: -20px;
	margin-left: 508px;
	padding: 20px 6px 20px 5px;
	background: url("img/login_vline.png") left no-repeat;
}

.login-form {
	margin-top: -290px;
	margin-left: 260px;
	background-color: white;
	background-repeat: no-repeat;
	width: 250px;
	height: 270px;
}

.id {
	text-indent: -14;
	padding-top: 20px;
	padding-left: 50px;
}

.id-text {
	padding-top: 10px;
	padding-left: -10px;
}

.pw {
	padding-top: 10px;
	padding-left: 36px;
}

.pw-text {
	padding-top: 8px;
	margin-left: 0px;
}

.checkCodeText {
	padding-top: 15px;
	padding-left: 37px;
}

.checkCodeImg {
	margin-top: -22px;
	padding-left: 70px;
}

.reflash {
	margin-top: -20px;
	padding-left: 75px;
}

a:hover {
	text-decoration: underline;
}

a {
	color: #0A8CD2;
	text-decoration: none;
}
.login-button{
	margin-top: 15px;
	padding-left: 35px;
}
.regist-text{
	margin-top: 10px;
	margin-left: 2px;
}
.footer{
	width:740px;
	height:10px;
	margin-top: 4px;
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
	
		<body style="background: url('img/bg_repeat_reg.png') repeat-x scroll 0 0 #C8E1F0;margin: -5 0">
		<font face="微软雅黑">
			<div style="background: url('img/bg_reg.png') no-repeat scroll center top transparent;">
				<div class="header">
					<a href=""><img alt="" src="img/logo.png"> </a>
				</div>
				<div class="topboard">
					<img alt="" src="img/login_default.jpg">
				</div>
				<div class="center">
				<div class="center-line">
				<img alt="" src="img/bg_topline.png">
				</div>
					<div class="right-img">
						<img alt="" src="img/big_energy.jpg">
					</div>
					<div class="login-form">
						<html:form method="post" action="login.do?notice_id=1">
							<div class="id">
								<font><strong><bean:message key="id"/></strong> </font>
								<div class="id-text">
									<input type="text" name="ID" maxlength="20"
										style="width: 160px; height: 26px">
								</div>
							</div>


							<div class="pw">
								<font><strong><bean:message key="password"/></strong> </font>
								<div class="pw-text">

									<input type="password" name="PW" value="" maxlength="20"
										style="width: 160px; height: 26px" />

								</div>

							</div>
							<div class="checkCodeText">
								<html:text property="checkcode" maxlength="4" style="width: 55px; height: 24px"/>
									
								<div class="checkCodeImg">
									<img id="code" src="checkCodeImg.jsp" />
									<div class="reflash">
										<font size="2.5"><a href="javascript:refreshCode();"><bean:message key="refreshcheck"/></a>
										</font>
									</div>
								</div>
							</div>
							<div class="login-button">
							<input type="image" src=<bean:message key="login-button1"/>
				onmouseover="this.src='<bean:message key="login-button2"/>'"
				onmouseout="this.src='<bean:message key="login-button1"/>'"
				alt="登陆" onclick="allIsNull()"/>
							<div class="regist-text">
							<font size="2">还未登上热气球？<a href="Regist.jsp">马上申请~＞▽＜</a></font>
							</div>		
							</div>
					</html:form>
						<font color=red>
	<html:errors/><br>
	</font>
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
