<!-- 03/18 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "com.bitcamp.board.BoardDAO" %>
<!-- 게시판 입력폼에 입력한 데이터를 DB에 저장 -->
<!-- 액션태그 useBean : 폼 데이터 request 후 + 폼의 name 속성의 값과 vo에 있는 멤버변수명이 같은 데이터를 담는다.-->
<!-- 
	BoardVO vo = new BoardBO(); <-객체 생성
	useBean - class로 객체를 만들어 객체명 vo에 담는다.
	scope : 생명주기 - request, page, session, application
 -->
 <% 
 	request.setCharacterEncoding("UTF-8");
 %>
<jsp:useBean id="vo" class="com.bitcamp.board.BoardVO" scope="page"/>
<jsp:setProperty name="vo" property="*"/><!-- request실행해서 담는 객체 / VO의 변수 --> 
<%
	//session의 글쓴이 아이디를 vo에 대입한다.
	vo.setUserid((String)session.getAttribute("logId"));
	//글쓴이 컴퓨터 ip
	vo.setIp(request.getRemoteAddr());
	
	BoardDAO dao = new BoardDAO();
	int result = dao.insertBoard(vo);
	
	if(result>0){ //글 등록
		response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");	
	}else{ //글 등록 실패 시 
		%>
		 <script>
			alert("글 등록이 실패하였습니다.");
			history.back();
		</script>
		<%
		
	}
%>