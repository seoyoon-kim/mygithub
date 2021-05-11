<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#cMyPageLeft{
		display: block;
	}
	#mypointList{
		height:1080px;
		margin-left:20px;
	}
	.Pbuttons{
		height:40px;
		width:80px;
		background-color: #e06666;
		color:white;
		line-height:40px;
		text-align:center;
		border-radius:7%;
		margin-left:1px;
	}
	#pointSelect>div{
		float:left;
	}
	#pointSelectDate{
		float:right;
	}
	#pointSelectDate>div{
		float:left;
	}
	#pointUl{
		padding-top:40px;
		padding-left:20px;
		width:1050px;
	}
	#pointUl>li{
		width:11%;
		height:60px;
		margin:5px 0;
		
	}
	#pointUl>li:nth-child(5n+2){
		width:50%;
	}
	#pointUl>li:nth-child(5n+1){
		width:16%;
	}
	#pointUl>li:nth-child(1), #pointUl>li:nth-child(2), #pointUl>li:nth-child(3), #pointUl>li:nth-child(4){
		line-height:60px;
	}
	#pointUl>li:nth-child(1), #pointUl>li:nth-child(2), #pointUl>li:nth-child(3), #pointUl>li:nth-child(4), #pointUl>li:nth-child(5){
		font-size:17px;
		text-align:center;
		padding-bottom:40px;
		border-bottom:1px solid #e06666;
	}
	#pointUl>li:nth-child(5n+1), #pointUl>li:nth-child(5n+3), #pointUl>li:nth-child(5n+4), #pointUl>li:nth-child(5n){
		text-align:center;
	}
	#pointUl>li:nth-child(5n+1), #pointUl>li:nth-child(5n+2), #pointUl>li:nth-child(5n+3), #pointUl>li:nth-child(5n+4), #pointUl>li:nth-child(5n){
	}
	.pointdate{
		line-height:60px;
	}
	.pointtitle{
		font-size:1.1em;
	}
	.pointdetail{
		font-size:0.9em;
		color:#999;
	}
	.pointprice{
		line-height:60px;
	}
	.pointup, .pointdown{
		font-size: 0.9em;
		line-height:60px;
	}
	.pointup{
		color:red;
	}
	.pointdown{
		color:blue;
	}
	.pointresult{
		font-weight:bold;
		line-height:60px;
	}
	#pointUl img{
		height:58px;
		width:58px;
		float:left;
	}
	#mypointListDiv{
		overflow:auto;
	}
	#linkStop>a:link, #linkStop>a:active, #linkStop>a:visited, #linkStop>a:hover{
		text-decoration: none;
		color:black;
	}
</style>
<script>
	$(document).on('click','#allView',function(){
		location.href="mypoint"
	});
	$(document).on('click','#saveView',function(){
		if($("#month").val()!=null && $("#month").val()!=''){
			location.href="mypoint?type=save&month="+$("#month").val();
		}else{
			location.href="mypoint?type=save"
		}
	})
	$(document).on('click','#spendView',function(){
		if($("#month").val()!=null && $("#month").val()!=''){
			location.href="mypoint?type=spend&month="+$("#month").val();
		}else{
			location.href="mypoint?type=spend"
		}
	})
	$(document).on('click', '#3monthView', function(){
		if($("#type").val()!=null && $("type").val()!=''){
			location.href="mypoint?month=3&type="+$("#type").val();
		}else{
			location.href="mypoint?month=3";
		}
	});
	$(document).on('click', '#6monthView', function(){
		if($("#type").val()!=null && $("type").val()!=''){
			location.href="mypoint?month=6&type="+$("#type").val();
		}else{
			location.href="mypoint?month=6";
		}
	});
	$(document).on('click', '#12monthView', function(){
		if($("#type").val()!=null && $("type").val()!=''){
			location.href="mypoint?month=12&type="+$("#type").val();
		}else{
			location.href="mypoint?month=12";
		}
	});
</script>
<div class="section" id="mypointListDiv">
	<div id="mypointList">
		<c:if test="${type != null}">
			<input type="hidden" id="type" value="${type}"/>
		</c:if>
		<c:if test="${month != null}">
			<input type="hidden" id="month" value="${month}"/>
		</c:if>
		<h2>마이포인트</h2>
		<h4>현재 포인트 : 1000p</h4>
		<div style="margin-bottom:20px;">
			<b style="font-size:15px;">${logId}</b>님의 포인트 적립 현황입니다.<br/>
			저희 비트몰에서는 구매가격의 1%를 포인트로 적립해드리고 있습니다.<br/> 
			포인트는 현금과 동일하게 사용하실 수 있으며, 구매시 사용하여 할인받을 수 있습니다.<br/>
			오늘도 비트몰을 이용해주셔서 감사합니다. <br/>
		</div>
		<div id="pointSelect">
			<div class="btn" id="allView">전체</div>
			<div class="btn" id="saveView">적립</div>
			<div class="btn" id="spendView">소비</div>
		</div>
		<div id="pointSelectDate">
			<div class="btn" id="3monthView">3개월</div>
			<div class="btn" id="6monthView">6개월</div>
			<div class="btn" id="12monthView">1년</div>
		</div>
		<div>
			<ul id="pointUl">
				<li>일시</li>
				<li>상품</li>
				<li>판매가</li>
				<li>마일리지</li>
				<li>잔여<br/>마일리지</li>
				<c:forEach var="vo" items="${list}">
					<li><span class="pointdate">${vo.orderdate}</span></li>
					<li id="linkStop">
						<a href="customproduct?no=${vo.productnum}"><img src="/sshj/resources/sellerProductImgs/${vo.thumbimg}" style="margin-right:10px;"></a>
						<a href="customproduct?no=${vo.productnum}"><span class="pointtitle wordcut">${vo.productname}</span><br/></a>
						<a href="customproduct?no=${vo.productnum}"><span class="pointdetail wordcut">${vo.productcontent }</span></a>
					</li>
					<li><span class="pointprice">${vo.orderprice}</span>원</li>
					<c:if test="${vo.changepoint > 0}">
						<li><span><span class="pointup">${vo.changepoint}p적립</span></span></li>
					</c:if>
					<c:if test="${vo.changepoint < 0}">
						<li><span><span class="pointdown">${vo.changepoint * -1}p소비</span></span></li>
					</c:if>
					<li><span class="pointresult">${vo.usedpoint}p</span></li>
				</c:forEach>
			</ul>
			<ul id="pageUl">
				<c:forEach var="pageVO" items="${plist}">
					<c:if test="${pageVO.pageNum>1}">
						<li><a href="mypoint?no=${pageVO.pageNum-1}"></a>
					</c:if> 
				</c:forEach>
			</ul>
		</div>
	</div>
</div>