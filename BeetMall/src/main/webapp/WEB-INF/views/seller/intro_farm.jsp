<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<<<<<<< HEAD:BeetMall/src/main/webapp/WEB-INF/views/seller/intro_farm.jsp

=======
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
>>>>>>> parent of f12ae57 (feature/intro_farm#13 농장 소개 페이지 내부 스타일 적용):BeetMall/src/main/webapp/WEB-INF/views/intro_farm.jsp
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
<<<<<<< HEAD:BeetMall/src/main/webapp/WEB-INF/views/seller/intro_farm.jsp
		
		<form method="post" action="farmEdit" id="info_frm">
			<input type="hidden" name="storenum" value="${storenum}"/>
			<!-- info 컨테이너 묶기 width:700px 고정 -->
			<div id="info_container">
				<div id="profile_box">
					<img src="<%=request.getContextPath()%>/resources/img/xprofile_img.jpg"/>
					<div id="farmname" name="farmname">사나없이 사나마나</div>
					<div>
						방문자수 : ${farmvisitor }명<br/>
						즐겨찾기 : 즐겨찾기 수 명
					</div>
				</div><!-- profile_box 종료 -->
				<hr/>
				<div id="farm_info">
					<div>INFO</div>
					<p name="farmintro">제가 키운건 자부심 있습니다!</p>
				</div><!-- farm_info 종료 -->
				<div id="farm_contact">
					<div>CONTACT</div>
					<div id="contact_content">
						<b>스토어 정보</b>
						<div><span>상호명</span><p name="storename">금강산 푸르게</p></div>
						<div><span>대표자</span><p name="sellername">이강산</p></div>
						<div><span>사업자등록번호</span><p name="sellerreginum">622-220-11234</p></div>
						<div><span>사업장 소재지</span><p name="storeaddr">서울특별시 영등포구 ...</p></div>
						<div><span>은행명</span><p name="bank">신한은행</p></div>
						<div><span>예금주</span><p name="bankname">이강산</p></div>
						<div><span>계좌번호</span><p name="bankaccount">110-393-12341234</p></div>
						<div><span>E-Mail</span><p name="storeemail">rkdtksfl96@hanmail.net</p></div>
					</div>
				</div><!-- farm_contact 종료 -->
				<div id="farm_repMenu">
					<input type="hidden" name="productnum" value="productnum"/> 
					<div>대표메뉴</div>
					<div id="repMenu_content">
						<img src="<%=request.getContextPath()%>/resources/img/xeggplant.jpg" name="thumbimg"/>
						<div>
							<div><span name="">14%</span>&nbsp;<p name="saleprice">50,000원</p></div>
							<p name="productname">상추 품평회에서 대상 수상한 정말 맛있는 상추 설탕 먹여서 키움</p>
						</div>
					</div>
=======
		<!-- info 컨테이너 묶기 width:700px 고정 -->
		<div id="info_container">
			<div id="profile_box">
				<img src="<%=request.getContextPath()%>/resources/profile_img.jpg"/>
				<div id="seller_nickname">작은농부 이강산</div>
				<div>
					방문자수 : 0명<br/>
					즐겨찾기 : 0명
>>>>>>> parent of f12ae57 (feature/intro_farm#13 농장 소개 페이지 내부 스타일 적용):BeetMall/src/main/webapp/WEB-INF/views/intro_farm.jsp
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