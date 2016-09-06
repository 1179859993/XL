<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>CSS3动态背景登录框代码</title>

	<link rel="stylesheet" type="text/css" href="css/styles.css">

  </head>
  
  <body>
    <div class="wrapper">
	<div class="container">
		<h1>MOOC 后台管理</h1>
		<form class="form" action="<%=basePath%>login.do" method="post">
			<input type="hidden" name="methodName" value="login">
			<input type="text" placeholder="账号" name="userName">
			<input type="password" placeholder="密码" name="userPass"><br>
			<p style="color:red;">${loginError}</p>
			<button type="submit" id="login-button"><strong>登陆</strong></button>
			<p>
				<span>&ldquo;<a href="reg.jsp">注册账号登录</a></span>
			</p>
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		
	</ul>
	
</div>
  </body>
</html>
