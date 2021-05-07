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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin.css" type="text/css"> 
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
	/*회색 바*/ 
	#topBar h5{
		width:120px;
	}
	#topBar li:nth-of-type(1){   
		position:relative;
		left:-8px;
	}
	#topBar li:nth-of-type(2){   
		margin-left:98px; 
	}
	/*회색 바와 데이터 제목, 데이터 내용*/
	#contentBox li:nth-of-type(9n+1){ width:0%; }  
 	/*데이터 내용의 topBar*/
 	#title li:nth-of-type(5), #contentBox li:nth-of-type(5){ 
		width:13%; 
	}  
	#btns a>button, button:nth-of-type(4){ margin-left:900px; }  
	 
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
<%@ include file="/inc/leftBar.jspf" %>
<div id="body1">
	<div id="container">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="/customerBlackList">블랙리스트</a></strong></h5></li> 
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
				<li><button class="success" value="add" name="add" id="addBtn">추가</button></li>
				<li><button class="success" value="del" name="del" id="delBtn">삭제</button></li>
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
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16</li> 
			</ul>  
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16</li> 
			</ul>  
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul>  
		
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 1236954</li>
				<li>홍길동</li>
				<li><a href="회원정보?">customerid</a></li>
				<li>badid</li>
				<li>비방</li>
				<li>2021-05-23</li>
				<li>2021-02-16<br/></li> 
			</ul> 
		
		<c:forEach var="data" items="${list}">
			<ul class="noticeList">
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

	<!-- 
	 <ul class="breadcrumb pagination-md">
	 	 % if(nowNum>1){%>
	 		<li class="page-item"><a href="noticeBoardList.jsp?nowNum= %=nowNum-1%> %
	 		if(searchWord!=null && !searchWord.equals("")){
	 			out.write("&searchKey="+searchKey+"&searchWord="+searchWord);}%>" 
				class="page-link">Prev</a></li>
		 % }else{%>
			<li class="page-item disabled"><a href="#" class="page-link">Prev</a></li>
		 % }
	 		//페이지 번호 매기기                  
	 		for(int p=startPage; p<startPage+onePageSize; p++){
				if(p<=totalPage){
		 			if(nowNum==p){//현재 보고있는 페이지에 표시하기
		%>		 	
	 				<li class="page-item active"><a href="noticeBoardList.jsp?nowNum= %=p%> %
			if(searchWord!=null && !searchWord.equals("")){
				out.write("&searchKey="+searchKey+"&searchWord="+searchWord);}%>" class="page-link"> %=p%></a></li>
		  
		 % 		}else{//현재 보고있는 페이지가 아닐 때 표시하기
		    %>
        <li class="page-item"><a href="noticeBoardList.jsp?nowNum= %=p %> %if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);} %>" class="page-link"> %=p %></a></li>   
           %   }
          }/// totalPage
      }

	 	if(nowNum==totalPage){ //마지막 페이지
	 	%>
	 		<li class="page-item disabled"><a href="#" class="page-link">Next</a></li>	
	 	 % }else{ %>
	 	 	<li class="page-item"><a href="noticeBoardList.jsp?nowNum= %=nowNum+1%> %
	 	if(searchWord!=null && !searchWord.equals("")){
	 		out.write("&searchKey="+searchKey+"&searchWord="+searchWord);}%>" class="page-link">Next</a></li>
	 	 % } %>
	 </ul>		
 -->
 
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
</div>
</body>
</html>