<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!-- font-family: 'Nanum Gothic', sans-serif; -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- font-family: 'NanumSquare', sans-serif !important; -->

<style>
#searchBtn {
	top: 0px;
	left: 0px;
}

.section {
	width: 1080px;
	background-color: white;
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}

#cMyPageLeft {
	display: block;
}

/*--------------------게시판+타이틀---------------------------*/
#wisht {
	float: left;
	width: 100%;
	height: 20px;
	margin-top: 10px;
	font-weight: bold;
	margin-bottom: 30px;
}
#wisht>b{
	padding-top:20px;
	padding-left:20px;
}
.wishListTitle {
	width: 100%;
	border-bottom: 2px solid #ddd;
	margin-top: 3%;
}

.wishList {
	width: 100%;
}

.wishListTitle>li {
	float: left;
	line-height: 40px;
}

.wishListTitle>li:nth-child(4n+1) {
	width: 57%;
	padding-left: 20%;
}

.wishListTitle>li:nth-child(4n+2) {
	width: 15%;
}

.wishListTitle>li:nth-child(4n+3) {
	width: 5%;
}

.wishListTitle>li:nth-child(4n+4) {
	width: 23%;
}

/*--------------------게시판 리스트들---------------------------*/
.wishList {
	margin-left: 2%;
}

.wishList>li {
	float: left;
	height: 60px;
	width: 10%;
	line-height: 60px;
}

.wishList>li:nth-child(7n+1), .wishList>li:nth-child(7n+1)>a {
	width: 15%;
}

.wishList>li:nth-child(7n+2), .wishList>li:nth-child(7n+2)>a {
	width: 40%;
}

.wishList>li:nth-child(7n+3) {
	width: 15%;
}

.wishList>li:nth-child(7n+4) {
	width: 5%;
}

.wishList>li:nth-child(7n+7) {
	width: 5%;
}

.wishList>li>a>img {
	width: 60px;
	height: 50px;
	border-radius: 5px;
}

/*--------------------게시판 버튼들---------------------------*/
#nogetbutton {
	line-height: 20px;
	float: right;
	color: #fff;
	border-radius: 5px;
	background: gray;
	text-decoration: none;
	display: inline-block;
	border: none;
	height: 30px;
	width:120px;
	
}

#nogetbutton:hover {
	color: red;
}

#wishCenterButton {
	width: 100%;
	text-align: center;
}

#wishPriceTitle {
	padding-left: 80%;
	float: right;
	width: 100%;
	margin-bottom: 50px;
}

/*버튼----------------------------------------------------------------*/
#swishbtn, #twishbtn {
	padding: 3px 10px;
	color: #666666;
	border-radius: 8px;
	background: #fff;
	box-shadow: 0 0px 3px 0 rgba(0, 0, 0, 0.5);
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border: none;
}
/*버튼*/
#swishbtn:hover, #twishbtn:hover {
	background: gray;
	color: white;
	display: inline-block;
}

#getbutton {
	padding: 3px 10px;
	color: #666666;
	border-radius: 8px;
	background: #fff;
	box-shadow: 0 0px 3px 0 rgba(0, 0, 0, 0.5);
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border: none;
	line-height: 20px;
	height: 25px;
}

#getbutton:hover {
	background-color: #eee;
	color: red;
	display: inline-block;
}

#whisListPage {
	font-size: 17px;
	height:1080px;
}

.wishList a:active, .wishList a:link, .wishList a:hover, .wishList a:visited{
	color: black;
}
#menuListUl{
	font-size:14px;
}
</style>
	<div class="section" id="whisListPage">
		<!-- 큰제목 ---------------------------------------------->

		<div id="wisht">
			<b>*********의 장바구니 입니다.</b>
		</div>

		<input type="button" value="선택상품제거" id="nogetbutton" />

		<!-- ----------------게시판------------------------ -->
		<div class="wishlistbox">

			<ul class="wishListTitle">
				<li><b>상품</b></li>
				<li><b>판매가</b></li>
				<li><b>수량</b></li>
				<li><b>구매가격</b></li>
			</ul>


			<ul class="wishList">
				<li><a href=""><img src="img/cr3.jfif"></a></li>
				<li><a href="">맛있는오렌지</a></li>
				<li>17,900</li>
				<li><select name="selectwish">
						<option>1</option>
						<option>2</option>
						<option>3</option>
				</select></li>
				<li>17,900</li>
				<li><input type="button" value="구매하기" id="getbutton" /></li>
				<li><input type="checkbox" name="boardCheckBox" value="" /></li>



				<li><a href=""><img src="img/cr3.jfif"></a></li>
				<li><a href="">맛있는오렌지</a></li>
				<li>17,900</li>
				<li><select name="selectwish">
						<option>1</option>
						<option>2</option>
						<option>3</option>
				</select></li>
				<li>17,900</li>
				<li><input type="button" value="구매하기" id="getbutton" /></li>
				<li><input type="checkbox" name="boardCheckBox" value="" /></li>




				<li><a href=""><img src="img/cr3.jfif"></a></li>
				<li><a href="">맛있는오렌지</a></li>
				<li>17,900</li>
				<li><select name="selectwish">
						<option>1</option>
						<option>2</option>
						<option>3</option>
				</select></li>
				<li>17,900</li>
				<li><input type="button" value="구매하기" id="getbutton" /></li>
				<li><input type="checkbox" name="boardCheckBox" value="" /></li>

			</ul>
		</div>

		<!-- ----------------게시판 밑에 버튼------------------------ -->

		<div id="wishCenterButton">
			<input type="button" value="선택주문" id="swishbtn" /> <input
				type="button" value="전체주문" id="twishbtn" />
		</div>

		<!-- ----------------게시판 밑에 총가격------------------------ -->

		<div id="wishPriceTitle">
			<h4>장바구니 현재 금액</h4>
			<h2 style="color: red;">
				<b>29,960</b>
			</h2>
		</div>
		<div style="clear: both;"></div>
	</div>
</html>