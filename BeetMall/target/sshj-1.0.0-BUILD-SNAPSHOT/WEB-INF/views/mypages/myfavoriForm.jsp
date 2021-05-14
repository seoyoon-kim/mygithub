<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif;}
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
		padding-top: 80px;
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
	.like{
		height:20px;
		width:20px;
		background-size:20px 20px;
		float:right;
	}
	.like{
		background-image:url(/sshj/img/dlike.png);
	}
</style>
<div class="section">
	<div id="myfavList">
		<div id="ttile" class="ttile"><h2>즐겨찾기한 농장</h2></div>
		<div>
			<ul id="favUl">
				<li></li>
				<li>소개</li>
				<li>위치</li>
				<li>즐겨찾기한 사용자</li>
				<li>구경하기</li>
				
				<c:forEach var="data" items="${list}">
					<li></li>
					<li>
						<img src="/sshj/img/${data.farmprofile}"><span class="buyttitle wordcut">${data.farmname}</span><span class="buydetail wordcut">${data.farmintro}</span>
					</li>
					<li><span class="favprice">${data.storeaddr}</span></li>
					<li style="color: red;"><div class="like">${data.goodTotal}명</div></li>
					<li><input type="button" class="buybutton" value="구경가기"/></li>
				</c:forEach>				
			</ul>
		</div>
	</div>
</div>