<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif;}
	#leftMenu{ display:block;}
	/* 페이징처리부분 */
	.page_wrap {
		text-align:center;
		font-size:0;
		padding-bottom: 30px;
	}
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:35px;
		height:35px;
		line-height:35px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	.page_nation .pprev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat center center;
		margin-right:0;
	}
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	/* 페이징처리끝 */
	/* 상품페이지 부분 */
	#productMain{
		width: 1100px;
		overflow:auto;
		padding-left: 40px;
	}
	#productMain div{
		text-align: left;
		margin-right: 65px;
		margin-bottom: 30px;
	}
	#productDiv{
		width:200px;
		float: left;
	}
	#productDiv>ul>li>img{
		width:198px;
	}
	#productDiv>ul>li:nth-child(5n+2){
	    font-size: xx-large;
	    font-weight: bold;
	}
	
	/* 상품페이지 부분 css끝 */	
	
	.main{
		width:1080px;
	}
	#mainName{
		text-align: center;
		margin-bottom: 20px;
	}
	#category{
		overflow: auto;
		height:130px;
		width:auto;
		padding-left:120px;
	}
	#category li{
		float: left;
		text-align: center;
		padding-left : 90px;
		padding-right : 10px;
	}
	#pickupMain{
		float: right;
		vertical-align: middle;
		padding-top: 15px;
   		font-size: large;
	}
	#Sequence{
		margin-left:20px;
		width: 100px;
		padding: .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('<%=request.getContextPath()%>/img/karrow.jpg') no-repeat 95% 50%/30px;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	#pickup{
		width: 17px;
    	height: 17px;
	}
	#categorySubmenu{
		margin-top: 150px;
	}
	#categorySubmenu> #pickupMain, #Sequence{
		position:relative;
		height:40px;
	}
	#category2{
		position:absolute;
		left:550px;
		top: 480px;
		width:830px;
		height:21px;
		overflow:hidden;
	}
	#category2>span>div>a{
		text-align: center;
		padding:20px;
	}
	
	#searchBtn{
		left:0px;
		top:0px;
	}
</style>
<script>
	$(function(){
		$("#categoryAll").click(function(){
			$("#category2Left").css("display", "none");
			$("#category2Right").css("display", "none");
			$("#categoryAll2").css("display", "block");
			$("#categoryFruit2").css("display", "none");
			$("#categoryVege2").css("display", "none");
			$("#categorySall2").css("display", "none");
		});
		$("#categoryFruit").click(function(){
			$("#category2Left").css("display", "none");
			$("#category2Right").css("display", "none");
			$("#category2Left").css("display", "contents");
			$("#category2Right").css("display", "contents");
			$("#categoryAll2").css("display", "none");
			$("#categoryFruit2").css("display", "block");
			$("#categoryVege2").css("display", "none");
			$("#categorySall2").css("display", "none");
		});
		$("#categoryVege").click(function(){
			$("#category2Left").css("display", "contents");
			$("#category2Right").css("display", "contents");
			$("#categoryAll2").css("display", "none");
			$("#categoryFruit2").css("display", "none");
			$("#categoryVege2").css("display", "block");
			$("#categorySall2").css("display", "none");
		});
		$("#categorySall").click(function(){
			$("#category2Left").css("display", "none");
			$("#category2Right").css("display", "none");
			$("#categoryAll2").css("display", "none");
			$("#categoryFruit2").css("display", "none");
			$("#categoryVege2").css("display", "none");
			$("#categorySall2").css("display", "block");
		});
		$("#category2Right").click(function(){
			$("#categoryVege2>div").first().appendTo('#categoryVege2');
			$("#categoryFruit2>div").first().appendTo('#categoryFruit2');
		});
		$("#category2Left").click(function(){
			$("#categoryVege2>div").last().prependTo('#categoryVege2');
			$("#categoryFruit2>div").last().prependTo('#categoryFruit2');
		});
	});
</script>
<div class="section">
	<div class="main">
		<div id="mainName"><h1>못난이 할인</h1></div>
			<ul id="category">
				<li><sqan id="categoryAll"><img src="<%=request.getContextPath()%>/img/k001.png"><br/>전체</sqan></li>
				<li><sqan id="categoryFruit"><img src="<%=request.getContextPath()%>/img/k003.png"><br/>과일</sqan></li>
				<li><sqan id="categoryVege"><img src="<%=request.getContextPath()%>/img/k004.png"><br/>채소</sqan></li>
				<li><sqan id="categorySall"><img src="<%=request.getContextPath()%>/img/k005.png"><br/>쌀/잡곡</sqan></li>
			</ul>
			<div id="categorySubmenu">
			<hr/>
				<select id="Sequence">
					<option value="평점순" selected="selected">평점순</option>
					<option value="가격순">가격순</option>
					<option value="조회수순">조회수순</option>
				</select>
				<a id="category2Left" style="display: none">◀</a>
				<div id="category2">
					<span id="categoryAll2" style="display: none;">전체</span>
					<span id="categoryFruit2" style="display: none;">
						<div>
							<a>전체</a>
							<a>감/홍시/곶감</a>
							<a>감귤/한라봉/천혜향</a>
							<a>딸기/베리</a>
							<a>매실/산수유/오미자</a>
							<a>배</a>
							<a>사과</a>
						</div>
						<div>
							<a>수박/참외/멜론/키위</a>
							<a>자두/복숭아/포도</a>
							<a>토마토</a>
							<a>기타과일</a>
						</div>
					</span>
					<span id="categoryVege2" style="display: none;">
						<div>
							<a>전체</a>
							<a>감자/옥수수</a>
							<a>견과/밤/잣/콩/대추</a>
							<a>고구마</a>
							<a>나물/건나물</a>
							<a>당근/연근/우엉/마</a>
						</div>
						<div>
							<a>마늘/생강/양파/파</a>
							<a>배추/상추/쌈채소</a>
							<a>버섯</a>
							<a>양초/도라지/삼/더덕</a>
							<a>피망/파프리카/고추</a>
						</div>
						<div>
							<a>호박/아스파라거스</a>
							<a>기타채소</a>
						</div>
					</span>
					<span id="categorySall2" style="display: none;">
						<a>전체</a>
						<a>쌀/찹쌀/흑미/현미</a>
						<a>수수/보리/팥/콩</a>
						<a>깨/기타잡곡</a>
					</span>
				</div>
				<span id="pickupMain"><a id="category2Right" style="display: none">▶&nbsp;</a><input type="checkbox" id="pickup" value="pickup"/>&nbsp;픽업여부</span>
			<hr/>
			</div>
		<div id="productMain">
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
		</div>
		<div class="page_wrap">
			<div class="page_nation">
			   <a class="arrow pprev" href="#"></a>
			   <a class="arrow prev" href="#"></a>
			   <a href="#" class="active">1</a>
			   <a href="#">2</a>
			   <a href="#">3</a>
			   <a href="#">4</a>
			   <a href="#">5</a>
			   <a href="#">6</a>
			   <a href="#">7</a>
			   <a href="#">8</a>
			   <a href="#">9</a>
			   <a href="#">10</a>
			   <a class="arrow next" href="#"></a>
			   <a class="arrow nnext" href="#"></a>
			</div>
		 </div>
	</div>
</div>