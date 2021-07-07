<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${result==1 }"><!-- 삭제 성공 시 -->
	<script>
		location.href="<%=request.getContextPath()%>/data/dataView.do?no=${no}";
	</script>
</c:if>
<c:if test="${result==0}"><!-- 삭제 실패 시  -->
	<script>
		location.href="<%=request.getContextPath()%>/data/dataEdit.do?no=${no}";
	</script>
</c:if>