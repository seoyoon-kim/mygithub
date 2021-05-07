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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin.css" type="text/css"> 
 <style> 
	 #container li{ 
		 list-style-type:none; 
		 float:left; 
		 width:9%; 
	 }  
	 #container li:nth-of-type(6){ 
	 	padding:0 40px 0 20px;
	 }
	#contentBox{ 
		top:20px; 
		margin-left:10px;
	} 
	#contentBox li:nth-of-type(9n-8){ 
		width:0%; 
	}
	#contentBox li:nth-of-type(2){ 
		width:11%; 
		padding-left:30px;
	}  
	#contentBox li:nth-of-type(4){ 
		width:15%; 
	}  
	#contentBox li:nth-of-type(5){ 
		width:9%; 
	} 
	#contentBox li:nth-of-type(6){ 
		width:21%; 
	}   
	#contentBox li:nth-of-type(7){ 
		margin-left:10px; 
	}   
	#topBar li:nth-of-type(3){
		width:12%;
	} 
	#topBar li:nth-of-type(4){
		width:6%;
	}   
	/*데이터 내용*/
	.subjectLine{
		white-space:nowrap; 
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.cartImg{
		margin-left:10px;
		height:20%;
		width:25%;
	}
	#content input, textarea, select, #noticeSearchFrm input{
		border:1px solid lightgray; 
		border-radius: 3px;
	}#content li, label{
		list-style-type:none; 
		padding-bottom:10px;
	}
	#content select{
		height:28px;
	} 
	/*버튼*/
	#btns{ 
		top:-115px; 
		left:460px; 
	} 
	#btns a>button, button:nth-of-type(4){ 
		margin-left:900px; 
	} 
	#topBar Button:nth-of-type(1),
	#topBar Button:nth-of-type(2),
	#topBar Button:nth-of-type(3),
	#topBar Button:nth-of-type(4){
		padding:2px 7px;
	}  
	/*신고, 처리완료 표시*/
	#reported, #processed{
		position:absolute; 
		left: 888px;
		border-radius:10px;
		width:68px;
		padding-left:1px;
	}
	#reported{ 
		top: 545px;
		background-color:red;
		text-align:center;
		width:50px;
		margin-left:5px;
	}
	#processed{
		top:483px;
		background-color:#F5D726;  
		padding-left:5px;
	}
	/* 페이징처리부분 */ 
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
	/*모달*/
	#reviewModal{
		width:857px;
	}
	#modalHeader{
		background-color:#182337;
		color:white; 
		padding:5px 0 0 355px;
		font-size:16px;
		font-weight:bold;
		letter-spacing:2px;
		height:35px;
		
	}
	/*모달 내 상품, 구매자 정보 표*/
	.tg  {
		border-collapse:collapse;
		border-spacing:0;
	}
	.tg td{
		border:gray solid 1px; 
		overflow:hidden;
		padding:10px 5px;
		word-break:normal;
	}
	.tg th{ 
		border:gray solid 1px; 
	  	font-weight:normal;
	  	overflow:hidden;
	  	padding:10px 5px;
	  	word-break:normal;
	 }
	.tg .tg-2vng{
		text-align:center;
		vertical-align:middle;
	}
	.tg .tg-9wgu{
		text-align:left;
		vertical-align:middle;
	}
	.tg-2vng:not(#imgBox){
		background-color:lightgray;
	}
	#imgBox{
		border-right: 1px solid white;
	}
	#imgBox>img{
		width:100px;
		height:100px;
	}	 
	#stars{
		position:relative;
		top:10px;
	}
	#stars>img{
		width:20px;
		height:20px;
	} 
	#starBox{ 
		padding-left:20px;
	}
	#score{
		padding-left:120px;
		position:relative;
		top:-10px;
	} 
	#likeBox{
		position:relative;
		top:10px;
	}
	#likeBox>img{
		width:25px;
		height:25px;
	}
	#likeNumBox{
		position:relative;
		top:-13px;
		left:35px;
		display:flex;
	} 
	#likeNum{
		padding-left:15px;
	}
	.last{
		padding:0 0 0 10px !important; 
	}
	/*모달*/
	#reviewModal{
		position:relative;
		top:-2300px;
		left:400px;
	}
	/*모달 내 리뷰 파트*/
	#reviewPart{
		border-right:1px solid gray;
		border-left:1px solid gray;
		padding:10px;
		height:315px;
	}
	#reviewBox{
		height:300px;
	}
	#reviewContentBox, #answerContent{
		background-color:white;
		margin:5px 5px 5px 0;
		height:250px;	 
		padding:20px;
	} 
	#reviewContent{
		width:650px;
	}
	#reviewImg{
		position:relative;
		top:-235px;
		left:700px; 
	}
	#reviewImg>img{
		height:100px;
		width:100px;
	}
	#reasonBuyer, #reasonSeller{ 
		position:relative;
		height:30px;
		background-color:yellow;
		padding:5px;
		width:830px;
	}
	#reasonBuyer{
		top:-95px;	
	}
	#reviewPart, #replyPart{
		background-color:lightgray;
	}
	/*모달 내 답변 파트*/
	#replyPart{
		border:1px solid gray;
		padding:10px;
	}
	#replyContent{
		background-color:lightgray;
	}
	#sellerLine{
		display:flex;
		font-weight:bold;
	}
	#seller{
		margin-right:10px;
	}
	#farmGo, #closeBtn{
		border:1px solid gray;
		height:30px;
		background-color:gray;
		color:black;
	}
	#farmGo{	
		margin: 10px 10px 0 625px;
	}
	#farmGo:hover, #closeBtn:hover{
		background-color:white;
	}
