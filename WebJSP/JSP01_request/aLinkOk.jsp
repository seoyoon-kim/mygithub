<!-- 3/16 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트의 정보를 서버로 가져오기
	String username = request.getParameter("username");
	int num = Integer.parseInt(request.getParameter("num"));//네트워크를 통해 넘어오는 숫자는 모두 문자이다.
	String tel = request.getParameter("tel");
	
	System.out.println("이름="+username);
	System.out.println("번호="+(num+1000));
	System.out.println("연락처="+tel);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%= username %><br/>
	번호 : <%= num %><br/>
	연락처 : <%= tel %><br/> 
</body>
</html>