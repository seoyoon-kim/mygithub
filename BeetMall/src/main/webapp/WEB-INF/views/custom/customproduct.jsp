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



/*  상품 박스------------이미지 부분----------------------------------                 */
#productmainbox {
   padding-top:30px;
   width: 1080px;
   float: left;
}

#productImgBox {
	float: left;
	margin-left:80px;
	margin-top: 130px;
	width: 400px;
	height: 500px; 
}

#productImgBox>img {
	width: 400px;
	height: 500px;
}


/*  상품 박스------------텍스트 부분----------------------------------                 */
#pbox {
	width: 550px;
	float: left;
	margin-left: 40px;
	margin-bottom: 40px;
	padding-top:70px;
}

#productMainTiltle {
	width: 480px;
	height: 50px;
	line-height: 50px;
	float: left;
	margin-right: 70px;
	font-size:25px;
}

#productPrice {
	float: left;
	width: 50%;
	height: 40px;
	line-height: 40px;
	font-size:17px;
    margin-bottom:20px;
   
}

#sprofile {
	float: left;
	width: 250px;
	height: 40px;
	line-height: 40px;
	padding-left:20px;
	margin-bottom:20px;;
	font-size:14px;
	
}

#sprofile>a{
color:gray;
}

#simg {
	float: left;
	with: 20%;
	height: 40px;
	line-height: 40px;
	margin-bottom:20px;
	
}

#simg>a>img {
	width: 50px;
	line-height: 40px;
}


#yesdiscount{
width:100%;
float:left;
line-height: 40px;
height: 40px;
font-size:13px;
color:gray;
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
	margin-bottom:10px;
	padding-bottom:5px;
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
width: 50%;
padding-left:20px;
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
	font-size:25px;
	padding-left:280px;
	margin-bottom:25px;
	font-weight:bold;

	
}

#productTotalPrice2 {
	padding-left: 350px;
	width: 100%;
	float: left;
	line-height: 15px;
	height: 15px;
	font-size:13px;
	font-weight: 400px;
	padding-left:280px;
	margin-bottom:3px;
	color:gray;		
}

#productTotalPrice3 {
	padding-left: 350px;
	width: 100%;
	float: left;
	line-height: 15px;
	height: 15px;
	font-size:13px;
	font-weight: 400px;
	padding-left:280px;
	margin-bottom:15px;
	color:gray;	
}

#productTotalPrice4 {
	padding-left: 350px;
	width: 100%;
	float: left;
	line-height: 15px;
	height: 15px;
	font-size:13px;
	font-weight: 400px;
	padding-left:280px;
	margin-bottom:3px;
	color:gray;		
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

/*  상세정보박스1  -------------------------------------------------------- */
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


#productInfoPage2>#retitle,#qtitle {
	width: 100%;
	float: left;
	margin-top: 30px;
	margin-bottom: 50px;
	padding-left:20px;
	color:gray;
	font-size:14px;
}

#noreview{
   width: 100%;
   float: left;
   margin-top: 50px;
   margin-bottom: 100px;
   padding-left:100px;
   color:gray;
}



#reviewTitle>li>b{
color:gray;
}

#reviewTitle, .reviewList {
	width: 100%;
	margin-bottom: 10px; 
	line-height: 60px;
	height: 60px;
}

.reviewList { 
	margin-bottom: 10px;
	padding-bottom:10px;
}

#reviewTitle>li, .reviewList>li {
	width: 10%;
	float: left;
	border-bottom: 1px solid #ddd;
	
}

#reviewTitle>li{
height:60px;
padding-bottom:10px;
}

.reviewList>li {
	height: 60px;
	line-height: 60px;
	padding-bottom:10px;
	
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


#reviewViewbox,#qnaViewbox{
width:100%;
float:left;
padding-left:30px;
padding-bottom:10px;
border-bottom:1px solid #ddd;
}

/* 리뷰이미지 설정*/
#reviewImgbox {
   width:100%;
   float: left;
   padding-left:50px;
}

#reviewImgbox>img {
	width:600px;
	height: 400px;
	float: left;
}


#reviewtxtbox,#qnatxtbox {
    padding-left:15px;
	width:1050px;
	height: 300px;
	line-height: 100px;
	float: left;
	padding-left:50px;
	overflow:auto;
}

