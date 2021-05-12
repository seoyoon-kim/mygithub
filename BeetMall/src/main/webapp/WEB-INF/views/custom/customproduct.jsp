<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/menu_c.jspf"%>

<style>

/*  기본설정----------------------------------------------                 */
.section {
	width: 1080px;
	
	margin: 0 auto;
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
	width: 540px;
	margin-top:30px;
}

#selectOrder {

	width: 540px;

}

/*  공유 아이콘 정렬----------------------------------------------                 */
#sharicon {
	float: right;
	width: 540px;
	margin: 0;
	padding-left: 420px;
	text-align: right;
	margin-bottom:30px;
}

#sharicon>li {
	width: 30px;
}

#sharicon>li>a>img {
	width: 25px;
}

/*  상품 박스------------이미지 부분----------------------------------                 */
#productmainbox {
   width: 1080px;
   float: left;
}

#productImgBox {
	float: left;
	margin-left:80px;
	margin-top: 100px;
	width: 250px;
	height: 300px; 
}

#productImgBox>img {
	width: 250px;
	height: 300px;
}

#ptime {
	width: 250px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	background-color: red;
	color: white;
}

/*  상품 박스------------텍스트 부분----------------------------------                 */
#pbox {
	width: 550px;
	float: left;
	margin-left: 40px;
	margin-bottom: 40px;
}

#productMainTiltle {
	width: 480px;
	height: 50px;
	line-height: 50px;
	float: left;
	margin-right: 150px;
	font-size:23px;
}

#productPrice {
	float: left;
	width: 50%;
	height: 50px;
	line-height: 50px;
	font-size:20px;
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
	width: 45%;
	height: 35px;
	line-height: 35px;
	margin-bottom:10px;
	margin-top:5px;
	border-bottom:1px solid #eee;
}

#productPrBox>ul>li:nth-child(16n+13),#productPrBox>ul>li:nth-child(16n+14),#productPrBox>ul>li:nth-child(16n+1),#productPrBox>ul>li:nth-child(16n+2){
border-bottom:none;
}

#productPrBox>ul>li:nth-child(16n+1),
#productPrBox>ul>li:nth-child(16n+3),
#productPrBox>ul>li:nth-child(16n+5),
#productPrBox>ul>li:nth-child(16n+7),
#productPrBox>ul>li:nth-child(16n+9),
#productPrBox>ul>li:nth-child(16n+11),
#productPrBox>ul>li:nth-child(16n+13){
color:gray;
font-size:17px;
width: 55%;
padding-left:10px;
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
	color:red;
	
}

#productTotalPrice2 {
	padding-left: 350px;
	width: 100%;
	float: left;
	line-height: 15px;
	height: 15px;
	font-size:15px;
	font-weight: 400px;
	padding-left:280px;
	margin-bottom:3px;
	color:red;	
}

#productTotalPrice3 {
	padding-left: 350px;
	width: 100%;
	float: left;
	line-height: 15px;
	height: 15px;
	font-size:15px;
	font-weight: 400px;
	padding-left:280px;
	margin-bottom:15px;
	color:red;	
}

#productTotalPrice4 {
	padding-left: 350px;
	width: 100%;
	float: left;
	line-height: 15px;
	height: 15px;
	font-size:15px;
	font-weight: 400px;
	padding-left:280px;
	margin-bottom:3px;
	color:red;	
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
	border-bottom: 1px solid #eee;
	margin-bottom: 10px;
}

.infoBtnb>a>input{
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

#pBigtxt2,#pBigtxt3 {
	padding: 30px;
	float: left;
	width: 80%;
	margin-bottom: 20px;
}

#pBigtxt3>img {
	float: left;
	width: 80%;
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
width:100%;
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
		background-color:white;
		color:black;
		display: inline-block;
	}
	
	
	#infoBtn1,#infoBtn2,#infoBtn3{
	   border-radius: 1px;	 	
	   background-color:#eee;	
	}
	
	#infoBtn1:hover,#infoBtn2:hover,#infoBtn3:hover{
	
	background-color:#FF5430;	
	color:white;
	
	}
	
	
	
	#infoBtn1>a:active,#infoBtn2>a:active,#infoBtn3>a:active{
	outline: 0;
	}
	
	#productBtn>.btn{
	background-color:#eee;	
	height:30px;
	}
	#productBtn>.btn:hover{
	background-color:#FF5430;
	color:white;
	}


