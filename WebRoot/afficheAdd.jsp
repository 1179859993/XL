<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'afficheAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="Css/style.css" />
    <script type="text/javascript" src="Js/jquery.js"></script>
    <script type="text/javascript" src="Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="Js/bootstrap.js"></script>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/common.js"></script>
    <script type="text/javascript" src="js/showdate.js"></script>

	<style type="text/css">
        body {font-size: 20px;
             padding-bottom: 40px;
             background-color:#e9e7ef;
             font-size:17px;
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
		function jump(){
		 window.location.href="placardQuery.jsp";
		}
	</script>
  </head>
  
  <body>
	    <form action="#" method="post">
			<table class="table table-bordered table-hover definewidth m10" style="margin-left:3%;margin-top:2%;">
			    <tr>
			        <td width="10%" class="tableleft">公告标题</td>
			        <td><input type="text" name="bigTypeName" style="height: 41px; width: 546px"/></td>
			     
			    </tr>
			    <tr>
			        <td class="tableleft">内容</td>
			        <td><input type="text" name="typeIntroduce" style="height: 93px; width: 546px"/></td>
			    </tr> 
			    <tr>
			        <td class="tableleft">发布时间</td>
			        <td style="height: 46px; "> <div style="margin:0 auto;">
				             <input type="text" id="time1" value="选择时间" onClick="return Calendar('time1');" class="text_time"/>
			             </div> 
			        </td>
			    </tr> 
			    <tr>
			        <td class="tableleft">失效时间</td>
			        <td> <div style="margin:0 auto;">
				             <input type="text" id="time2" value="选择时间" onClick="return Calendar('time2');" class="text_time"/>
			             </div> 
			        </td>
			    </tr>  
			    <tr>
			        <td class="tableleft"></td>
			        <td>
			            <button style="margin-left:180px;"type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;<button type="button" ><a href="afficheQuery.jsp">返回列表</a></button>
			        </td>
			    </tr>
			</table>
		</form>
  </body>
</html>
