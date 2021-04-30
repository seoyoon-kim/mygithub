<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/menu_c.jspf"%>
<style>

/*  기본설정----------------------------------------------                 */
.section {
	width: 1080px;
	background-color: white;
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}

#leftMenu{ display:block;}

a:hover, a:active, a:visited, a:link {
    text-decoration: none;
    color: black;
}

/*  상품 품목글자----------------------------------------------                 */
#mainName {
	text-align: center;
	font-size: 1.5em;
	margin: 0 auto 20px;
	width: 100%;
	text-align: center;
}

#mainName>h2 {
	width: max-content;
	margin-top: 30px;
	margin-bottom: 30px;
	padding-left: 465px;
}

/*  카테고리이미지----------------------------------------------                 */
#category {
	text-align: center;
	width: 1080px;
	padding-right: 165px;
	padding-left: 165px;
	height: 120px;
}

#category>li {
	width: 150px;
}

#category>li>span>img {
	width: 70px;
	height: 70px;
	border-radius: 100%;
}

/*  카테고리 소분류----------------------------------------------                 */
#categorySubmenu>ul {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	floate: left;
	width: 1080px;
	line-height: 30px;
	padding: 0 30px;
}

#categorySubmenu>ul>li {
	width: 204px;
}

/*  정렬방식----------------------------------------------                 */
#selectOrderbox {
	float: left;
	width: 540px;
}

#selectOrder {
	floate: left;
	width: 540px;
}

/*  공유 아이콘 정렬----------------------------------------------                 */
#sharicon {
	float: right;
	width: 540px;
	margin: 0;
	padding-left: 420px;
	text-align: right;
}

#sharicon>li {
	width: 30px;
}

#sharicon>li>a>img {
	width: 25px;
}

/*  상품 박스------------이미지 부분----------------------------------                 */
#productmainbox {
	width: 850px;
}

#productImgBox {
	float: left;
	margin-left: 115px;
	margin-top: 20px; height : 300px;
	width: 300px;
	height: 300px;
}

#productImgBox>img {
	width: 250px;
	height: 300px;
}

#ptime {
	width: 250px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background-color: red;
	color: white;
}

/*  상품 박스------------텍스트 부분----------------------------------                 */
#pbox {
	width: 550px;
	float: left;
	margin-bottom: 40px;
}

#productMainTiltle {
	width: 480px;
	height: 50px;
	line-height: 50px;
	float: left;
	margin-right: 150px;
}

#productPrice {
	float: left;
	width: 50%;
	height: 50px;
	line-height: 50px;
}

#sprofile {
	float: left;
	width: 30%;
	height: 50px;
	line-height: 50px;
}

#simg {
	float: left;
	with: 20%;
	height: 50px;
	line-height: 50px;
}

#simg>a>img {
	width: 50px;
	line-height: 50px;
}

#productPrBox>ul {
	float: left;
	margin: 0 auto;
	padding-left: 0px;
}

#productPrBox>ul>li {
	float: left;
	width: 50%;
	height: 35px;
	line-height: 35px;
}

#mapbtn {
	border: none;
	margin-left: 10px;
	font-size: 0.5em;
	width: 100px;
	height: 25px;
	line-height: 15px;
}

#productPrBox>ul>li>#ppbtn, #productPrBox>ul>li>.pmbtn {
	line-height: 10px;
	width: 20px;
	height:20px;
}

#selecOption {
	width: 80%;
}

#productTotalPrice {
	padding-left: 350px;
	width: 100%;
	float: left;
	line-height: 50px;
	height: 50px;
	font-size:30px;
	font-weight: 700px;
	padding-left:280px;
	margin-bottom:15px;
}

#productBtn {
	width: 100%;
	height: 50px;
	line-height: 30px;
	float: left;
	padding-left:85px;
}

#productBtn>input {
	width: 150px;
}

/*  상세정보박스 상단 버튼----------------------------------------------                 */
.infoBtnb {
	width: 100%;
	float: left;
	padding-left: 10px;
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid rgb(252,118,45);
	margin-bottom: 10px;
}

.infoBtnb>input {
	width: 150px;
	height: 30px;
	line-height: 30px;
	float:left;
}

