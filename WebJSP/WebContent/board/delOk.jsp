<%@page import="com.bitcamp.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%System.out.println(8888);
	int no = Integer.parseInt(request.getParameter("no"));
		
	int nowNum = Integer.parseInt(request.getParameter("nowNum"));
	String searchKey = request.getParameter("searchKey");
	String searchWord = request.getParameter("searchWord");
	System.out.println(1111999);
	BoardDAO dao = new BoardDAO();
	int result = dao.deleteRecord(no, (String)session.getAttribute("logId"));
	System.out.println(1111111);
	//삭제 후 history.go(-2)를 하면 삭제 전의 리스트가 보이므로 새로 로딩한다.
	if(result>0){ //삭제 성공 시 
		%>
		<script>
			location.href="<%=request.getContextPath()%>/board/boardList.jsp?nowNum=<%=nowNum%><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);}%>"	
		</script>
		<%
	
	}else{ // 삭제 실패 시 : 글 내용 보기로 보내기
		%>
		<script>
			alert("글 삭제 실패했습니다");
			hitory.back();
		</script>
		<%
		
	}

%> 