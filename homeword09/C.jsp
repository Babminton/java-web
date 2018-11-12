<%@ page language="java" import="java.util.*,bsh.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'C.jsp' starting page</title>
    
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
   <%
   Interpreter bsh=new Interpreter();
   try{
    bsh.eval("a="+request.getParameter("expr"));
    out.println(request.getParameter("expr")+"=");
    out.println(bsh.get("a"));
   }catch(Exception e){}
   
   
    %>   



  </body>
</html>
