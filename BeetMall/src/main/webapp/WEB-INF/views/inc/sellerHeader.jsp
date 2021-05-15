<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<style>
/* 판매자 페이지는 header, footer 따로쓰기위해 display none */
body{
	font-family: 'Noto Sans KR', sans-serif;
}

header{
	display: none;
}

#seller_header{
	font-family: 'Noto Sans KR', sans-serif;
}

/*================ seller header =================*/
nav{
	width: 100%;
	height: 120px;
	padding: 0 20px;
	box-shadow: 0px 0px 5px #3a7a36;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background-color: white;
	display: flex;
	flex-direction: column;
}

#headerMember{
	width: 1280px;
	display: flex;
	justify-content:flex-end;
	flex-direction: row;
	margin: 5px auto 0 auto;
}

.sellerMenuButtons{
	border: none;
	background-color: white;
	padding: 0 0 0 5px;
}

nav>ul{
	display: flex;
	width: 1280px;
	height: 100px;
	line-height: 100px;
	margin: 0 auto;
	flex-direction: row;
	justify-content: space-between;
}

nav>ul>li{
	font-size: 16px;
	text-align: center;
}

nav>ul>li>a:hover,#sellerHeaderSubMenu>li>a:hover{
	color:black;
	font-weight: bold;
	font-size: 16px;
}

nav>ul>li:nth-child(1)>a{
	color: #3a7a36;
	font-size: 40px;
	font-weight: bold;
	font-family: 'Lobster', cursive;
}

#sellerHeaderSubMenu{
	width: 100px;
	height: 80px;
	line-height: 40px;
	border: 1px solid #aaa;
	display: none;
	background-color: #fff;
}

#sellerHeaderSubMenu>li:first-child{
	border-bottom: 1px solid #ddd;
}

footer{
	box-shadow: 0px 0px 5px #bbb;
}

</style>
<c:if test="${logType!=2}">
	<script>
		alert('판매자만 페이지에 접속 할 수 있습니다.');
		location.href = "/sshj";
	</script>
</c:if>
<script>
 	$( () => {
		$('#headerSelectMenu').hover( function(){
			$(this).children('ul').css('display','block');
		}, function(){
			$(this).children('ul').css('display','none');
		})
	}) 
</script>
<div id="seller_header">
	<!-- 상단 메뉴 바 -->
	<nav>
		<div id="headerMember">
			<c:if test="${logStatus != 'Y'}">
				<div class="sellerLoginBtn">
					<!-- 로그인 전 -->
					<input type="button" value="회원가입" class="sellerMenuButtons" /> <input type="button" value="로그인" class="sellerMenuButtons" /> <input type="button" value="고객센터" class="sellerMenuButtons" />
				</div>
			</c:if>
			<c:if test="${logStatus == 'Y' }">
				<div class="sellerLoginBtn">
					<!-- 로그인 후 -->
					<c:if test="${logType==2}">
						<input type="button" value="판매자 페이지로 이동하기" class="sellerMenuButtons" />
					</c:if>
					<a href="myinfoEdit">${logName}님</a><span id="sellerMenuButtons">▼</span> <input type="button" value="로그아웃" class="sellerMenuButtons" /> <input type="button" value="고객센터" class="sellerMenuButtons" onClick="location.href='<%=request.getContextPath()%>/notice'" />
				</div>
			</c:if>
		</div>
		<ul>
			<li><a href="#" >Beetmall</a></li>
			<li><a href="product_list">상품 관리</a></li>
			<li><a href="product_regi">상품 등록</a></li>
			<li><a href="order_management">주문 관리</a></li>
			<li><a href="sale_management">판매 관리</a></li>
			<li><a href="#">배송 관리</a></li>
			<li><a href="sellerSales">매출 관리</a></li>
			<li><a href="sellerSettle">정산 관리</a></li>
			<li><a href="sellerIntroFarm">농장 관리</a></li>
			<li id="headerSelectMenu"><a href="sellerReview">리뷰/문의 관리</a>
				<ul id="sellerHeaderSubMenu">
					<li><a href="sellerReview">리뷰 관리</a></li>
					<li><a href="sellerAskManagement">문의 관리</a></li>
				</ul>
			</li>
			<li><a href="#">회원정보수정</a></li>
		</ul>
	</nav>
</div>