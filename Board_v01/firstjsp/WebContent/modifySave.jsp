<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	/*  
		modify.jsp에서 [해당 게시물의 content id(PK) / 제목/내용]를 post 방식으로 받아온다. 
	*/
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String content_id_str = request.getParameter("content_id");
	int content_id;
	content_id = Integer.parseInt(content_id_str);

	System.out.println("수정된 게시글 정보 : " + title + " "+content);
	
	Connection conn = null;
	PreparedStatement pstmt = null;  
	
	
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
		
		String modify_sql =
		"UPDATE board_table SET TITLE= ?, CONTENT=?, modDate=?  WHERE content_id=?";
		
		//글 수정 sql 쿼리
		// 수정 날짜, 제목, 내용을 업데이트하고 등록일자는 그대로 둔다. 
		
		pstmt = conn.prepareStatement(modify_sql);
		//prepare statement에서 해당 sql을 미리 컴파일.
		
		 
		//현재 시간 계산 용..
		
		
		
		//일단 시간 이상하게 들어가는거..
		Timestamp cur_time = new Timestamp(System.currentTimeMillis()) ;
		//이 줄 살려서.
		
		// 제대로 계산
				
		//
		 
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setTimestamp(3,  cur_time);
		pstmt.setInt(4, content_id); //현재 게시물의 ID
		// DB에 저장 
		pstmt.executeUpdate();
		
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
	%>
</body>
</html>