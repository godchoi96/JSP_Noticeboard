<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>

<!-- head -->
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- bootstrap은 기본적으로 반응형 웹을 제공함 / 간단한 meta태그를 작성 -->
<link rel="stylesheet" href="css/bootstrap.css">
</head>

<!-- body -->
<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<!-- Navigation bar -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span> <!-- 웹페이지를 줄일 때 생기는 아이콘 3개 -->
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null) { // 세션에 없으면 로그인, 회원가입 리스트가 출력되도록 함
			%>	
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
							
						</ul>
					</li>		
				</ul>	 
			<%
				} else { // 세션에 있을 경우 로그아웃 객체 생성
			%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>		
				</ul>	
			<%	
				}
			%>
			
		</div>
	</nav>
	
	<!-- Noticeboard -->
	<div class="container">
		<table class="table table-striped" style="text-align: center; border: 1px sold #dddddd">
			 <thead>
			 	<tr>
			 		<th style="background-color: #eeeeee; text-align:center;">번호</th>
			 		<th style="background-color: #eeeeee; text-align:center;">제목</th>
			 		<th style="background-color: #eeeeee; text-align:center;">작성자</th>
			 		<th style="background-color: #eeeeee; text-align:center;">작성일</th>
			 	</tr>
			 </thead>
			 <tbody>
			 	<tr>
			 		<td>1</td>
			 		<td>안녕하세요.</td>
			 		<td>최승대</td>
			 		<td>2021-10-01</td>
			 	</tr>
			 </tbody>
		</table>
		<a href="write.jsp" class="btn btn-pimary pull-right">글쓰기</a>
	</div>

	<!-- script -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>

</html>