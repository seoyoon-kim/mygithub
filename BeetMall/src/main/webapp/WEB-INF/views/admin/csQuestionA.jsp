<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	#topBar h5{  
		padding-left:120px;
	}
	 #container li{ 
		 list-style-type:none; 
		 float:left; 
		 width:15%; 
	 }   
	#contentBox{
		top:-40px;
	}
	#contentBox li:nth-of-type(6n-5){ 
		width:0%; 
	}
	#contentBox li:nth-of-type(4){ 
		width:37%; 
	}
	#title li:nth-of-type(8n-1), #contentBox li:nth-of-type(8n-1){  
		width:30%; 
		padding-left:20px; 
	}    
	#topBar li:nth-of-type(2){
		margin-left:22px;
	}  
	#topBar li:nth-of-type(3){
		width:12%;
	} 
	#topBar li:nth-of-type(4){
		width:6%;
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
	
	#sortBox {
		margin: 80px 0 0 20px;
	} 
	#sortBox>ul{
		width:1110px !important;
	}
	#sortBox li:nth-of-type(1), #sortBox li:nth-of-type(5), #sortBox li:nth-of-type(6) {
		width: 10%;
	}
	#sortBox li:nth-of-type(2) {
		display:flex;
		width: 16%;
	}
	#sortBox li:nth-of-type(3) {
		width:10%;
		margin-right:44px;
	}
	#sortBox li:nth-of-type(4) {
		margin-right:180px;
	} 
	#sortBox li:nth-of-type(7),#sortBox li:nth-of-type(8){
		width: 3.5%;
	}
	#fromTo{
		margin-left:14px;
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
</style> 
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="csQuestionA">고객 문의</a></strong></h5></li> 
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
						<option value="birthdate">생년월일</option> 
						<option value="regDate">탈퇴일</option>
					</select>  
				</li>
				<li><input type="date" id="from"><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>  
				<li><input type="submit" value="검색" /></li>
				<li><select name="sort" > 
		   				<option value="전체" selected>전체</option>
		   				<option value="미답변">미답변</option>
		   				<option value="답변완료">답변완료</option>   
			  		</select> 
	   			</li>
	   			<li><select name="sort" > 
		   				<option value="전체" selected>전체</option>
		   				<option value="소비자">소비자</option>
		   				<option value="판매자">판매자</option>   
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
				<li>문의번호</li>
				<li>문의주체</li>
				<li>제목</li>
				<li>작성자</li>
				<li>등록일</li> 
			</ul>
		</div>
		<c:forEach var="data" items="${list}">  
			<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"></li>
				<li>${data.qmnum}</li>
				<li>
					<c:if test="${data.qmoption==1 }">
						소비자
					</c:if>
					<c:if test="${data.qmoption==2 }">
						판매자
					</c:if>
				</li>
				<li class="subjectLine"><a href="/sshj/csAnswerA?qmnum=${data.qmnum}">${data.qmtitle}</a></li>
				<li>${data.userid}</li> 
				<li>${data.qmdate}</li>
			</ul> 
		</c:forEach>
		</div>	 
		<div class="page_wrap">
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/csQuestionA?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum}"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/csQuestionA?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="/sshj/csQuestionA?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
	           </c:if>
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
</div> 
<style>
 	.page_nation {
	    display: inline-block;
	    padding-top: 0px;
	    margin-bottom: 15px;
	}
/* 	#title {
        width: 1025px;
	    font-weight: bold;
	    padding: 65px 0 25px 0;
	    border-bottom: gray 1px solid;
	}
	#kktitle{
		width:30%;
	}
	#contentBox li:nth-of-type(4) {
	    width: 30%;
	    text-align: left;
	} */
	#contentBox li:nth-of-type(4) {
	    width: 37%;
	    text-align: left;
	}
</style>