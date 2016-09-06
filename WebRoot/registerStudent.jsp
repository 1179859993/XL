<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'registerStudent.jsp' starting page</title>
    
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
	<script type="text/javascript" src="Js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript"> 
	var currentShowCity=0;
	$(document).ready(function(){
	   $("#province").change(function(){
		   $("#province option").each(function(i,o){
			   if($(this).attr("selected"))
			   {
			 
				   $(".city").hide();
				   $(".city").eq(i).show();
				   currentShowCity=i;
			   }
		   });
	   });
	   $("#province").change();
	});
	
	function getSelectValue(){
		alert("1级="+$("#province").val());
		$(".city").each(function(i,o){
	                   
			 if(i == currentShowCity){
				alert("2级="+$(".city").eq(i).val());
			 }
	   });
	}
	
	
	</script> 
	<script language="JavaScript">   
	function YYYYMMDDstart(){   
		MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];   
		
		//先给年下拉框赋内容   
		var y  = new Date().getFullYear();  
		for (var i = (y-30); i < (y+30); i++) //以今年为准，前30年，后30年   
			   document.reg_testdate.YYYY.options.add(new Option(" "+ i +" 年", i));   
		
		//赋月份的下拉框   
		for (var i = 1; i < 13; i++)   
			   document.reg_testdate.MM.options.add(new Option(" " + i + " 月", i));   
		
		document.reg_testdate.YYYY.value = y;   
		document.reg_testdate.MM.value = new Date().getMonth() + 1;   
		var n = MonHead[new Date().getMonth()];   
		if (new Date().getMonth() ==1 && IsPinYear(YYYYvalue)) n++;   
			writeDay(n); //赋日期下拉框Author:meizz   
		document.reg_testdate.DD.value = new Date().getDate();   
	}   
	if(document.attachEvent)   
		window.attachEvent("onload", YYYYMMDDstart);   
	else   
	window.addEventListener('load', YYYYMMDDstart, false);   
	function YYYYDD(str) //年发生变化时日期发生变化(主要是判断闰平年)   
	{   
		var MMvalue = document.reg_testdate.MM.options[document.reg_testdate.MM.selectedIndex].value;   
		if (MMvalue == ""){ var e = document.reg_testdate.DD; optionsClear(e); return;}   
		var n = MonHead[MMvalue - 1];   
		if (MMvalue ==2 && IsPinYear(str)) n++;   
		writeDay(n)   
	}   
	function MMDD(str)   //月发生变化时日期联动   
	{   
		var YYYYvalue = document.reg_testdate.YYYY.options[document.reg_testdate.YYYY.selectedIndex].value;   
		if (YYYYvalue == ""){ var e = document.reg_testdate.DD; optionsClear(e); return;}   
		var n = MonHead[str - 1];   
		if (str ==2 && IsPinYear(YYYYvalue)) n++;   
		writeDay(n)   
	}   
	function writeDay(n)   //据条件写日期的下拉框   
	{   
		var e = document.reg_testdate.DD; optionsClear(e);   
		for (var i=1; i<(n+1); i++)   
		e.options.add(new Option(" "+ i + " 日", i));   
	}   
	function IsPinYear(year)//判断是否闰平年   
	{
		return(0 == year%4 && (year%100 !=0 || year%400 == 0));
	}   
	function optionsClear(e)   
	{   
		e.options.length = 1;   
	}   
</script>
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
   	<form action="reg" method="post">
	     <div id="formDiv">
		    <table border="0"  cellspacing="0" cellpadding="0" >
		    	<tr>
		    	    <td class="lab"><lable>照片上传:</lable></td>
		    	    <td><img src=""/></td>
		    	</tr>
		    	
		        <tr>
		            <td class="lab"><label>姓名:</label></td>
		            <td><input type="text" name="userName" class=in/></td>
		        </tr>
		        
		        <tr>
		            <td class="lab"><label>初始密码:</label></td>
		            <td><input type="pasword" name="userPass" class=in/></td>       
		        </tr>
		        
		        <tr>
		        	<td class="lab"><label>出生年月:</label></td>
		        	<td>
		        		<form name="reg_testdate">
							<select name="YYYY" onChange="YYYYDD(this.value)">
								<option value="">请选择 年</option>
							</select>
							<select name="MM" onChange="MMDD(this.value)">
								<option value="">选择 月</option>
							</select>
							<select name="DD">
								<option value="">选择 日</option>
							</select>
						</form>
		        	</td>
		        </tr>
		        
		        <tr>
		            <td class="lab"><label>性别:</label></td>
		            <td>
		                <input type="radio" name="sex" value=1/>男 
		                <input type="radio" name="sex" value=2/>女
		            </td>     
		        </tr>
		        
		        <tr>
		            <td class="lab"><lable>家庭地址:</lable></td>
		            <td>
			            <select id="province"> 
					       <option>北京</option> 
					       <option>上海</option> 
					       <option>江苏</option> 
					    </select> 
					    <select class="city"> 
					       <option>东城</option> 
					       <option>西城</option> 
					       <option>崇文</option> 
					       <option>宣武</option> 
					       <option>朝阳</option> 
					    </select>  
					    <select class="city"> 
					       <option>黄浦</option> 
					       <option>卢湾</option> 
					       <option>徐汇</option> 
					       <option>长宁</option> 
					       <option>静安</option> 
					    </select> 
				    </td>
		        </tr>
		        
		        <tr>
		            <td class="lab"><label>手机号码:</label></td>
		            <td><input type="text" name="phone" class=in/></td>       
		        </tr>
		        
		        <tr>
		            <td class="lab"><label>毕业学校:</label></td>
		            <td><input type="text" name="" class=in/></td>       
		        </tr>
		        
		        <tr>
		            <td class="lab"><label>学历:</label></td>
		            <td>
				        <select name="enducation">
				            <option value="1">其他</option>
				            <option value="2">专科</option>
				            <option value="3">本科</option>
				        </select>
			        </td>
		        </tr>
		       
		        <tr>
		            <td colspan="1" style="text-align:center;">&ldquo;</td>
		            <td>
		            	<input type="submit" value="注册"/>
		            </td>
		        </tr>
		    </table>
	   </div>
      </form>
  </body>
</html>
