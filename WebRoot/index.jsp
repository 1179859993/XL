<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
	<title>MOOC视频网站</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/adminStyle.css" rel="stylesheet" type="text/css" />
	
	<title>MOOC网站管理系统</title>
		<script type="text/javascript" src="js/jquery1.js"></script>
	<script type="text/javascript">
		$(document).ready(
			function() {
				$(".div2").click(
					function() {
						$(this).next("div").slideToggle("slow").siblings(".div3:visible").slideUp("slow");
			});
		});
			function openurl(url) {
				var rframe = parent.document.getElementById("rightFrame");
				rframe.src = url;
			}
	</script>
	<style type="text/css">
		body {
			margin: 0;
			font-family: 微软雅黑;
			background-image: url(images/bg555.jpg);
			background-repeat: no-repea;
			background-size: cover;
			background-attachment: fixed;
			background-color: #DDDDDD
			
		}
		
		.top1 {
			position: absolute;
			top: 0px;
			width: 100%;
			height: 20px;
			text-align: center;
			color: #FFFFFF;
			font-size: 17px;
			font-height: 20px;
			font-family: 楷体;
			background-color: #888888
		}
		
		.title {
		float:left;
		    margin:-32px 20px;
			font-size: 40px;
			color: #FFFFFF;
			font-height: 55px;
			font-family: 隶书;
		}
		
		.top2 {
			position: absolute;
			top: 20px;
			width: 100%;
			height: 77px;
			text-align: center;
			color: #ccffff;
			background-color: #888888
		}
		
		.left {
			position: absolute;
			left: 0px;
			top: 97px;
			width: 200px;
			height: 85%;
			border-right: 1px solid #9370DB;
			color: #000000;
			font-size: 20px;
			text-align: center;
			background-color: #B3B3B3
		}
		
		.right {
			position: absolute;
			left: 200px;
			top:97px;
			width: 85.2%;
			height: 85%;
			border-top: 0px solid #484860;
			font-size: 14px;
			text-align: center;
		}
		
		.end {
			position: absolute;
			bottom: 0px;
			width: 100%;
			height: 30px;
			text-align: center;
			color: #556B2F;
			font-size: 17px;
			font-height: 20px;
			font-family: 楷体;
			background-color: #C0C0C0
		}
		
		.div1 {
			text-align: center;
			width: 200px;
			padding-top: 10px;
		}
		
		.div2 {
			height: 40px;
			line-height: 40px;
			cursor: pointer;
			font-size: 18px;
			position: relative;
			border-bottom: #ccc 0px dotted;
		}
		
		.spgl {
			position: absolute;
			height: 20px;
			width: 20px;
			left: 40px;
			top: 10px;
			background: url(images/1.png);
		}
		
		.yhgl {
			position: absolute;
			height: 20px;
			width: 20px;
			left: 40px;
			top: 10px;
			background: url(images/4.png);
		}
		
		.gggl {
			position: absolute;
			height: 20px;
			width: 20px;
			left: 40px;
			top: 10px;
			background: url(images/4.png);
		}
		
		.zlgl {
			position: absolute;
			height: 20px;
			width: 20px;
			left: 40px;
			top: 10px;
			background: url(images/4.png);
		}
		
		.pjgl {
			position: absolute;
			height: 20px;
			width: 20px;
			left: 40px;
			top: 10px;
			background: url(images/4.png);
		}
		
		.tcht {
			position: absolute;
			height: 20px;
			width: 20px;
			left: 40px;
			top: 10px;
			background: url(images/2.png);
		}
		
		.div3 {
			display: none;
			cursor: pointer;
			font-size: 15px;
		}
		
		.div3 ul {
			margin: 0;
			padding: 0;
		}
		
		.div3 li {
			height: 30px;
			line-height: 30px;
			list-style: none;
			border-bottom: #ccc 1px dotted;
			text-align: center;
		}
		
		.a {
			text-decoration: none;
			color: #000000;
			font-size: 15px;
		}
		
		.a1 {
			text-decoration: none;
			color: #000000;
			font-size: 18px;
		}
		
		</style>
	
  </head>
  
  <body>
    <div class="top1">
		<marquee scrollAmount=2 width=300>数据无价，请谨慎操作！</marquee>
	</div>
	<div class="top2">
		<div class="logo">
			<img src="images/admin_logo.png" title="在哪儿" />
		</div>
		<div class="title" >
			<h3>MOOC网站后台管理系统</h3>
		</div>
			<div id = "head" style="font-size: 30">热烈欢迎你${user.userName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.do?methodName=logout" style="font-size: 20">安全退出</a> </div>
		</div>

	<div class="left">
		<div class="div1">
			<div class="left_top">
				<img src="images/bbb_01.jpg"><img src="images/bbb_02.jpg"
					id="2"><img src="images/bbb_03.jpg"><img
					src="images/bbb_04.jpg">
			</div>
			
           <div class="div2">
				<div class="spgl"></div>注册
			</div>
			<div class="div3">
				<li><a class="a" href="javascript:void(0);"
					onClick="openurl('videoQuery.html');">注册及管理</a></li>
			</div>
			<div class="div2">
				<div class="spgl"></div>
				项目经理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('documentQuery.html');">管理题库数据</a></li>
				</ul>
			</div>
			<div class="div2">
				<div class="spgl"></div>班主任
			</div>
			<div class="div3">
				<ul>
					<li>
						<a class="a" href="javascript:void(0);"
							onClick="openurl('registerStudent.jsp');">注册学生</a>
					</li>
					<li>
						<a class="a" href="javascript:void(0);"
							onClick="openurl('.jsp');">查询当前负责的所有学生</a>
					</li>
					<li>
						<a class="a" href="javascript:void(0);"
							onClick="openurl('queryStudent.jsp');">查询学生信息</a>
					</li>
					<li>
						<a class="a" href="javascript:void(0);"
							onClick="openurl('classQuery.jsp');">修改自身信息</a>
					</li>
					
				</ul>
			</div>
			<div class="div2">
				<div class="yhgl"></div>
				用户管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javasc   ript:void(0);"
						onClick="openurl('studentQuery.jsp');">学生管理</a></li>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('teacherQuery.jsp');">老师管理</a></li>
				</ul>
			</div>
			
			
			
			<div class="div2">
				<div class="gggl"></div>开班
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('view/addClass.jsp');">添加新班级</a></li>
				</ul>
			</div>
			
			
			<div class="div2">
				<div class="gggl"></div>
				班级管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('Classinfo.jsp');">班级信息</a></li>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('deletecomment.jsp');">评价删除</a></li>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('useredit.jsp');">用户禁言</a></li>
				</ul>
			</div>
			<div class="div2">
				<div class="pjgl"></div>
				公告管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('afficheQuery.jsp');">查看公告</a></li> 
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('afficheAdd.jsp');">添加公告</a></li>
				</ul>
			</div>
			
			
			
			
			<a class="a1" href="login.jsp">
				<div class="div2">
					<div class="tcht"></div>退出后台
				</div>
			</a>
			
		</div>
	</div>

	<div class="right">
		<iframe id="rightFrame" name="rightFrame" width="100%" height="100%" scrolling="auto" marginheight="0" marginwidth="0" align="center"
			style="border: 0px solid #CCC; margin: 0; padding: 0;">
		</iframe>
	</div>
  </body>
</html>
