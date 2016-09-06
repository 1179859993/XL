<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
        table{
            margin:auto;
            width: 500px;
            height: 300px;
        }
        #formDiv{
            border: 1px solid #000;
            widows: 500px;
            height: 300px;
            margin: auto;
            margin-top: 150px;
        }
        .lab{text-align:right;}
        .in{
            width: 200px;
            height: 30px;
            border: 1px solid #008888;
            border-radius:4px;
        }
        .in:hover{
            border:2px solid #ooFFCC;
        }
    </style>

  </head>
  <body>
      <from action="reg" method="post">
          <div id="fromDiv">
              <table border="0" cellpadding="0" cellspacing="0" >
                  <tr>
                  	 <td class="lab"><label>账号:</label></td>
                  	 <td><input  type="text" name="userName" class="in"/></td>
                  </tr>
                  
                  <tr>
		             <td class="lab"><label>初始密码:</label></td>
		             <td><input type="pasword" name="userPass" class=in/></td>       
			      </tr>
			      
                  <tr>
                     <td><label class="lab">出生:</label></td>
                     <td><input  type="text" name="birth" class="in"/></td>
                  </tr>
                  <tr>
		  			<td class="lab">性别:</td>
		  			<td>
		  				<input name="sex" type="radio" value="1"/>男
		  				<input name="sex" type="radio" value="0"/>女
		  			</td>
		  		 </tr>
		  		 
		  		 <tr>
		  			<td class="lab">家庭地址:</td>
		  			<td>
		  				<input class="in" type="text" name="address"/>
		  			</td>
		  		 </tr>
		  		 <tr>
		  			<td class="lab">手机号:</td>
		  			<td>
		  				<input class="in" type="text" name="phone"/>
		  			</td>
		  		 </tr>
                  
                  <tr>
                  	 <td class="lab"><label>毕业学校:</label></td>
                  	 <td><input  type="text" name="school" class="in"/></td>
                  </tr>
                  
                  <tr>
                  	<td class="lab">学历:</td>
                  	<td>
                  		<select name="education">
                  			<option value="1">初中</option>
                  			<option value="2">高中</option>
                  			<option value="3">大专</option>
                  			<option value="4">本科</option>
                  			<option value="5">研究生</option>
                  		</select>
                  	</td>
                  </tr>
                  
                  <tr>
		  			<td class="lab"><label>工作年限:</label></td>
		  			<td><input class="in" type="text" name="work"/></td>
		  		 </tr>
		  		
		  		 <tr>
		  			<td class="lab"><label>注册时间:</label></td>
		  			<td><input class="in" type="text" name="regdate"/></td>
		  		 </tr>	
                  
			      <tr>
		            <td colspan="1" style="text-align:center;"></td>
		            <td>
		            <input type="submit" value="注册"/>
		            <span>&ldquo;<a href="longin.jsp">已有账号登录</a></span>
		            </td>
		          </tr>
              </table>
          </div>
      </from>
  </body>
</html>
