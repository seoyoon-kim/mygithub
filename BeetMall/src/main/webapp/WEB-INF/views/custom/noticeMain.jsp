<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif;}
	#boardList{list-style-type:none;}
   #boardList li{width:20%; height:40%; line-height:40px; border-bottom:1px solid gray; float:left;}
   #boardList li:nth-child(3n+2){width:60%;}
   #boardList li:nth-child(3n+3){width:20%;}
   .wordcut{white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
   #noticeMainn{
   		overflow: auto;
   }
   #Main{
	   	margin:30px;
	   	text-align: center;
   }
   #NoticeleftMenu{
   	display:block;
   }
   
   a:hover, a:active, a:visited, a:link {
   		color: black;
   }
</style>
<script>
</script>
<div class="section">
	<div id="Main"><h1>공지사항</h1></div>
	<div id="noticeMainn">
		<ul id="boardList">
			<li>번호</li>
			<li>제목</li>
			<li>등록일</li>
			
			<%-- <c:forEach var="data" items="${list }"> --%>
	        <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <li>번호</li>
	        <li class="wordcut"><a href="#">제목</a></li>
	        <li>등록일</li>
	         <%-- </c:forEach>  --%>
		</ul>
	</div>
</div>