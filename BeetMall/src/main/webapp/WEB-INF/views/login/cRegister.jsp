<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#formUl>li:nth-child(2n+1){
		width:19%;
		text-align:right;
		margin-right:5px;
	}
	#formUl>li:nth-child(2n){
		width:78%;
		margin-left:5px;
	}
	.spanstar{
		color:red;
	}
	#userinputDiv>h2{
		padding-top: 20px;
		padding-left: 20px;
	}
	#infoCheckDiv{
		padding-top:20px;
	}
	#formUl, #formUl li{
		padding:0px;
		padding-top:5px;
		margin:0px;
	}
	#register{
		font-size:20px;
	}
	#userinputDiv{
		height:500px;
		background-color:white;
	}
	#infoView, #infoView2{
		width:1080px;
		height:50px;
		background-color:rgb(224,102,102);
		color:white;
		line-height:50px;
		font-size:25px;
		padding-left:10px;
	}
	.btnClass{
		background-color:rgb(224,102,102);
		color:white;
		border:none;
		border-radius:5%;
		width:100px;
		height:40px;
		margin:1px;
		padding:1px;
	}
	#infosubmit{
		margin-left:490px;
	}
</style>
<script>
	$(function(){
		$("#infoView").click(function(){
			$(this).css("height","500px").css("background-color","white").css("border","3px solid rgb(224,102,102)").css("color","black").css("transition", "0.5s");
			$(this).html("약관내용 주우욱~~~ 나오는 부분");
		});
		$("#infoView2").click(function(){
			$(this).css("height","500px").css("background-color","white").css("border","3px solid rgb(224,102,102)").css("color","black").css("transition", "0.5s");
			$(this).html("약관내용 주우욱~~~ 나오는 부분");
		});
		$("#infocheck1").click(function(){
			$(this).prop("checked", true).prop("disabled", true);
			$("#hinfocheck1").val('Y');
		});
		$("#infocheck2").click(function(){
			$(this).prop("checked", true).prop("disabled", true);
			$("#hinfocheck2").val('Y');
		});
		$("#infocheck3").click(function(){
			$(this).prop("checked", true).prop("disabled", true);
			$("#hinfocheck3").val('Y');
		});
		$("#infosubmit").click(function(){
			if($("#hinfocheck1").val() != "Y") {
				alert("약관에 동의해주세요!");
				return false;
			}
			if($("#hinfocheck2").val() != "Y"){
				alert("약관에 동의해주세요!");
				return false;
			}
			if($("#hinfocheck3").val() != "Y"){
				alert("약관에 동의해주세요!");
				return false;
			}
			location.href="/sshj";
			return true;
		})
	});
</script>
<div class="section">
	<div id="register">
		<div id="userinputDiv">
		<h2>회원가입</h2><span class="spanstar">*</span>표시는 필수입력항목입니다
		<hr/>
		<form>
		<input type="hidden" name="idcheck" value="N"/>		
		<input type="hidden" id="hinfocheck1" value="N"/>		
		<input type="hidden" id="hinfocheck2" value="N"/>		
		<input type="hidden" id="hinfocheck3" value="N"/>		
			<ul id="formUl">
				<li><span class="spanstar">*</span>아이디</li> 		<li><input type="text" name="userid" style="margin-right:5px;"/><input type="button" value="중복검사"/></li>
				<li><span class="spanstar">*</span>비밀번호</li>		<li><input type="text" name="userpwd"/></li>	
				<li><span class="spanstar">*</span>비밀번호 확인</li>	<li><input type="text" name="userpwd2" style="float:left"/><div id="passwordCheck" style="margin-left:200px"></div></li>	
				<li><span class="spanstar">*</span>이름</li>			<li><input type="text" name="username"/></li>		
				<li><span class="spanstar">*</span>이메일</li>			<li><input type="text" name="useremail" style="margin-right:5px;"/><input type="button" value="인증하기""/></li>			
				<li><span class="spanstar">*</span>휴대폰</li>			<li><input type="text" name="userphone"/></li>			
				<li><span class="spanstar">*</span>주소</li>			<li><input type="button" name="userzipcode" value="우편번호 검색" style="margin-right:5px;"/><input type="text" name="useraddr" readonly/><br/><input type="text" name="userdetailaddr" style="margin-top:5px; width:302px;"></li>			
				<li><span class="spanstar">*</span>생년월일</li>		<li><input type="text" name="birthday"/></li>		
			</ul>
		</form>
		</div>
		<div id="infoCheckDiv">
			<div id="infoView">▼위치기반 서비스 이용약관</div>
			<input type="checkbox" id="infocheck1" value="infocheck1" />&nbsp;동의합니다.<br/>
			<div id="infoView2">▼서비스, 개인수집 및 이용약관</div>
			<input type="checkbox" id="infocheck2" value="infocheck2"/>&nbsp;동의합니다. <br/>
			<input type="checkbox" id="infocheck3" value="infocheck3"/>본인은 만 14세 이상입니다.
			<div style="margin-bottom:20px;"><input type="submit" value="가입하기" class="btnClass" id="infosubmit"></div>
		</div>
	</div>
</div>
</body>
</html>