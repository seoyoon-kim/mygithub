<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=dvice-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style>

	/*================ 기본 설정 시작 =================*/
	header{
		width:1080px; 
		margin:0 auto;
		height:200px;
		background-color:pink;
	}
	section{
		width:1080px;
		margin:0 auto;
		overflow:auto;
		display:flex;
		flex-direction:row;
	}
	footer{
		width:1080px;
		margin:0 auto;
	}
	ul,li{
		padding:0;
		margin:0;
	}
	a:hover{text-decoration:none; color:white;}
	a:active{text-decoration:none; color:white;}
	a:visited{text-decoration:none; color:white;}
	a:checked{text-decoration:none; color:white;}
	
	/*================ 기본 설정 끝 =================*/
	
	/*================ 사이드바 시작=================*/
	nav{
		width:180px;
		padding:0 10px;
		background-color:rgb(224,102,102);
	}
	nav li{
		padding:25px;
		text-align:center;
	}
	/*================ 사이드바 끝 =================*/
	
	/*================ 본문 시작 =================*/
	article{
		width:100%;
		background-color:#ddd;
	}
	/* 검색하기 */
	#search_box{
		text-align:right;
		height:40px;
		background-color:#aaa;
	}
	#serach{
	}
	#search_box img{
		width:34px;
		height:34px;
		color:rgb(224,102,102);
	}
	
	/*---------- 본문 컨테이너 -----------*/
	#info_container{
		width:700px;
		margin:0 auto;
	}
	
	/* 프로필 이미지*/
	#profile_box{
		width:700px;
		height:200px;
		text-align:center;
		margin:30px auto;
		border:1px solid #ddd;
		background-color:#fff;
	}
	#seller_nickname{
		font-size:12px;
		margin-bottom:10px;
	}
	#profile_box img{
		width:100px;
		height:110px;
		margin:10px auto 0 auto;
	}
	
	/* 농장 소개 */
	#farm_info>div,#farm_contact>div:nth-child(1),#farm_repMenu>div:nth-child(1){
		width:150px;
		background-color:yellow;
	}
	#farm_info{
		display:flex;
	}
	#farm_contact{
		display:flex;
	}
	#farm_repMenu{
		display:flex;
	}
	#contact_content span{
		display:block;
		width:150px;
		height:30px;
		background-color:red;
	}
	
	
	/*---------- 본문 컨테이너 끝 -----------*/
	
	/*================ 본문 끝 =================*/
</style>
</head>
<body>
<header>
hello
</header>
<section>
	<!-- 사이드바 -->
	<nav>
		<ul>
			<li><a href="#">상품 관리</a></li>
			<li><a href="#">상품 등록</a></li>
			<li><a href="#">주문 관리</a></li>
			<li><a href="#">판매 관리</a></li>
			<li><a href="#">매출 관리</a></li>
			<li><a href="#">정산 관리</a></li>
			<li><a href="#">배송 관리</a></li>
			<li><a href="#">리뷰/문의 관리</a></li>
			<li><a href="#">회원정보수정</a></li>
		</ul>
	</nav>
	<!-- 본문 시작 -->
	<article>
		<div id="search_box">
			<input type="text" id="search" name="search" placeholder="검색하기"/>
			<img src="<%=request.getContextPath()%>/resources/search_icon.png"/>
		</div>
		<!-- info 컨테이너 묶기 width:700px 고정 -->
		<div id="info_container">
			<div id="profile_box">
				<img src="<%=request.getContextPath()%>/resources/profile_img.jpg"/>
				<div id="seller_nickname">작은농부 이강산</div>
				<div>
					방문자수 : 0명<br/>
					즐겨찾기 : 0명
				</div>
			</div>
			<hr/>
			<div id="farm_info">
				<div>INFO</div>
				<p>제가 키운건 자부심 있습니다!</p>
			</div>
			<div id="farm_contact">
				<div>CONTACT</div>
				<div id="contact_content">
					<b>스토어 정보</b>
					<span>상호명</span><p></p><br/>
					<span>대표자</span><p></p><br/>
					<span>사업자등록번호</span><p></p><br/>
					<span>사업장 소재지</span><p></p><br/>
					<span>계좌번호</span><p></p><br/>
					<span>E-Mail</span><p></p>
				</div>
			</div>
			<div id="farm_repMenu">
				<div>대표메뉴</div>
				<p>테스트테스트테스트</p>
			</div>
		</div>
	</article>
</section>
<footer>
</footer>
</body>
</html>