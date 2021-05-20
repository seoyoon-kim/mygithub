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
	
	margin: 0 auto;
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

.wishList>li>input{
line-height:15px;
height:15px;
}

.wishListTitle>li {
	float: left;
	line-height: 40px;
	width:180px;
	text-align:center;
	font-size:18px;
	color:gray;
	margin-bottom:10px;
}

.wishListTitle>li:nth-child(6n+1) {
	padding-left: 150px;
	width:670px;
}

.wishListTitle>li:nth-child(6n+2) {
	width:170px;
}


.wishListTitle>li:nth-child(6n+3) {
	width:70px;
}


/*--------------------게시판 리스트들---------------------------*/

.wishList{
margin:0 auto;
border-bottom:1px solid #eee;
}
.wishList>li {
	float: left;
	height: 150px;
	width: 100px;
	padding-top:20px;
	padding-bottom:20px;
	margin-right:10px;

}

.wishList>li:nth-child(7n+1) {
  width: 200px;
  padding-left:50px;
  padding-right:50px;
}

.wishList>li:nth-child(7n+2) {
  width: 490px;
}

.wishList>li:nth-child(7n+3) {
  text-align:center;
  line-height: 90px;
}

.wishList>li:nth-child(7n+4) {
  text-align:center;
  line-height: 90px;
}

.wishList>li:nth-child(7n+5) {
  text-align:center;
  line-height: 90px;
  width: 1px;
}

.wishList>li:nth-child(7n+6) {
  text-align:center;
  line-height: 90px;
  width: 50px;
}

.wishList>li:nth-child(7n+7) {
  text-align:center;
  line-height: 90px;
  width: 50px;
}




.wishList>li>a>img {
	width: 100px;
	height: 100px;
	border-radius: 2px;
}

/*--------------------게시판 버튼들---------------------------*/
#nogetbutton {
	line-height: 20px;
	margin-left:960px;
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
	float:left;
	padding-left:850px;
	margin-top:30px;
	margin-bottom:30px;
}

#wishPriceTitle {
    background-color:#E8F1F4;
	float:left;
	width: 100%;
	margin-bottom: 50px;
	height:150px;
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

#delbutton{
border:none;
width:15px;
font-size:20px;
background-color:white;
color:gray;
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


#ptitle>a{
font-size:19px;
font-weight:bold;
}

#ptitleprice{
color:gray;
}

#optitle{
color:gray;
font-weight:bold;

}

#wishone{
font-size:20px;
}

#wishtotal{
font-size:20px;
}

#pbtn,#mbtn{
width:20px;
height:20px;
font-size:20px;
margin-left:2px;
margin-right:2px;
border:none;
}

</style>

<script>



$(function(){
	
	var prtprice=0; //상품본래가격
	var dprtprice=0; //상품할인가격
	var optprice=0;//옵션가격
	var ocount=1; //옵션갯수
	var pcount=1; //상품갯수

	var tprice=0; //총가격
	var submitprice = 0;//총가격
	
	var totaldprtprice=0;//전체할인가격
	
	var =${wlist};
	
	$("#oneproductTotalPrice").html("구매가격:"+tprice+"원");
	

	var len = $("input[name='checkbox']:checked").length; //체크박스의 갯수
	var checkArr = []; //배열만들기
	
	if(len > 1){ //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
	    $("input[name='checkbox']:checked").each(function(e){
	        var value = $(this).val();
	        checkArr.push(value);     
	        
            var oneArr=opt.split('&'); 
			optnum=parseInt(oneArr[0]);   //상품가격
			dprtprice=parseInt(oneArr[1]); //할인가격
			optprice=parseInt(oneArr[2]);//옵션가격
			ocount=parseInt(oneArr[3]);//옵션갯수
			pcount=parseInt(oneArr[4]);//상품의갯수
	        
	    })
	}
	
	/*
	prtprice=${pvo.productprice}; //상품본래가격
	
	//상품할인가격
    dprtprice=${Dprice};
	
	submitprice=tprice=prtprice-dprtprice;
	
	//상품갯수 추가하기/////////////
	$(".pCount").click(function(){ 	    	
		
		pcount=parseInt($("#prtnum").text())+1;
		//alert("pcount="+pcount);
		$('#prtnum').text(pcount);	   			

		var tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);			
		//alert("pcount="+pcount+"tprice="+tprice);
		$("#oneproductTotalPrice").html("구매가격:"+tprice+"원");	
		
		submitprice=tprice;
		totaldprtprice=dprtprice*pcount;
		
	});
	 ///////////////상품갯수 빼기////////////////
	$(".mCount").click(function(){
		
		pcount=parseInt($("#prtnum").text())-1;
	
		if(pcount<=0){	
			alert("1개이상 구매해 주세요");	
			pcount=parseInt($("#prtnum").text());
		}
		
		$('#prtnum').text(pcount);

		tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);
		//alert("pcount="+pcount+"tprice="+tprice); 		 		
		$("#oneproductTotalPrice").html("구매가격:"+tprice+"원");	
		
		submitprice=tprice;
		totaldprtprice=dprtprice*pcount;
		
	});		
	
	
	
	$("#totalbuy").click(function(){
		  var toltalPrice = (prtprice * pcount) + (optprice* ocount);
		  alert("상품가격="+prtprice+"/상품의 갯수="+pcount+"/옵션가격="+optprice+"/옵션의갯수="+ocount+"/최종구매가격="+submitprice+
				"/옵션코드="+optnum+"/할인금액="+dprtprice+"/토탈가격="+toltalPrice);
		  var totalCount = pcount+optprice;
		  location.href="/sshj/productPay?total="+toltalPrice+"&discountprice="+dprtprice+"&productnum=${pvo.productnum}&productname=${pvo.productname}&deliveryoption=${pvo.deliveryoption}&optionnum="+optprice+"&totalCount="+totalCount;
	});
*/	
});





