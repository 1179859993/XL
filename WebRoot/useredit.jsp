<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'useredit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="Css/style.css" />
    <script type="text/javascript" src="Js/jquery2.js"></script>
    <script type="text/javascript" src="Js/jquery2.sorted.js"></script>
    <script type="text/javascript" src="Js/bootstrap.js"></script>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/common.js"></script>

    <style type="text/css">
        body {font-size: 20px;
            padding-bottom: 40px;
            background-color:#e9e7ef;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }

    </style>
    <script type="text/javascript">
    $(function () {
		$('#addnew').click(function(){
			window.location.href="goodsAdd.html";
		 });
    });
	
	</script>
    </head>
    <body>
	    <form class="form-inline definewidth m20" action="#" method="get">
	    <font color="#777777"><strong>查询用户：</strong></font>
	    <input type="text" name="menuname" id="menuname"class="abc input-default" placeholder="" value="">&nbsp;&nbsp; 
	    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
		<button type="submit"  ><a href="usercommentlist.jsp">查询所有用户</a></button>
	    </form>
	    <table class="table table-bordered table-hover definewidth m10">
	    <thead>
	   
	        &nbsp;&nbsp; <font><strong>用户名称：</strong></font>
	        <a href="studentdetail.html"> <font><strong>小强</strong></font><br></a><br>
			&nbsp;&nbsp; <font><strong>是否禁言：</strong></font>
			 <button type="button" >是</button> &nbsp;&nbsp;
			 <button type="button" >否</button><br>
			 &nbsp;&nbsp; <font><strong>评价列表：</strong></font>
	    <tr>
		<th>序号</th>
	        <th>评价内容</th>
	      
	        <th>评价时间</th>
	    </tr>
	    </thead>
	        <tr>
	            <td>1</td>
	            <td>你来人间一趟，你要看看太阳，和你的心上人，一起走在街上。</td>
	
	            <td>2016.02.12</td>
	        </tr>
	    </table>
    </body>
</html>
