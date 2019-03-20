<%@ page language= "java" contentType= "text/html; charset=utf-8" pageEncoding= "utf-8" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Timestamp" %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판</title>
</head>
<body>
	<h1>게시판</h1>
	<table border="1px">
		<tr>
			<th>제목</th> 
			<th>저장날짜</th>
			<th>수정날짜</th>
		</tr>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			//쿼리 결과를 저장한 메모리 영역을 참조할 객체
	
			int content_id = 1;
			
			try{
				//1. JDBC 드라이버 로딩 	
				String driverName = "com.mysql.cj.jdbc.Driver";
				Class.forName(driverName);
			
				//2. DB 서버 접속
				String dbUrl = "jdbc:mysql://localhost:3306/boardDB?serverTimezone=UTC";
				String dbUser = "root";
				String dbPassword = "ROOT";
						
				//접속 URL정보와 포트 번호, SID		
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				//위에서 만든 클래스를 import하여 Connection 객체를 생성한다.
				 
				stmt = conn.createStatement();
				//데이터 추가, 수정, 삭제를 실행할 객체를 생성
				
				String sql = "SELECT * FROM board_table";		
				rs = stmt.executeQuery(sql);
				int idx=1; // idx : 게시글의 번호(PK)임.
				
				while(rs.next()){ //다음 값이 있을 때까지
					int i=1;	
					String title = rs.getString(i++);
					String content = rs.getString(i++);
					String regDate = rs.getString(i++);
					String modDate = rs.getString(i++);
					
					//System.out.println(title+ " " + content + " " + regDate + " " + modDate);
					//이걸 화면에 뿌리는 걸로 변경 

					out.print("<tr>");
					out.print("<td> <a href='view.jsp?content_idx="+ idx +" '> " + title + "</td>");
			//		out.print("<td> " + content + "</td>");
					out.print("<td> " + regDate.toString() + "</td>");
					out.print("<td>" + modDate.toString() + "</td>");
					out.print("</tr>");
					idx++;
			} //end of while
			if( rs!= null){
				try {
					rs.close();
				} catch(SQLException e){					
				}
			}
			if(stmt != null){
				try {
					stmt.close();
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
	%>
	</table>
	<a href="write.jsp"> [ 새로운 게시물 등록 ]</a>
</body>

</html>