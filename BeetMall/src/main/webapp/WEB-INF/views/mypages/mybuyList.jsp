<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	#cMyPageLeft{
		display: block;
	}
	#mypointList{
		height:1500px;
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
		font-size:17px;
		/* line-height:40px; */
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
		font-size:14px;
	}
	.addInput{
		width:675px;
	}
	.thumbsupYes{
		background-image: url("/sshj/img/dthumbsupYes.png");
		background-repeat:no-repeat;
		background-size:contain;
		height:28px;
		width:28px;
		float:left;
		transition-duration:0.5s;
		margin-right: 7px;
	}
	.thumbsupNo{
		background-image: url("/sshj/img/dthumbsupNo.png");
		background-repeat:no-repeat;
		background-size:contain;
		height:28px;
		width:28px;
		float:left;
		transition-duration:0.5s;
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
	.reviewContentDiv{
		height:880px;
		overflow:scroll;
		width:1080px;
	}
	#infoInput>li:nth-child(2n+1){
		width:200px;
		float:left;
	}
	#infoInput>li:nth-child(2n){
		width:839px;
		float:left;
	}
	.normalFont{
		font-size:14px;
		line-height: 15px;
	}
	.normalFont>input{
		margin-top:3px;
	}
	#tradeDiv, #refundDiv{
		padding-left:10px;
	}
	#returnUl>li:nth-child(2n+1){
		width:200px;
		text-align:left;
		padding-left:10px;
		border-bottom:1px solid rgb(250, 250, 250);
	}
	#returnUl>li:nth-child(2n){
		width:348px;
		border-bottom:1px solid rgb(250, 250, 250);
	}
	#returnUl>li:last-child{
		width:548px;
		height:410px;
		background-color: rgb(250, 250, 250);
		overflow:auto;
		padding-top:5px;
		padding-left:10px;
		padding-right:10px;
	}
	#returnDiv{
		display:none;
	}
	#questionUl>li:nth-child(2n+1){
		width:200px;
		text-align:left;
		padding-left:10px;
		border-bottom:1px solid rgb(250, 250, 250);
		font-size:17px;
	}
	#questionUl>li:nth-child(2n){
		width:348px;
		border-bottom:1px solid rgb(250, 250, 250);
		font-size:17px;
	}
	#questionUl>li:last-child{
		width:548px;
		height:530px;		
		background-color: rgb(250, 250, 250);
		padding-top:5px;
		padding-left:10px;
		padding-right:10px;
		margin-bottom:15px;
	}
	#questionDiv{
		display:none;
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
		var ordernum = $(this).parent().prev().prev().prev().prev().html();
		$("#buyReviewView").css("display","block");
		$("#buyReviewWrite").css("display","none");
		var reviewnum = -1;
		$.ajax({
			url : "reviewSelect",
			data : "ordernum="+ordernum,
			success:function(result){
				var tag = "<li>번호</li> <li>"+result.reviewnum+"</li>";
				tag	+= "<li>작성자</li> <li>"+result.userid+"</li>";
				tag	+= "<li>작성일</li> <li>"+result.reviewwritedate+"</li>";
				tag	+= "<li>리뷰 좋아요</li> <li><div class='thumbsupNo'></div><span id='reviewCountNum'>"+result.reviewcount+"</span></li>";
				$("#buyReviewtxt").html(result.reviewcontent);
				$("#infoInput").empty().append(tag);
				reviewnum = result.reviewnum;
				
				// 2중 ajax
				$.ajax({
					url : "goodCheck",
					data : "reviewnum="+reviewnum,
					success: function(result){
						if(result == 0){
							
						}else if(result > 0){
							$(".thumbsupNo").toggleClass("thumbsupNo").toggleClass("thumbsupYes");
						}else if(result == -1){
							alert('서버에 문제가 있어 불러오기에 실패했습니다\n잠시후 다시 시도하세요\n error_code:03');
						}
					}, error : function(){
						alert('서버에 문제가 있어 불러오기에 실패했습니다\n잠시후 다시 시도하세요\n error_code:03');
					}
				});
				//
			}, error : function(){
				alert('서버에 문제가 있어 불러오기에 실패했습니다\n잠시후 다시 시도하세요\n error_code:03');
			}
		});
	})
	
	$(document).on('click','input[value="반품/환불신청"]', function(){
		var num = $(this).parent().prev().children().val();
		var ordernum = $(this).prev().prev().prev().val();
		$("#buyReturnInput").css("display","block");
		$("#returnProductnum").val(num);
		$("#returnOrdernum").val(ordernum); 
		console.log("제품번호=="+num+"주문번호"+ordernum);
	});
	$(document).on('click','input[value=재구매]', function(){
		var num = $(this).prev().prev().val();
		console.log(num);
		location.href="productInfo?num="+num;
	});
	$(document).on('click','input[value=문의작성]', function(){
		var ordernum = $(this).parent().prev().prev().prev().prev().html();
		var productnum = $(this).parent().prev().children().val();
		$("#qboardnum").val(productnum);
		$("#qsetNum").html(productnum);
		$("#questionDiv").css("display","block");
	});
	$(document).on('click','#questionBtn', function(){
		$("#questionForm").submit();
	});
	$(document).on('click','#questionCloseBtn', function(){
		$("#questionDiv").css("display","none");
	});
	$(document).on('click','input[value="환불내역 보기"]', function(){
		var num = $(this).parent().prev().children().val();
		$("#returnDiv").css("display","block");
		var ordernum = $(this).prev().val();
		console.log(ordernum);
		$.ajax({
			url:"returnView",
			data : "ordernum="+ordernum,
			success: function(result){
				console.log(result);
				var type = "";
				if(result.claimkind==1){
					type="환불"
				}else if(result.claimkind == 2){
					type="반품"
				}
				var tag = "<li>주문번호</li><li>"+result.ordernum+"</li>";
				tag += "<li>상태</li><li>"+type+"</li>";
				tag += "<li>"+type+"사유</li><li>"+result.claimstatus+"</li>";
				tag += "<li>택배사</li><li>"+result.delivery+"</li>";
				tag += "<li>송장번호</li><li>"+result.invoice+"</li>";
				tag += "<li>접수일</li><li>"+result.claimdate+"</li>";
				tag += "<li>"+result.claimcontent+"</li>"
				
				$("#returnUl").empty();
				$("#returnUl").append(tag);
			}, error:function(){
				
			}
		})
	});
	
	
	$(document).on('click','.thumbsupYes', function(){
		var reviewnum = $(this).parent().prev().prev().prev().prev().prev().prev().text();
		$(this).toggleClass('thumbsupNo');
		$(this).toggleClass('thumbsupYes');
		$.ajax({
			url : 'reviewgoodcancel',
			data : 'reviewnum='+reviewnum,
			success : function(result){
				$("#reviewCountNum").text($("#reviewCountNum").text()-1);
			}, error : function(){
				alert('서버에 문제가 있어 좋아요에 실패했습니다\n잠시후 다시 시도하세요')
			}
		})
	});
	$(document).on('click','.thumbsupNo', function(){
		var reviewnum = $(this).parent().prev().prev().prev().prev().prev().prev().text();
		$(this).toggleClass('thumbsupNo');
		$(this).toggleClass('thumbsupYes');
		$.ajax({
			url : 'reviewgoodOk',
			data : 'reviewnum='+reviewnum,
			success : function(result){
				$("#reviewCountNum").text(Number($("#reviewCountNum").text())+1);
			}, error : function(){
				alert("좋아요에 실패했습니다.. \n서버에 문제가 있으니 잠시후 다시 시도하세요");
			}
		})
	});
 	$(document).on('click', "#refund", function(){
 		$(".change").text('환불');
	});
 	
	$(document).on('click', "#trade", function(){
 		$(".change").text('반품');
	}); 
	$(document).on('click', ".anotherCompany", function(){
		
		$(".anotherSelect").css("display","block").attr("disabled", false);
	});
	$(document).on('click', "#returnBtn", function(){
		$("#returnDiv").css("display","none");
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
					<li><input type="hidden" value="${vo.ordernum}"/><input type="button" class="btn" value="구매확정"/><input type="button" class="btn" value="문의작성"/><input type="button" class="btn" value="반품/환불신청"/></li>
					</c:if>
					<c:if test="${vo.orderstatus == '환불'}">
					<li><input type="button" class="btn" value="환불확정"/><input type="button" class="btn" value="문의작성"/></li>
					</c:if>
					<c:if test="${vo.orderstatus == '취소'}">
					<li></li>
					</c:if>
					<c:if test="${vo.orderstatus == '환불 진행중'}">
					<li><input type="hidden" value="${vo.ordernum}"/><input type="button" class="btn" value="환불내역 보기"/></li>
					</c:if>
					<c:if test="${vo.orderstatus == '반품 진행중'}">
					<li><input type="hidden" value="${vo.ordernum}"/><input type="button" class="btn" value="환불내역 보기"/></li>
					</c:if>
					
					<c:if test="${vo.orderstatus == '구매확정'}">
						<c:if test="${vo.ordercnt == null || vo.ordercnt <=0}">
						<li><input type="hidden" value="${vo.productnum}"/><input type="button" class="btn" value="리뷰작성"/><input type="button" class="btn" value="재구매"/><input type="button" class="btn" value="문의작성"/></li>
						</c:if>
						<c:if test="${vo.ordercnt != null && vo.ordercnt>=1 }">
						<li><input type="hidden" value="${vo.productnum}"/><input type="button" class="btn" value="리뷰작성완료"/><input type="button" class="btn" value="재구매"/><input type="button" class="btn" value="문의작성"/></li>						
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
			<div class="buyListBar" style="margin-left:0px;font-size:21px;"><span class="change">반품/환불</span> 신청</div><div class="buyListBarClose">&times;</div>
			<!-- 반품신청 -->
			<div class="buyListContent" style="height:750px;" id="tradeDiv">
			
			<form method="post" action='tradeCommit'>
				<input type="hidden" name="ordernum" id="returnOrdernum"/>
				<input type="hidden" name="productnum" id="returnProductnum"/>
				
				<div style="background-color: rgb(250, 250, 250); text-align:center;height: 100px;margin-left:-10px;padding-top: 7px;">
					<input type="radio" name="claimkind" value="1" id="trade" style="margin-top:60px;" checked/><span style=" margin-right:5px;">반품 신청</span>
					<input type="radio" name="claimkind" value="2" id="refund"/><span style="margin-left:5px;">환불 신청</span>
				</div>
				<h3 style="text-align: center">해당 제품을 <span class="change">반품</span>하시겠습니까?</h3>
				<h5><span class="change">반품</span>사유를 선택해주세요</h5>
				<select name="whyReturn">
					<option value="구매의사취소">구매의사취소</option>
					<option value="종류 및 크기 변경">종류 및 크기 변경</option>
					<option value="다른 상품 잘못 주문">다른 상품 잘못 주문</option>
					<option value="서비스 불만족">서비스 불만족</option>
					<option value="배송지연">배송지연</option>
					<option value="배송누락">배송누락</option>
					<option value="상품파손">상품파손</option>
					<option value="상품정보 상이">상품정보 상이</option>
					<option value="오배송">오배송</option>
					<option value="색상 등 다른상품 잘못 배송">색상 등 다른상품 잘못 배송</option>
				</select>
				<div>
					<span class="warningInfo">제품 <span class="change">반품</span>시 발생하는 배송비는 소비자 부담입니다.<br/></span>
					<span class="warningInfo">단, 상품의 변질, 파손으로 인해 발생된 <span class="change">반품</span> 배송비는 판매자가 부담합니다.</span>
				</div>
				<div class="companyDiv">
				<span class="normalFont" style="margin-right:10px;">택배사를 선택해주세요</span>
					<select class="normalFont" name="delivery">
						<option value="우체국택배">우체국 택배</option>
						<option value="CJ대한통운">CJ대한통운</option>
					</select><br/>
				</div>
				<div class="normalFont" style="padding-bottom:10px;">
				<span style="margin-right:10px;">송장 번호 </span><input type="text" name="invoice" style="margin-left:80px;"/>
				</div>
				<textarea class="summernote" name="claimcontent"></textarea>
				<div style="text-align:center;margin-top:10px;"><input type="submit" value="반품 신청" class="btn" style="top:520px;"/></div>
			</form>
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
			<div class="buyListBar" style="font-size:21px;width:1080px;">상품리뷰 보기</div><div class="buyListBarClose" style="left:1030px;">&times;</div>
			<div class="buyListContent" style="padding-top:60px; height:730px;background-color: #ddd; text-align: center;width:1080px;">
				<ul id="infoInput" style="text-align:left;">
					<li>번호</li> 	<li>100</li>
					<li>작성자</li> 	<li>rabbit123</li>
					<li>작성일</li>	<li>2021-04-02</li>
					<li>추천</li>	<li>4<div class="thumbsupYes"></div></li>
				</ul>
				<div id="buyReviewtxt" style="width:1060px;"></div>
				<input type="button" value="닫기" class="btn" style="top:600px;" />
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
			<form method="post" name="reviewFrm" enctype="multipart/form-data" action="reviewWrite" >
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
				<input type="submit" value="리뷰 제출하기" class="btnSubmit" id="reviewSubmitBtn"/>
			</form>
			</div>
		</div>
		<div class="buyListDiv" id="returnDiv">
			<div class="buyListBar" style="font-size:21px;width:550px;">환불정보</div><div class="buyListBarClose" style="left:500px;">&times;</div>
			<div class="buyListContent" style="padding-top:60px; height:730px;background-color:white; text-align: center;width:550px;">
				<ul id="returnUl" style="text-align:left;">
					<li>주문번호</li>		<li></li>
					<li>상태</li>		<li></li>
					<li>환불사유</li> 	<li></li>
					<li>택배사</li>		<li></li>
					<li>송장번호</li>		<li></li>
					<li>접수일</li>		<li></li>
					<li></li>
				</ul>
				<div id="" style="width:1060px;"></div>
				<input type="button" value="닫기" class="btn" style="top:600px;" id="returnBtn" />
			</div>
		</div>
		<div class="buyListDiv" id="questionDiv">
			<div class="buyListBar" style="font-size:21px;width:550px;">문의하기</div><div class="buyListBarClose" style="left:500px;">&times;</div>
			<div class="buyListContent" style="padding-top:60px; height:730px;background-color:white; text-align: center;width:550px;">
			<form id="questionForm" action="questionWrite" method="post">
				<input type="hidden" name="productnum" value="" id="qboardnum"/>
				<ul id="questionUl" style="text-align:left;">
					<li>상품번호</li>		<li><span id="qsetNum"></span></li>
					<li>공개비공개 설정하기</li> 	<li>
										<select name="open">
											<option value="Y">공개</option>
											<option value="N">비공개</option>
										</select>
										</li>
					<li><textarea id="summernoteQuestion"></textarea></li>
				</ul>
				
				<div id="" style="width:1060px;"></div>
				<input type="button" value="문의하기" class="btn" style="top:660px;" id="questionBtn"/>
				<input type="button" value="닫기" class="btn" style="top:600px;margin-top: 0px;" id="questionCloseBtn"/>
			</form>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
		  height: 660,                 // 에디터 높이
		  maxHeight:660,
		  minHeight:660,
		  focus: true,
		  placeholder:'고객님의 리뷰를 작성해주세요 단, 무분별한 비난, 욕설 등이 포함된 리뷰는 숨김처리 될 수 있습니다.',
		  //콜백 함수
        callbacks : { 
        	onImageUpload : function(files, editor, welEditable) {
        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = files.length - 1; i >= 0; i--) {
        uploadSummernoteImageFile(files[i],
        this);
        		}
        	}
        }
	  });
	});
