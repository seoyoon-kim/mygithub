<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style>
	.section{
		width:1080px;
		margin:0 auto;
		text-align:center;
	}
	#errdiv>a>img{
		width:200px;
		height:200px;
		margin:0px 100px;
	}
	#errdiv{
		width:400px;
		height:340px;
		margin:0 auto;
		border : 5px solid black;
		padding:10px;
		cursor: pointer;
	}
</style>
</head>
<script>$(function(){$("#errdiv").click(function(){location.href="/sshj";});});</script>
<body>
	<div class="section" >
		<div id="errdiv">
		<h2>죄송합니다 오류가 발생했습니다.</h2>
		<h2>빠른 시일 내에 조치하겠습니다...</h2>
		<h3>토마토를 클릭해서 메인페이지로 이동하기</h3>
		<a href="/sshj"><img src="/sshj/img/derrorImg.jpg"/></a>
		</div>
	</div>
</body>
</html>