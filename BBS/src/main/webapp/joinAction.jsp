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
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
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
		String userID = null;
		if(session.getAttribute("userID") !=  null) {
			userID = (String) session.getAttribute("userID");
		} // 현재 로그인한 계정의 세션을 관리
		
		if(userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
		|| user.getUserGender() == null || user.getUserEmail() == null) { // 아무것도 입력이 되있지 않을 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 되지 않는 부분이 존재합니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1) { 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입이 완료되었습니다.')");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>

</html>