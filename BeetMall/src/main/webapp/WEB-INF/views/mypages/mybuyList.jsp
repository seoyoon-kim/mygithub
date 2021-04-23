<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#cMyPageLeft{
		display: block;
	}
	#mypointList{
		height:1080px;
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
		padding:30px 0px;
		margin:0px;
		width:1080px;
	}
	#pointUl>li{
		width:135px;
		height:60px;
		line-height:60px;
		margin:5px 0;
		text-align:center;
	}
	#pointUl>li:nth-child(1), #pointUl>li:nth-child(2), #pointUl>li:nth-child(3), #pointUl>li:nth-child(4), #pointUl>li:nth-child(5), #pointUl>li:nth-child(6){
		border-bottom:1px solid #e06666;
		
	}
	#pointUl>li:nth-child(6n){
		width:240px;
	}
	#pointUl>li:nth-child(6n+3){
		width:300px;
	}
	.buyttitle, .buydetail{
		line-height:30px;
		text-align:left;
		float:left;
		width:242px;
	}
	#pointUl>li:nth-child(6n+3) img{
		line-height:60px;
		float:left;
	}
	#pointUl img{
		height:58px;
		width:58px;
		float:left;
	}
	#cMyPageLeft{
		display:block;
	}
	.buytitle{
		font-size:1.1em;
	}
	.buydetail{
		font-size:0.9em;
		color:#999;
	}
	.wordcut{
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.buybutton{
		width:70px;
		height:35px;
		line-height:35px;
		text-align:center;
		margin:1px;
		padding:0px;
		border: none;
		background-color:#e06666;
		color:white;
		border-radius: 5px;
	}
	.buybuttonNo{
		width:70px;
		height:35px;
		line-height:35px;
		text-align:center;
		margin:1px;
		padding:0px;
		border: none;
		background-color:#e06666;
		color:white;
		border-radius: 5px;
		opacity:60%;
	}
	
</style>
<div class="section">
	<div id="mypointList">
		<h2>구매내역</h2>
		<div id="pointSelect">
			<div class="Pbuttons">전체</div>
		</div>
		<div id="pointSelectDate">
			<div class="Pbuttons">3개월</div>
			<div class="Pbuttons">6개월</div>
			<div class="Pbuttons">1년</div>
		</div>
		<div>
			<ul id="pointUl">
				<li>일시</li>
				<li>주문번호</li>
				<li>상품</li>
				<li>구매가격</li>
				<li>상태</li>
				<li>&nbsp;</li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>배송중</li>
				<li><input type="button" class="buybutton" value="배송조회"/><input type="button" class="buybutton" value="문의작성"/><input type="button" class="buybuttonNo" value="취소"/></li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>배송완료</li>
				<li><input type="button" class="buybutton" value="구매확정"/><input type="button" class="buybutton" value="문의작성"/><input type="button" class="buybutton" value="반품신청"/></li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>취소</li>
				<li></li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>환불</li>
				<li><input type="button" class="buybutton" value="뭐넣지?"/><input type="button" class="buybuttonNo" value="환불확정"/></li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>준비중</li>
				<li><input type="button" class="buybutton" value="취소하기"/><input type="button" class="buybutton" value="문의작성"/></li>
			</ul>
		</div>
	</div>
</div>