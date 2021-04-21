<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>답변형 게시판 답글쓰기</h1>
		<form method="post" action="claseWriteFormOk">
		<!-- 원글 글번호 가져가기 -->
		<input type="hidden" name="no" value="${no}"/>
			제목 : <input type="text" name="subject"/><br/>
			글내용 : <textarea name="content" cols="50" rows="5"></textarea>
		<input type="submit" value="답글저장"/>
		
		</form>
	</div>
</body>
</html>