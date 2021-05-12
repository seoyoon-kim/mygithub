<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	header{
		display: none;
	}
	footer{
		display:none;
	}
	/* #productMain{
    	padding-left: 0px;
	} */
</style>
	<c:forEach var="data" items="${list}">
		<div id="productDiv">
			<ul style="width:200px;">
				<li><img src="/sshj/img/${data.thumbimg}"></li>
				<li>
					<c:if test="${data.saleprice==null || data.saleprice=='' || data.salefinish=='1' || data.salestart=='1'}">
						${data.productprice}원
					</c:if>
					<c:if test="${data.saleprice != null && data.saleprice != '' && data.salefinish !='1' && data.salestart !='1'}">
						${data.proprice}원
					</c:if>
				</li>
				<li>${data.productname}</li>
				<c:if test="${data.totalscore==1}">
					<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★☆☆☆☆</span></li>
				</c:if>
				<c:if test="${data.totalscore==2}">
					<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★☆☆☆</span></li>
				</c:if>
				<c:if test="${data.totalscore==3}">
					<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★☆☆</span></li>
				</c:if>
				<c:if test="${data.totalscore==4}">
					<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★★☆</span></li>
				</c:if>
				<c:if test="${data.totalscore==5}">
					<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★★★</span></li>
				</c:if>
				<li>${data.storeaddr}</li>
				<li>${data.username}</li>
			</ul>
		</div>
	</c:forEach>