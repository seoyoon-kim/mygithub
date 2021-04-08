<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<h1>회원정보수정</h1>
	<form method="post" action="/home/memberEditOk">
		아이디 : ${vo.userid}<br/>
		비밀번호 :<input type="password" name="userpwd"/><br/>
		이름 :   ${vo.username}<br/>
		연락처 :  <input type="text" name="tel1" value="${vo.tel1}"/>-
				<input type="text" name="tel2" value="${vo.tel2}"/>-
				<input type="text" name="tel3" value="${vo.tel3}"/><br/>
		이메일 :  <input type="text" name="emailid" value="${vo.emailid}"/>@<input type="text" name="emaildomain" value="${vo.emaildomain}"/><br/>
		우편번호 : <input type="text" name="zipcode" value="${vo.zipcode}"/><br/>
		주소 : 	<input type="text" name="addr"value="${vo.addr}"/><br/>
		상세주소 : <input type="text" name="detailaddr"value="${vo.detailaddr}"/><br/>
		관심분야 : <input type="checkbox" name="interestArr" value="컴퓨터" <c:forEach var="i" items="${vo.interestArr}"><c:if test="${i=='컴퓨터'}">checked</c:if></c:forEach>>컴퓨터
				<input type="checkbox" name="interestArr" value="목탁" <c:forEach var="i" items="${vo.interestArr}"><c:if test="${i=='목탁'}">checked</c:if></c:forEach>>목탁
				<input type="checkbox" name="interestArr" value="불경" <c:forEach var="i" items="${vo.interestArr}"><c:if test="${i=='불경'}">checked</c:if></c:forEach>>불경 
				<input type="checkbox" name="interestArr" value="자바" <c:forEach var="i" items="${vo.interestArr}"><c:if test="${i=='자바'}">checked</c:if></c:forEach>>자바 
				<input type="checkbox" name="interestArr" value="스프링" <c:forEach var="i" items="${vo.interestArr}"><c:if test="${i=='스프링'}">checked</c:if></c:forEach>>스프링
				<input type="checkbox" name="interestArr" value="JSP" <c:forEach var="i" items="${vo.interestArr}"><c:if test="${i=='JSP'}">checked</c:if></c:forEach>>JSP  
				<input type="submit" value="회원정보수정하기"/>
	</form>
</div> 

</body>
</html>