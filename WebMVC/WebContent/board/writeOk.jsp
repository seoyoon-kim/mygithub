<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:if test="${cnt>0}"><!-- 글쓰기 글이 등록됐을 때 -->
 	<script>
 		location.href="<%=request.getContextPath()%>/board/list.do";
 	</script>  </c:if>
 <c:if test="${cnt<=0 }"><!-- 글쓰기 글이 등록 안됐을 때 -->
 	<script>
 		history.back();
 	</script>
 </c:if>