/*  상세정보박스1 관련상품 -------------------------------------------------------- */
#productInfoPage {
	width: 100%;
	float: left;
	padding-left: 100px;
}

#productInfoPage1 {
	width: 100%;
}

#productInfoPage1>div {
	width: 100%;
	float: left;
}

.relativeList {
	padding-left: 80px;
	padding-right: 80px;
	margin-bottom: 20px;
	float: left;
	width: 100%;
	height: 150px;
	position: relative;
	overflow: hidden;
}

.relativeproduct {
	position: relative;
}

.relativeproduct, .relativeproduct>div {
	float: left;
}

.relativePanel>div:nth-child(4n+1), .relativePanel img {
	width: 190px;
	height: 150px;
}

.relativePanel>div:nth-child(4n+2), .relativePanel>div:nth-child(4n+3) {
	width: 195px;
	height: 30px;
	font-size: 1.1em;
	font-weight: 800;
}

.relativePanel>div:nth-child(4n) {
	width: 195px;
	height: 30px;
	font-size: 0.7em;
	color: #999;
}

.relativePanel {
	width: 195px;
	height: 360px;
	margin-left: 5px;
	margin-right: 5px;
}
/*----------슬라이더------------*/

/* ------------------페이징처리부분-------------------- */
.page_wrap2 {
	text-align: center;
	font-size: 0;
	padding-bottom: 5px;
}

.page_nation2 {
	display: inline-block;
}

.page_nation2 .none {
	display: none;
}

.page_nation2 a {
	display: block;
	margin: 0 3px;
	float: left;
	width: 15px;
	height: 15px;
	line-height: 15px;
	text-align: center;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation2 .arrow {
	border: 1px solid #ccc;
}

.page_nation2 .prev {
	background: #f8f8f8;
	margin-right: 7px;
}

.page_nation2 .next {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat
		center center;
	margin-left: 7px;
}

.page_nation2 a.active {
	color: red;
}

/* ---------------페이징 처리끝-------------------- */
/* ---------------상세정보1 큰이미지랑 큰텍스트들-------------------- */
#pBigimg {
	margin-top: 50px;
	text-align: center;
	width: 100%;
}

#pBigimg>img {
	width: 80%;
	height: 500px;
	margin-bottom: 50px;
}

#pBigtxt {
	padding: 30px;
	float: left;
	width: 80%;
	margin-bottom: 100px;
}

/* ---------------상세정보2 --------------------------------------------------------------------------------- */
#productInfoPage2 {
	width: 100%;
}

#productInfoPage2>#retitle {
	width: 100%;
	float: left;
	margin-bottom: 20px;
}

#reviewTitle, .reviewList {
	width: 100%;
	margin-bottom: 5px;
}

.reviewList {
	height: 200px;
	margin-bottom: 30px;
}

#reviewTitle>li, .reviewList>li {
	width: 10%;
	float: left;
	border-bottom: 1px solid #ddd;
	height: 30px;
	line-height: 30px;
	height: 30px;
}

.reviewList>li {
	height: 200px;
	line-height: 150px;
}

#reviewTitle>li:nth-child(5n+1), .reviewList>li:nth-child(5n+1) {
	text-align:center;
	width: 90px;
}
#reviewTitle>li:nth-child(5n+2){
	text-align:center;
}
#reviewTitle>li:nth-child(5n+2), .reviewList>li:nth-child(5n+2) {
	width: 540px;
}
#reviewTitle>li:nth-child(5n+3), .reviewList>li:nth-child(5n+3) {
	text-align:center;
	width: 180px;
}
#reviewTitle>li:nth-child(5n+4), .reviewList>li:nth-child(5n+4) {
	text-align:center;
	width: 180px;
}
#reviewTitle>li:nth-child(5n), .reviewList>li:nth-child(5n) {
	text-align:center;
	width: 90px;
}

/* 리뷰이미지 설정*/
#reviewImgbox {
	height: 100px;
}

#reviewImgbox>img {
	width: 30%;
	height: 100px;
	margin-right: 2%;
}

#reviewImgbox>img:nth-child(3n+3) {
	margin-right: 6%;
}

