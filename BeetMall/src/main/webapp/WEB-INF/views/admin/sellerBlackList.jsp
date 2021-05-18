<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	 #container li{ 
		 list-style-type:none; 
		 float:left; 
		 width:13%; 
	 }  
	 #contentBox{ 
		top:20px; 
		margin-left:10px;
	}
	/*남색 바*/ 
	#topBar h5{ 
    	padding-left: 150px; 
	}
	#topBar li:nth-of-type(1){   
		position:relative;
		left:-8px;
	}
	#topBar li:nth-of-type(2){   
		margin-left:98px; 
	}
	#title{
		padding-top:0 !important;
	} 
	/*남색 바와 데이터 제목, 데이터 내용*/
	#contentBox li:nth-of-type(9n+1){ width:0%; }  
 	/*데이터 내용의 topBar*/
 	#title li:nth-of-type(5), #contentBox li:nth-of-type(5){ 
		width:13%; 
	}  
	#btns a>button, button:nth-of-type(4){ margin-left:900px; }  
	
	#sortBox {
		margin: 30px 0 0 20px;
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
	}
	#sortBox li:nth-of-type(4) {
		margin-right:307px;
	} 
	#sortBox li:nth-of-type(6),#sortBox li:nth-of-type(7){
		width: 4%;
	}
	#fromTo{
		margin-left:14px;
	} 
	#ascBtn{
		top:170px !important; 
	}
	#descBtn{ 
		top:170px !important; 
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
</style>
<script>
 
</script>
 
 
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="sellerBlackList">블랙리스트</a></strong></h5></li> 
				<li><button class="success" value="add" name="add" id="addBtn">추가</button></li>
				<li><button class="success" value="del" name="del" id="delBtn">삭제</button></li>
			</ul> 
		</div>  
		</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="choose">
			<a href="customerBlackList"><button class="success" value="" name="" id="">일반회원</button></a>
			<a href="sellerBlackList"><button class="success" value="" name="" id="" style="background-color:lightgray; color:black;">판매자회원</button></a>
		</div> 
		<div id="sortBox">
			<ul>
				<li>
					<select name="searchDate">  
						<option value="birthdate">신고일</option> 
						<option value="regDate">처리일</option>
					</select>  
				</li>
				<li><input type="date" id="from"><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>  
				<li><input type="submit" value="검색" /></li>
				<li><select name="sort" > 
		   				<option value="신고번호" selected>신고번호</option>
		   				<option value="이름">이름</option>
		   				<option value="아이디">아이디</option> 
		   				<option value="신고자">신고자</option> 
		   				<option value="신고유형">신고유형</option> 
		   				<option value="신고일">신고일</option> 
		   				<option value="처리일">처리일</option> 
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
				<li>신고번호</li>
				<li>이름</li>
				<li>아이디</li>
				<li>신고자</li>
				<li>신고유형</li>
				<li>신고일</li>
				<li>처리일</li> 
			</ul>
		</div>  
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16</li> 
			</ul>
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16</li> 
			</ul>  
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul>  
		
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">sellerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul>     
		<c:forEach var="data" items="${list}">
			<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> name?</li>
				<li><a href="회원정보?">id?</a></li>
				<li>나이?</li>
				<li>{member.email}</li>  
				<li>{data.birthday}</li>
				<li>{data.addr}</li>
				<li>탈퇴일?<br/></li> 
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
</div>
</body>
</html>