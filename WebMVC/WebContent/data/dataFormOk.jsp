<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cnt==1}"> <!-- 파일 추가(글쓰기) 성공시 -->
	<script>
		location.href="<%=request.getContextPath()%>/data/dataList.do";
	</script>
</c:if>
<c:if test="${cnt<=0}"><!-- 파일 추가(글쓰기) 실패 시  -->
	history.back();
</c:if>