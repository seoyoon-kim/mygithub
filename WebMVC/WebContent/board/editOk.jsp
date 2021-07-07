<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 로그인 했으나 본인이 쓴 글이 아닐 경우 -->
<c:if test="${result==100}">
	<script>
		location.href="<%=request.getContextPath()%>/board/list.do";	
	</script>
</c:if>
<!-- 글쓴이의 글이 정상 수정되었을 때 -->
<c:if test="${result==1}">
	<script>
		location.href="<%=request.getContextPath()%>/board/boardView.do?${addrParam}";
	</script>
</c:if>
<!-- 글 수정이 안 되었을 때 -->
<c:if test="${result==0}">
	<script>
		history.back();
	</script>
</c:if>