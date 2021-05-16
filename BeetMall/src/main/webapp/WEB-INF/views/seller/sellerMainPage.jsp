<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/xstyle_sellerMain.css">
<!-- 차트 라이브러리 chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js"></script>
<section>
	<%@include file="/WEB-INF/views/inc/sellerHeader.jsp"%>
	<!-- 본문 시작 -->
	<article>
		<!-- 첫번째 단 -->
		<div id="firstLine">
			<div class="firstContainer" id="orderDelivery">
				<div>주문/배송</div>
				<div>
					<div id="orderContainer">
						<img src="<%=request.getContextPath()%>/img/y_new.png">
						<ul>
							<li>신규주문 <p></p> 건</li>
						</ul>
					</div>
					<div id="deliveryContainer">
						<img src="<%=request.getContextPath()%>/img/y_truck.png">
						<ul>
							<li>배송준비 <p>0</p> 건</li>
							<li>배송중  <p>2</p> 건</li>
							<li>배송완료 <p>3</p> 건</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="firstContainer" id="claimSales">
				<div>클레임/매출</div>
				<div>
					<div id="claimContainer">
						<img src="<%=request.getContextPath()%>/img/y_undo.png">					
						<ul>
							<li>취소요청 <p>0</p> 건</li>
							<li>반품요청 <p>0</p> 건</li>
							<li>교환요청 <p>0</p> 건</li>
						</ul>
					</div>
					<div id="salesContainer">
						<img src="<%=request.getContextPath()%>/img/y_won.png">
						<ul>
							<li>매출 <p></p> 원</li>
							<li>환불 <p></p> 원</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="secondLine">
			<div class="secondContainer" id="sales">
				<div>매출통계</div>
				<canvas id="myChart" style="width: 90%; height: 80%; margin: 10px auto 0 auto;"></canvas>

				<script> // 차트 선언, 카테고리, 날짜, 차트, 엑셀 관여하는 스크립트
				
					let ctx = document.getElementById("myChart").getContext("2d");
					myChart = new Chart(ctx, {
						type: 'line',
						data:{
							labels: [], // 몇년 몇월 몇일 표시하는 데이터
							datasets: [] // 차트에 그려지는 데이터를 표시하는 데이터
						},
						options: {
							responsive: false,
							scales:{
								y:{
									beginAtZero: true // 차트 숫자는 0부터 표시
								}
								
							}
							
						}
					});
				
				</script>
			</div>
			<div class="secondContainer" id="review">
				<div>미답변문의/리뷰</div>
				<div>
					<img src="<%=request.getContextPath()%>/img/y_question.png">
					<ul>
						<li>미답변 문의 <p></p> 건</li>
						<li>미답변 리뷰 <p></p> 건</li>
					</ul>
				</div>
			</div>
			<div class="secondContainer" id="notice">
				<div>공지사항</div>
				<ul>
					<li>공지</li>
				</ul>
			</div>
		</div>
	</article>
</section>