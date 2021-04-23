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
	#pointUl>li:nth-child(1), #pointUl>li:nth-child(2), #pointUl>li:nth-child(3), #pointUl>li:nth-child(4), #pointUl>li:nth-child(5){
		font-size:20px;
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
	
</style>
<div class="section">
	<div id="mypointList">
		<h2>마이포인트</h2>
		<h3>현재 포인트 : <span>1000</span>p</h3>
		<div>
			여기는 이미지같은거 넣어놔도 좋을듯... 뭔가 좀 애매함..<br/>
			포인트 적립에 대한 간단한 설명<br/>
			포인트 적립 기준<br/>
			포인트 사용기준 설명<br/>
		</div>
		<div id="pointSelect">
			<div class="Pbuttons">전체</div>
			<div class="Pbuttons">적립</div>
			<div class="Pbuttons">소비</div>
		</div>
		<div id="pointSelectDate">
			<div class="Pbuttons">3개월</div>
			<div class="Pbuttons">6개월</div>
			<div class="Pbuttons">1년</div>
		</div>
		<div>
			<ul id="pointUl">
				<li>일시</li>
				<li>상품</li>
				<li>판매가</li>
				<li>마일리지</li>
				<li>잔여<br/>마일리지</li>
				
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>
					<img src="/sshj/img/pi.gif">
					<span class="pointtitle wordcut">맛깔나는귤</span><br/>
					<span class="pointdetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li><span><span class="pointup">17p적립</span></span></li>
				<li><span class="pointresult">230p</span></li>
				
				
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>
					<img src="/sshj/img/pi.gif">
					<span class="pointtitle wordcut">맛깔나는귤</span><br/>
					<span class="pointdetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li><span><span class="pointdown">17p적립</span></span></li>
				<li><span class="pointresult">230p</span></li>
				
				
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>
					<img src="/sshj/img/pi.gif">
					<span class="pointtitle wordcut">맛깔나는귤</span><br/>
					<span class="pointdetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li><span><span class="pointdown">17p적립</span></span></li>
				<li><span class="pointresult">230p</span></li>
				
				
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>
					<img src="/sshj/img/pi.gif">
					<span class="pointtitle wordcut">맛깔나는귤</span><br/>
					<span class="pointdetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li><span><span class="pointup">17p적립</span></span></li>
				<li><span class="pointresult">230p</span></li>
			</ul>
		</div>
	</div>
</div>