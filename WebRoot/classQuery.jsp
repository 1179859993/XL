<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'classQuery.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
	<link rel="stylesheet" type="text/css"href="Css/bootstrap-responsive.css" />
	<link rel="stylesheet" type="text/css" href="Css/style.css" />
	<script type="text/javascript" src="Js/jquery2.js"></script>
	<script type="text/javascript" src="Js/jquery2.sorted.js"></script>
	<script type="text/javascript" src="Js/bootstrap.js"></script>
	<script type="text/javascript" src="Js/ckform.js"></script>
	<script type="text/javascript" src="Js/common.js"></script>
	<style type="text/css">
		body {
			font-size: 20px;
			padding-bottom: 40px;
			background-color: #e9e7ef;
		}
		
		.sidebar-nav {
			padding: 9px 0;
		}
		
		@media ( max-width : 980px) {
			/* Enable use of floated navbar text */
			.navbar-text.pull-right {
				float: none;
				padding-left: 5px;
				padding-right: 5px;
			}
		}
		</style>
  </head>
  
  <body>
      <form class="form-inline definewidth m20" action="#" method="get">
		 <font color="#777777"><strong></strong></font> 
		
	  </form>
	  <table class="table table-bordered table-hover definewidth m10">
		  <thead>
			<tr>
				<th>班主任姓名</th>
			    <th>当前状态</th>
				<th>注册时间</th>
				<th>所带班级总数</th>
				<th>修改</th>
				<th>删除</th>
			</tr>
		  </thead>

		<tr>
			<td>张三</td>
		    <td><select>
			    <option value="1"/>&nbsp;正常</option>
                <option value="2"/>&nbsp;休假</option>
                <option value="3"/>&nbsp;停职</option> 
				</select>
			</td>
			<td>
				<input type="text" name="" class=in/>
            </td>
			<td>
			    <button type="submit"><a href="classUpdate.html">修改</a></button> 
            </td>

			<td>
				<button type="submit">删除</button> 
			</td>
		</tr>


	 </table>


 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  id="addnew">
			<a href="classAdd.">新建信息</a>
		</button>
  </body>
</html>
