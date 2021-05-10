<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#loginDiv{
		height:1180px;
	}
	#loginDiv>h2{
		text-align: center;
		padding:100px 0;
	}
	.searchBtn{
		height:50px;
		width:300px;
		float:left;
		margin-left:390px;
		margin-right:390px;
		margin-top:1px;
	}
	#idInput, #emailInput{
		height:50px;
		width:300px;
		margin-left:390px;
		margin-right:390px;
	}
	
	#idInput, #emailInput{
		padding-left:10px;
	} 
	#searchBtn{
		background-color: rgb(252,118,45);
		color:white;
		font-weight:700;
	}
	#idInput, #emailInput{
		margin-top:5px;
	}
	#searchBtn{
		margin-top:30px;		
	}
	.popupForm{
		height:250px;
		width:400px;
		background-color:#ddd;
	}
	.popupForm>h2{
		text-align:center;
		padding-top:50px;
	}
	.popupForm>div{
		font-size:17px;
		text-align:center;
	}
	.popupForm>input{
		margin-left:50px;
		margin-right:50px;
		margin-top:10px;
	}
</style>
<div class="section" id="loginDiv">
	<h2>아이디 찾기</h2>
	<form>
		<input type="text" name="userid" placeholder="아이디를 입력해주세요" id="idInput"/><br/>
		<input type="password" name="userpwd" placeholder="가입 시 등록하신 이메일주소를 입력해주세요" id="emailInput"/><br/>
		<input type="button" value="아이디 찾기" id="searchBtn" class="searchBtn"/>
	</form>
	<div class="popupForm">
		<h2>아이디 찾기</h2>
		<div>고객님께서 입력하신 정보가<br/>정확한지 확인 후 다시 시도해주세요.</div>
		<input type="button" value="아이디 찾기" class="searchBtn"/>
	</div>
	<div class="popupForm">
		<h2>아이디 찾기</h2>
		<div>고객님 이메일로<br/>아이디를 보냈습니다.<br/>확인 후 로그인해주세요,</div>
		<input type="button" value="확인" class="searchBtn"/>
	</div>
</div>