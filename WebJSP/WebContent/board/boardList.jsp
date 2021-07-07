<!-- 03/18
03/19 
03/22-->
 
<%@ page import="com.bitcamp.board.BoardVO"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bitcamp.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style>
	ul, li{margin:0; padding:0; list-style-type:none;}
	#boardList>li{
		float:left; width:10%; height:40px; line-height:40px; border-bottom:1px solid gray;
	}
	/*제목 : 55%* white-space:nowrap; 줄바꾸기 금지*/
	#boardList>li:nth-child(5n+2){
		width:55%; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	}
	/*작성일 : 15%*/
	#boardList>li:nth-child(5n+4){
		width:15%; 
	}
</style>
<script>
	$(function(){
		$("#searchFrm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색어를 입력 후 검색하세요");
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
<%@ include file="../jsp04_include/jspf_header.jspf" %>
<%
	//총 레코드 수 
	BoardDAO dao = new BoardDAO();
	//검색어 확인
	String searchKey = request.getParameter("searchKey");
	String searchWord = request.getParameter("searchWord");
	System.out.println("searchKey->"+searchKey+", searchWord->"+searchWord);
	
	int totalRecord = dao.totalRecord(searchKey, searchWord); 
	int onePageRecord = 5; //한 페이지당 출력할 레코드 수
	int onePageSize = 5;//한번에 표시할 페이지수
	
	//현재 페이지 번호
	String nowNumStr= request.getParameter("nowNum"); //null or 페이지 번호 -> 정수로 바꿀 수 없다.
	int nowNum = 1;
	if(nowNumStr !=null && !nowNumStr.equals("")){//전송받은 페이지 번호가 있는 경우
		nowNum = Integer.parseInt(nowNumStr);
	}else{//전송받은 페이지 번호가 없는 경우
		nowNum=1; //nowNum이 원래 1이기에 생략이 가능한 코드
	}
	
	//총 페이지 수 
	int totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
	
	//레코드 선택                     현재페이지, 한페이지당 출력할 레코드수, 총 레코드 수, 총 페이지 수, 검색 분야,   검색어
	List<BoardVO> list = dao.selectRecord(nowNum, onePageRecord, totalRecord, totalPage, searchKey, searchWord);
	
%>	
	<div class="container">
		<h1>게시판 목록</h1>
		<div>총레코드 수 : <%=totalRecord %>, Page : <%=nowNum %>/<%=totalPage %>page</div>
		<ul id="boardList">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>작성일</li>
			<li>조회수</li>
			<% for(int i=0; i<list.size(); i++){
				BoardVO vo = list.get(i); 
			%>
			 <li><%=vo.getNo() %></li>
	         <li><a href="<%=request.getContextPath()%>/board/boardView.jsp?no=<%=vo.getNo()%>&nowNum=<%=nowNum%><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);} %>"><%=vo.getSubject() %></a></li>
	         <li><%=vo.getUserid() %></li>
	         <li><%=vo.getWritedate() %></li>
	         <li><%=vo.getHit() %></li>
      <% }%>
   </ul>
   <div>
		<%
			String logStatus = (String)session.getAttribute("logStatus"); 
			if(logStatus !=null && logStatus.equals("Y")){
		%>
			<a href="<%=request.getContextPath()%>/board/boardWriteForm.jsp">글쓰기</a>
		<%
			}
		%>
		</div>
		<div>
			<%
				//((현재페이지-1)/출력페이지수*출력페이지수)+1
				int startPage = ((nowNum-1)/onePageSize*onePageSize)+1;
			%>
		
		
		 <ul class="breadcrumb pagination-md">
		 	<!-- 페이지 이동에 따른 변화 jsp -->
		 	<% if(nowNum>1){%>
		 		<li class="page-item"><a href="boardList.jsp?nowNum=<%=nowNum-1%><%
		 		if(searchWord!=null && !searchWord.equals("")){
		 			out.write("&searchKey="+searchKey+"&searchWord="+searchWord);}%>" 
		 			class="page-link">Prev</a></li>
		 	<% }else{%>
		 		<li class="page-item disabled"><a href="#" class="page-link">Prev</a></li>
		 	<% }
		 		//페이지 번호 매기기                  
		 		for(int p=startPage; p<startPage+onePageSize; p++){
		 			if(p<=totalPage){
		 			
		 			if(nowNum==p){//현재 보고있는 페이지에 표시하기
		 	%>		 	
		 				<li class="page-item active"><a href="boardList.jsp?nowNum=<%=p%><%
		 		if(searchWord!=null && !searchWord.equals("")){
		 			out.write("&searchKey="+searchKey+"&searchWord="+searchWord);}%>" class="page-link"><%=p%></a></li>
		  
		 	<% 		}else{//현재 보고있는 페이지가 아닐 때 표시하기
		 	    %>
                  <li class="page-item"><a href="boardList.jsp?nowNum=<%=p %><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);} %>" class="page-link"><%=p %></a></li>   
                  <%   }
               }/// totalPage
            }

		 		if(nowNum==totalPage){ //마지막 페이지
		 		%>
		 			<li class="page-item disabled"><a href="#" class="page-link">Next</a></li>	
		 		<% }else{ %>
		 		 	<li class="page-item"><a href="boardList.jsp?nowNum=<%=nowNum+1%><%
		 		if(searchWord!=null && !searchWord.equals("")){
		 			out.write("&searchKey="+searchKey+"&searchWord="+searchWord);}%>" class="page-link">Next</a></li>
		 		<% } %>
		 </ul>		
		</div>
		<div>
			<form method="get" id="searchFrm" action="<%=request.getContextPath() %>/board/boardList.jsp">
				<select name="searchKey">
					<option value="subject">제목</option>
					<option value="userid">작성자</option>
					<option value="content">글내용</option>
				</select>			
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" value="Search"/>
			</form>
		</div>
	</div>
</body>
</html>