#productBtn{
    padding-left: 0px;
}

/*표*/

table{
	width:100%%;	
	border-spacing: 0;
	text-indent: initial;
	border-top:1px solid #ddd;
	border-bottom:1px solid #ddd;
}

thead{
	border-bottom: 1px solid #ccc;
    border-top: 1px solid #ccc;
    width:100%;
}
tr{
	display: table-row;
    vertical-align: inherit;
    border-color: inherit;
    height:50px;
}
.td, .content{
	padding-left:20px;
}
.content{
	padding: 20px 0 20px;
}
td, .td{
	height:50px;
	width:930px;
}
.tr_head{
	border-top:1px solid #eee;
	border-bottom:1px solid #eee;
}
.tr_head li{
	float:left;
}
.menu, .th{
	width:150px; text-align:center;
}
.td, .th{ line-height:50px;}
.td{
	width:930px; line-height:50px;
}


</style>
<script>
    var pcount=1; //상품갯수
    var ocount=1; //옵션갯수
    var prtprice=parseInt(${pvo.productprice}); //상품본래가격
    var dprtprice=parseInt(${Dprice}); //상품할인가격
    var tprice=prtprice-dprtprice;
    var submitprice;
    
	function pCount(){
		pcount+=1;
		$('#prtnum').text(pcount);
		
		optionstay();
		opCount();
		omCount();
		
		

		//alert(dprtprice);
		
		
		//
		
	 
		//var tprice=tpp*pcount;
		 var tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);
		//alert(tprice);
		document.getElementById("productTotalPrice").innerHTML="구매가격:"+tprice+"원";
		document.getElementById("productTotalPrice4").innerHTML="상품"+prtprice+"x"+pcount+"개";
		document.getElementById("productTotalPrice2").innerHTML="할인된가격: - "+(dprtprice*pcount)+"원";
		
		submitprice=tprice;
		alert("총"+submitprice);
		//alert(tprice);
		
		
		
	}
	
	function mCount(){
		pcount-=1;
		
		if(pcount<=0){	
			alert("1개이상 구매해 주세요");	
			pcount+=1;
		}
		
		$('#prtnum').text(pcount);
		
		
		optionstay();
		opCount();
		omCount();

		
		//var tprice=tpp*pcount;
		 var tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);
		 
		//alert(dprtprice);
		//var tprice=tpp*pcount;
		//var tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);
		//alert(tprice);
		
		
		document.getElementById("productTotalPrice").innerHTML="구매가격:"+tprice+"원";
		document.getElementById("productTotalPrice4").innerHTML="상품"+prtprice+"x"+pcount+"개";
		document.getElementById("productTotalPrice2").innerHTML="할인된가격: - "+(dprtprice*pcount)+"원"
		
		submitprice=tprice;
		alert("총"+submitprice);
		//alert(tprice);
	}
	


	
	
///////////////////////옵션가격 구하기///////////////////////////
function optionstay(){
		var opt=$('#selecOption').val();
		var optArr=opt.split('&'); 
		var optnum=optArr[0];   //옵션 숫자
	    var optprice=parseInt(optArr[1]); //옵션 가격
  }

	
function optionchange(){
		 var opt=$('#selecOption').val();
		 var optArr=opt.split('&'); 
		 var optnum=optArr[0];   //옵션 숫자
		 var optprice=parseInt(optArr[1]); //옵션 가격
		 ocount=1;
		 $('#optnum').text(ocount);
		 
		 //alert(dprtprice);
		 var tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);
		 //alert(tprice);
		 document.getElementById("productTotalPrice3").innerHTML=optprice+"x"+ocount+"개"+"옵션가격:"+optprice+"원";
		 document.getElementById("productTotalPrice").innerHTML="구매가격:"+tprice+"원";
		 document.getElementById("productTotalPrice4").innerHTML="상품"+prtprice+"x"+pcount+"개";
		 document.getElementById("productTotalPrice2").innerHTML="할인된가격: - "+(dprtprice*pcount)+"원";
		 
		 submitprice=tprice;
		 alert("총"+submitprice);
		 //alert(tprice);

};


