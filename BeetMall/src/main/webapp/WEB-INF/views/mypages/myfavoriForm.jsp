<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#cMyPageLeft{
		display: block;
	}
	#myfavList{
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
	#favSelect>div{
		float:left;
	}
	#favSelectDate{
		float:right;
	}
	#favSelectDate>div{
		float:left;
	}
	#favUl{
		padding:0px;
		margin:0px;
		width:1080px;
	}
	#favUl>li{
		width:120px;
		height:60px;
		line-height:60px;
		margin:5px 0;
		text-align:center;
	}
	#favUl>li:nth-child(1), #favUl>li:nth-child(2), #favUl>li:nth-child(3), #favUl>li:nth-child(4), #favUl>li:nth-child(5){
		border-bottom:1px solid #e06666;
		
	}
	#favUl>li:nth-child(5n+3){
		width:240px;
	}
	#favUl>li:nth-child(5n+2){
		width:530px;
		line-height:60px;
		float:left;
	    padding-left: 30px;
	}
	#favUl>li:nth-child(5n+1){
		width:60px;
	}
	.buyttitle, .buydetail{
		line-height:30px;
		text-align:left;
		float:left;
		width:242px;
	}
	#favUl img{
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
	.buybutton2{
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
	#deletee>input{
		float:right;
	}
	#deletee{
		overflow:auto;
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
	
	#ttile{
		overflow:auto;
	}
	#ttile h2{
		float:left;
	}
	
	input[type="checkbox"]{
		display: inline-block;
		width: 20px;
		height: 20px;
		border: 2px solid #bcbcbc;
		cursor: faver;
	}
	
</style>
<div class="section">
	<div id="myfavList">
		<div id="ttile" class="ttile"><h2>000</h2><h2>님이 즐겨찾는 농장입니다.</h2></div>
		<div id="deletee"><input type="button" class="buybutton2" value="삭제하기"/></div>
		<div>
			<ul id="favUl">
				<li></li>
				<li>소개</li>
				<li>위치</li>
				<li>즐겨찾기한 사용자</li>
				<li>구경하기</li>
				
				<!-- 구분용 -->
				<li><input type="checkbox" value="#"></li>
				<li>
					<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="favprice">서울 서대문구</span></li>
				<li>531명</li>
				<li><input type="button" class="buybutton" value="구경가기"/></li>
				
				<!-- 구분용 -->
				<li><input type="checkbox" value="#"></li>
				<li>
					<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="favprice">서울 서대문구</span></li>
				<li>531명</li>
				<li><input type="button" class="buybutton" value="구경가기"/></li>
				
				<!-- 구분용 -->
				<li><input type="checkbox" value="#"></li>
				<li>
					<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="favprice">서울 서대문구</span></li>
				<li>531명</li>
				<li><input type="button" class="buybutton" value="구경가기"/></li>
				
				<!-- 구분용 -->
				<li><input type="checkbox" value="#"></li>
				<li>
					<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="favprice">서울 서대문구</span></li>
				<li>531명</li>
				<li><input type="button" class="buybutton" value="구경가기"/></li>
				
			</ul>
		</div>
	</div>
</div>