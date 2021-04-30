<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
	#cMyPageLeft{
		display: block;
	}
	#mypointList{
		height:3500px;
		overflow:auto;
		position: relative;
	}
	.Pbuttons{
		height:40px;
		width:80px;
		background-color: rgb(252,118,45);
		color:white;
		line-height:40px;
		text-align:center;
		border-radius:7%;
		margin-left:1px;
	}
	#pointSelect>div{
		float:left;
	}
	#pointSelectDate{
		float:right;
	}
	#pointSelectDate>div{
		float:left;
	}
	#pointUl{
		padding:30px 0px;
		margin:0px;
		width:1080px;
	}
	#pointUl>li{
		width:135px;
		height:60px;
		line-height:60px;
		margin:5px 0;
		text-align:center;
	}
	#pointUl>li:nth-child(1), #pointUl>li:nth-child(2), #pointUl>li:nth-child(3), #pointUl>li:nth-child(4), #pointUl>li:nth-child(5), #pointUl>li:nth-child(6){
		border-bottom:1px solid rgb(252,118,45);
		
	}
	#pointUl>li:nth-child(6n){
		width:240px;
	}
	#pointUl>li:nth-child(6n+3){
		width:300px;
	}
	.buyttitle, .buydetail{
		line-height:30px;
		text-align:left;
		float:left;
		width:242px;
	}
	#pointUl>li:nth-child(6n+3) img{
		line-height:60px;
		float:left;
	}
	#pointUl img{
		height:58px;
		width:58px;
		float:left;
	}
	#cMyPageLeft{
		display:block;
	}
	.buytitle{
		font-size:1.1em;
	}
	.buydetail{
		font-size:0.9em;
		color:#999;
	}
	.wordcut{
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.buybutton{
		width:70px;
		height:35px;
		line-height:35px;
		text-align:center;
		margin:1px;
		padding:0px;
		border: none;
		background-color:rgb(252,118,45);
		color:white;
		border-radius: 5px;
	}
	.buybuttonNo{
		width:70px;
		height:35px;
		line-height:35px;
		text-align:center;
		margin:1px;
		padding:0px;
		border: none;
		background-color:rgb(252,118,45);
		color:white;
		border-radius: 5px;
		opacity:60%;
	}
	.buyListDiv{
		position:absolute;
		top:500px;
		background-color: white;
	}
	.buyListDiv, .buyListBar, .buyListContent{
		width:680px;
	}
	.buyListBar{		
		height:50px;
		background-color: rgb(252,118,45);
		position:absolute;
		color:white;
		text-align: center;
		line-height: 50px;
	}
	.buyListBarClose{
		height:50px;
		width:50px;
		background-color: white;
		position:absolute;
		font-size:40px;
		line-height:40px;
		text-align:center;
		border:1px solid rgb(252,118,45);
		left:630px;
	}
	.buyListContent{
		height:700px;
		border:1px solid rgb(252,118,45);
	}
	.buyListBtn{
		position:absolute;
		width:100px;
		height: 50px;
		top:600px;
		left:290px;
		background-color:rgb(252,118,45);
		color:white;
		border:none;
	}
	#buyListdeliverySearch{	 /* 배송조회 클릭시 */
		display: none;
	}
	#buyCommit{	/* 구매확정 클릭시 */
		display: none;
	}
	#buyReturnInput{	/* 반품 클릭시 */
		font-size:21px;
		line-height:40px;
		display: none;
	}
	#buyCancelNotice{	/* 취소 클릭시 */
		display: none;
	}
	
	#buyCancelRollBack{		/* 취소를 클릭했지만 배송중인 상품이 있을 때 */
		display: none;
	}
	#buyReviewView{
		display: none;		/* 후기 보기 */
	}
	
	
	.warningInfo{
		color:red;
	}
	.addInput{
		height:30px;
		width:675px;
	}
	.thumbsupYes{
		background-image: url("/sshj/img/dthumbsupYes.png");
		background-repeat:no-repeat;
		background-size:contain;
		height:28px;
		width:28px;
		float:left;
		transition-duration:1s;
		margin-right: 7px;
	}
	.thumbsupNo{
		background-image: url("/sshj/img/dthumbsupNo.png");
		background-repeat:no-repeat;
		background-size:contain;
		height:28px;
		width:28px;
		float:left;
		transition-duration:1s;
		margin-right: 7px;
	}
	
	.buyListContent>ul>li:nth-child(2n+1){
		float:left;
		width:226px;
		text-align: center;
		font-size:17px;
		line-height:28px;
		height:30px;
		margin-bottom:1px;
	}
	.buyListContent>ul>li:nth-child(2n){
		float:left;
		width:452px;
		font-size:17px;
		line-height:28px;
		height:30px;
		margin-bottom:1px;
	}
	.buyListContent>ul{
		margin-bottom: 10px;
	}
	#buyReviewtxt{
		width:610px;
		height:400px;
		overflow:auto;
		margin-left:36px;
		margin-right:36px;
		background-color: white;
		font-size: 18px;
		padding:5px;
	}
	#reviewWrite{
		width:610px;
		height:400px;
		overflow:auto;
		margin-left:36px;
		margin-right:36px;
		background-color: white;
		font-size: 18px;
		padding:5px;
		border:1px solid red;
	}
	#buyProduct{
		float:left;
		width:680px;
	}
	#buyProduct img{
		height:100px;
		width:100px;
		float:left;
	}
	#buyProduct>div{
		width:480px;
		float:left;
	}
	.buyListleftMenu{
		width:100px;
		float:left;
		font-size:20px;
		line-height: 100px;
	}
	#reviewStars{
		width:150px;
		height:100px;
		line-height:100px;
	}
	#buyProductStar>span:last-child{
		width:430px;
		height: 100px;
		line-height: 100px;
	}
	#buyProductImg>input{
		width:578px;
		height:100px;
		line-height: 90px;
	}
	#buyProductStar>div:first-child, #reviewStars{
		float:left;
	}
	#buyProductImg>input{
		float:left;
	}
	
	#reviewSubmit{
		width:100px;
		height:60px;
		background-color:rgb(252,118,45);
		border:none;
		color:white;
	}
	.btnSubmit{
		margin:20px 290px;
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
		margin:0 3px;
	}
	/*버튼*/
	.btn:hover, .btnSubmit:hover{
		background: gray;
		color:white;
		display: inline-block;
	}
