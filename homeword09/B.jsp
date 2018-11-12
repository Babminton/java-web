<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>计算界面</title>
    
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
<%--   <%!
    String str=null;
    public void jspinit(){
       ServletConfig sc=getServletConfig();
       str=sc.getInitParameter("secret");
    }
   %>  --%> 
  <%
   String str=config.getInitParameter("secret");
  if(!str.equals(request.getParameter("pass"))){
    RequestDispatcher view=request.getRequestDispatcher("error.jsp"); 
     view.forward(request, response);   //请求转发到error.jsp 
  //   view.include(request, response);
//     response.sendRedirect("error.jsp"); //重定向
  }         
   %>    
 <form action="C.jsp" method="post" name="myform">
  <input type="text" name="expr">
  <input type="submit" value="计算" name="submit">
 
 </form>


  </body>
</html>
