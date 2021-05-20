<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	 #container li{ 
		 list-style-type:none; 
		 float:left; 
	 }   
	#topBar h5{  
		padding-left:120px;
	} 
	#contentBox{
		top:-40px;
	}
	#contentBox li{ 
		 width:16%; 
	}
	#contentBox li:nth-of-type(8n-7){ 
		width:0%; 
	}    
	#topBar li{ 
		 width:10%; 
	}
	#topBar li:nth-of-type(3){
		width:5.5%;
	} 
	#topBar li:nth-of-type(4){
		width:14%;
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
		margin-right:405px;
	} 
	#sortBox li:nth-of-type(6),#sortBox li:nth-of-type(7){
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
</style> 
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="csQBrowse">상품 문의</a></strong></h5></li> 
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
						<option value="regDate">등록일</option>
					</select>  
				</li>
				<li><input type="date" id="from"><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>  
				<li><input type="submit" value="검색" /></li>
				<li><select name="sort" > 
		   				<option value="전체" selected>전체</option>
		   				<option value="문의번호">문의번호</option>
		   				<option value="제목">제목</option> 
		   				<option value="신고된 문의">신고된 문의</option> 
		   				<option value="구매자">구매자</option> 
		   				<option value="판매자">판매자</option> 
		   				<option value="등록일">등록일</option> 
			  		</select> 
	   			</li> 
				<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li> 
		 	</ul>
		</div>
   		<div id="contentBox"> 	
		<div id="title">
			<ul>
				<li><input type="checkbox" name="check"  ></li>
				<li>번호</li>
				<li>제목</li>
				<li>신고여부</li>
				<li>구매자</li>
				<li>판매자</li>
				<li>등록일</li> 
			</ul>
		</div>  
		<c:forEach var="data" items="${list}">  
			<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li>${data.qnum}</li>
				<li class="wordcut"><a href="/sshj/csQOpen?qnum=${data.qnum}">${data.qtitle }</a></li>
				<li>
					<c:if test="${data.reportcount == null }">
						없음
					</c:if>
					<c:if test="${data.reportcount != null }">
						${data.reportcount }
					</c:if>
				</li>
				<li>${data.custom}</li> 
				<li>${data.seller}</li>
				<li>${data.qwritedate }</li>  
			</ul> 
		</c:forEach>
		</div>	 
		<div class="page_wrap">
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/csQBrowse?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum}"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/csQBrowse?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="/sshj/csQBrowse?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
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
</html>
<style>
	.wordcut{white-space:nowrap; overflow:hidden; text-overflow:ellipsis; text-align: left !important;}
	.page_nation {
	    display: inline-block;
	    padding-top: 0px;
	    margin-bottom: 15px;
	}
</style>