</style>
<script>
	$(function(){
		$(".buyListBtn").click(function(){
			$(this).parent().parent().css('display',"none");
		})
		$(".buyListBarClose").click(function(){
			$(this).parent().css("display","none");
		})
		$(".thumbsupNo").click(function(){
			$(this).toggleClass("thumbsupNo");
			$(this).toggleClass("thumbsupYes");
		})
		$(".thumbsupYes").click(function(){
			$(this).toggleClass("thumbsupNo");
			$(this).toggleClass("thumbsupYes");
		})
	})
	$(document).ready(function(){
		$("#summernote").summernote({
			height:660,
			minHeight:660,
			maxHeight:660,
			focus:true,
			lang:"ko-KR",
			placeholder:'리뷰를 작성해주세요'
		});
	});
</script>
<div class="section">
	<div id="mypointList">
		<h2>구매내역</h2>
		<div id="pointSelect">
			<div class="btn">전체</div>
		</div>
		<div id="pointSelectDate">
			<div class="btn">3개월</div>
			<div class="btn">6개월</div>
			<div class="btn">1년</div>
		</div>
		<div>
			<ul id="pointUl">
				<li>일시</li>
				<li>주문번호</li>
				<li>상품</li>
				<li>구매가격</li>
				<li>상태</li>
				<li>&nbsp;</li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>배송중</li>
				<li><input type="button" class="btn" value="배송조회"/><input type="button" class="btn" value="문의작성"/><input type="button" class="btn" value="취소"/></li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>배송완료</li>
				<li><input type="button" class="btn" value="구매확정"/><input type="button" class="btn" value="문의작성"/><input type="button" class="btn" value="반품신청"/></li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>취소</li>
				<li></li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>환불</li>
				<li><input type="button" class="btn" value="뭐넣지?"/><input type="button" class="btn" value="환불확정"/></li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>12345678</li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="buyttitle wordcut">맛깔나는귤</span><span class="buydetail wordcut">맛깔나는귤의 설명입니다. 맛깔나는귤의 설명입니다.</span>
				</li>
				<li><span class="pointprice">17,980</span>원</li>
				<li>준비중</li>
				<li><input type="button" class="btn" value="취소하기"/><input type="button" class="btn" value="문의작성"/></li>
			</ul>
		</div>
		
		<div class="buyListDiv" id="buyListdeliverySearch">
			<div class="buyListBar" style="font-size:21px;">배송 조회</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="text-align:center;padding-top:100px;">
				<div>배송조회 iframe</div>
				<input type="button" value="확인" class="btn"/>
			</div>
		</div>
		
		<div class="buyListDiv" id="buyCommit">
			<div class="buyListBar" style="font-size:21px;">구매 확정</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="text-align: center;padding-top:100px; height:300px;">
				<h3>구매확정 하시겠습니까?</h3>
				<h3>배송완료 후 구매확정이 가능합니다.</h3>				
				<input type="button" value="확인" class="btn" style="top:220px;" />
			</div>
		</div>
		
		<div class="buyListDiv" id="buyReturnInput">
			<div class="buyListBar" style="font-size:21px;">반품 신청</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="height:600px;">
				<h3 style="text-align: center">해당 제품을 반품하시겠습니까?</h3>
				<select name="whyReturn">
					<option value="단순변심" >단순변심</option>
					<option value="상품의 상태가 이상해서" >상품의 상태가 이상해서</option>
					<option value="사진과 너무 달라서" >사진과 너무 달라서</option>
					<option value="상품이 손상 또는 파손되어서" >상품이 손상 또는 파손되어서</option>
				</select>
				<div>
					<span class="warningInfo">제품 반품시 발생하는 배송비는 소비자 부담입니다.<br/></span>
					<span class="warningInfo">단, 상품의 변질, 파손으로 인해 발생된 반품 및 교환은 판매자가 부담합니다.</span>
				</div>
				이미지도 첨부해주세요
				<input type="file" name="filename">
				<div id="companyDiv">
				<input type="radio" name="companyRadio" value="기존 택배사 이용"/>기존택배사 이용<br/>
					<input type="text" name="address" class="addInput" placeholder="주소를 입력해주세요"/><br/>
				<input type="radio" name="companyRadio" value="기타 택배사 이용"/>기타 택배사 이용<br/>
					<select>
						<option>우체국 택배</option>
						<option>CJ대한통운</option>
					</select><br/>
					<input type="text" name="address" class="addInput" placeholder="주소를 입력해주세요"/>			
				</div>	
				<input type="button" value="확인" class="btn" style="top:520px;"/>
			</div>
		</div>
		
		<div class="buyListDiv" id="buyCancelNotice">
			<div class="buyListBar" style="font-size:21px;">배송 취소</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="text-align:center;padding-top:100px; height:300px;">
				<h2>선택하신 주문을 취소하시겠습니까?</h2>
				<input type="button" value="확인" class="btn" style="top:220px"/>
			</div>
		</div>
		
		<div class="buyListDiv" id="buyCancelRollBack">
			<div class="buyListBar" style="font-size:21px;">취소 실패</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="text-align: center;padding-top:100px; height:340px;">
				<h2>배송중 / 배송완료 상품은 취소할 수 없습니다.</h2>
				<h2>판매자에게 문의해주세요</h2>
				<input type="button" value="확인" class="btn" style="top:240px"/>
			</div>
		</div>
		
		<div class="buyListDiv" id="buyReviewView">
			<div class="buyListBar" style="font-size:21px;">상품리뷰 보기</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="padding-top:60px; height:700px;background-color: #ddd;">
				<ul>
					<li>번호</li> 	<li>100</li>
					<li>작성자</li> 	<li>rabbit123</li>
					<li>작성일</li>	<li>2021-04-02</li>
					<li>추천</li>	<li>4<div class="thumbsupYes"></div></li>
				</ul>
				<div id="buyReviewtxt">
					굉장히 긴 문장
				</div>
				<input type="button" value="확인" class="btn" style="top:630px;"/>
			</div>
		</div>
		
		
		<div class="buyListDiv" id="buyReviewWrite">
			<div class="buyListBar" style="font-size:21px;">상품리뷰 작성하기</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="padding-top:60px; height:1200px;">
			<div id="buyProduct">
				<span class="buyListleftMenu">구매상품</span>
				<img src="/sshj/img/dsweetpotato2.jpg"/>
				<div>[매당 약 190원]KF94 대형 100매 국산원재료 지퍼형 5매입</div>
				<div>[옵션]1개</div>
			</div>
			<div id="buyProductStar">
				<span class="buyListleftMenu">상품평가</span>
				<div id="reviewStars">별별별별별</div><span>별을 클릭하여 상품 만족도를 알려주세요</span>
			</div>
			<div id="buyProductImg">
				<span class="buyListleftMenu" style="float:left">첨부이미지</span><input type="file" name="filename"/>&nbsp;
			</div>
			<textarea name="reviewcontent" id="summernote">
				서머노트 사용해야 할 부분
			</textarea>
			<input type="button" value="작성하기" class="btnSubmit"/>
			</div>
		</div>
		
		
	</div>
</div>