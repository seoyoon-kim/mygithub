<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	/*맨 위 top Bar*/
	#topBar h5{
		margin-left:50px;
	}
	#topBar li:nth-of-type(1){
	 	margin-left:10px;
	}
	#topBar li:nth-of-type(2){
		margin-left:110px;
	}
	#topBar li:nth-of-type(4){
		width:7%;
	}
	#topBar li:nth-of-type(7){
		margin-left:40px;
		width:150px;
	}
	#topBar li:nth-of-type(8){
		position:relative;
		left:-90px;
	}
	#search{
		margin-left:40px;
		height:29px;
		border-radius:3px;
	}
	.searchFrm{
		margin-left:150px ! important;
	}
	#from{ 
		margin-right:20px;
	}
	#todate{ 
		position:relative;
		left:-15px;
	}
	#fromTo{
		color:black;
		position:relative;  
		left:-15px;
		margin:0 10px;
	}
	#sortBox {
		margin-left:900px;
	}
	#sortBox li{
		margin:30px 0 5px 0;
	}
	#sortBox li:nth-of-type(1){
		width:108px;
	}
	#sortBox li:nth-of-type(2), #sortBox li:nth-of-type(3){
		width:38px;
	}
	
	/*내용 전체 정렬*/
	#title{
		margin-top:20px;
	}
	#topBar li:nth-of-type(7){
		position:relative; left:-80px;
	}   
	#contentBox li:nth-of-type(9n-2) {
    	width: 8%;
	}
	#contentBox li:nth-of-type(9n-1) {
    	width: 23%;
    	padding:10px 25px; 
	}
	#contentBox li:nth-of-type(9n+1) {
    	width: 0%;
	} 
	#contentBox li:nth-of-type(3) {
    	width: 8%;
	}  
	#title>ul,.contentList{
		position:relative; left:-20px;
	}
	#title li:nth-of-type(8){
		position:relative;
		top:-10px;
	}
	#title li:nth-of-type(8){
		padding-bottom:10px;
	}
	#container li:nth-of-type(2):not(#topBar li:nth-of-type(2)){
		margin-left:20px;
	} 
	#container li:nth-of-type(5):not(#topBar li:nth-of-type(5)){
		width:11%;
	} 
	 
	/* 본문 정렬*/
	#container li{ 
		width:11%; 
		list-style-type:none;
		float:left;
	} 
	.contentList{
		height:30px; 
	} 
	.contentList li{
		margin:0;
	}
	.contentList:nth-of-type(1){
		margin-top:0;
	} 
	#contentList>ul{
		float:left; 
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
	/*모달*/
	#modal{
		border:1px solid gray;
		width:500px;
		margin:500px 0 0 450px;
	}
	#modalHeader{
		background-color:lightgray;
		text-align:center;
		font-weight:bold;
		letter-spacing:2px;
		padding:5px 0;
	}
	#modal ul{
		width:500px;
		display:flex;
	}
	#modalList>ul:nth-of-type(1){
		padding:5px 0; 
		border-bottom:1px solid lightgray;
		background-color:#eee;
		width:498px;
	}
	#modalList>ul:nth-of-type(2n+1){
		background-color:#eee;
		width:498px;
	}
	#modal li{
		text-align:center;
	}
	#modal li:nth-of-type(1){
		width:30%;
	}
	#modal li:nth-of-type(2){
		width:70%;
	} 
	#modal input{
		width:100px;
		margin:20px 0 20px 10px;
	}
	#modal button{
		border:1px solid lightgray;
		border-radius:5px;
	}
	#modal button:not(#modalPast button){
		width:70px;
		margin-right:10px;
	} 
	#modal button:nth-of-type(1):not(#modalPast button){
		margin-left:30px;
	} 
	#modal select{
		margin-left:30px;
	}
</style>
<script>
 
