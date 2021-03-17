<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//jsp에서 사용자 컴퓨터에 쿠키 저장하기
	//                      변수, 값(데이터)
	Cookie coo = new Cookie("userid", "growth");
	coo.setMaxAge(10*60); //쿠키의 소멸 주기(초 단위) 10*60 = 10분
	response.addCookie(coo);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 	                   /* 변수=값,    경로,     기간*/
	document.cookie == "food=pizza;path=/;expires=2021"
	document.cookie == "notice=text";
</script>
</head>
<body>
	<button onclick="location.href='/WebJSP/jsp02_cookie/cookieView.jsp'">쿠키 확인하러 가기</button>
</body>
</html>