#reviewtxtbox {
	width: 100%;
	margin-top: 30px;
	line-height: 20px;
	height: 50px;
	float: left;
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

/* ---------------상세정보박스2끝-------------------- */
/* ---------------상세정보박스3시잗-------------------- */
#productInfoPage3 {
	width: 100%;
}

#productInfoPage3>#qtitle {
	width: 100%;
	float: left;
	margin-bottom: 20px;
}

#qnaTitle {
	width: 100%;
	margin-bottom: 3px;
}


#qnaList {
	width: 100%;
	margin-bottom: 30px;
}

#qnaTitle>li{
	text-align: center;
}
#qnaTitle>li, #qnaList>li {
	width: 10%;
	float: left;
	border-bottom: 1px solid #ddd;
	height: 30px;
	line-height: 30px;
}
#qnaTitle>li:nth-child(5n+1), #qnaList>li:nth-child(5n+1) {
	text-align:center;
	width: 90px;
}
#qnaTitle>li:nth-child(5n+2){
	text-align:center;
}
#qnaTitle>li:nth-child(5n+2), #qnaList>li:nth-child(5n+2) {
	width: 540px;
}

#qnaTitle>li:nth-child(5n+3), #qnaList>li:nth-child(5n+3) {
	text-align:center;
	width: 180px;
}

#qnaTitle>li:nth-child(5n+4), #qnaList>li:nth-child(5n+4) {
	text-align:center;
	width: 180px;
}
#qnaTitle>li:nth-child(5n), #qnaList>li:nth-child(5n) {
	text-align:center;
	width: 90px;
}
#qnaList a:link, #qnaList a:active, #qnaList a:visited, #qnaList a:hover{
	color:black;
}
#qnaList>li>img {
	width: 20px;
	height: 20px;
}

<!--
문의 후기 버튼 -->#reviewWriteBtn {
	
}

#reviewWriteBtn>input {
	float: right;
	width: 80px;
	height: 25px;
	line-height: 20px;
}

#qnaWriteBtn {
	
}

#qnaWriteBtn>input {
	float: right;
	width: 80px;
	height: 25px;
	line-height: 20px;
}

#productPageDiv {
	font-size: 17px;
}

#productInfoPage {
	padding-left: 0px;
}
	button, .btn{
		padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
	}
	.minibtn{
		padding: 3px 5px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
	}
	/*버튼*/
	.btn:hover, .minibtn:hover{
		background: gray;
		color:white;
		display: inline-block;
	}
</style>
<script>

/*

  $(document).ready(function(){
	 
	  
	  $("#infoBtn1").click(function(){
		  $("#productInfoPage1").show()
		   $("#productInfoPage2").hide()
		   $("#productInfoPage3").hide()

	  })
	  
	  
	  $("#infoBtn2").click(function(){
		  $("#productInfoPage2").show()
		   $("#productInfoPage1").hide()
		   $("#productInfoPage3").hide()
	  })
	  
	   $("#infoBtn3").click(function(){
		  $("#productInfoPage3").show()
		   $("#productInfoPage1").hide()
		   $("#productInfoPage2").hide()
	  })
	  
	
  })
 
*/




