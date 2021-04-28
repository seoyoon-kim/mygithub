<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

/*  기본설정----------------------------------------------                 */
#main {
	font-size: 20px;
}

.section {
	width: 1080px;
	background-color: white;
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}

#searchBtn {
	top: 0px;
	left: 0px;
}

#cMyPageLeft {
	display: block;
}

/* ------------------페이징처리부분-------------------- */
.page_wrap {
	text-align: center;
	font-size: 0;
	padding-bottom: 30px;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 35px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat
		center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat
		center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat
		center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat
		center center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

/* ---------------페이징 처리끝-------------------- */
/*--------------상단 메뉴바들-------------------->*/
#recitb {
	height: 30px;
	margin-left:50px;
    margin-top: 50px;
}

#reciTitle {
	width: 100%;
	color: rgb(252, 118, 45);
	margin-top: 10px;
	margin-bottom: 15px;
	font-size: 1em;
	height: auto;
	
}

#myrecipeTop {
	float: left;
	width: 500px;
}

#myrecipeTop2 {
	float: right;
	width: 440px;
}

#myrecipeTop2>li {
	padding-right: 10px;
}

/*------------------------하단 게시판메뉴-----------------------------------*/
#recimainbox {
	float: left;
	width: 100%;
	padding-left: 10px;
	margin-left:50px;
	margin-top:20px;
}

#recipebox {
	padding-top: 10px;
	padding-bottom: 10px;
	width: 30%;
	float: left;
}

#recipebox>ul>li>a>img {
	width: 270px;
	height: 170px;
	border-radius: 3px;
}

#recipebox>ul>li:nth-child(5n+1) {
	width: 100%;
}

#recipebox>ul>li:nth-child(5n+2) {
	width: 100%;
	font-weight: bold;
	margin-top: 5px;
}

#recipebox>ul>li:nth-child(5n+3) {
	width: 100%;
}

#recipebox>ul>li:nth-child(5n+4) {
	width: 80%;
	font-size: 0.5em;
}

#recipebox>ul>li:nth-child(5n+5) {
	width: 10%;
}

/*-------------------------------------------*/
/*버튼*/
#myrbtn, #goodrbtn {
	padding: 3px 10px;
	color: #666666;
	border-radius: 5px;
	background: #fff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border: none;
}

#norebtn {
	padding: 3px 10px;
	color: #fff;
	border-radius: 5px;
	background: gray;
	text-decoration: none;
	display: inline-block;
	border: none;
	height: 25px;
	font-size: 0.5em;
}

/*버튼*/
#myrbtn:hover, #goodrbtn:hover {
	background: gray;
	color: white;
	display: inline-block;
}

#myrbtn:active, #goodrbtn:active {
	background: gray;
	color: white;
	display: inline-block;
}
</style>

<body>
	<div class="section" id="main">
		<div>
			<div id="reciTitle">
				<h1>마이레시피</h1>
			</div>

			<!--------------상단 메뉴바들-------------------->
			<div id="recitb">
				<div id="myrecipeTop">
					<input type="button" id="myrbtn" value="나의 레시피" /> <input
						type="button" id="goodrbtn" value="즐겨찾기 레시피" />
				</div>
				<ul id="myrecipeTop2">
					<li><select name="selectOrder">
							<option>최신순</option>
							<option>추천순</option>
							<option>조회수순</option>
					</select></li>
					<li><input type="button" id="norebtn" value="선택즐겨찾기제거" /></li>
					<li><input type="text" id="search" name="search"
						placeholder="검색하기"></li>
				</ul>
			</div>
		</div>
		<!--------------게시판 이미지들-------------------->
		<div id="recimainbox">
			<div id="recipebox">
				<ul>
					<li><a href=""><img src="img/cr3.jfif"></a></li>
					<li><a href="">멋진토마토 레시피 만들기</a></li>
					<li>닉네임</li>
					<li>★★★★★(15) 조회수 25</li>
					<li><input type="checkbox" name="recipeCheckBox" value="" /></li>
				</ul>
			</div>



			<div id="recipebox">
				<ul>
					<li><a href=""><img src="img/cr3.jfif"></a></li>
					<li><a href="">멋진토마토 레시피 만들기</a></li>
					<li>닉네임</li>
					<li>★★★★★(15) 조회수 25</li>
					<li><input type="checkbox" name="recipeCheckBox" value="" /></li>
				</ul>
			</div>



			<div id="recipebox">
				<ul>
					<li><a href=""><img src="img/cr3.jfif"></a></li>
					<li><a href="">멋진토마토 레시피 만들기</a></li>
					<li>닉네임</li>
					<li>★★★★★(15) 조회수 25</li>
					<li><input type="checkbox" name="recipeCheckBox" value="" /></li>
				</ul>
			</div>



			<div id="recipebox">
				<ul>
					<li><a href=""><img src="img/cr3.jfif"></a></li>
					<li><a href="">멋진토마토 레시피 만들기</a></li>
					<li>닉네임</li>
					<li>★★★★★(15) 조회수 25</li>
					<li><input type="checkbox" name="recipeCheckBox" value="" /></li>
				</ul>
			</div>



		</div>
		<!--------------페이징 표시-------------------->


		<div class="page_wrap">
			<div class="page_nation">
				<a class="arrow pprev" href="#"></a> <a class="arrow prev" href="#"></a>
				<a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a>
				<a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a>
				<a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a
					class="arrow next" href="#"></a> <a class="arrow nnext" href="#"></a>
			</div>
		</div>











	</div>