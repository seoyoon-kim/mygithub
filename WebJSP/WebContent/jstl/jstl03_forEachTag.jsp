<!-- 3/22 --> 
<%@page import="java.util.HashMap"%>
<%@page import="com.bitcamp.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 반복문</title>
<meta name="viewport" content="width=dvice-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</head>
<body>
	<c:set var="dan" value="${6}"/>
	<h1> forEach 태그 : 반복문</h1>
	<!-- for(int a=10; a<20; a++) -->
	<!--                   시작값     최종값     증가값(step 생략 시 기본값 1씩) -->
	<c:forEach var="i" begin="2" end="9" step="2"> 
		${dan} *${i} = ${dan*i}<br/>
	</c:forEach>
	
	<c:set var="arr" value="<%=new int[]{25,26,2,5,6,75,12,39,95,68} %>"/>
	<ol>
		<c:forEach var="n" items="${arr}">
			<li>[${n}]</li> <!-- []:html , ${n}:jstl -->
		</c:forEach>
	</ol>
	
	<%
		//jsp로 컬렉션 만들기
		List<BoardVO> list = new ArrayList<BoardVO>();
		list.add(new BoardVO(1, "jstl 테스트"));
		list.add(new BoardVO(2, "연습 중"));
		list.add(new BoardVO(3, "jsp로 컬렉션 만들기"));
		list.add(new BoardVO(4, "BoardVO에 메서드 추가해서"));
		list.add(new BoardVO(5, "forEach로 반복처리")); 
	%>
	<ul>
		<c:forEach var="ii" items="<%=list%>">
			<li>${ii.no} : ${ii.subject}</li> <!-- jstl은 서버가 getNum, getSubject를 자동으로 호출=생략 가능 -->
		</c:forEach> 
	</ul>
	<% //Hash Map컬렉션에 키와 값 추가
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("name","홍길동");
		hm.put("tel","010-000-0000");
		hm.put("addr","서울시 동작구");	
	%>
	<ul>
		<c:forEach var="h" items="<%=hm %>">
			<li>key : ${h.key} & value : ${h.value }</li>
		</c:forEach>
	</ul>
</body>
</html>