</script>
<body>

	<div class="section" id="productPageDiv">
		<div id="mainName">
			<h2>상품 품목별</h2>
		</div>

		<!-- ------------------------------------카테고리이미지-------------------------------------------------------- -->
		<ul id="category">
			<li><span id="categoryAll"><img
					src="<%=request.getContextPath()%>/img/cicon04.png"><br />전체</span></li>
			<li><span id="categoryarea"><img
					src="<%=request.getContextPath()%>/img/cicon04.png"><br />지역별</span></li>
			<li><span id="categoryFruit"><img
					src="<%=request.getContextPath()%>/img/cicon04.png"><br />과일</span></li>
			<li><span id="categoryVege"><img
					src="<%=request.getContextPath()%>/img/cicon04.png"><br />채소</span></li>
			<li><span id="categorySall"><img
					src="<%=request.getContextPath()%>/img/cicon04.png"><br />쌀/잡곡</span></li>
		</ul>
		<!-- ------------------------------------카테고리 소분류--------------------------------------------------------- -->

		<div id="categorySubmenu">
			<ul>
				<li>전체</li>
				<li>쌀/찹쌀/흑미/현미</li>
				<li>수수/보리/콩</li>
				<li>께/기타잡곡</li>
			</ul>
		</div>
		<!-- -------------------------------------정렬방식 -------------------------------------------------------- -->
		<div id="selectOrderbox">
			<select name="selectOrder">
				<option>평점순</option>
				<option>가격순</option>
				<option>조회수순</option>
			</select>
		</div>

		<!-- ---------------------------------공유 아이콘 정렬------------------------------------------------------------ -->
		<ul id=sharicon>
			<li><a href="#"><img src="img/cicon01.png"></a></li>
			<li><a href="#"><img src="img/cicon02.png"></a></li>
			<li><a href="#"><img src="img/cicon03.png"></a></li>
			<li><a href="#"><img src="img/cicon05.png"></a></li>
		</ul>

		<!-- ------------------------------상품 박스--------------------------------------------------------------- -->
		<div id=productMainBox>


			<div id=productImgBox>
				<img src="img/cr3.jfif">
				<div id=ptime>06:48:17남음</div>
			</div>



			<div id=pbox>
				<div id=productMainTiltle>
					<b>국산 100% 볶음참깨 160g 80g 볶음참깨 당일생산 당일 배송!!</b>
				</div>
				<div id=productPrice>8,900</div>
				<div id="sprofile">
					<a href="#">경북예천 홍길동</a>
				</div>
				<div id="simg">
					<a href="#"><img src="img/cprofile.png"></a>
				</div>


				<div id=productPrBox>
					<ul>
						<li>판매단위</li>
						<li>1통</li>
						<li>중량/용량</li>
						<li>160g</li>
						<li>배송구분</li>
						<li>픽업/배송<input type="button" id="mapbtn" value="픽업위치확인하기" /></li>
						<li>원산지</li>
						<li>국산</li>
						<li>포장타입</li>
						<li>냉장/종이포장</li>
						<li>안내사항</li>
						<li>어쩌구저쩌구</li>
						<li>구매수량</li>
						<li><input type="button" class="pmbtn minibtn" value="-"/>1통<input	type="button" class="pmbtn minibtn" value="+"/></li>
						<li>추가옵션</li>
						<li></li>
						<li><select name="selecOption" id="selecOption">
								<option>1</option>
								<option>2</option>
								<option>3</option>
						</select></li>
						<li><input type="button" class="pmbtn minibtn" value="-"/>1번<input	type="button" class="pmbtn minibtn" value="+"/></li>
					</ul>
				</div>
				<!--productPrBox  -->


				<div id=productTotalPrice>총 상품금액:8,900원</div>
				<div id=productBtn>
					<input type="button" value="1:1대화하기"  class="btn"/>
					<input type="button" value="장바구니 담기" class="btn"/>
					<input type="button" value="구매하기"  class="btn"/>
				</div>
			</div>
			<!--pbox  -->


		</div>
		<!-- productMainBox -->

		<!-- -------------------------------------상세정보박스 상단 버튼-------------------------------------------------------- -->

		<div class="infoBtnb">
			<input type="button" id="infoBtn1" value="상품설명" class="btn" /> <input
				type="button" id="infoBtn2" value="고객후기"  class="btn"/> <input type="button"
				id="infoBtn3" value="상품문의"  class="btn"/>
		</div>

		<!-- -------------------------------------상세정보박스1-------------------------------------------------------- -->

		<div id="productInfoPage">
			<div id="productInfoPage1">
				<div>해당 상품의 관련 상품들입니다.</div>

				<div id="relativeBox">
					<div class="relativeList">
						<div class="relativeSetWidth">
							<div class="relativeproduct" id="relativeProduct">
								<div class="relativePanel">
									<div>
										<a href="error"><img src="img/cr4.jfif" /></a>
									</div>
								</div>
								<div class="relativePanel">
									<div>
										<a href="error"><img src="img/cr4.jfif" /></a>
									</div>
								</div>
								<div class="relativePanel">
									<div>
										<a href="error"><img src="img/cr4.jfif" /></a>
									</div>
								</div>
								<div class="relativePanel">
									<div>
										<a href="error"><img src="img/cr4.jfif" /></a>
									</div>
								</div>
								<div class="relativePanel">
									<div>
										<a href="error"><img src="img/cr4.jfif" /></a>
									</div>
								</div>
								<div class="relativePanel">
									<div>
										<a href="error"><img src="img/cr4.jfif" /></a>
									</div>
								</div>
								<div class="relativePanel">
									<div>
										<a href="error"><img src="img/cr4.jfif" /></a>
									</div>
								</div>
								<div class="relativePanel">
									<div>
										<a href="error"><img src="img/cr4.jfif" /></a>
									</div>
								</div>

							</div>
							<!-- ---relativeproduct   ----->
						</div>
						<!-- ---relativeSetWidth   ----->

					</div>
					<!-- ---relativeList   ----->
					<!-- ---페이징처리------------------------------------   ----->


					<div class="page_wrap2">
						<div class="page_nation2">
							<a class="arrow prev2" href="#">◁</a> <a href="#" class="active">●</a>
							<a href="#">●</a> <a href="#">●</a> <a href="#">●</a> <a
								class="arrow next2" href="#">▷</a>
						</div>




					</div>

				</div>
				<!-- relativeBox -->

				<div id=pBigimg>
					<img src="img/cr4.jfif">
				</div>
				<div id=pBigtxt>한국의 대표적인 후식으로 꼽히는 사과. 유럽에서 소시지나 돼지고기 요리에 곁들이는
					튀긴 사과. 과일 자체로도 달콤한 맛이 좋은 인기만점 과일의 여왕 사과입니다. 사과는 수확시기에 따라 조생종, 중생종,
					만생종으로 나뉜다. 8월 하순 이전이 최성수확기인 조생종에는 미광, 조홍, 서홍, 쓰가루(아오리) 등이 있고,
					최성수확기가 9월 상순에서 10월 중순까지인 중생종에는 홍로, 홍월, 양광, 추광, 골든딜리셔스, 세계일, 조나골드,
					시나노스위트 등이 있다. 10월 하순 이후가 최성수확기인 만생종에는 후지(부사), 홍옥, 감홍, 화홍 등이 있다.</div>
				<!-- -pBigtxt -->
			</div>
			<!-- -상세정보박스1-->
		</div>
		<!-- -상세정보박스-->
		<!-- -------------------------------------상세정보박스1  끝-------------------------------------------------------- -->
		<!-- -------------------------------------상세정보박스 상단 버튼-------------------------------------------------------- -->

		<div class="infoBtnb">
			<input type="button" id="infoBtn1" value="상품설명"  class="btn"/> <input
				type="button" id="infoBtn2" value="고객후기" class="btn" /> <input type="button"
				id="infoBtn3" value="상품문의"  class="btn"/>
		</div>
		
		<!-- -------------------------------------상세정보박스2  시작-------------------------------------------------------- -->

		<div id="productInfoPage">
			<div id="productInfoPage2">
				<div id="retitle">상품에 대한 후기를 남기는 공간입니다 해당 게시판의 성격과 다른 글은 사전동의
					없이 담당 게시판으로 이동될 수 있습니다.</div>

				<ul id="reviewTitle">
					<li><b>번호</b></li>
					<li><b>내용</b></li>
					<li><b>작성자</b></li>
					<li><b>작성일</b></li>
					<li><b>평점</b></li>
				</ul>

				<ul class="reviewList">
					<li>123</li>
					<li>
						<div id="reviewImgbox">
							<img src="img/cr4.jfif" /><img src="img/cr4.jfif" /><img
								src="img/cr4.jfif" />
						</div>
						<div id="reviewtxtbox">너무 맛있어요! 빨간 맛 궁금해 Honey깨물면 점점 녹아든
							스트로베리 그 맛코너 캔디 샵 찾아 봐</div>
					</li>
					<li>goguma123</li>
					<li>2020.01.23</li>
					<li>4</li>
				</ul>

				<ul class="reviewList">
					<li>123</li>
					<li>
						<div id="reviewImgbox">
							<img src="img/cr4.jfif" /><img src="img/cr4.jfif" /><img
								src="img/cr4.jfif" />
						</div>
						<div id="reviewtxtbox">빨간 맛 궁금해 Honey</div>
					</li>
					<li>goguma123</li>
					<li>2020.01.23</li>
					<li>4</li>
				</ul>

				<ul class="reviewList">
					<li>123</li>
					<li>
						<div id="reviewImgbox">
							<img src="img/cr4.jfif" /><img src="img/cr4.jfif" /><img
								src="img/cr4.jfif" />
						</div>
						<div id="reviewtxtbox">너무 맛있어요! 빨간 맛 궁금해 Honey깨물면 점점 녹아든
							스트로베리 그 맛코너 캔디 샵 찾아 봐</div>
					</li>
					<li>goguma123</li>
					<li>2020.01.23</li>
					<li>4</li>
				</ul>

				<div id="reviewWriteBtn">
					<input type="button" value="후기 작성"  class="btn"/>
				</div>

				<!-- 페이징 표시--------- -->
				<div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#"></a> <a class="arrow prev"
							href="#"></a> <a href="#" class="active">1</a> <a href="#">2</a>
						<a href="#">3</a> <a href="#">4</a> <a class="arrow next" href="#"></a>
						<a class="arrow nnext" href="#"></a>
					</div>
				</div>
				<!-- 페이징 표시--------- -->


			</div>
			<!-- productInfoPage2 -->
		</div>
		<!-- productInfoPage -->

		<!--- -------------------------------------상세정보박스2  끝-------------------------------------------------------- -->
		
		<div class="infoBtnb">
			<input type="button" id="infoBtn1" value="상품설명"  class="btn"/> <input
				type="button" id="infoBtn2" value="고객후기" class="btn" /> <input type="button"
				id="infoBtn3" value="상품문의" class="btn" />
		</div>
		
		
		<!-- -------------------------------------상세정보박스3  시작-------------------------------------------------------- -->
		<div id="productInfoPage">
			<div id="productInfoPage3">

				<div id="qtitle">상품에 대한 문의를 남기는 공간입니다 해당 게시판의 성격과 다른 글은 사전동의
					없이 담당 게시판으로 이동될 수 있습니다.</div>

				<ul id="qnaTitle">
					<li><b>번호</b></li>
					<li><b>내용</b></li>
					<li><b>작성자</b></li>
					<li><b>작성일</b></li>
					<li><b>공개여부</b></li>
				</ul>

				<ul id="qnaList">
					<li>123</li>
					<li><a href="#">비공개 처리된 게시글 입니다.</a></li>
					<li>goguma123</li>
					<li>2020.01.23</li>
					<li><img src="img/ciconlock2.png"></li>

					<li>123</li>
					<li><a href="#">비공개 처리된 게시글 입니다.</a></li>
					<li>goguma123</li>
					<li>2020.01.23</li>
					<li><img src="img/ciconlock2.png"></li>

					<li>123</li>
					<li><a href="#">비공개 처리된 게시글 입니다.</a></li>
					<li>goguma123</li>
					<li>2020.01.23</li>
					<li><img src="img/ciconlock2.png"></li>

					<li>123</li>
					<li><a href="#">비공개 처리된 게시글 입니다.</a></li>
					<li>goguma123</li>
					<li>2020.01.23</li>
					<li><img src="img/ciconlock2.png"></li>

					<li>123</li>
					<li><a href="#">비공개 처리된 게시글 입니다.</a></li>
					<li>goguma123</li>
					<li>2020.01.23</li>
					<li><img src="img/ciconlock2.png"></li>

				</ul>

				<div id="qnaWriteBtn">
					<input type="button" value="문의 작성" class="btn"/>
				</div>

				<!-- 페이징 표시--------- -->
				<div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#"></a> <a class="arrow prev"
							href="#"></a> <a href="#" class="active">1</a> <a href="#">2</a>
						<a href="#">3</a> <a href="#">4</a> <a class="arrow next" href="#"></a>
						<a class="arrow nnext" href="#"></a>
					</div>
				</div>
				<!-- 페이징 표시--------- -->


			</div>
			<!--productInfoPage3  -->

		</div>
		<!--productInfoPage  -->


	</div>
	<!-- section -->



	<div style="clear: both;"></div>
</body>
</html>