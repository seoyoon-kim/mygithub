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
	/*맨 위 회색 top Bar*/
	#topBar li:nth-of-type(2){
		margin-left:60px;
	} 
	/*내용 전체 정렬*/
	#topBar li:nth-of-type(4){
		width:7%;
	} 
	#title li:nth-of-type(5), #contentBox li:nth-of-type(5){ 
		width:12%; 
	} 
	#topBar li:nth-of-type(7){
		position:relative; left:-80px;
	}   
	#contentBox li:nth-of-type(9n-2) {
    	width: 8%;
	}
	#contentBox li:nth-of-type(9n+1) {
    	width: 0%;
	}  
	#title>ul,.productList{
		position:relative; left:-40px;
	} 
	
	#ascBtn, #descBtn{
		width:40px;
	} 
	/* 본문 정렬*/
	#container li{ 
		width:12%; 
		list-style-type:none;
		float:left;
	} 
	#container li:nth-of-type(3){
		width:10%;
	}  
	#container li:nth-of-type(6){
		width:20%;
	} 
	#container li:nth-of-type(8){
		width:14%;
	}  
	.productList:nth-of-type(1){ 
		margin-top:10px;
	}
	#contentList>ul{
		float:left;
		margin-bottom:0px;
	}
	
	/*페이징 이미지 링크*/
	.page_nation .pprev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/resources/img/kpage_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/resources/img/kpage_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('<%=request.getContextPath()%>/resources/img/kpage_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('<%=request.getContextPath()%>/resources/img/kpage_nnext.png') no-repeat center center;
		margin-right:0;
	}
</style>
<script>
 
</script>
</head>
<body>
<%@ include file="/inc/top.jspf" %>
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="topBar">
			<ul>
				<li><h5><strong>판매 내역</strong></h5></li> 
				<li><select name="sort" > 
				<option value="구매번호" selected>번호</option>  
		   				<option value="주문현황">주문현황</option>   
		   				<option value="배송현황">배송현황</option>   
		   				<option value="제목">제목</option>   
		   				<option value="아이디">아이디</option>
		   				<option value="법인명">법인명</option>
		   				<option value="구매일">구매일</option>         
		   			 </select>
	   			</li> 
	   			<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>  
			</ul> 
		</div>  
   		<div id="contentBox"> 	
		<div id="title">
			<ul>
				<li></li>
				<li>구매번호</li>
				<li>카테고리</li>
				<li>주문현황</li>
				<li>배송현황</li>
				<li>제목</li>
				<li>아이디</li>
				<li>법인명</li> 
				<li>구매일</li> 
			</ul>
		</div>  
		<div id="contentList">
			<c:forEach var="data" items="${list}">
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
			</c:forEach>
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
		<div>
			<ul>
				<li><select name="sort" > 
			   				<option value="번호" selected>카테고리선택</option>
			   				<option value="과일">과일</option> 
			   				<option value="채소">채소</option> 
			   				<option value="쌀/잡곡">쌀/잡곡</option> 
				  	</select> 
		   		</li>
	   		</ul>  
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
</body>
</html>