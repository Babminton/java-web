<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>登录界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="charset" content="utf-8">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <script language="javascript" type="text/javascript">
   function checkMyform(){
   
      var pass=document.myform.pass;
      if(!checkNumber(pass)){
      return false;
      }
      return true;
   }
   function checkNumber(obj){
         var reg=/^[0-9]+$/
         if(!reg.test(obj.value)){
           alert('只能输入数字');
           obj.value="";
           obj.focus();
           return false;
         }
         return true;
   }
  </script>   
<h1>请登录系统</h1>
	<form action="B.jsp" method="post" name="myform"
		onsubmit="return checkMyform()">
		<input type="password" name="pass"> <input type="submit"
			value="登录">
	</form>

</body>
</html>
