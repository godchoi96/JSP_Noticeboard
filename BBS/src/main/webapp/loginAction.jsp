<!-- 데이터베이스 연동은 WEB-INT > lib > mySQL Connector > 파일 붙여넣기 -->
<!-- 로그인 시 정상적 작동과 비정상적 작동의 출력을 위한 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
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
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if(result == 1) { // 정상적으로 로그인 되는 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if(result == 0) { // 비밀번호가 틀린 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1) { // 아이디가 틀린 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2) { // 데이터베이스 오류 발생한 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스에 오류가 발생하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>

</html>