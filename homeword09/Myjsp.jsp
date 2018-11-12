<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Myjsp.jsp' starting page</title>
    
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
      <h1>http://localhost:7001/lab09_3/Myjsp.jsp</h1>
      <%
			int localvar = 0;
		%>
		<%!int count = 0;%>
		<%
			localvar++;
			count++;
		%>
		局部变量localvar=<%=localvar%><br>
		实例变量count=<%=count%><br>

<br><br><br><br><br>
<%
			//获取系统当前日期和时间值
			Calendar calendar = new GregorianCalendar();
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH)+1;
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
			String weekDay = null;
			switch (dayOfWeek) {
			case 1:
				weekDay = "星期日";
				break;
			case 2:
				weekDay = "星期一";
				break;
			case 3:
				weekDay = "星期二";
				break;
			case 4:
				weekDay = "星期三";
				break;
			case 5:
				weekDay = "星期四";
				break;
			case 6:
				weekDay = "星期五";
				break;
			case 7:
				weekDay = "星期六";
				break;
			}
		%><p>今天是:<%=year%>年<%=month%>月<%=day%>日
		<%=weekDay%>

		<H4>
			打印九九表(下三角)
		</H4>
		<%
			for (int i = 1; i <= 9; i++) {
				for (int j = 1; j <= i; j++) {
		%>
		<%=i%>*<%=j%>=<%
			if (i * j <= 9)
		%>&nbsp;
		<%=i * j%>&nbsp;&nbsp;
		<%
			if (j == i) {
		%><br>
		<%
			}
				}
			}
		%>
<br>
<br>
<BODY BGCOLOR=cyan>  
<FONT Size=5> 
<P>这是一个简单的JSP页面  
     <% int i, sum=0;
         for(i=1;i<=100;i++)
          { sum=sum+i;
          }
      %>  
<P>  1到100的连续和是： 
<BR>
   <%=sum %>
</FONT>  

<br><br><br><br>
<P> 请输入三角形的三个边的长度，输入的数字用逗号分割：
  <BR>
  


  </body>
</html>
