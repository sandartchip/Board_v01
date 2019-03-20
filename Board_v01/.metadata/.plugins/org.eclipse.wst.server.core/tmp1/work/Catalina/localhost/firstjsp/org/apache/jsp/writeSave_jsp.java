/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.93
 * Generated at: 2019-03-20 08:38:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.*;
import java.util.Enumeration;

public final class writeSave_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");

	
	/*  write.jsp에서 [해당 게시물의 제목/내용]를 받아온다. 
	*/
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	

	System.out.println("게시글 정보 : " + title + " "+content);
	
	Connection conn = null;
	PreparedStatement pstmt = null; 
	//쿼리 결과를 저장한 메모리 영역을 참조할 객체 
	
	try{
		//1. JDBC 드라이버 로딩 	
		String driverName = "com.mysql.cj.jdbc.Driver";
		Class.forName(driverName); 
		
		//2. DB 서버 접속
		String dbUrl = "jdbc:mysql://localhost:3306/boardDB?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
		String dbUser = "root";
		String dbPassword = "ROOT";
		
		//접속 URL정보와 포트 번호, SID		
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		//위에서 만든 클래스를 import하여 Connection 객체를 생성한다.
		
		String insert_sql = 
		"INSERT INTO board_table (title, content, regDate, modDate) values(?,?,?,?)";
		//sql 쿼리
		
		pstmt = conn.prepareStatement(insert_sql);
		//prepare statement에서 해당 sql을 미리 컴파일.
		
		//현재 시간 계산
				
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		 
		String str = dayTime.format(new Date(time));
		System.out.println("현재 시간 = "+str);
		
		//Timestamp cur_time = Timestamp.valueOf(str);
		Timestamp cur_time = new Timestamp(System.currentTimeMillis() );
		//현재 시간 계산
		
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setTimestamp(3, cur_time);
		pstmt.setTimestamp(4, cur_time);
		
		// DB에 저장 
		pstmt.executeUpdate();
		
		//-------------------에러처리
		
		if(pstmt != null){
			try {
				pstmt.close();
			} catch(SQLException e){					
			}
		}
		if(conn != null){
			try {
				conn.close();
			} catch(SQLException e){					
			}
		}
	} catch(ClassNotFoundException ec){
		ec.printStackTrace();
	}
	catch( SQLException e){
		e.printStackTrace();
	}
	response.sendRedirect("list.jsp");
	
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
