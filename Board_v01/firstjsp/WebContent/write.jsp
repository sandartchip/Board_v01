<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글 작성 페이지</title>
</head>
<body>
<!--  서버단에서 출력 -->
	<form action="writeSave.jsp" method="post"
	onsubmit="return formCheck();">
		<!--  데이터들을 가진 form을 action에 지정된 페이지로 보냄 -->
		<!--  post는 많은 값 보낼 때. -->
		
		제목 : <input type="text" name="title">
		내용 : <input type="text" name="content" style="height:100px"> 
				
		<input type="submit" value = "저장"/>	
	</form>
	<a href="list.jsp"> 취소 </a> <!-- 상세보기로 이동 -->

	<script>
		function formCheck(){
 
			//첫번째 form의 제목의 값
			var title = document.forms[0].title.value;
			var content = document.forms[0].content.value;
			if(title.length == 0)
				alert("제목 없음");
			
			if(content.length == 0 )
				alert("내용 없음");
			
			if( title.length >80) 
				alert("제목의 길이가 너무 깁니다");
			console.log("제목: " + title + "내용  : " + content);

			if( ( title.length >80)|| (content.length == 0 ) || (title.length == 0))
				return false;
		} 
	</script> 
</body>
</html>

