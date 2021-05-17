<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/xstyle_sellerMain.css">
<!-- 차트 라이브러리 chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js"></script>
<script>
//콤마 찍은 숫자 표현하기, 정규표현식
function reqularExpression(num){
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
}
</script>
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
						<img src="<%=request.getContextPath()%>/resources/img/new.png">
						<ul>
							<c:if test="${newOrder != null && newOrder != ''}">
								<li>신규주문 &nbsp;<p>${newOrder }</p> 건</li>
							</c:if>
							<c:if test="${newOrder == null}">
								<li>신규주문 &nbsp;<p>0</p> 건</li>
							</c:if>
						</ul>
					</div>
					<div id="deliveryContainer">
						<img src="<%=request.getContextPath()%>/resources/img/delivery.png">
						<ul>
							<c:if test="${ing != null && ing != '' }">
								<li>배송중 &nbsp;<p>${ing}</p> 건</li>
							</c:if>
							<c:if test="${ing == null}">
								<li>배송중 &nbsp;<p>0</p> 건</li>
							</c:if>
							
							<c:if test="${ready != null && ready != '' }">
								<li>배송준비중 &nbsp;<p>${ready }</p> 건</li>
							</c:if>
							<c:if test="${ready == null}">
								<li>배송준비중 &nbsp;<p>0</p> 건</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<div class="firstContainer" id="claimSales">
				<div>클레임/매출</div>
				<div>
					<div id="claimContainer">
						<img src="<%=request.getContextPath()%>/resources/img/refund.png">					
						<ul>
							<c:if test="${cancel != null && ing != '' }">
								<li>취소요청 &nbsp;<p>${cancel}</p> 건</li>
							</c:if>
							<c:if test="${cancel == null}">
								<li>취소요청 &nbsp;<p>0</p> 건</li>
							</c:if>
							
							<c:if test="${refund != null && refund != '' }">
								<li>환불요청 &nbsp;<p>${refund}</p> 건</li>
							</c:if>
							<c:if test="${refund == null}">
								<li>환불요청 &nbsp;<p>0</p> 건</li>
							</c:if>	
						</ul>
					</div>
					<div id="salesContainer">
						<img src="<%=request.getContextPath()%>/resources/img/dash.png">
						<ul>
							<li>매출 &nbsp;<p>${todayMoney}</p> 원</li>
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
							labels: [],
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
				<c:if test="${resultStr0 != null}">
					<script>
					let data = {
							label : '3개월 매출 내역',
							data : [${resultStr0},${resultStr1},${resultStr2}],
							borderColor : [
								'rgba(255,99,132,1)',
							]
					}
					myChart.data.labels.push('${resultDate0}','${resultDate1}','${resultDate2}');
					myChart.data.datasets.push(data);
					myChart.update();
					</script>
				</c:if>
				
			</div>
			<div class="secondContainer" id="review">
				<div>미답변문의/리뷰</div>
				<div>
					<img src="<%=request.getContextPath()%>/resources/img/question.png">
					<ul>
						<c:if test="${qboard !=null}">
							<li>미답변 문의 &nbsp;<p>${qboard.qanswer}</p> 건</li>
						</c:if>
						<c:if test="${qboard ==null}">
							<li>미답변 문의 &nbsp;<p>0</p> 건</li>
						</c:if>
						<c:if test="${review !=null}">
							<li>미답변 문의 &nbsp;<p>${review.reviewanswer}</p> 건</li>
						</c:if>
						<c:if test="${review ==null}">
							<li>미답변 문의 &nbsp;<p>0</p> 건</li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="secondContainer" id="notice">
				<div>공지사항</div>
				<ul>
					<c:if test="${notice != null }">
						<c:forEach var="data" items="${notice }">
							<li><div>${data.infotitle}</div><div>${data.infowritedate}</div></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
	</article>
</section>