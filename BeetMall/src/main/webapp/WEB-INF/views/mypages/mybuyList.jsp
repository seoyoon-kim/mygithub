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
	#pointUl>li:nth-child(6n+1){
		line-height:20px;
		padding-top:10px;
	}
	
	#pointUl>li:nth-child(6n+2){
		width:105px;
	}
	#pointUl>li:nth-child(6n){
		width:270px;
	}
	
	#pointUl>li:nth-child(6n+3){
		width:300px;
	}
	#pointUl>li:nth-child(6n+3)>span{
		padding-left:5px;
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
	.buyttitle a:link, .buyttitle a:hover, .buyttitle a:visited, .buyttitle a:active{
		color:black;
	}
	.buydetail a:link, .buydetail a:hover, .buydetail a:visited, .buydetail a:active{
		color:#999;
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
		width:660px;
		height:467px;
		overflow:auto;
		margin-left:10px;
		margin-right:10px;
		background-color: white;
		font-size: 18px;
		padding:5px;
		margin-bottom:15px;
	}
	.buyListContent>input:last-child{
		margin-top:15px;
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
	#buyReviewWrite{
		display:none;
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
	.nonBtn{
		
	}
	.redstar{
		color:red;
		text-size:13px;
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
		$(".nonBtn").attr("readonly",true);
		$("#divcloseBtn").click(function(){
			$("#buyCancelRollBack").css("display","none");
		})
	})
	$(document).ready(function(){
		$("#summernote").summernote({
			height:660,
			placeholder:'고객님의 리뷰를 작성해주세요 단, 무분별한 비난, 욕설 등이 포함된 리뷰는 숨김처리 될 수 있습니다.',
			minHeight:660,
			maxHeight:660,
			lang:"ko-KR"
		});
	});
	$(document).on('click','#invoiceCloseBtn', function(){
		$("#buyListdeliverySearch").css("display","none");
	})
	$(document).on('click',"input[value=취소하기]", function(){
		var num = $(this).parent().prev().children().val();
		var ordernum = $(this).parent().prev().prev().prev().prev().html();
		$("#buyCancelNotice").css("display","block");
		$("#cancelNoticeVal").val(ordernum);
    });
	$(document).on('click','#cancelNoticeBtn', function(){
		var ordernum = $("#cancelNoticeVal").val();
		var url = "orderCancel";
		$.ajax({
			url : url,
			data : "ordernum="+ordernum,
			success : function(result){
				$("#buyCancelNotice").css("display","none");
				if(result == 1){
					console.log('취소성공');
					location.href="mybuyList";
				}else if(result == -1){
					console.log('배송중이라 취소 못함');
					$("#buyCancelRollBack").css("display","block");
				}else{
					alert('취소에 실패했습니다 고객센터로 연락 부탁드립니다');
				}
			}, error : function(){
				console.log('취소실패');
			}
		});
	})
	$(document).on('click','input[value=배송조회]', function(){
		var num = $(this).parent().prev().children().val();
		$("#buyListdeliverySearch").css("display","block");
		var invoicenum = $(this).prev().val();
		$("#invoiceIframe").attr("src","https://www.ilogen.com/web/personal/trace/"+invoicenum);
		// 주소 : https://www.ilogen.com/web/personal/trace/123131564
	});
	$(document).on('click','input[value=구매확정]', function(){
		var num = $(this).parent().prev().children().val();
		$("#buyCommit").css("display","block");
		var ordernum = $(this).parent().prev().prev().prev().prev().html();
		$("#orderCommitHidden").val(ordernum);
		
	});
	$(document).on('click','#ordercommit', function(){
		var num = $("#orderCommitHidden").val();
		var url = "orderCommit";
		var param = "num="+num;
		$.ajax({
			url : url,
			data : param,
			success(result){
				if(result>=1){
					console.log('성공');
					$("#buyCommit").css("display","none");
					location.href="mybuyList";
				}
			}, error(){
				console.log('실패..');
			}
		})
	});
	var date = new Date();
	var today = date.getFullYear()+"/"+addZero(date.getMonth()+1)+"/"+addZero(date.getDate());
	function addZero(value){
		if(value<10){
			return "0"+value;
		}else{
			return value;
		}
	}
	var reviewCheck = 0;
	$(document).on('click','input[value=리뷰작성]', function(){
		var num = $(this).parent().prev().children().val();
		var ordernum = $(this).parent().prev().prev().prev().prev().html();
		$("#buyReviewWrite").css("display","block");
		$("#buyReviewView").css("display","none");
		console.log("productNum=",num);
		$.ajax({
			url : "productInfo",
			data : "productNum="+num,
			success:function(result){
				console.log(result);
				console.log("resultproductname="+result.productname);
				$("#reviewImg").attr("src","/sshj/resources/sellerProductImgs/"+result.thumbimg);
				$("#reviewTitle").html(result.productname);
				$("#reviewordernum").val(ordernum);
				$("#reviewproductnum").val(num);
				console.log("reviewordernun = "+$("#reviewordernum").val()+"reviewproductnum = "+$("#reviewproductnum").val());
			}, error : function(){
				console.log('실패');
			}
		});
	});
	$(document).on('click','input[value=리뷰작성완료]', function(){
		var num = $(this).parent().prev().children().val();
		var ordernum = $(this).parent().prev().prev().prev().prev().html();S
		$("#buyReviewWrite").css("display","none");
		$("#buyReviewView").css("display","block");
		var tag = "<li>번호</li> <li>"+ordernum+"</li>";
		tag	+= "<li>작성자</li> <li>"+${logId}+"</li>";
		tag	+= "<li>작성일</li> <li>"+today+"</li>";
		tag += "<li>제목</li>	<li><input type='text' placeholer='제목을 입력하세요' style='width:443px'/></li>";	
		
		$("#infoInput").empty().append(tag); 
		//$("#buyReviewtxt").next().css("margin-top","5px");
	})
	
	$(document).on('click','input[value=환불확정]', function(){
		var num = $(this).parent().prev().children().val();
	});
	$(document).on('click','input[value=재구매]', function(){
		var num = $(this).parent().prev().children().val();
	});
	$(document).on('click','input[value=문의작성]', function(){
		var num = $(this).parent().prev().children().val();
	});
	
	$(document).on('click','input[value=리뷰작성완료하기]', function(){
		var reviewForm = $("form[name=reviewFrm]").serialize();
		$.ajax({
			type:'post',
			url : "reviewWrite",
			data : reviewForm,
			dataType : 'json',
			success:function(result){
				console.log('리뷰전송성공');
				console.log(result);
				
			},error:function(){
				console.log("리뷰전송실패");
			}
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
				
				<c:forEach var="vo" items="${list}">
					<li><span class="pointdate">${vo.orderdate}</span></li>
					<li>${vo.ordernum}</li>
					<li>
					<a href="customproduct?no=${vo.productnum}"><img src="/sshj/resources/sellerProductImgs/${vo.thumbimg}"></a><span class="buyttitle wordcut"><a href="">${vo.productname}</a></span><span class="buydetail wordcut"><a href="">${vo.productcontent}</a></span>
					</li>
					<li><span class="pointprice">${vo.orderprice}</span>원</li>
					<li>${vo.orderstatus}<input type="hidden" value="${vo.productnum}"/></li>
					<c:if test="${vo.orderstatus == '준비중'}">
					<li><input type="button" class="btn qnaWrite" value="문의작성"/><input type="button" class="btn" value="취소하기"/></li>
					</c:if>
					<c:if test="${vo.orderstatus == '배송중'}">
					<li><input type="hidden" value="${vo.invoice}"/><input type="button" class="btn" value="배송조회"/><input type="button" class="btn" value="문의작성"/><input type="button" class="btn nonBtn" value="취소하기"/></li>
					</c:if>
					<c:if test="${vo.orderstatus == '배송완료'}">
					<li><input type="button" class="btn" value="구매확정"/><input type="button" class="btn" value="리뷰작성"/><input type="button" class="btn" value="문의작성"/></li>
					</c:if>
					<c:if test="${vo.orderstatus == '환불'}">
					<li><input type="button" class="btn" value="환불확정"/><input type="button" class="btn" value="문의작성"/></li>
					</c:if>
					<c:if test="${vo.orderstatus == '취소'}">
					<li></li>
					</c:if>
					<c:if test="${vo.orderstatus == '구매확정'}">
						<c:if test="${vo.ordercnt == null || vo.ordercnt <=0}">
						<li><input type="button" class="btn" value="리뷰작성"/><input type="button" class="btn" value="재구매"/><input type="button" class="btn" value="문의작성"/></li>
						</c:if>
						<c:if test="${vo.ordercnt != null && vo.ordercnt>=1 }">
						<li><input type="button" class="btn" value="리뷰작성완료"/><input type="button" class="btn" value="재구매"/><input type="button" class="btn" value="문의작성"/></li>						
						</c:if>
					</c:if>					
				</c:forEach>
				<!-- 구분용 -->
				
			</ul>
		</div>
		</div>
		<div class="buyListDiv" id="buyListdeliverySearch" style="overflow-x:hidden; width:1300px;z-index:80;">
			<div class="buyListBar" style="font-size:21px; width:1300px;">배송 조회</div><div class="buyListBarClose" style="left:1250px;">&times;</div>
			<div class="buyListContent" style="text-align:center;padding-top:47px; width:1300px;">
			<iframe src="https://www.ilogen.com/web/personal/tkSearch" height="548px" width="1298px"  frameborder="no" id="invoiceIframe">
			
			</iframe><br/>
				<input type="button" value="확인" class="btn" id="invoiceCloseBtn"/>
			</div>
		</div>
		<div class="section">
		<div class="buyListDiv" id="buyCommit">
			<div class="buyListBar" style="font-size:21px;">구매 확정</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="text-align: center;padding-top:100px; height:300px;">
				<input type="hidden" value="" id="orderCommitHidden"/>
				<h3>구매확정 하시겠습니까?</h3>
				<h3>배송완료 후 구매확정이 가능합니다.</h3>				
				<input type="button" value="확인" class="btn" style="top:220px;" id="ordercommit" />
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
				<input type="hidden" value="" id="cancelNoticeVal"/>
				<input type="button" value="확인" class="btn" style="top:220px" id="cancelNoticeBtn"/>
			</div>
		</div>
		
		<div class="buyListDiv" id="buyCancelRollBack">
			<div class="buyListBar" style="font-size:21px;">취소 실패</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="text-align: center;padding-top:100px; height:340px;">
				<h2>배송중 / 배송완료 상품은 취소할 수 없습니다.</h2>
				<h2>판매자에게 문의해주세요</h2>
				<input type="button" value="확인" class="btn" style="top:240px" id="divcloseBtn"/>
			</div>
		</div>
		
		<div class="buyListDiv" id="buyReviewView">
			<div class="buyListBar" style="font-size:21px;">상품리뷰 보기</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="padding-top:60px; height:700px;background-color: #ddd; text-align: center;">
				<ul id="infoInput" style="text-align:left;">
					<li>번호</li> 	<li>100</li>
					<li>작성자</li> 	<li>rabbit123</li>
					<li>작성일</li>	<li>2021-04-02</li>
					<li>추천</li>	<li>4<div class="thumbsupYes"></div></li>
				</ul>
				<div id="buyReviewtxt"></div>
				<input type="button" value="확인" class="btn" style="top:630px;" />
			</div>
		</div>
		
		
		<div class="buyListDiv" id="buyReviewWrite">
			<div class="buyListBar" style="font-size:21px;">상품리뷰 작성하기</div><div class="buyListBarClose">&times;</div>
			<div class="buyListContent" style="padding-top:60px; height:1200px;">
			<div id="buyProduct">
				<span class="buyListleftMenu">구매상품</span>
				<img src="/sshj/" id="reviewImg"/>
				<div id="reviewTitle" style="font-size: 17px;padding-left:5px;">불러오는 중입니다...</div>
				<div></div>
			</div>
			<form method="post" name="reviewFrm" enctype="multipart/form-data" >
					<input type="hidden" name="ordernum" value="" id="reviewordernum"/>
					<input type="hidden" name="productnum" value="" id="reviewproductnum"/>
				<div id="buyProductStar">
					<span class="buyListleftMenu">상품평가</span>
					<div id="reviewStars">
						<span class="redstar">
							<select name="reviewscore">
								<option value="5">★★★★★</option>
								<option value="4">★★★★</option>
								<option value="3">★★★</option>
								<option value="2">★★</option>
								<option value="1">★</option>
							</select>
						</span>
					</div><span>별을 클릭하여 상품 만족도를 알려주세요</span>
				</div>
				<div id="buyProductImg">
					<span class="buyListleftMenu" style="float:left">첨부이미지</span><input type="file" name="file"/>&nbsp;
				</div>
				<textarea name="reviewcontent" id="summernote">
					
				</textarea>
				<input type="button" value="리뷰작성완료하기" class="btnSubmit" id="reviewSubmitBtn"/>
			</form>
			</div>
		</div>
		
		
	</div>
</div>