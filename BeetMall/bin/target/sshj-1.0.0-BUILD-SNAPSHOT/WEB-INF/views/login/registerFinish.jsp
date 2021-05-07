<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#regiFin{
		height:950px;
	}
	#regiFin>h2{
		padding-top:10px;
	}
	#regiFinInfos{
		height:400px;
		width:1080px;
		padding:0 50px;
	}
	.regiFinInfo{
		width:235px;
		height:300px;
		padding:0 5px;
		float:left;
		margin-top:100px;
		
	}
	.regiFinInfo>img{
		height:155px;
		width:155px;
		margin-left:40px;
		margin-right:40px;
		
	}
	.regiFinInfoTxt{
		margin-top:20px;
		font-size:20px;
		line-height:35px;
		text-align: center;
		
	}
	#regiFinBtnDiv{
		height:80px;
		width:1080px;
		padding-left:220px;
		margin-top:160px;
	}
	.regiFinBtn{
		height: 80px;
		float:left;
		width:300px;
		border-radius: 5px;
		background-color: rgb(252,118,45);
		color:white;
		line-height: 70px;
		font-size:25px;
		margin-left: 10px;
	}
</style>
<script>
	$(function(){
		$("#goHomeBtn").click(function(){
			location.href="/sshj";
		});
		$("#goBuyBtn").click(function(){
			location.href="/sshj";
		})
	})
</script>
<div class="section" id="regiFin">
	<h2>회원님 환영합니다.</h2>
	<hr/>
	<h3>비트몰 가입을 환영합니다.</h3>
	<h4>비트몰의 다양한 서비스를 소개합니다.</h4>
	<div id="regiFinInfos">
		<div class="regiFinInfo"><img src="/sshj/img/dstore.png"/><div class="regiFinInfoTxt">우리동네<br/>가까운 농장을<br/>찾아보세요</div></div>
		<div class="regiFinInfo"><img src="/sshj/img/dtruck.png"/><div class="regiFinInfoTxt">빠르고<br/>신선한<br/>배송</div></div>
		<div class="regiFinInfo"><img src="/sshj/img/dcoins.png"/><div class="regiFinInfoTxt">구매 건당<br/>1% 적립</div></div>
		<div class="regiFinInfo"><img src="/sshj/img/dvegetables.png"/><div class="regiFinInfoTxt">유통단계를<br/>거치지 않고<br/>저렵하게 구매가능한<br/>신선한 과일 야채</div></div>
	</div>
	<div id="regiFinBtnDiv">
		<input type="button" value="홈으로" class="regiFinBtn" id="goHomeBtn"/>
		<input type="button" value="지금 구매하러 가기" class="regiFinBtn" id="goBuyBtn"/>
	</div>
</div>