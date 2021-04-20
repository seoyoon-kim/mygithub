<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#formUl>li:nth-child(2n+1){
		width:20%;
	}
	#formUl>li:nth-child(2n){
		width:80%;
	}
	#formUl>li span{
		color:red;
	}
	#formUl, #formUl li{
		padding:0px;
		margin:0px;
	}
</style>
<div class="section">
	<h1>회원가입</h1><span>*</span>표시는 필수입력항목입니다
	<hr/>
	<form>
	<ul id="formUl">
		<li><span>*</span>아이디</li> 		<li><input type="text" name="userid"/><input type="button" value="중복검사"/></li>		
		<li><span>*</span>비밀번호</li>		<li><input type="text" name="userpwd"/></li>	
		<li><span>*</span>비밀번호 확인</li>	<li><input type="text" name="userpwd2"/><div>일치하는지 확인해서 보여줄 부분임</div></li>	
		<li><span>*</span>이름</li>			<li><input type="text" name="username"/></li>		
		<li><span>*</span>이메일</li>			<li><input type="text" name="useremail"/><input type="button" value="인증하기"/></li>			
		<li><span>*</span>휴대폰</li>			<li><input type="text" name="userphone"/></li>			
		<li><span>*</span>주소</li>			<li><input type="button" name="userzipcode" value="우편번호 검색"/><input type="text" name="useraddr" readonly/><input type="text" name="userdetailaddr"></li>			
		<li><span>*</span>생년월일</li>		<li><input type="text" name="birthday"/></li>		
	</ul>
	<input type="radio">동의합니다.<br/>
	<input type="radio">본인은 만 14세 이상입니다.<br/>
	<input type="submit" value="가입하기">
	</form>
</div>
</body>
</html>