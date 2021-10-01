<!-- 데이터베이스 연동은 WEB-INT > lib > mySQL Connector > 파일 붙여넣기 -->
<!-- 로그인 시 정상적 작동과 비정상적 작동의 출력을 위한 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>

<html>

<!-- head -->
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>

<!-- body -->
<body>

	<% 
		session.invalidate();
	%>
	
	<script>
		location.href = 'main.jsp';
	</script>

</body>

</html>