</script> 
<%@ include file="/inc/top.jspf" %>
<%@ include file="/inc/leftBar.jspf" %>
<div id="body1">
	<div id="container">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="/reportListA">신고 채팅 관리</a></strong></h5></li> 
					<li><button class="success" value="add" name="add" id="blind">비공개</button></li>
				<li><button class="success" value="del" name="del" id="edit">정지</button></li> 
			</ul> 
		</div>  
		<div id="sortBox">
			<ul>
				<li><select name="sort"> 
						<option value="채팅번호" selected>채팅번호</option>
		   				<option value="주문번호">주문번호</option>
		   				<option value="구입상품">구입상품</option> 
		   				<option value="구매자">구매자</option>  
		   				 <option value="판매자">판매자</option>
		   				 <option value="날짜">날짜</option>
		   				 <option value="내용">내용</option> 
		   				 <option value="신고처리">신고처리</option>  
	   				 </select>
	   			</li> 
	   			<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>
			</ul>
		</div>
   		<div id="contentBox"> 	
   		<div style="float:right; margin-right:25px;">* 신고 채팅은 노란색으로 표시됩니다</div>
		<div id="title">
			<ul>
				<li><input type="checkbox" name="check"></li>
				<li>채팅번호</li>
				<li>주문번호</li>
				<li>구입상품</li>
				<li>구매자</li>
				<li>판매자</li>
				<li>날짜</li>
				<li>내용</li> 
				<li>신고처리</li>
			</ul>
		</div>  
		<div id="contentList">
			<c:forEach var="data" items="${list}"> 
				<ul class="contentList">
					<li><input type="checkbox" name="check" id="check"> </li>
					<li>1286</li>
					<li>865435465</li>
					<li>토마토</li> 
					<li>asdghle113</li>
					<li>yuthgvf</li>
					<li>2021/03/21</li>
					<li class="wordCut"><a href="제목?">상품 추가 주문 가능한지 문의드려요 포도 세 박스 더 주문하고싶어요</a></li>
					<li>-</li> 
				</ul>
				<ul class="contentList">
					<li><input type="checkbox" name="check" id="check"> </li>
					<li>1286</li>
					<li>865435465</li>
					<li>토마토</li> 
					<li>asdghle113</li>
					<li>yuthgvf</li>
					<li>2021/03/21</li>
					<li class="wordCut"><a href="제목?">상품 추가 주문 가능한지 문의드려요 포도 세 박스 더 주문하고싶어요</a></li>
					<li>-</li> 
				</ul>
			</c:forEach>
			 
			</div>
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
			<form method="get" class="searchFrm" action="<%=request.getContextPath() %>/board/noticeBoardList.jsp">
				<input type="date" id="from"><div id="fromTo">~</div>
				<input type="date" id="todate"> 
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
		<!-- 신고된 채팅 보기 모달창 -->
		<div id="modal">
			<div id="modalHeader">
				신고된 채팅 보기
			</div>
			<div id="modalList">
				<ul>
					<li>아이디</li>
					<li>대화</li>
				</ul>
				<ul>
					<li style="display:flex; margin-left:20px;"><div>판매자 :&nbsp; </div><div>dlkfjhbu</div></li>
					<li><div>맛이 없어요 포장은 또 왜이래요</div></li>
				</ul>
				<ul>
					<li style="display:flex; margin-left:20px;"><div>구매자 :&nbsp; </div><div>aosihnf</div></li>
					<li>신고합니다</li>
				</ul>
				<ul>
					<li style="display:flex; margin-left:20px;"><div>판매자 :&nbsp; </div><div>dlkfjhbu</div></li>
					<li><div>고객님 안됩니다ㅠㅠ</div></li>
				</ul> 
			</div> 
			<hr>
			<select name="reportChoice"> 
				<option value="선택" selected>선택</option>
		   		<option value="dlkfjhbu">dlkfjhbu</option>
		   		<option value="aosihnf">aosihnf</option>
		   	</select>
			<input type="text">&nbsp; 일 &nbsp;
			<button class="success" value="" name="" id="">정지</button>
			<button class="success" value="" name="" id="">닫기</button>
		</div> 
</html>