////////////////////////옵션갯수 구하기///////////////////////////////////
	function opCount(){
		ocount+=1;
		
		
		 var opt=$('#selecOption').val();
		 var optArr=opt.split('&');
		 var optnum=optArr[0];   //옵션 숫자
		 var optprice=parseInt(optArr[1]); //옵션 가격
		 var tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);
		 
		 $('#optnum').text(ocount);
		 
		 document.getElementById("productTotalPrice3").innerHTML=optprice+"x"+ocount+"개 "+"옵션가격:"+(optprice*ocount)+"원";
		 document.getElementById("productTotalPrice").innerHTML="구매가격:"+tprice+"원";
		 document.getElementById("productTotalPrice4").innerHTML="상품"+prtprice+"x"+pcount+"개";
		 document.getElementById("productTotalPrice2").innerHTML="할인된가격: - "+(dprtprice*pcount)+"원"
	
		 submitprice=tprice;
		 alert("총"+submitprice);
		 //alert(tprice); 
		 
	}
		
	
	function omCount(){
		ocount-=1;
		
		if(ocount<=0){	
			ocount+=1;
			}
		$('#optnum').text(ocount);
		
		 var opt=$('#selecOption').val();
		 var optArr=opt.split('&');
		 var optnum=optArr[0];   //옵션 숫자
		 var optprice=parseInt(optArr[1]); //옵션 가격
		 var tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);
		 
		 document.getElementById("productTotalPrice3").innerHTML=optprice+"x"+ocount+"개 "+"옵션가격:"+(optprice*ocount)+"원";
		 document.getElementById("productTotalPrice").innerHTML="구매가격:"+tprice+"원";
		 document.getElementById("productTotalPrice4").innerHTML="상품"+prtprice+"x"+pcount+"개";
		 document.getElementById("productTotalPrice2").innerHTML="할인된가격: - "+(dprtprice*pcount)+"원"
		 
		 submitprice=tprice;
		 alert("총"+submitprice);
		 //alert(tprice);
	}	    

///////////////////////총가격 변수에 저장해놓기
function total(){
	
	alert("최종구매"+submitprice);
	
}



//document.onload = optionchange


