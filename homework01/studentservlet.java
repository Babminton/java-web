package com.sise.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Vector;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.directory.InitialDirContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class studentservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  //	http://localhost:7001/Test03/test.html
    public studentservlet() {   
        super();
        
    }

	public void init(ServletConfig config) throws ServletException {
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("gb2312");
	response.setContentType("text/html,Charset=gb2312");
	PrintWriter out = response.getWriter();
 if(!(request.getParameter("sno").equals("input number"))){
		Vector<student> vc=new Vector<student>();
		out.println("<form method='post' action='/Test03/studentservlet'>");
		out.println("学生学号：<input type='text' name='sno' value='input number'>");
		out.println("<input type='submit' value='查询'><br>");
		out.println("</form>");
		out.println("<hr>");
		out.println("<table border='1'><tr>");
		out.println("<th>学号</th><th>姓名</th><th>语文</th><th>数学</th><th>英语</th>");
		try{
			if((vc=accessDB(Integer.parseInt((String)request.getParameter("sno")))).size()!=0){
				for(int i=0;i<vc.size();i++){
					student st=vc.get(i);   
					out.println("<tr>");
					out.println("<td>"+st.getSno()+"</td>");
					out.println("<td>"+st.getSname()+"</td>");
					out.println("<td>"+st.getChinese()+"</td>");
					out.println("<td>"+st.getMath()+"</td>");
					out.println("<td>"+st.getEnglish()+"</td>");
					out.println("</tr>");
				}
			}else{
				out.println("<tr>");
				out.println("<td colspan='4'>没有记录</td>");
				out.println("</tr>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	out.println("  </BODY>");
	out.println("</HTML>");
	out.flush();
	out.close();
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	public Vector<student> accessDB(int id){   //
		Vector<student> vc=new Vector<student>();
		javax.sql.DataSource ds=null;
		javax.naming.Context ctx;
		Connection myConn=null;
		final String JNDI_DATABASE_NAME="BB";
		Properties ht=new Properties();
		ht.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY,"weblogic.jndi.WLInitialContextFactory");
		ht.put(javax.naming.Context.PROVIDER_URL, "t3://localhost:7001");
		try{
			ctx=new InitialContext(ht);
			ds=(javax.sql.DataSource) ctx.lookup(JNDI_DATABASE_NAME);
		}catch(Exception e){
			e.printStackTrace();
		}
		if(ds==null){
			System.out.println("Eorror!");
		}else{
			System.out.println("Connection is OK!");
		}
		java.sql.PreparedStatement myStatement=null;
		ResultSet mySet=null;
		try{
			myConn=ds.getConnection();
			myStatement=myConn.prepareStatement("select * from student where sno=?");
			myStatement.setInt(1, id);    //
			mySet=myStatement.executeQuery();
			if(mySet!=null){
				while(mySet.next()){
					int sno=mySet.getInt("sno");
					String sname=mySet.getString("sname");
					int chinese=mySet.getInt("chinese");
					int math=mySet.getInt("math");
					int english=mySet.getInt("english");
					student st=new student(sno,sname,chinese,math,english);
					vc.add(st);
				}
			}
			myStatement.close();
			mySet.close();
			myConn.close();
			return vc;
		}catch(Exception e){
			e.printStackTrace();
		}
		return vc;
	}

}