#qnatxtbox2{
   padding-left:15px;
	width:1050px;
	height: 300px;
	line-height: 100px;
	float: left;
	padding-left:50px;
	background-color:#eee;
	overflow:auto;
}

#nonebox{
float:left;
 width:100%;
 height:30px;
 line-height:30px;
 margin:10px;
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
	margin-top:30px;
	margin-bottom: 50px;
}

#qnaTitle {
	width: 100%;
	margin-bottom: 10px;
	color:gray;
}


#qnaList {
	width: 100%;
	height: 60px;
	margin-bottom: 10px;
	padding-bottom:10px;
}

#qnaTitle>li{
	text-align: center;
}
#qnaTitle>li, #qnaList>li {
	width: 10%;
	float: left;
	border-bottom: 1px solid #ddd;
	height: 60px;
	line-height: 50px;
	padding-bottom:10px;
	
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

<!-- 문의 후기 버튼 -->

#reviewWriteBtn {
	width:100%;
	padding-left:980px;
	padding-right:10px;
}

#reviewWriteBtn>input {
	float: right;
	width: 80px;
	height: 25px;
	line-height: 20px;
	margin-left:1000px;
	margin-bottom:20px;
	
	padding: 3px 5px;
	color: #666666;
	border-radius: 1px;
	background:#eee;
	text-align: center;
 	text-decoration: none;
	display: inline-block;
	border:1px solid #ddd;
	
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

 
#pagelibtn{
float:left;
width:70px;
height:50px;
line-height:50px;
margin-left:1010px;
font-size:15px;
color:black;
}

/* 채팅 */
#chatIframe{
		position:absolute;
		top:600px;
		width:502px;
		height:662px;
		padding:1px;
		background-color:rgb(250, 250, 250);
		display:none;
	}
	#chatContainer{
		width:500px;
		height:590px;
	}
	#chatTop{
		width:500px;
		height:20px;
		background-color:rgb(252,118,45);
	}
	#chatInfoTitle{
		height:50px;
		width:500px;
		background-color:white;
	}
	#closedivBtn, #reportChat{
		cursor: pointer;
	}
	#chatHeaderSpan{
		line-height:50px;	
	}
	#chatInfoTitle{
		text-align: center;
		font-size:16px;
	}
	#reportChat{
		color:red;
		float:left;
		margin-left:10px;
	}
	#closedivBtn{
		float:right;
		line-height:50px;
		font-size:20px;
		margin-right:10px;
	}
	#theyId{
		font-weight:bold;
		font-size:17px;
		margin-right:5px;
	}
