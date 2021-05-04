<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	.formUl>li:nth-child(2n+1){
		width:19%;
		text-align:right;
		margin-right:5px;
	}
	.formUl>li:nth-child(2n){
		width:78%;
		margin-left:5px;
	}
	.spanstar{
		color:red;
	}
	.formUl, .formUl li{
		padding:0px;
		padding-top:5px;
		margin:0px;
	}
	#userinputDiv>h2{
		padding-top: 20px;
		padding-left: 20px;
	}
	#infoCheckDiv{
		padding-top:20px;
		padding-bottom:30px;
		border-bottom: 1px solid rgb(252,118,45);
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
		background-color:rgb(252,118,45);
		color:white;
		line-height:50px;
		font-size:25px;
		padding-left:10px;
	}
	.btnClass{
		background-color:rgb(252,118,45);
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
	#sFrm{
		margin-bottom: 30px;
	}
	#notice{
		font-size:0.8em;
		color:#aaa;
	}
	.radiusClass{
		border-radius:5px;
	}
</style>
<script>
	$(function(){
		$("#infoView").click(function(){
			$(this).css("height","500px").css("background-color","white").css("border","3px solid rgb(252,118,45)").css("color","black").css("transition", "0.5s");
			$(this).html("약관내용 주우욱~~~ 나오는 부분");
		});
		$("#infoView2").click(function(){
			$(this).css("height","500px").css("background-color","white").css("border","3px solid rgb(252,118,45)").css("color","black").css("transition", "0.5s");
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
			
			return true;
		})
	});
	function regCheck(){
		// 아이디 검사
		var idreg = /^[a-zA-z0-9]{6,15}$/;
		if(!idreg.test(document.getElementById("userid").value)){
			alert("아이디는 6~15자리 사이의 영어와 숫자만 사용할 수 있습니다.");
			return false;
		}
		// 비밀번호 검사
		var pwdreg = /^[A-Za-z1-9!@#]{6,15}$/;
		if(!pwdreg.test(document.getElementById("userpwd").value)){
			alert("비밀번호는 6~15자리, 특수문자는!@#만 사용 가능합니다.");
			return false;
		}
		// 이름 검사
		var namereg = /^[가-힣]{2,4}$/;
		if(!namereg.test(document.getElementById("username").value)){
			alert("이름은 2~4글자만 가능합니다.");
			return false;
		}
		
		// 이메일 검사
		var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if(!emailreg.test(document.getElementById("useremail1").value)){
			alert("이메일이 잘못 입력되었습니다.");
			return false;			
		}
		
		// 전화번호 검사
		var midtelreg=/^[0-9]{3,4}$/;
		if(!midtelreg.test(document.getElementById("userphone2").value)){
		  alert("전화번호를 잘못입력하였습니다...");
		  return false;
		}
		
		var lasttelreg=/^[0-9]{4}$/;
		if(!lasttelreg.test(document.getElementById("userphone3").value)){
		  alert("전화번호를 잘못입력하였습니다...");
		  return false;
		}
		
		// 대표자 검사
		if(!namereg.test(document.getElementById("sellername").value)){
			alert("이름은 2~4글자만 가능합니다.");
			return false;
		}
		
		// 계좌번호 검사
		var accountreg = /^[0-9]{11~15}$/;
		if(!accountreg.test(document.getElementById("bankaccount ").value)){
			alert("계좌번호는 숫자만 입력해주세요");
			return false;
		}
		
		// 판매자 이메일 검사
		
		if(!emailreg.test(document.getElementById("storeemail").value)){
			alert("이메일이 잘못 입력되었습니다.");
			return false;			
		}
	}
</script>
<div class="section">
	<div id="register">
		<div id="userinputDiv">
		<h2>회원가입</h2><span class="spanstar">*</span>표시는 필수입력항목입니다
		<hr/>
		<form method="post" action="regiFinish" id="regiFrm">
		<input type="hidden" name="idcheck" value="N"/>		
		<input type="hidden" id="hinfocheck1" value="N"/>		
		<input type="hidden" id="hinfocheck2" value="N"/>		
		<input type="hidden" id="hinfocheck3" value="N"/>		
			<ul class="formUl">
				<li><span class="spanstar">*</span>아이디</li> 		<li><input type="text" name="userid" id="userid" style="margin-right:5px;" value="tester"/><input type="button" value="중복검사"/></li>
				<li><span class="spanstar">*</span>비밀번호</li>		<li><input type="password" name="userpwd" id="userpwd" value="1234!!"/></li>	
				<li><span class="spanstar">*</span>비밀번호 확인</li>	<li><input type="password" id="userpwd2" style="float:left" value="1234!!"/><div id="passwordCheck" style="margin-left:200px"></div></li>	
				<li><span class="spanstar">*</span>이름</li>			<li><input type="text" name="username" id="username" value="테스터"/></li>		
				<li><span class="spanstar">*</span>이메일</li>			<li><input type="text" name="useremail1" id="useremail1" style="margin-right:5px;" value="tester@tester.com"/><input type="button" value="인증번호 전송"/></li>
				<li></li>												<li><input type="text" name="useremail2" id="useremail2" style="margin-right:5px;" value="123456"/><input type="button" value="인증하기"/></li>
							
				<li><span class="spanstar">*</span>휴대폰</li>			<li><select  id="userphone1" name="userphone1" style="height:30px;">
																			<option value="010">010</option>
																			<option value="02">02</option>
																			<option value="031">031</option>
																			<option value="032">032</option>
																			<option value="033">033</option>
																			<option value="041">041</option>
																			<option value="042">042</option>
																			<option value="043">043</option>
																			<option value="044">044</option>
																			<option value="051">051</option>
																			<option value="052">052</option>
																			<option value="053">053</option>
																			<option value="054">054</option>
																			<option value="055">055</option>
																			<option value="061">061</option>
																			<option value="062">062</option>
																			<option value="063">063</option>
																			<option value="064">064</option>
																			</select> -
																			<input type="text" name="userphone2" id="userphone2" value="1234" style="width:80px;" maxlength="4"/> -
																			<input type="text" name="userphone3" id="userphone3" value="1234" style="width:80px;" maxlength="4"/></li>
				<li><span class="spanstar">*</span>주소</li>			<li><input type="button"  id="zipSearch" value="우편번호 검색" style="margin-right:5px;"/>
																		<input type="text" name="userzipcode" id="userzipcode"  value="13579" readonly  style="width:100px;"/>
																		<input type="text" name="useraddr" id="useraddr" style="margin-top:5px; width:302px;" value="마포구 백범로 ">
																		<input type="text" name="userdetailaddr" id="userdetailaddr" style="margin-top:5px; width:540px;" value="신수로 51"></li>			
				<li><span class="spanstar">*</span>생년월일</li>		<li><input type="date" name="birthday" id="birthday" value="2020-04-01"/></li>
			</ul>
		</form>
		</div>
		<div id="infoCheckDiv">
			<div id="infoView" class="radiusClass">▼위치기반 서비스 이용약관</div>
			<input type="checkbox" id="infocheck1" value="infocheck1"  />&nbsp;동의합니다.<br/>
			<div id="infoView2" class="radiusClass">▼서비스, 개인수집 및 이용약관</div>
			<input type="checkbox" id="infocheck2" value="infocheck2"/>&nbsp;동의합니다. <br/>
			<input type="checkbox" id="infocheck3" value="infocheck3"/>본인은 만 14세 이상입니다.
		</div>
		<div>
			<ul class="formUl" id="sFrm">
				<li><span class="spanstar">*</span>상호명</li> 			<li><input type="text" name="storename" style="margin-right:5px;" id="storename"/></li>
				<li><span class="spanstar">*</span>대표자</li>				<li><input type="text" name="sellername" id="sellername"/></li>	
				<li><span class="spanstar">*</span>사업장등록번호</li>		<li><input type="text" name="sellerreginum" id="sellerreginum" style="float:left"/><div id="passwordCheck" style="margin-left:200px"></div></li>	
				<li><span class="spanstar">*</span>사업자등록증 첨부</li>	<li><input type="file" name="sellerregiimg" id="sellerregiimg"/></li>
				<li></li>								<li><div id="notice">※사업자등록번호 도용 방지를 위해 기업인증을 시행하고 있습니다.<br/>
																※사업자등록증을 첨부해주세요. 관리 절차에 따라 가입이 승인됩니다.<br/>
																※인증이 되지 않을 경우 고객센터(02-111-1111)로 문의해주세요.</div></li>		
				<li><span class="spanstar">*</span>사업장소재지</li>		<li><input type="button"  id="sellerzipSearch" value="우편번호 검색" style="margin-right:5px;"/>
																		<input type="text" name="storezipcode" id="storezipcode"  value="13579" readonly  style="width:100px;"/>
																		<input type="text" name="storeaddr" id="storeaddr" style="margin-top:5px; width:302px;" value="마포구 백범로 ">
																		<input type="text" name="storedetailaddr" id="storedetailaddr" style="margin-top:5px; width:540px;" value="신수로 51"></li>					
				<li><span class="spanstar">*</span>은행</li>				<li><select name="bank">
																		<option value="index">은행명선택</option>  
																		<option value="국민">국민</option>  
																		<option value="비씨">비씨</option>  
																		<option value="신한">신한</option>  
																		<option value="현대">현대</option>  
																		<option value="삼성">삼성</option>  
																		<option value="롯데">롯데</option>  
																		<option value="외환">외환</option>  
																		<option value="NH">NH</option>  
																		<option value="하나">하나</option>  
																		<option value="우리">우리</option>  
																		<option value="광주">광주</option>  
																		<option value="수협">수협</option>  
																		<option value="씨티">씨티</option>  
																		<option value="전북">전북</option>  
																		<option value="제주">제주</option>  
																		<option value="카카오뱅크">카카오뱅크</option>  
																		<option value="케이뱅크">케이뱅크</option>  
																		</select></li>			
				<li><span class="spanstar">*</span>계좌번호</li>			<li><input type="text" name="bankaccount" id="bankaccount"/></li>
				<li><span class="spanstar">*</span>예금주</li>				<li><input type="text" name="bankname" id="bankname"/></li>
				<li><span class="spanstar">*</span>이메일</li>				<li><input type="text" name="storeemail" id="storeemail" style="margin-right:5px;"/><input type="button" class="btnClass" value="인증하기"/></li>
			</ul>
			<div style="margin-bottom:20px; padding-top:20px"><input type="submit" value="가입하기" class="btnClass" id="infosubmit"></div>
		</div>
	</div>
</div>
</body>
</html>