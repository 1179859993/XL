<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addClass.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
        body {
        	font-size: 20px;
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

  </head>
  
  <body>
  	<p>${Prompt}</p>
	<form action="addClass.do?methodName=addClass" method="post">
	   <tr>
           <td class="lab"><label>班级名:</label></td>
           <td><input type="text" name="sName" class=in/></td>       
       </tr>
		<tr>
           <td class="lab"><label>班级类型:</label></td>
           <td>
		        <select name="sType">
		            <option value="1">常规班</option>
		            <option value="2">快速班</option>
		            <option value="3">flash班</option>
		       </select>
           </td>
       </tr>
	   <tr>
           <td class="lab"><label>备注:</label></td>
           <td><input type="text" name="remark" class=in/></td>       
       </tr>
       <tr>
           <td class="lab"><label>创建时间:</label></td>
           <td><input type="text" name="creationTime" class=in/></td>       
       </tr>
       <tr>
           <td class="lab"><label>开班时间:</label></td>
           <td><input type="text" name="beginTime" class=in/></td>       
       </tr>
       <tr>
           <td class="lab"><label>毕业时间:</label></td>
           <td><input type="text" name="graduationTime" class=in/></td>       
       </tr>
       <button type="submit" id="login-button"><strong>提交</strong></button>
	</form>
  </body>
</html>