</style>
<script>
    var productnump=${pvo.productnum};
	var pcount=1; //상품갯수
	var ocount=1; //옵션갯수
	var prtprice=0; //상품본래가격
	var dprtprice=0; //상품할인가격
	var tprice=0;
	var submitprice = 0;
	var optprice=0;
	var optnum=0;
	var totaldprtprice=0;
	
	$(function(){
		prtprice=${pvo.productprice}; //상품본래가격
		
		//상품할인가격
        dprtprice=${Dprice};
		
		submitprice=tprice=prtprice-dprtprice;
		//alert("submit="+submitprice);
		$("#spanTotalPrice").text(tprice);
		//////		
		//alert("prtprice="+prtprice+", dprtprice="+dprtprice+", tprice="+tprice+",optprice="+optprice);
		//상품갯수구하기 +
		$("#pCount").click(function(){ 	    	
			
    		pcount=parseInt($("#prtnum").text())+1;
    		//alert("pcount="+pcount);
    		$('#prtnum').text(pcount);	   			

    		var tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);			
    		//alert("pcount="+pcount+"tprice="+tprice);
    		$("#productTotalPrice").html("구매가격:"+tprice+"원");
    		$("#productTotalPrice2").html("할인된가격: - "+(dprtprice*pcount)+"원");
    		$("#productTotalPrice4").html("상품"+prtprice+"원 x"+pcount+"개");
    		$("#productTotalPrice3").html("옵션가격:"+(optprice*ocount)+"원("+optprice+"x"+ocount+"개)");
    		submitprice=tprice;
    		totaldprtprice=dprtprice*pcount;
    		
    	});
		 ///////////////상품갯수 구하기 -////////////////
    	$("#mCount").click(function(){
    		
    		pcount=parseInt($("#prtnum").text())-1;
    	
    		if(pcount<=0){	
    			alert("1개이상 구매해 주세요");	
    			pcount=parseInt($("#prtnum").text());
    		}
    		
    		$('#prtnum').text(pcount);
	
    		tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);
    		//alert("pcount="+pcount+"tprice="+tprice); 		 		
    		$("#productTotalPrice").html("구매가격:"+tprice+"원");
    		$("#productTotalPrice2").html("할인된가격: - "+(dprtprice*pcount)+"원");
    		$("#productTotalPrice4").html("상품"+prtprice+"원 x"+pcount+"개");
    		$("#productTotalPrice3").html("옵션가격:"+(optprice*ocount)+"원("+optprice+"x"+ocount+"개)");
    		
    		submitprice=tprice;
    		totaldprtprice=dprtprice*pcount;
    		//alert("총"+submitprice);
    		//alert(tprice);
    	});		
		 
       ///옵션바뀔때마다 가격 계산해주기
       $("#selectOption").change(function(){
			var opt=$('#selectOption').val();
			//alert("opt"+opt);
			var optArr=opt.split('&'); 
			
			optnum=parseInt(optArr[0]);   //옵션 숫자
			optprice=parseInt(optArr[1]); //옵션 가격
			//ocount=1;
			
			
			 
			//$('#optnum').text(ocount);
			 
			//alert(dprtprice);
			var tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);
			//alert("옵션바뀔때 가격"+optprice+",tprice="+tprice);
			
			$("#productTotalPrice").html("구매가격:"+tprice+"원");
			$("#productTotalPrice2").html("할인된가격: - "+(dprtprice*pcount)+"원");
			$("#productTotalPrice4").html("상품"+prtprice+"원 x"+pcount+"개");
			$("#productTotalPrice3").html("옵션가격:"+(optprice*ocount)+"원("+optprice+"x"+ocount+"개)");
			   
			submitprice=tprice;
			totaldprtprice=dprtprice*pcount;
	  });
 
      ////옵션 갯수 늘리기+//////////////////////////////////////////
      $("#opCount").click(function(){
         ocount=parseInt($("#optnum").text())+1;
		 $('#optnum').text(ocount);
	
		 tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);    		 

		 $("#productTotalPrice3").html("옵션가격:"+(optprice*ocount)+"원("+optprice+"x"+ocount+"개)");
		 $("#productTotalPrice").html("구매가격:"+tprice+"원");
  		 $("#productTotalPrice2").html("할인된가격: - "+(dprtprice*pcount)+"원");
  		 $("#productTotalPrice4").html("상품"+prtprice+"원 x"+pcount+"개");

		 submitprice=tprice;
		 totaldprtprice=dprtprice*pcount;
      }); 
      
      //옵션갯수 줄이기-////////////////////////////////////////////////
      $("#omCount").click(function(){
          ocount=parseInt($("#optnum").text())-1;
          
          if(ocount<=0){	
  			ocount=parseInt($("#optnum").text());
  		   }
          
 		 $('#optnum').text(ocount);
 	
 		 tprice=(optprice*ocount)+((prtprice-dprtprice)*pcount);    		 

 		 $("#productTotalPrice3").html("옵션가격:"+(optprice*ocount)+"원("+optprice+"x"+ocount+"개)");
 		 $("#productTotalPrice").html("구매가격:"+tprice+"원");
   		 $("#productTotalPrice2").html("할인된가격: - "+(dprtprice*pcount)+"원");
   		 $("#productTotalPrice4").html("상품"+prtprice+"원 x"+pcount+"개");

 		 submitprice=tprice;
 		 totaldprtprice=dprtprice*pcount;
       });
      
      //////////총계산 값 저장해놓기/////////////////////////////////
      
      $("#totalbuy").click(function(){
    	  if(${logId==null}){
    		  alert("로그인후 이용해 주세요")
    	  }
    	  var toltalPrice = (prtprice * pcount) + (optprice* ocount);
    	  var totalCount = pcount+optprice;
    	  location.href="/sshj/productPay?total="+toltalPrice+"&discountprice="+totaldprtprice+"&productnum=${pvo.productnum}&productname=${pvo.productname}&deliveryoption=${pvo.deliveryoption}&optionnum="+optprice+"&totalCount="+totalCount;
      });
      ///////////////////////////장바구니에 등록하기/////////////////////////////
      ////장바구니에 넘겨야할 데이터-> 아이디/상품코드/상품가격/상품의갯수/할인가격/옵션코드/옵션가격/옵션의갯수/최종구매가격
		$("#wishbtn").click(function() {
			alert("아이디="+"${logId}"+"상품코드"+productnump+"상품가격="+prtprice+"/상품의 갯수="+pcount+"/옵션가격="+optprice+"/옵션의갯수="+ocount+"/최종구매가격="+submitprice+"/옵션코드="+optnum+"/본래할인가격"+dprtprice+"/총할인가격="+totaldprtprice);
			var data= "userid=${logId}&productnum=${pvo.productnum}&prtprice="+prtprice+"&optnum="+optnum+"&pcount="+pcount+"&optprice="+optprice+"&ocount="+ocount+"&submitprice="+submitprice+"&dprtprice="+dprtprice;
			var url="customWishInsert";
			//alert(data);
			$.ajax({
				url:url,
				data:data,
				success:function(result){
					console.log('장바구니 등록 성공');
				},error:function(e){
					console.log(e.responseText);
					console.log("장바구니 등록 실패");
				}
			})
			
			
			
		
		});
       ///////////////////////////////////채팅하기////////////////////
   
     $(document).on('click','input[value="1:1대화하기"]', function(){
		var roomcode =1;
		var theyid = "${pvo.userid}";
		var myid = "${logId}";
		console.log("logid="+myid);
		$("#theyId").text(theyid);
		$("#chatIframe").css("display","block");/* 아이피 수정해야 할 곳 ^^^^^^ */
		$("#chatContainer").attr("src","http://192.168.0.52:12021/chatForm?sender="+myid+"&receiver="+theyid+"&roomcode="+roomcode);
	});
    
    
    
    
      /////////////////////////리뷰보기/////////////////////////////////
    
    	$(".reviewViewbtn").click(function() {
    		
  			$(this).parent().next().toggle(
  				function(){
  					$(this).parent().next().css("display", " "); 
  				},
  				function(){
  					$(this).parent().next().css("display", "hide"); 
  				   
  				}
  			);
  		});
      
     ///////////////////////////문의보기///////////////////////////////
	$(".qnaViewbtn").click(function() {
    		
  			$(this).parent().next().toggle(
  				function(){
  					$(this).parent().next().css("display", " "); 
  				},
  				function(){
  					$(this).parent().next().css("display", "hide"); 
  				  
  				}
  			);
  		});
 
    
    
    
});
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
			
				<c:if test="${Dprice>0}">
				<div id="yesdiscount">해당 상품은 할인이 적용중입니다.</div>
				</c:if>
				
				<c:if test="${Dprice<=0}">
				<div id="yesdiscount">해당 상품은 할인이 없습니다.</div>
				</c:if>
				
				<div id=productPrice>원가: ${pvo.productprice}</div>  <!-- 가격 -->
				<div id="sprofile">
					<a href="#">${fvo.farmname}</a>  <!--농장이름 -->
					<a href="#">${pvo.userid}</a>  <!-- 판매자 아이디 -->
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
						<li><input type="button" id="mCount" class="pmbtn minibtn" value="-"/><span id="prtnum" name="prtnum">1</span><input type="button"  id="pCount" class="pmbtn minibtn" value="+"/></li>  <!-- 12 -->
						<li>추가옵션</li>  <!-- 13 -->
						<li><c:if test="${empty ovo}">해당 상품은 옵션이 없습니다. </c:if></li>  <!-- 14 -->
						 
						<c:if test="${not empty ovo}">
							<li><select name="selectOption" id="selectOption">
							   
							   
							        <option value="0&0">옵션 선택 안함</option>
							   	    
						   	 <c:forEach var="ovodata" items="${ovo}">						   	       
								   <option value="${ovodata.optionnum}&${ovodata.optionprice}">${ovodata.optionnum}${ovodata.optionname}</option> <!-- -----옵션선택하기----- -->
							 </c:forEach>
							</select></li>
						
						<c:if test="${not empty ovo}">
							<li><input type="button" id="omCount" class="pmbtn minibtn"  value="-"/><span id="optnum">1</span><input type="button" id="opCount" class="pmbtn minibtn"  value="+"/></li>  <!-- 16 -->
					    </c:if>
					  </c:if>
					    
					</ul>
				</div>
				<!--productPrBox  -->
                <div id=productTotalPrice4></div>
                <div id=productTotalPrice2>할인된가격:- ${Dprice} 원</div>
                <div id=productTotalPrice3>옵션가격:</div>
				<div id=productTotalPrice>구매가격: <span id="spanTotalPrice"></span> 원</div>
				
				<div id=productBtn>
					<input type="button" value="1:1대화하기"  class="btn" id="chatbtn"/>
					<input type="button" value="장바구니 담기" class="btn" id="wishbtn"/>
					<input type="button" value="구매하기"  class="btn" id="totalbuy"/>
				</div>
			</div>
			<!--pbox  -->

        

		</div>
		<!-- productMainBox -->

		<!-- -------------------------------------상세정보박스 상단 버튼-------------------------------------------------------- -->

		<div class="infoBtnb">
			<a href="#productTotalPrice"><input type="button" id="infoBtn1" value="상품설명" class="btn" /></a>
			<a href="#productInfoPage2"><input type="button" id="infoBtn2" value="고객후기"  class="btn"/></a>
			<a href="#productInfoPage3"><input type="button" id="infoBtn3" value="상품문의"  class="btn"/></a>
		</div>

		<!-- -------------------------------------상세정보박스1-------------------------------------------------------- -->

		<div id="productInfoPage">
			<div id="productInfoPage1">

				<!-- relativeBox -->

              
                
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
			<a href="#productTotalPrice"><input type="button" id="infoBtn1" value="상품설명" class="btn" /></a>
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
				
                <c:if test="${empty reviewlist}">
		             <div id="noreview">작성된 후기가 없습니다.</div>
		        </c:if>
		       
              <c:forEach var="rlist" items="${reviewlist}">
                 	
		          	
					<ul class="reviewList">
						<li>${rlist.reviewnum}</li>
						<li id="reviewViewbtn" class="reviewViewbtn">
							<input type="hidden" class="reviewconinput" value="${rlist.reviewnum}"/>
							후기 자세히 보기 ▼
						</li>
						<li>${rlist.userid}</li>
						<li>${rlist.reviewwritedate}</li>
						<li>${rlist.reviewscore}</li> 
					</ul>
					
					   <div id="reviewViewbox" style="display:none" >
					      <input type="hidden" value="r${rlist.reviewnum}"/>
							<div id="reviewImgbox">
								<img src="img/${rlist.reviewimg}"/>
							</div>
							<div id="reviewtxtbox">					
							     ${rlist.reviewcontent}
							</div>
					   </div>
					   
               </c:forEach>
               
               <div id="pagelibtn"><a href="/sshj/mybuyList">후기 작성</a></div>
               
		       <div id="nonebox">   </div>

               <c:if test="${not empty reviewlist}">
               
					<!-- 페이징 표시--------- -->
		<div class="page_wrap">
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/customproduct?productnum=${pvo.productnum}&rpageNum=${pageVO.pageNum-1}#productInfoPage2<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum}"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/customproduct?productnum=${pvo.productnum}&rpageNum=${p}#productInfoPage2<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="/sshj/customproduct?productnum=${pvo.productnum}&rpageNum=${pageVO.pageNum+1}#productInfoPage2<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
	           </c:if>
			</div>
		 </div>
		 
					<!-- 페이징 표시--------- -->
              </c:if>

			</div>
			<!-- productInfoPage2 -->
		</div>
		<!-- productInfoPage -->

		<!--- -------------------------------------상세정보박스2  끝-------------------------------------------------------- -->
		
		<!-- ---------------------------------------상품후기 글 팝업창---------------------------------------------------------------------- -->
		
		 

		
			<!-- -------------------------------------상세정보박스 상단 버튼-------------------------------------------------------- -->


        <div class="infoBtnb">
			<a href="#productTotalPrice"><input type="button" id="infoBtn1" value="상품설명" class="btn" /></a>
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

		   <c:if test="${empty faqlist}">
		       <div id="noreview">작성된 문의가 없습니다.</div>
		   </c:if>

           <c:forEach var="qlist" items="${faqlist}">
				<ul id="qnaList">
					 <li>${qlist.qnum}</li> <!-- 문의 숫자 -->
					<c:if test="${qlist.qopen==0 && logId!=qlist.userid}"> <!-- 비공개일경우 제목표시 -->
					 <li class="qnaViewbtn">비공개로 작성된 글입니다.</li>
					</c:if>
					<c:if test="${qlist.qopen==1 || logId==qlist.userid}"> <!-- 공개일경우 제목표시 -->
					 <li class="qnaViewbtn">${qlist.qtitle}</li>
					</c:if>
					 <li>${qlist.userid}</li> <!-- 유저아이디 -->
					 <li>${qlist.qwritedate}</li><!-- 날짜 -->
				  <c:if test="${qlist.qopen==0}">	<!-- 비공개일경우 그림표시 -->
					 <li><img src="img/ciconlock2.png"></li>
				  </c:if>
				  <c:if test="${qlist.qopen==1}">	 <!-- 공개일경우 그림표시 -->
					 <li><img src="img/ciconlock.png"></li>
				  </c:if>
				</ul>
				
				<div id="qnaViewbox" style="display:none" >
				<c:if test="${qlist.qopen==1 || logId==qlist.userid}">	<!-- 공개일경우 내용표시 -->	
							<div id="qnatxtbox">				
							     ${qlist.qcontent}
							</div>
						 <c:if test="${qlist.qanswer==null}"> <!-- 답변없을경우 -->	
						    <div id="qnatxtbox2">	
							  아직 작성된 답변이 없습니다.
							</div>
						 </c:if>
						 
						 <c:if test="${qlist.qanswer!=null}">
						    <div id="qnatxtbox2">					
							     ${qlist.qanswer}
							</div>
						</c:if>	
				</c:if>	
				
				<c:if test="${qlist.qopen==0 && logId!=qlist.userid}">	
				           <div id="qnatxtbox2">
				                비공개로 작성된 글입니다.
				           </div>
				</c:if>	
				
				</div>
				
		  </c:forEach>	

				<div id="pagelibtn"><a href="/sshj/mybuyList">문의 작성</a></div>
				
				<div id="nonebox">   </div>

			<c:if test="${not empty faqlist}">
			
				<!-- 페이징 표시--------- -->
	<div class="page_wrap">
			<div class="page_nation">
			   <c:if test="${pageVO2.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/customproduct?productnum=${pvo.productnum}&fpageNum=${pageVO2.pageNum-1}#productInfoPage3<c:if test="${pageVO2.searchWord != null && pageVO2.searchWord != ''}">&searchKey=${pageVO2.searchKey}&searchWord=${pageVO2.searchWord}</c:if>"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO2.startPageNum}" step="1" end="${pageVO2.startPageNum + pageVO2.onePageNum-1}">
	              <c:if test="${p<=pageVO2.totalPage}">
	                 <c:if test="${p==pageVO2.pageNum}"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO2.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/customproduct?productnum=${pvo.productnum}&fpageNum=${p}#productInfoPage3<c:if test="${pageVO2.searchWord != null && pageVO2.searchWord != ''}">&searchKey=${pageVO2.searchKey}&searchWord=${pageVO2.searchWord}</c:if>">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO2.pageNum < pageVO2.totalPage}">
	              <a class="arrow next" href="/sshj/customproduct?productnum=${pvo.productnum}&fpageNum=${pageVO2.pageNum+1}#productInfoPage3<c:if test="${pageVO2.searchWord != null && pageVO2.searchWord != ''}">&searchKey=${pageVO2.searchKey}&searchWord=${pageVO2.searchWord}</c:if>"></a>
	           </c:if>
			</div>
	 </div>
				<!-- 페이징 표시--------- -->
  			</c:if>

			</div>
			<!--productInfoPage3  -->

		</div>
		<!--productInfoPage  -->


			<!-- 채팅창 -->
         	<div id ="chatIframe">
				<div id="chatTop"></div>
				<div id="chatInfoTitle"><span id="chatHeaderSpan"><span id="reportChat">신고하기</span><span id="theyId"></span>님과의 채팅입니다.</span><span id="closedivBtn">&times;</span></div>
				<iframe src="" id="chatContainer" frameborder="0" ></iframe>
			</div>									

	</div>
	<!-- section -->



	<div style="clear: both;"></div>
</body>
</html>