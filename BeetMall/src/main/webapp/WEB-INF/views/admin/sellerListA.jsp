<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	 #container li{  
		 float:left; 
		/*  width:13%;  */
	 }   
	 #contentBox{ 
		/* top:20px; 
		margin-left:10px; */
		margin-left:0px !important;
	}
	#container{
		width:1120px !important;
		top:0px !important;
		margin:0px !important;
	}
	#descBtn, #ascBtn{
		top:100px !important;
	}
	/*남색 바*/ 
	#topBar h5{
		 padding-left:130px;
	}
	#topBar li:nth-of-type(1){   
		position:relative;
		left:-8px;
	}
	#topBar li:nth-of-type(2){   
		margin-left:98px; 
	}
	/*회색 바와 데이터 제목, 데이터 내용*/
	/* #contentBox li:nth-of-type(8n+1){ width:0%; } */
 	 
	#btns a>button, button:nth-of-type(4){ margin-left:900px; }  
	#title{
		padding-top:0 !important;
	} 
	#sortBox {
		margin: 30px 0 0 20px;
		width:1080px;
	} 
	#sortBox>ul{
		width:1110px !important;
	} 
	#sortBox li:nth-of-type(1), #sortBox li:nth-of-type(3),#sortBox li:nth-of-type(4),#sortBox li:nth-of-type(5),#sortBox li:nth-of-type(4),#sortBox li:nth-of-type(6) {
		width: 10%; 
	}
	#sortBox li:nth-of-type(2) {
		width: 6%;
	}
	#sortBox li:nth-of-type(4) {
		margin-right:45px;
	}
	#sortBox li:nth-of-type(6) {
		margin-left:340px;
	}
	#sortBox li:nth-of-type(7),#sortBox li:nth-of-type(8){
		width: 4%;
	}
	#fromTo{
		margin-left:90px;
	} 
	#ascBtn{
		
		left:1030px;
	}
	#descBtn{ 
		
		left:1070px;
	}
	.page_wrap{
		height:100px;
	}
	.searchFrm{
		height:100px;
		margin-top:500px !important;
	}
	#choose{
		margin-top:20px !important;
	}
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
	.reginone{
		color:red;
	}
	.regiwait{
		color:#b1aa52;
	}
	.regifin{
		color:#68cc68;
	}
	.registop{
		color:#b1aa52;
	} 
	.wordcut{
		white-space: nowrap;
		overflow: hidden;
		text-overflow:ellipsis;
	}
	.contentList{
		margin:0px;
	}
	#contentBox li{
		height:56px; 
		
		line-height:56px;
		font-size:13px;
		border-bottom:1px solid #eee;
	}
	
	.contentList>li:nth-child(1), #contentBox li:nth-of-type(8n+1){
		width:0%;
		height:20px;
		
	} 
	.contentList>li:nth-child(2), #contentBox li:nth-of-type(8n+2){
		width:7%;
	}
	.contentList>li:nth-child(3), #contentBox li:nth-of-type(8n+3){
		width:10%;
	}
	.contentList>li:nth-child(4), #contentBox li:nth-of-type(8n+4){
		width:11%;
	}
	.contentList>li:nth-child(5), #contentBox li:nth-of-type(8n+5){
		width:15%;
	}
	.contentList>li:nth-child(6), #contentBox li:nth-of-type(8n+6){
		width:11%;
	}
	.contentList>li:nth-child(7), #contentBox li:nth-of-type(8n+7){
		width:31%;
	}
	.contentList>li:nth-child(8), #contentBox li:nth-of-type(8n){
		width:15%;
	}
	#inputsss{
		flex-wrap:unset;
		margin-top:30px;
		display: inline;
	}
	#container{
		height:1080px;
		overflow:auto;
		overflow-x: hidden;
	}
	#contentBox{
		overflow: auto;
	    height: 550px;
	    overflow-x: hidden;
	}
	#addBtn, #delBtn{
		visibility: hidden;
	}
	#sortBox{
		display:none;
	}
	#contentBox>div>ul>li:nth-child(1), #contentBox>div>ul>li:nth-child(2), #contentBox>div>ul>li:nth-child(3), #contentBox>div>ul>li:nth-child(4), #contentBox>div>ul>li:nth-child(5), #contentBox>div>ul>li:nth-child(6), #contentBox>div>ul>li:nth-child(7), #contentBox>div>ul>li:nth-child(8) {
		border-top:1px solid #eee;
	}
