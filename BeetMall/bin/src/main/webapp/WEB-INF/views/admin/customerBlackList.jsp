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
<style>
	body{width:1920px; padding:0; margin:0; font-family: 'Nanum Gothic', sans-serif; font-size:16px;}
	#topBar, #topBar form, #noticeSearchFrm, #title, button, #contentBox{ 
		position:relative; 
	}
	#addBtn, #delBtn{
		position:absolute;
	}
	#container{ 
		position:absolute; 
		top:200px; 
		left:190px; 
		width:1080px; 
		padding:0; 
	}
	#container ul{ 
		width:1080px; 
	} 
	#container li{ 
		list-style-type:none;
		float:left; width:13%; 
	} 
	#ascBtn, #descBtn{ 
		top:-2px; 
	} 
	#contentBox{ 
		top:20px; 
		margin-left:10px;
	}
	#contentBox li{ 
		text-align:center; 
	} 
	#contentBox li:nth-of-type(8n+1){ 
		width:0%; 
	}
	#title li:nth-of-type(5), #contentBox li:nth-of-type(5){ 
		width:15%; 
	} 
	#topBar{ 
		background-color:lightgray; 
		float:left; 
		height:50px; 
		padding:10px 0 0 0px;  
		width:1280px;
		left:-200px;
	}
	#topBar li:nth-of-type(2){
		margin-left:70px; 
		width:12%;
	} 
	#topBar li:nth-of-type(3){
		width:5.5%;
	} 
	#topBar li:nth-of-type(4){
		width:14%;
	}  
	#addBtn{
		top:10px; 
		left:1040px; 
		width:100px;
	}
	#delBtn{
		top:10px; 
		left:1150px; 
		width:100px;
	} 
	select{
		width:100px;
	}
	#btns{ 
		top:-115px; 
		left:460px; 
	} 
	/*버튼*/
	button{
		padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
	}
	/*버튼*/
	button:hover, button:active{
		background: gray;
		color:white;
		display: inline-block;
	} 
	#btns a>button, button:nth-of-type(4){ 
		margin-left:900px; 
	}  
	#title{ 
		width: 1080px; 
		font-weight:bold; 
		padding:65px 0 25px 0; 
		border-bottom:gray 1px solid;
	}
	.noticeList{ 
		padding-top:5px;
	} 
	.noticeList:nth-of-type(1){ 
		padding-top:10px;
	} 
	#noticeSearchFrm{ 
		top:30px; left:360px; 
		}
	input[type=checkbox] {
		zoom: 1.8;
	} 
	#subjectLine{
		white-space:nowrap; 
		overflow:hidden;
		text-overflow:ellipsis;
	}
	#content input, textarea, select, #noticeSearchFrm input{
		border:1px solid lightgray; 
		border-radius: 8px;
	}
	#content li, label{list-style-type:none; padding-bottom:10px;}
	#content select{height:28px;}
	
	/* 페이징처리부분 */
	.page_wrap {
		text-align:center;
		font-size:0; 
	}
	.page_nation {
		display:inline-block;
		padding-top:60px;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:35px;
		height:35px;
		line-height:35px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
	}
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
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	/* 페이징처리끝 */
	
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
				<li><h5><strong>블랙리스트</strong></h5></li> 
				<li><select name="sort" > 
		   				<option value="아이디" selected>아이디</option>
		   				<option value="이름">이름</option>
		   				<option value="신고번호">신고번호</option> 
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
				<li><input type="checkbox" name="check"></li>
				<li>신고번호</li>
				<li>이름</li>
				<li>아이디</li>
				<li>신고자</li>
				<li>신고유형</li>
				<li>신고일</li>
				<li>처리일</li> 
			</ul>
		</div>  
		<c:forEach var="data" items="${list}">
			<ul class="noticeList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li><a href="신고번호?">no?</a></li>
				<li>name?</li>
				<li><a href="reportList?id=?">id?</a></li>
				<li>repoter</li>  
				<li>type</li>
				<li>date</li>
				<li>donedate<br/></li> 
			</ul>
		</c:forEach>
		</div>	 
		<div class="page_wrap">
			<div class="page_nation">
			   <a class="arrow pprev" href=""></a>
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
</body>
</html>