</script>



	<div class="section" id="whisListPage">
		<!-- 큰제목 ---------------------------------------------->

		<div id="wisht">
			<b>${logId}님 의 장바구니 입니다.</b>
		</div>

		

		<!-- ----------------게시판------------------------ -->
		
			
		
		<input type="button" value="선택상품제거" id="nogetbutton" />
		
		<div class="wishlistbox">

			<ul class="wishListTitle">
				<li><b>상품정보</b></li>
				<li><b>상품수량</b></li>
				<li><b>구매가격</b></li>
			</ul>

       <c:forEach var="wl" items="${wlist}">
      
			<ul class="wishList">
					<li><a href=""><img src="img/${wl.thumbimg}"></a></li> <!-- 이미지 -->
					
					<li>
					<div id="ptitle"><a href="">${wl.productname}</a></div><!-- 상품이름 -->
					<div id="ptitleprice">원가: ${wl.productprice}원</div><!-- 상품가격 -->
					<div id="ptitlediscount">할인가격: ${wl.saleprice}원</div><!-- 할인가격 -->
				
				    <c:if test="${wl.optionnum>0}">
					<div id="optitle">추가옵션 :${wl.optionname}${wl.optionprice} x ${wl.wishoptionnum} 개  <span id="wishoptionCount"></span>  </div><!-- 옵션이름 --><!-- 옵션 수량 -->
					</c:if>
					
					<c:if test="${wl.optionnum<=0}">
					<div id="optitle">&nbsp;</div><!-- 옵션이름 --><!-- 옵션 수량 -->
					</c:if>
					
					</li>
				
					<li><input type="button" id="pbtn" class="mCount" value="-"/><input type="hidden" value=""><span id="prtnum">${wl.wishnum}</span><input type="button" id="mbtn" class="pCount" value="+"/></li><!-- 상품수량 -->
					
					<li><span id="oneproductTotalPrice">${((wl.productprice-wl.saleprice)*wl.wishnum)+(wl.optionprice*wl.wishoptionnum)}원</span></li><!-- 총가격 -->
					
					<li></li>
					<li><input type="checkbox" name="checkbox" value="${wl.productprice}&${wl.saleprice}&${wl.optionprice}&${wl.wishoptionnum}&${wl.wishnum}"/></li>
					<li><input type="button" value="x" id="delbutton" /></li>
			</ul>
			
		</c:forEach>
		<!-- 페이징 표시--------- -->
		<div class="page_wrap">
			<div class="page_nation">
			   <c:if test="${pageVO1.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/customWish?wpageNum=${pageVO1.pageNum-1}<c:if test="${pageVO1.searchWord != null && pageVO1.searchWord != ''}">&searchKey=${pageVO1.searchKey}&searchWord=${pageVO1.searchWord}</c:if>"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO1.startPageNum}" step="1" end="${pageVO1.startPageNum + pageVO1.onePageNum-1}">
	              <c:if test="${p<=pageVO1.totalPage}">
	                 <c:if test="${p==pageVO1.pageNum}"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO1.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/customWish?wpageNum=${p}<c:if test="${pageVO1.searchWord != null && pageVO1.searchWord != ''}">&searchKey=${pageVO1.searchKey}&searchWord=${pageVO1.searchWord}</c:if>">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO1.pageNum < pageVO1.totalPage}">
	              <a class="arrow next" href="/sshj/customWish?wpageNum=${pageVO1.pageNum+1}<c:if test="${pageVO1.searchWord != null && pageVO1.searchWord != ''}">&searchKey=${pageVO1.searchKey}&searchWord=${pageVO1.searchWord}</c:if>"></a>
	           </c:if>
			</div>
		 </div>
		 
         <!-- 페이징 표시--------- -->
		 <!-- ----------------총가격------------------------ -->

		<div id="wishPriceTitle">
		    <div id="wishone">상품 가격:</div>
			<div id="wishtotal">총 구매가격:</div>
			
			<div id="wishCenterButton">
				 <input type="button" value="선택구매" id="swishbtn" />
				 <input type="button" value="전체구매" id="twishbtn" />
			</div>
			
		</div>
		
		
		
		</div>
     

		
		
	   </div>
	   <div style="clear: both;"></div>