</style>
<script>
	function pagelist(pagenum){
		var lin = "sellerListA?pageNum="+pagenum;
		
		location.href=lin;
	}
</script>
 
 
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="sellerListA">회원관리</a></strong></h5></li> 
					<li><button class="success" value="add" name="add" id="addBtn">추가</button></li>
				<li><button class="success" value="del" name="del" id="delBtn">삭제</button></li>
			</ul> 
		</div>
		</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">   
		<div id="choose">
			<a href="customerListA"><button class="success" value="" name="" id="">일반회원</button></a>
			<a href="sellerListA"><button class="success" value="" name="" id="" style="background-color:lightgray; color:black;">판매자회원</button></a>
		</div> 
			<div id="sortBox">
				<ul>
				<li>
					<select name="searchDate">  
						<option value="birthdate">생년월일</option> 
						<option value="regDate">탈퇴일</option>
					</select>  
				</li>
				<li><input type="date" id="from"></li>
				<li><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>
				<li><input type="submit" value="검색" /></li>
				<li><select name="sort" > 
			   				<option value="정렬하기" selected>정렬하기</option> 
			   				<option value="이름">이름</option> 
			   				<option value="아이디">아이디</option> 
			   				<option value="나이">나이</option> 
			   				<option value="이메일">이메일</option> 
			   				<option value="생년월일">생년월일</option> 
			   				<option value="주소">주소</option> 
			   				<option value="가입일">가입일</option> 
			  			</select> 
	   				</li> 
					<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
					<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>
				</ul>
			</div>
   		<div id="contentBox"> 	
		<div id="">
			<ul>
				<li></li>
				<li>농장번호</li> 
				<li>판매자명</li>
				<li>아이디</li>
				<li>이메일</li>
				<li>상호명</li>
				<li>주소</li> 
				<li>인증여부</li> 
				
				<c:forEach var="vo" items="${list}">
			
				<li></li>
				<li>${vo.storenum}</li>
				<li><a href="${vo.userid}">${vo.sellername}</a></li>
				<li>${vo.userid}</li>
				<li>${vo.storeemail}</li>
				<li>${vo.storename}</li>
				<li class="wordcut">(${vo.storezipcode})${vo.storeaddr} ${vo.storedetailaddr}</li>
				<li>
					<c:if test="${vo.regiapproval == 0}"><span class="reginone">미등록</span></c:if>
					<c:if test="${vo.regiapproval == 1}"><span class="regiwait">대기중</span></c:if>
					<c:if test="${vo.regiapproval == 2}"><span class="regifin">완료</span><span class="regidate">(${vo.regiapprovaldate})</span></c:if>
					<c:if test="${vo.regiapproval == 3}"><span class="registop">반려</span></c:if>
				</li> 
				</c:forEach>
			</ul>
		</div>
		</div>	
		
		<div class="page_wrap">	
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="javascript:pagelist(${pageVO.pageNum-1})"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum }"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="javascript:pagelist(${p})">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="javascript:pagelist(${pageVO.pageNum+1})"></a>
	           </c:if>
			</div>
			
		 </div> 
		 <div style="margin: 50px auto;width:550px" >
			<form method="get" id="inputsss">
				 <select name="searchKey">
					<option value="" selected>이름</option>
	   				<option value="">아이디</option> 
	   				<option value="">이메일</option> 
	   				<option value="">주소</option> 
				</select>			
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" value="검색"/> 
			</form> 
		</div>  
		</div>
</div>
</body>
</html>