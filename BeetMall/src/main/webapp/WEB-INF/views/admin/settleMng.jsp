<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin.css" type="text/css"> 
<style>
	/*맨 위 top Bar*/
	#topBar li{
		width:12%;
	}	
	#topBar li:not(#topBar li:nth-of-type(1)), 
	#topBar li>input, 
	#topBar li>button{
		margin-right:10px;
	}
	#topBar li:nth-of-type(2){
		margin-left:108px;
	} 
	#topBar li:nth-of-type(2)>span{
		color:white;
		position:relative;
		top:-23px;
		left:120px;
	}
	#topBar li:nth-of-type(2)>input, #topBar li:nth-of-type(3)>input{
		width:110px;
	}
	#topBar li:nth-of-type(3){
		width:11%;
	}
	#topBar li:nth-of-type(4){
		width:20%;
	} 
	#topBar li:nth-of-type(4)>button{
		width:110px;
		color:black;
	}
	#topBar li:nth-of-type(5){
		width:10%;
	}
	#topBar input::placeholder {
	  color: lightgray; 
	}
	
	#topBar input[type=text]{
		width:200px;
	} 
	#topBar li:nth-of-type(7){
		position:relative; left:215px; top:-28px;
	}  
	#topBar li:nth-of-type(8){
		position:relative; left:1135px; top:-56px;
	}    
	#title>ul,.productList{
		position:relative; left:-40px;
	} 
	#title li:nth-of-type(5), #contentBox li:nth-of-type(5){ 
		width:19%; 
	} 
	
	#ascBtn, #descBtn{
		width:40px;
	} 
	/* 본문 정렬*/
	#container li{ 
		list-style-type:none;
		float:left;
	}  
	#contentBox li:nth-of-type(8){
		width:14%;
	}  
	.productList{
		height:28px;
	}
	.productList:nth-of-type(1){ 
		margin-top:10px;
	} 
	#contentList>ul{
		float:left;
		margin-bottom:0px;
	}
	#contentBox li{
		width:11%;
	}
	/*하단 검색 파트*/
	#searchBox{
		position:relative;
		top:30px;
		left:100px;
	}
	#searchBox li:nth-of-type(2){
		margin-left:10px;
	}
	#noticeSearchFrm{
		left:130px;
	}
	/*페이징 이미지 링크*/
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
	/*정산 표*/ 
	#hr{
		margin-top:30px;
		margin-bottom:30px;
		border: 1px solid lightgray;
	}
	.flex{
		display:flex;
		padding-left:90px;
	}
	.tg  {
		border-collapse:collapse;
		border-spacing:0;
	}
	.tg td{
		border-color:dimgray;
		border-style:solid;
		border-width:1px;
		font-size:14px;
		overflow:hidden;
		padding:10px 5px;
		word-break:normal;
	}
	.tg th{
		border-color:dimgray;
		border-style:solid;
		border-width:1px;
		font-size:14px;
		font-weight:normal;
		overflow:hidden;
		padding:10px 5px;
		word-break:normal;
	}
	.tg .tg-j8xs{
		background-color:#c0c0c0;
		font-size:16px;
		font-weight:bold;
		text-align:center;
		vertical-align:top
	}
	.tg .tg-13pz{
		font-size:18px;
		text-align:center;
		vertical-align:top
	}
	 #settleBtn{
	 	position:relative;
	 	top:-90px;
	 	left:920px;
	 	border:1px solid #182337;
	 	width:150px;
	 	height:90px;
	 	background-color:#182337;
	 	color:white;
	 	font-weight:bold;
	 	font-size:18px;
	 	letter-spacing:2px;
	 }
	 #settleBtn:hover{
	 	background-color: midnightblue;
	 }
</style>
<script>
 
</script>
<div id="body1">
<%@ include file="/inc/top.jspf" %>
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="/settleMng">정산 관리</a></strong></h5></li> 
				<li><input type="date"/>   <span>~&nbsp;</span></li>
				<li><input type="date"/></li>
				<li><button class="success" value="" name="" id="confirmBtn">구매확정 목록</button></li>
				<li><select name="sort" > 
				<option value="구매번호" selected>구매번호</option>  
		   				<option value="상품명">상품명</option>
		   				<option value="구매자 아이디">구매자 아이디</option>   
		   				<option value="판매자 아이디">판매자 아이디</option>   
		   				<option value="금융사명">금융사명</option>         
		   			 </select>
	   			</li> 
	   			<li><input type="text" placeholder="검색어를 입력해주세요"/></li>
	   			<li><button class="success" value="" name="" id="searchBtn">검색</button></li>
				<li><button class="success" value="" name="" id="excelBtn">엑셀로 다운</button></li>  
			</ul> 
		</div>  
   		<div id="contentBox"> 	
		<div id="title">
			<ul> 
				<li>구매번호</li>
				<li>카테고리</li>
				<li>주문현황</li>
				<li>배송현황</li>
				<li>상품명</li>
				<li>아이디</li>
				<li>법인명</li> 
				<li>구매일</li> 
			</ul>
		</div>  
		  <div id="contentList">
			<!--<c:forEach var="data" items="${list}">
				<ul class="productList">
					<li></li>
					<li>buyNo?</li>
					<li>cate?</li>
					<li>ordernow?</li>  
					<li>delivnow?</li>  
					<li><a href="제목?">subject?</a></li>
					<li>userid?</li>
					<li>farmName?</li> 
					<li>buydate?</li>
				</ul>
			</c:forEach>-->
			
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>입금대기중</li>
					<li>배송준비</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>결제완료</li>
					<li>배송준비</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>반품요청</li>
					<li>배송중</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>입금완료</li>
					<li>픽업대기중</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>입금완료</li>
					<li>픽업완료</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
				</ul>
			<ul class="productList">
					<li>12345</li>
					<li>견과류</li>
					<li>취소요청</li>
					<li>배송중</li>  
					<li class="wordCut"><a href="#">오독오독 맛있는 아몬드 맥주 안주로 제격!</a></li>  
					<li>beermore</li>
					<li>almondfarm</li>
					<li>2021/01/12</li>
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
		 <hr id="hr"/>
		<div id="settleBox"> 
			<table class="tg" style="undefined;table-layout: fixed; width: 900px">
			<colgroup>
			<col style="width: 200px">
			<col style="width: 200px">
			<col style="width: 200px">
			</colgroup>
			<thead>
			  <tr>
			    <th class="tg-j8xs">정산일</th>
			    <th class="tg-j8xs">수익</th>
			    <th class="tg-j8xs">총 정산 금액</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			    <td class="tg-13pz"><div id="settleDate">2021/03/26</div></td>
			    <td class="tg-13pz"><div class="flex"><div id="profit">3,269,840</div>원</div></td>
			    <td class="tg-13pz"><div class="flex"><div id="settleMoney">9,561,028</div>원</div></td>
			  </tr>
			</tbody>
			</table>
		</div>	
		<button class="success" value="" name="" id="settleBtn">정산하기</button>
	 </div>
</div>