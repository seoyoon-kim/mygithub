<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	#topBar h5{  
		padding-left:145px;
	}
	 #container li{ 
		 list-style-type:none; 
		 float:left; 
		 width:9%; 
	 }  
	 #container li:nth-of-type(6):not(#sortBox li:nth-of-type(6)){ 
	 	padding:10px 0;
	 	text-align:left;
	 } 
	#contentBox{
		top:-40px;
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
	#topBar li:nth-of-type(3){
		width:12%;
	} 
	#topBar li:nth-of-type(4){
		width:6%;
	}   
	#title li:nth-of-type(6){
		padding-top: 0 !important;
	}
	/*데이터 내용*/  
	#content input, textarea, select, #noticeSearchFrm input{
		border:1px solid lightgray; 
		border-radius: 3px;
	}
	#content li, label{
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
	#sortBox {
		margin: 80px 0 0 20px;
	} 
	#sortBox>ul{
		width:1110px !important;
	}
	#sortBox li:nth-of-type(1), #sortBox li:nth-of-type(5) {
		width: 10%;
	}
	#sortBox li:nth-of-type(2) {
		display:flex;
		width: 16%;
	}
	#sortBox li:nth-of-type(3) {
		margin-right:12px;
		width: 13%;
	}
	#sortBox li:nth-of-type(4) {
		margin-right:243px;
	} 
	#sortBox li:nth-of-type(6) {
		margin-right:12px;
	}
	#sortBox li:nth-of-type(7),#sortBox li:nth-of-type(8){
		width: 3.5%;
	}
	#fromTo{
		margin-left:14px;
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
		position:relative;
		top:700px;
		left:350px;
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
	.tg-2vng:not(#imgBox),{
		background-color:lightgray;
	}
	 .tg-9wgu{
	 	background-color:white;
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
		background-color:#f5f541ad;
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
		margin: 10px 10px 0 560px;
	}
	#farmGo:hover, #closeBtn:hover{
		background-color:white;
	}
	#blindBtn1{ 
	    top: -124px;
	    left: 750px; 
	}
	#blindBtn2{ 
	    top: -40px;
	    left: 750px; 
	}
</style> 
<script>
////////////////////////////////전역변수 선언 /////////////////////////////////

let sortStr = 0;// 정렬 기준을 위한 변수

let startCalendarDataValue = "";//선택된 날짜의 데이터를 저장해 놓는 변수
let endCalendarDataValue = "";//선택된 날짜의 데이터를 저장해 놓는 변수

let startDate =null;// startDate 선택된 값을 가져온다.
let endDate = null;// endDate 선택된 값을 가져온다.

let searchTxt =null;// 검색 데이터


</script>
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="reviewListA">소비자 리뷰</a></strong></h5></li>  
				<li><button class="success" value="del" name="del" id="delBtn">비공개</button></li>
			</ul> 
		</div>  
		</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="sortBox">
			<ul>
				<li>
					<select name="searchDate">  
						<option value="birthdate">등록일</option>  
					</select>  
				</li>
				<li><input type="date" id="from"><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>		
				<li><input type="submit" value="검색" /></li>		
			 	<li><select name="sort" > 
		   				<option value="상품번호" selected>상품번호</option>
		   				<option value="상품명">상품명</option>
		   				<option value="판매자">판매자</option>
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
			 </ul>
		</div>
   		<div id="contentBox"> 	
		<div id="title">
			<ul>
				<li><input type="checkbox" name="check"></li>
				<li>리뷰번호</li>
				<li>카테고리</li>
				<li>상품명</li>
				<li>판매자</li>
				<li>리뷰내용</li>
				<li>답변상태</li>
				<li>작성자</li>
				<li>등록일</li> 
			</ul>
		</div>   
		 <c:forEach var="rvo" items="${list}">
			<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"></li>
				<li>${rvo.reviewnum}</li>
				<li>  
					<c:if test="${rvo.catenum==1}">
						 건과류
					</c:if>
					<c:if test="${rvo.catenum==2}">
						 견과류
					</c:if>
					<c:if test="${rvo.catenum==3}">
						 과일
					</c:if>
					<c:if test="${rvo.catenum==4}">
						 쌀
					</c:if>
					<c:if test="${rvo.catenum==5}">
						 잡곡
					</c:if>
					<c:if test="${rvo.catenum==6}">
						 채소
					</c:if>  
				</li>
				<li class="wordCut">${rvo.productname}</li>
				<li>${rvo.sellerid}</li>
				<li class="wordCut" id="reportDiv"><a href="회원정보?">${rvo.reviewcontent}</a></li>
				<li>
					<c:if test="${rvo.reviewanswer==null || data.reviewanswer==''}">
						답변대기
					</c:if>
					<c:if test="${rvo.reviewanswer!=null && data.reviewanswer !=''}">
						답변완료
					</c:if></li>
				<li>${rvo.customerid}</li>
				<li>${rvo.reviewwritedate}</li> 
			</ul> 
		</c:forEach> 	   
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
	<!---------------------------- 모달 ------------------------------>
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
					<button class="success" value="blind" name="blind" id="blindBtn1">비공개</button>
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
				<button class="success" value="blind" name="blind" id="blindBtn2">비공개</button>
				<button class="success" value="" name="" id="farmGo">판매자 농장 방문</button>
				<button class="success" value="" name="" id="closeBtn">닫기</button>
			</div>
		</div>
	</div>
</div> 

</html>