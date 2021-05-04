<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/xstyle_settlementManagement.css">
<section>
	<%@include file="/WEB-INF/views/inc/sellerHeader.jsp"%>
	<article>
		<div class="seller_title">정산관리</div>
			<div class="wrap">
				<div class="wrapTitle">조회하기</div>
				<div class="wrapContainer">
					<form method="post" action="">
						<div id="searchingStandard">
							<p>조회기준</p>
							<button id="dateBtn">날짜</button>
							<button id="orderBtn">주문 건별</button>
						</div>
						<div id="searchingTerm">
							<p>조회기간</p>
							<select>
								<option selected="selected">전체</option>
								<option>정산 날짜</option>
								<option>매출일자</option>
							</select>
							<input type="date" id="startDate" name="startDate"/>
							<input type="date" id="endDate" name="endDate"/>
						</div>
						<div id="searchingBtnContainer">
							<input class="normalBtn" type="submit" value="검색"/>
							<input class="normalBtn" type="reset" value="초기화"/>
						</div>
					</form>
				</div>
				<div class="wrapTitle">주문 건별 정산분석</div>
				<div class="wrapContainer">
					<table>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>매출일자</th>
								<th>주문금액</th>
								<th>결제수수료</th>
								<th>실결제금액</th>
								<th>이용수수료</th>
								<th>정산금액</th>
								<th>정산날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1234</td>
								<td>2021/02/02</td>
								<td>100</td>
								<td>12</td>
								<td>88</td>
								<td>342</td>
								<td>234</td>
								<td>2021/10/10</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
	</article>
</section>