</style> 
<%@ include file="/inc/top.jspf" %>
<%@ include file="/inc/leftBar.jspf" %>
<div id="body1">
	<div id="container">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="customerListA">리뷰 목록</a></strong></h5></li> 
				<li><select name="sort" > 
		   				<option value="상품번호" selected>상품번호</option>
		   				<option value="상품명">상품명</option>
		   				<option value="법인명">법인명</option>
		   				<option value="리뷰내용">리뷰내용</option>
		   				<option value="답변상태">답변상태</option>
		   				<option value="작성자">작성자</option>
		   				<option value="등록일">등록일</option> 
			  		</select> 
	   			</li> 
	   			<li><select name="sort" > 
		   				<option value="카테고리" selected>카테고리</option>
		   				<option value="과일">과일</option>  
		   				<option value="건과류">건과류</option>   
		   				<option value="채소">채소</option>  
		   				<option value="쌀">쌀</option> 
		   				<option value="잡곡">잡곡</option>   
		   				<option value="견과류">견과류</option>     
			  		</select> 
	   			</li> 
				<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>
				<li><button class="success" value="add" name="add" id="addBtn">추가</button></li>
				<li><button class="success" value="del" name="del" id="delBtn">삭제</button></li>
			</ul> 
		</div>  
   		<div id="contentBox"> 	
		<div id="title">
			<ul>
				<li><input type="checkbox" name="check"></li>
				<li>상품번호</li>
				<li>카테고리</li>
				<li>상품명</li>
				<li>법인명</li>
				<li>리뷰내용</li>
				<li>답변상태</li>
				<li>작성자</li>
				<li>등록일</li> 
			</ul>
		</div>  
		
		 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>채소</li>
				<li class="subjectLine"><a href="회원정보?">싱싱농산의 유기농 토마토</a></li>
				<li>제주천혜향</li>
				<li class="subjectLine">천혜향 향이 진짜 좋아요 너무 맛있어서 또 주문할거예요<div id="reportDiv"></div></li>
				<li>답변완료</li>
				<li>ilovetomato</li>
				<li>2021/04/26</li> 
			</ul> 
		 
		 


 
		<!--  
		<c:forEach var="data" items="${list}">
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>1569723</li>
				<li>판매자</li>
				<li><a href="회원정보?">[판매자 공지] 판매자 사업증 등록시 유의사항</a></li>
				<li>2021/05/23</li> 
			</ul>
		</c:forEach>-->
		</div>	 
		<div class="page_wrap">
			<div class="page_nation">
			   <a class="arrow pprev" href="<%=request.getContextPath()%>/img/kpage_pprev.png"></a>
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
		 <div>
			<form method="get" id="noticeSearchFrm" action="<%=request.getContextPath() %>/board/noticeBoardList.jsp">
				<select name="searchKey">
					<option value="subject" selected>제목</option>
	   				<option value="no">공지번호</option> 
	   				<option value="who">대상</option> 
	   				<option value="writedate">공지일</option> 
				</select>			
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" value="검색"/> 
			</form> 
		</div>  
	</div>
	<div id="reported">
		신고	
	</div>
	<div id="processed">
		처리완료	
	</div>
	<!-- 모달 -->
	<div>
		<div id="reviewModal">
			<div id="modalHeader">
				리뷰 관리
			</div>
			<!-- 상품 및 구매자 정보 표-->
			<table class="tg" style="undefined;table-layout: fixed; width: 857px">
			<colgroup>
				<col style="width: 163px">
				<col style="width: 182px">
				<col style="width: 511px">
			</colgroup>
			<thead>
			  <tr>
			    <th class="tg-2vng">구매 상품</th>
			    <th class="tg-2vng" id="imgBox"><img src="<%=request.getContextPath()%>/img/y_tomato.jpg"></th>
			    <th class="tg-9wgu">[자정 특가]  대저짭짤이 왕토마토 10kg<br>    [옵션] 1개</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			    <td class="tg-2vng">작성자</td>
			    <td class="tg-9wgu" colspan="2">kingtomato</td>
			  </tr>
			  <tr>
			    <td class="tg-2vng">작성일</td>
			    <td class="tg-9wgu" colspan="2">2021/05/23</td>
			  </tr>
			  <tr>
			    <td class="tg-2vng last">평점</td>
			    <td class="tg-9wgu last" id="starBox">
			    	<div id="stars">
			    		<img src="<%=request.getContextPath()%>/img/y_star.png">
			    		<img src="<%=request.getContextPath()%>/img/y_star.png">
			    		<img src="<%=request.getContextPath()%>/img/y_star.png">
			    		<img src="<%=request.getContextPath()%>/img/y_star.png">
			    	</div>
			    	<div id="score">4.3</div>
			    </td>
			    <td class="tg-9wgu last">
			    	<div id="likeBox">
			    			<img src="<%=request.getContextPath()%>/img/y_like.png">
			    	</div>
			     	<div id="likeNumBox">
			     		추천 수 : <div id="likeNum">2</div>
			     	</div>			     
			     </td>
			  </tr>
			</tbody>
			</table>
			<div id="reviewPart">
				<div id="reviewBox">
					<div id="reviewContentBox">
						<div id="reviewContent">
						토마토 처음 시켜봤는데요 된장 젠장
						</div>
					</div>
					<div id="reviewImg">
						<img src="<%=request.getContextPath()%>/img/y_tomato.jpg">
					</div>
					<div id="reasonBuyer">
						신고사유 : 비방
					</div>
				</div>
			</div>
			<div id="replyPart">
				<div id="sellerLine">
					<div id="seller">
						tomatoKing
					</div>
					판매자의 답글
				</div>
				<div id="answerContent">
					고객님 안 좋은 말을 사용하시다니 유감입니다
				</div>
					<div id="reasonSeller">
						신고사유 : 비방
					</div>
				<button class="success" value="" name="" id="farmGo">판매자 농장 방문</button>
				<button class="success" value="" name="" id="closeBtn">닫기</button>
			</div>
		</div>
	</div>
</div> 

</html>