<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<h1>답변형 게시판 글수정</h1>
		<form method="post" action="claseEditOk">
			<input type="hidden" name="no" value="${dto.no}"/>
			제목 : <input type="text" name="subject" value="${dto.subject}"/><br/>
			글내용 : <textarea name="content" cols="50" rows="5">${dto.content}</textarea><br/>
			<input type="submit" value="글수정하기"/> 
		</form>
	</div>
</body>
</html>