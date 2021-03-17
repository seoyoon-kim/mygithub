<!-- 3/16 -->
<!-- 3/17 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays, java.util.Enumeration"%>    
<% //전송받는 부분

	request.setCharacterEncoding("UTF-8");	//한글 깨질 때의 메서드

	String username = request.getParameter("username");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	String gender = request.getParameter("gender");
	
	String[] hobby = request.getParameterValues("hobby");
	String[] local = request.getParameterValues("local");
	
	String intro = request.getParameter("intro");
	
	System.out.println(tel);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<!-- 클라이언트 영역에 다시 출력해주는 부분 -->
	이름 : <%= username %><br/>
	연락처 : <%= tel %><br/> 
	주소 : <%= addr %><br/>
	성별 : <%= gender %><br/>
	관심분야 :  <!--<= hobby %><br/>  배열이 들어있는 주소 해시코드가 출력된다. -->
			<%= Arrays.toString(hobby) %><br/>
	지역 : 
	<% 
	for(int i=0; i<local.length; i++){
		out.write(local[i]+", ");
	} 
	%><br/>
	
	intro : <%=intro %>
	<hr/>
	<h1>이전 페이지 parameter 이름을 얻을 수 있다.</h1>
	<ol>
	<%
		Enumeration<String> e = request.getParameterNames();
		while(e.hasMoreElements()){
			out.write("<li>"+e.nextElement()+"</li>");
		}; 
	%>
	<%
		Enumeration<String> e2 = request.getParameterNames();
		while(e.hasMoreElements()){%>
			<li><%=e2.nextElement() %> </li>
		<% 
		} 
	%>
	</ol>
	
	<ul>
		<li>접속자의 컴퓨터 ip : <%=request.getRemoteAddr() %></li><!-- 서버에서 클라이언트의 IP 구하기 -->
		<li>URI : <%=request.getRequestURI() %></li> <!-- 경로 구하기 -->
		<li>절대 주소 : <%=request.getServletContext().getRealPath("/img") %></li><!-- 해당 폴더의 위치를 구해준다.파일 업로드 할 때 이용한다. 현재 폴더 : "/" -->
		
		<li>인코딩 코드값 : <%=request.getCharacterEncoding() %></li>
		<li>ContentType : <%=request.getContentType() %></li>
		<li>전송방식 : <%=request.getMethod() %></li> 
		<li>프로토콜 : <%=request.getProtocol() %></li> 		
		<li>contextPath : <%=request.getContextPath() %></li>
		<li>서버 이름 : <%=request.getServerName() %></li>
		<li>port : <%=request.getServerPort() %></li> 
	</ul>
</body>
</html>