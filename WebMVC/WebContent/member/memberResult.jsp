<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- MemberOkCommand에서 result를 받아옴 -->
<c:if test="${result==1}">
	<!-- 가입 성공시 -->
	<script>
		location.href="<%=request.getContextPath()%>/member/login.do";
	</script>
</c:if>  

<c:if test="${result==0}">
	<!-- 가입 실패시 -->
	<script>
		alert("로그인 실패하였습니다");
		history.back();
	</script>
</c:if>  