</script>
<body>

	<div class="section" id="productPageDiv">
		

		<!-- ---------------------------------공유 아이콘 정렬------------------------------------------------------------ -->
		<ul id=sharicon>
			
		</ul>

		<!-- ------------------------------상품 박스--------------------------------------------------------------- -->
		<div id=productMainBox >


			<div id=productImgBox>
				<img src="img/${pvo.thumbimg}"/>
			</div>



			<div id=pbox>
				<div id=productMainTiltle>
					<b>${pvo.productname}</b>   <!-- 상품명 -->
				</div>
				<div id=productPrice>${pvo.productprice}</div>  <!-- 가격 -->
				<div id="sprofile">
					<a href="#">${fvo.farmname}</a>  <!--농장이름 -->
				</div>
				<div id="simg">
					<a href="#"><img src="img/${fvo.farmprofile}"/></a>  <!-- 프사 -->
				</div>
				
				<div id=productPrBox>
					<ul>
						<li>판매단위</li>  <!-- 1 -->
						<li>${pvo.selloption}</li> <!-- 2 -->
						<li>중량/용량</li> <!-- 3 -->
						<li>${pvo.sellweight}</li> <!-- 4 -->
						<li>배송구분</li> <!-- 5 -->
						<li><c:if test="${pvo.deliveryoption==1}">픽업</c:if>
						    <c:if test="${pvo.deliveryoption==2}">배송</c:if>
						    <c:if test="${pvo.deliveryoption==3}">픽업/배송</c:if></li>  <!-- 6 -->
						<li>원산지</li>  <!-- 7 -->
						<li>${pvo.origin}</li>  <!-- 8 -->
						<li>포장타입</li>  <!-- 9 -->
						<li><c:if test="${pvo.wrapping==0}">실온</c:if>
						    <c:if test="${pvo.wrapping==1}">냉장</c:if>
						    <c:if test="${pvo.wrapping==2}">냉동</c:if></li>  <!-- 10 -->
						
						<li>구매수량</li>  <!-- 11 -->
						<li><input type="button" onclick="mCount()" class="pmbtn minibtn" value="-"/><span id="prtnum" name="prtnum">1</span><input type="button"  onclick="pCount()" class="pmbtn minibtn" value="+"/></li>  <!-- 12 -->
						<li>추가옵션</li>  <!-- 13 -->
						<li></li>  <!-- 14 -->
						
						
							<li><select name="selecOption" id="selecOption" onchange="optionchange()">
							    <c:if test="${not empty ovo}"> 
							       <option value="0&0">옵션을 선택해 주세요</option>
							    </c:if>
							    
							    <c:if test="${empty ovo}">  
							        <option value="0&0">옵션이 없습니다.</option>
							    </c:if>
							    						    
						   	 <c:forEach var="ovodata" items="${ovo}">						   	       
								   <option value="${ovodata.optionnum}&${ovodata.optionprice}">${ovodata.optionnum}${ovodata.optionname}</option> <!-- -----옵션선택하기----- -->
							 </c:forEach>
							</select></li>
						
						<c:if test="${not empty ovo}">
							<li><input type="button" onclick="omCount()" class="pmbtn minibtn"  value="-"/><span id="optnum">1</span><input type="button" onclick="opCount()" class="pmbtn minibtn"  value="+"/></li>  <!-- 16 -->
					    </c:if>
					    
					</ul>
				</div>
				<!--productPrBox  -->
                <div id=productTotalPrice4></div>
                <div id=productTotalPrice2>할인된가격:- ${Dprice} 원</div>
                <div id=productTotalPrice3>옵션가격:</div>
				<div id=productTotalPrice>구매가격: <script>document.write(tprice)</script> 원</div>
				
				<div id=productBtn>
					<input type="button" value="1:1대화하기"  class="btn"/>
					<input type="button" value="장바구니 담기" class="btn"/>
					<input type="button" value="구매하기"  class="btn" onclick="total()"/>
				</div>
			</div>
			<!--pbox  -->

        

		</div>
		<!-- productMainBox -->

		<!-- -------------------------------------상세정보박스 상단 버튼-------------------------------------------------------- -->

		<div class="infoBtnb">
			<a href="#productInfoPage1"><input type="button" id="infoBtn1" value="상품설명" class="btn" /></a>
			<a href="#productInfoPage2"><input type="button" id="infoBtn2" value="고객후기"  class="btn"/></a>
			<a href="#productInfoPage3"><input type="button" id="infoBtn3" value="상품문의"  class="btn"/></a>
		</div>

		<!-- -------------------------------------상세정보박스1-------------------------------------------------------- -->

		<div id="productInfoPage">
			<div id="productInfoPage1">

				<!-- relativeBox -->

                <c:if test="${pvo.addimg!='null'}">
	                <div id=pBigtxt3>
	                   ${pvo.addimg}
	                </div>
                </c:if>
                
				<div id=pBigtxt2>
                   ${pvo.productcontent}
                </div>
                
                
                
               <div id=pBigtxt>
                <table>
				<tbody>
					<tr class="tr_head">
						<th class="menu">상품정보</th>
						<td><span class="td" id="td">${pvo.productinfomation}</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">주의사항</th>
						<td ><span class="td" id="td">${pvo.prevention}</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">유통기한</th>
						<td ><span class="td" id="td">${pvo.deadline}</span></td>
					</tr>
				</tbody>
				</table>	
				</div>
                
                
                
                
				<!-- -pBigtxt -->
			
			</div>
			<!-- -상세정보박스1-->
		</div>
		<!-- -상세정보박스-->
		<!-- -------------------------------------상세정보박스1  끝-------------------------------------------------------- -->
         <!-- -------------------------------------상세정보박스 상단 버튼-------------------------------------------------------- -->

	<div class="infoBtnb">
			<a href="#productInfoPage1"><input type="button" id="infoBtn1" value="상품설명" class="btn" /></a>
			<a href="#productInfoPage2"><input type="button" id="infoBtn2" value="고객후기"  class="btn"/></a>
			<a href="#productInfoPage3"><input type="button" id="infoBtn3" value="상품문의"  class="btn"/></a>
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
							<img src="img/cr4.jfif" />
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
							<img src="img/cr4.jfif" />
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
							<img src="img/cr4.jfif" />
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
			<!-- -------------------------------------상세정보박스 상단 버튼-------------------------------------------------------- -->


        <div class="infoBtnb">
			<a href="#productInfoPage1"><input type="button" id="infoBtn1" value="상품설명" class="btn" /></a>
			<a href="#productInfoPage2"><input type="button" id="infoBtn2" value="고객후기"  class="btn"/></a>
			<a href="#productInfoPage3"><input type="button" id="infoBtn3" value="상품문의"  class="btn"/></a>
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