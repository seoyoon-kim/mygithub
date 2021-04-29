<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#loginDiv{
		height:1080px;
	}
	#loginDiv>h2{
		text-align: center;
		padding:100px 0;
	}
	#loginBtn, #registerBtn, #googleLogin, #naverLogin, #kakaoLogin{
		height:50px;
		width:300px;
		float:left;
		margin-left:390px;
		margin-right:390px;
		margin-top:1px;
	}
	#idInput, #pwdInput, #logStatus{
		height:50px;
		width:300px;
		margin-left:390px;
		margin-right:390px;
	}
	
	#idInput, #pwdInput{
		padding-left:10px;
	}
	#logStatus a:link, #logStatus a:active, #logStatus a:visited, #logStatus a:hover{
		color:black;
	} 
	#logStatus{
		margin-bottom:60px;
		text-align:right;
		font-size:17px;
		line-height: 35px;
	}
	#logStatus>div{
		text-align: center;
	}
	#loginBtn{
		background-color: rgb(94, 94, 94);
		color:white;
		font-weight:700;
	}
	#registerBtn{
		background-color: rgb(224, 224, 224);
		color:black;
		font-weight:700;
	}
	#googleLogin{
		background-color:rgb(204, 55, 49);
		color:white;
		margin-top:15px;
		font-weight:700;
	}
	#naverLogin{
		background-color:rgb(29, 200, 0);
		color:white;
		font-weight:700;

		
	}
	#kakaoLogin{
		background-color:rgb(255, 235, 0);
		color:black;
		font-weight:700;
	}
	.loginBtn{
		border:none;
	}
</style>
<div class="section" id="loginDiv">
	<h2>로그인</h2>
	<form method="post" action="loginOk">
		<input type="text" name="userid" placeholder="아이디를 입력해주세요" id="idInput" value="tester"/><br/>
		<input type="password" name="userpwd" placeholder="비밀번호를 입력해주세요" id="pwdInput" value="1234!!"/><br/>
		<div id="logStatus">
			<input type="checkbox" name="logalways"/>로그인상태유지
			<div><a href="searchId" id="searchId">아이디찾기</a> | <a href="searchPwd" id="searchPwd">비밀번호찾기</a></div>
		</div>
		<input type="submit" value="로그인" id="loginBtn"/>
		<input type="button" value="회원가입" id="registerBtn"/>
		<input type="button" value="Google 로그인" id="googleLogin" class="loginBtn"/>
		<input type="button" value="네이버 로그인" id="naverLogin" class="loginBtn"/>
		<input type="button" value="Kakao 로그인" id="kakaoLogin" class="loginBtn"/>
	</form>
	
</div>