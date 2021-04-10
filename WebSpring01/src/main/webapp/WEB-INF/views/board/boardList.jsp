<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
	<h1> 글 목록</h1>
	<div>
		<c:if test="${logStatus == 'Y' }">
			<a href="/home/boardWrite">글쓰기</a>
		</c:if>
		</div>
	<ul>
		<c:forEach var="vo" items="${list}">
			<li>${vo.no }번호</li>
			<li><a href="/home/boardView?no=${vo.no}">${vo.subject }제목</a></li>
			<li>${vo.userid }글쓴이</li>
			<li>${vo.hit }조회수</li>
			<li style="border-bottom:1px solid #ddd">${vo.writedate }등록일</li>	
		</c:forEach>
	</ul>

</div> 
</body>
</html>