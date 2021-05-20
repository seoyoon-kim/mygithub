<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <style> 
	#topBar h5{  
		padding-left:120px;
	}
	#container li{  
		 float:left; 
		 width:10%; 
	}   
	#contentBox{
		top:-40px;
	} 
	#contentBox li:nth-of-type(9n-8){ 
		width:0%; 
	}
	#contentBox li:nth-of-type(4){ 
		width:20%; 
	}   
	#topBar li:nth-of-type(3){
		width:12%;
	} 
	#topBar li:nth-of-type(4){
		width:6%;
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
		margin-right:44px;
	}
	#sortBox li:nth-of-type(4) {
		margin-right:233px;
	} 
	#sortBox li:nth-of-type(7),#sortBox li:nth-of-type(8){
		width: 3.5%;
	}
	#fromTo{
		margin-left:14px;
	}
	/*데이터 내용*/ 
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
	.contentList>li:nth-of-type(7){
		padding-top:3px;
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
	.page_nation{
		display: inline-block;
	    padding-top: 0px;
	    margin-bottom: 15px;
	}
	/* 페이징처리끝 */
</style> 
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="productListA">상품 목록</a></strong></h5></li> 
				<li><button class="success" value="add" name="add" id="addBtn" style="visibility: hidden;">추가</button></li>
				<li><button class="success" value="del" name="del" id="delBtn" style="visibility: hidden;">삭제</button></li>
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
		   				<option value="카테고리" selected>카테고리</option>
		   				<option value="과일">과일</option>  
		   				<option value="건과류">건과류</option>   
		   				<option value="채소">채소</option>  
		   				<option value="쌀">쌀</option> 
		   				<option value="잡곡">잡곡</option>   
		   				<option value="견과류">견과류</option>     
				  	</select> 
		   		</li> 
		   		<li><select name="sort" > 
		   				<option value="정렬하기" selected>정렬하기</option>
		   				<option value="상품번호">상품번호</option>
		   				<option value="제목">제목</option>
		   				<option value="상호명">상호명</option>
		   				<option value="판매자">판매자</option>
		   				<option value="장바구니">장바구니</option>
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
				<li><input type="checkbox" name="check" style="visibility: hidden;"></li>
				<li>상품번호</li>
				<li>카테고리</li>
				<li id="kktitle">제목</li>
				<li>상호명</li>
				<li>판매자</li>
				<li>장바구니</li>
				<li>등록일</li> 
			</ul>
		</div>  
		<c:forEach var="data" items="${list}">
			<ul class="contentList">
				<li><input type="checkbox" name="check" id="check" style="visibility: hidden;"> </li>
				<li>${data.productnum}</li>
				<li><c:if test="${data.mcatenum>=1 &&data.mcatenum<=7}">
						건과류
					</c:if>
					<c:if test="${data.mcatenum>=8 &&data.mcatenum<=21}">
						견과류
					</c:if>
					<c:if test="${data.mcatenum>=22 &&data.mcatenum<=50}">
						과일
					</c:if>
					<c:if test="${data.mcatenum>=51 &&data.mcatenum<=68}">
						쌀/잡곡
					</c:if>
					<c:if test="${data.mcatenum>=69 &&data.mcatenum<=104}">
						야채
					</c:if>
				</li>
				<li id="kktitle"><a href="/sshj/productEditA?productnum=${data.productnum}">${data.productname}</a></li>
				<li>${data.storename}</li>
				<li>${data.sellername}</li>
				<li>
					<c:if test="${data.count == null}">
						${data.count}<img class="cartImg" src="./img/y_cart.png" >
					</c:if>
					<c:if test="${data.count != null}">
						${data.count}<img class="cartImg" src="./img/y_cart.png" >
					</c:if>
				</li>
				<li>${data.sellstart}</li> 
			</ul>  
		</c:forEach>
		<!--  
		<c:forEach var="data" items="${list}">
			<ul class="contentList">
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
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/productListA?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum}"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/productListA?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="/sshj/productListA?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
	           </c:if>
			</div>
		 </div>
		 <div>
			<form method="get" class="searchFrm" action="<%=request.getContextPath()%>/board/noticeBoardList.jsp">
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
	#title {
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
	}
	#contentBox ul {
	    margin-left: 0;
	}
</style>