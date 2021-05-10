<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>	
	$(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		$("#payyy").click(function(){
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }

			    alert(msg);
			});
		});
	});
</script>

<style>

/*  기본설정----------------------------------------------                 */
.section{
	width: 1080px;
	background-color: white;
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
	
}
#section{
font-size:17px;
}

/*  기본설정----------------------------------------------                 */
#deliverinfoBox{
width:100%;
float:left;
}

#title1,#title2,#title3{
float:left;
width:100%;
height:30px;
border-bottom:1px solid #ddd;
margin-top:40px;
margin-bottom:40px;
padding-left:10px;
}
/*  배송지정보----------------------------------------------                 */

#infoul{
width:100%;
float:left;
padding-left:10px;
height:400px;
}

#infoul>li{
height:30px;
line-height:30px;
margin-top:20px;
}

#infoul>li:nth-child(13n+1){
float:left;
width:200px;
}

#infoul>li:nth-child(13n+2),#infoul>li:nth-child(13n+2)>input{
float:left;
width:370px;
margin-right:500px;
}

#infoul>li:nth-child(13n+3){
float:left;
width:200px;
}

#infoul>li:nth-child(13n+4),#infoul>li:nth-child(13n+4)>input{
float:left;
width:370px;
margin-right:10px;
}

#infoul>li:nth-child(13n+5){
width:300px;
margin-right:190px;
}

#infoul>li:nth-child(13n+6){
float:left;
width:200px;
}

#infoul>li:nth-child(13n+7),#infoul>li:nth-child(13n+7)>input{
float:left;
width:370px;
margin-right:500px;
}

#infoul>li:nth-child(13n+8){
float:left;
width:200px;
}

#adrrnum{
width:290px;
margin:3px;
}

#infoul>li:nth-child(13n+9){
float:left;
width:370px;
margin-right:500px;
line-height:30px;
}

#infoul>li:nth-child(13n+10)>input{
float:left;
width:370px;
margin-left:200px;
margin-right:500px;
height:30px;
line-height:30px;

}

#infoul>li:nth-child(13n+11)>input{
float:left;
width:370px;
margin-left:200px;
margin-right:500px;
height:30px;
line-height:30px;
}

#infoul>li:nth-child(13n+12){
float:left;
width:200px;
}

#infoul>li:nth-child(13n+13){
float:left;
width:300px;
margin-right:570px;
}

#infoul>li:nth-child(13n+13)>button{
width:150px;

}

/*  배송요청사항----------------------------------------------                 */

#deliveraskBox{
float:left;
width:100%;
margin-bottom:
}

#deliverMsg{
width:600px;
margin-right:470px;
}

/* 구매상품----------------------------------------------                 */
#payproductBox{
float:left;
width:100%;
margin-bottom:100px;
}

.wishlistbox{
width:100%;
float:left;
}

.wishListTitle{
width:100%;
float:left;
height:40px;
line-height:40px;
border-bottom:1px solid #ddd;

}

.wishListTitle>li:nth-child(4n+1){
width:400px;
padding-left:100px;

}

.wishListTitle>li:nth-child(4n+2){
width:200px;

}

.wishListTitle>li:nth-child(4n+3){
width:170px;

}

.wishListTitle>li:nth-child(4n+4){
width:300px;

}

/* 구매상품리스트----------------------------------------------                 */

.wishList{
margin-top:10px;
margin-bottom:10px;
}

.wishList>li:nth-child(5n+1),.wishList>li:nth-child(5n+1)>img{
width:100px;
height:60px;
float:left;
}

.wishList>li:nth-child(5n+2){
padding:3px;
padding-left:10px;
padding-right:20px;
width:300px;
height:20px;
float:left;
}

.wishList>li:nth-child(5n+3){
width:200px;
height:60px;float:left;
}

.wishList>li:nth-child(5n+4){
width:170px;
height:60px;float:left;
}

.wishList>li:nth-child(5n+5){
width:300px;
height:60px;float:left;
}

/*버튼*/
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
	/*버튼*/
	.btn:hover{
		background: gray;
		color:white;
		display: inline-block;
	}

#ppbox{
width:100%;
float:left;
}

#payyy{
width:80px;
margin-left:1000px;
}

#adrrnumbtn{
color: #666666;
border-radius: 3px;
background:#fff;
box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
text-align: center;
text-decoration: none;
display: inline-block;
border:none;
font-size:15px;
}

#adrrnumbtn:hover{
background: gray;
		color:white;
		display: inline-block;
}

</style>


<body>

<div class="section" id="section">

    <div id="payBox">
        <div id="deliverinfoBox">
           <div id="title1">배송지정보</div>
              <ul id="infoul">
	               <li>배송지명</li>   <li><input type="text" name="deliveryn" id="deliveryn"/></li>
	               <li>받는분</li>    <li><input type="text" name="usern" id="usern"/></li>  <li><input type="checkbox" name="boardCheckBox" value=""/>주문정보와동일</li>
	               <li>휴대폰</li>    <li><input type="text" name="tel" id="tel"/></li>
	               <li>주소</li>      <li><input type="button" id="adrrnumbtn" value="주소검색"> <input type="text" name="adrrnum" id="adrrnum"/></li>
	                                <li><input type="text" name="adrr1" id="adrr1"/></li>
	                                <li><input type="text" name="adrr2" id="adrr2"/></li>
	               <li>배송방법</li>  <li><input type="button" class="btn" name="" id="" value="택배배송"/><input type="button" class="btn" name="" id="" value="현장수령"/></li>
              </ul>
         </div>
        
        
        <div id="deliveraskBox">
           <div id="title2">배송요청사항</div>
           <div><input type="text" name="deliverMsg" id="deliverMsg"/></div>
        </div>
        
        
        <div id="payproductBox">
        
           <div id="title3">구매상품</div>
                <div class="wishlistbox">
						<ul class="wishListTitle">
							<li><b>상품</b></li>
							<li><b>판매가</b></li>
							<li><b>수량</b></li>
							<li><b>구매가격</b></li>
						</ul>
			
			
						<ul class="wishList">
							<li><img src="img/cr5.jfif"></li>
							<li><div>맛있는오렌지</div>
							    <div>맛있는오렌지 설명</div></li>
							<li>17,900</li>
							<li>1</li>
							<li>17,900</li>
			           </ul>
			           
			           <ul class="wishList">
							<li><img src="img/cr5.jfif"></li>
							<li><div>맛있는오렌지</div>
							    <div>맛있는오렌지 설명</div></li>
							<li>17,900</li>
							<li>1</li>
							<li>17,900</li>
			           </ul>
			       </div>   
			        
			             <div id="ppbox"><input type="button" class="btn" value="결제하기" id="payyy"/></div>
			             
			  </div>
           
         

    </div>


</div>
<div style="clear:both;"></div>