$(document).ready(function() {
	  $('.summernote').summernote({
		  height: 330,                 // 에디터 높이
		  maxHeight:330,
		  minHeight:330,
		  width:660,
		  focus: true,
		  placeholder:'가로+세로+높이=120cm, 10kg 규격 초과 시 현장수거 불가할 수 있으며, 강제수거요청 시 판매자가 추가비용 별도 청구할 수 있습니다. <br/> 이미지를 끌어서 놓으시면 이미지도 첨부가 가능합니다.',
		  //콜백 함수
      callbacks : { 
      	onImageUpload : function(files, editor, welEditable) {
      // 파일 업로드(다중업로드를 위해 반복문 사용)
      for (var i = files.length - 1; i >= 0; i--) {
      uploadSummernoteImageFile(files[i],
      this);
      		}
      	}
      }
	  });
	});
$(document).ready(function() {
	  $('#summernoteQuestion').summernote({
		  height: 430,                 // 에디터 높이
		  maxHeight:430,
		  minHeight:430,
		  width:530,
		  focus: true,
		  placeholder:'고객님의 문의를 작성해주세요 단, 무분별한 비난, 욕설 등이 포함된 문의는 숨김처리 또는 삭제 될 수 있습니다.',
		  //콜백 함수
      callbacks : { 
      	onImageUpload : function(files, editor, welEditable) {
      // 파일 업로드(다중업로드를 위해 반복문 사용)
      for (var i = files.length - 1; i >= 0; i--) {
      uploadSummernoteImageFile(files[i],
      this);
      		}
      	}
      }
	  });
	});

</script>

<script>
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
			console.log("성공");
			console.log(data);
		}, error: function(){
			console.log("실패");
		}
	});
}
</script>
