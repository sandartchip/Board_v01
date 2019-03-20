<%@page language= "java" contentType= "text/html; charset=utf-8" pageEncoding= "utf-8" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Timestamp" %> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
	
		//view 페이지에서 받아온 id PK 확인
		//DB 커넥션 후
		//Delete SQL문 수행
		<%
			String content_idx = request.getParameter("content_id");
			System.out.println("삭제 페이지로 진입~~ 삭제할 게시물 : " + content_idx);		
			//view에서 받아 옴.
		%>
	
		<%
		//데이터 받아오기
		 
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

			pstmt = conn.prepareStatement("DELETE FROM board_table WHERE content_id=?");
			pstmt.setString(1, content_idx);
			
			int r = pstmt.executeUpdate();
			System.out.println("변경된 row : "+ r);
			// DB에  
			
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