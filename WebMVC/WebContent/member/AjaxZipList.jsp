<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 우편번호 제주특별자치도 서귀포시 (읍면) 신서로79길 48-52, (강정동, 빌딩) -->
<!-- 주소 중 공백이 있을 수 있기 때문에 공백 처리가 필요 -->
<hr id="z"/>
<c:forEach var="vo" items="${list}"><!-- AjaxZipSearch에서 받아온 list -->
	<li><span class="zCode">${vo.zipcode}</span> <span class="addr">${vo.sido} ${vo.sigungu}<c:if test="${vo.um!=null}"> ${vo.um}</c:if> ${vo.doro} ${vo.gibun1}<c:if test="${vo.gibun2!=0}">-${vo.gibun2}</c:if>, (${vo.dong}<c:if test="${vo.sibuild!=null}">, ${vo.sibuild}</c:if> )</span></li> 
</c:forEach>
<hr id="z"/>
<!-- AjaxZipSearch로 list를 다시 보낸다 -->