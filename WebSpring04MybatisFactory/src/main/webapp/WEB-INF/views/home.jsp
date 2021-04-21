<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>Spring_Mybatis</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<style>
	 
</style>
</head>
<body>
<h1>
 Home
</h1>
 <div class="container">
 	<ul>
	 	<li>
	 		<c:if test="${logId==null || logId==''}">
	 			<a href="loginForm">로그인</a>
	 		</c:if>
	 		<c:if test="${logId!=null && logId!=''}">
	 			<a href="logout">${logName}로그아웃</a>
	 		</c:if>
	 		
	 	</li> 
	 	<li><a href="boardList">게시판</a></li>
	 	<li><a href="transactionForm">트랜잭션</a></li>
	 	<li><a href="claseList">계층형 게시판</a></li>
 	</ul>
 </div>
</body>
</html>
