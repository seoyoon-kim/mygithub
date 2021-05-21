<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
	#formUl, #formUl li{
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
	}
	#register{
		font-size:20px;
		padding-top:10px;
	}
	#userinputDiv{
		height:400px;
		background-color:white;
		margin-bottom:10px;
	}
	#idCheckDibPop, #emailSend, #emailCheckBtn, #zipSearch{
		padding:3px;
		font-size:12px;
	}
	#infoView, #infoView2{
		width:1080px;
		height:480px;
		background-color:white;
		border:rgb(252,118,45);
		color:black;
		font-size:25px;
		padding-left:10px;
		line-height:30px;
		overflow-x:hidden;
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
	.radiusClass{
		border-radius:5px;
	}
	.alertDiv{
		height:200px;
		width:400px;
		background-color:white;
		border:10px solid rgb(252,118,45);
		text-align:center;
		position: absolute;
		top:50%;
		left:340px;
	}
	#alertDivClose{
		height:50px;
		widht:100px;
	}
	.idCheckDiv{
		height:300px;
		width:500px;
		background-color:white;
		border:10px solid rgb(252,118,45);
		text-align:center;
		position: absolute;
		top:180px;
		left:295px;
		display:none;
		padding-top:20px;
	}
	#idCheckFin{
		display:none;
		width:100px;		
		margin-left:150px;
		float:left;
	}
	#popupcloseBtn{
		display:block;
		width:100px;
		margin-top:200px;
		margin-left:200px;
		float:left;
	}
	.infoView{
		overflow:scroll;
		white-space: pre-line;
		font-size:14px;
	}
	#usermap{
		height: 250px;
		width:250px;
		position: absolute;
		background-color: orange;
		top:227px;
		left:700px;
		display:none;
	}
	#modal{
		background-color: gray;
		opacity: 0.6;
		position: fixed;
		left:0px;
		top:0px;
		width:100%;
		height:100%;
		display:none;
	}
	#formUl{
		font-size:14px;
		height:25px;
		line-height: 25px;
	}
	.infotitles, .infoView{
		margin-top:5px;
		margin-bottom:5px;
	}
	.checkboxright{
		float:right;
		font-size:14px;
		color:red;
		padding-right:5px;
	}
	#userid2{
		width:280px;
	}
	#idCheckResult>div:first-child{
		margin-top:40px;
	}
</style>
<script>
	$(function(){
		$("#infoView").css("height","350px").css("background-color","white");
		var params = 'infoname=이용약관';
		$.ajax({
			url:"userinfo",
			data : params,
			success : function(data){
				console.log(data);
				$("#infoView").html(data).addClass("infoView").css("font-size","14px").css("border","1px solid #ddd");
			}, error : function(){
				alert("약관 오류발생...");
			}
		});
		$("#infoView2").css("height","350px").css("background-color","white");
		var params = 'infoname=개인정보처리방침';
		$.ajax({
			url:"userinfo",
			data : params,
			success : function(data){
				console.log(data);
				$("#infoView2").html(data).addClass("infoView").css("font-size","14px").css("border","1px solid #ddd");
			}, error : function(){
				alert("약관 오류발생...");
			}
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
			if($("#checkIdResult").val()=='N'){
				alert("아이디 중복검사를 진행해주세요");
				return false;
			}
			if($("#checkEmailResult").val()=='N'){
				alert("이메일 인증을 진행해주세요");
				return false;
			}
			if($("#userpwd").val()==null || $("#userpwd").val()==''){ 
				alert("비밀번호를 입력해주세요"); 
				return false;
			}
			if($("#userpwd").val() != $("#userpwd2").val()){ 
				alert("비밀번호 확인과 비밀번호가 일치하지 않습니다."); 
				return false;
			}
			if($("#username").val()==null || $("#username").val()==''){ 
				alert("이름을 입력해주세요"); 
				return false;
			}
			if($("#userphone2").val()==null || $("#userphone2").val()==''|| $("#userphone3").val()==null || $("#userphone3").val()==''){ 
				alert("휴대폰 번호를 입력해주세요"); 
				return false;
			}
			if($("#userzipcode").val()==null || $("#userzipcode").val()==''){ 
				alert("주소를 입력해주세요"); 
				return false;
			}
			if($("#useraddr").val()==null || $("#useraddr").val()==''){ 
				alert("주소를 입력해주세요"); 
				return false;
			}
			if($("#userdetailaddr").val()==null || $("#userdetailaddr").val()==''){ 
				alert("주소를 입력해주세요"); 
				return false;
			}
			if($("#birthday").val()==null || $("#birthday").val()==''){ 
				alert("생년월일을 입력해주세요"); 
				return false;
			}
			
			
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
			
			// 맨 밑부분
			if(regCheck()==false){
				return false;
			}else{
				$("#regiFrm").submit();
			}
			return true;
		});
		
		// 중복검사 창 띄우기
		function overlapIdCheck(){
			$("#modal").css("display","block");
			$(document.body).css("overflow","hidden");
			$(".idCheckDiv").css("display","block");
			$("#popupcloseBtn").css("margin-left","200px").css("margin-top","150px");			
		}
		$("#idCheckDibPop").click(function(){
			overlapIdCheck();
		});
		$("#userid").click(function(){
			overlapIdCheck();
		});
		
		// 중복확인
		$("#idCheck").click(function(){
			if($("#userid2").val()!=null && $("#userid2").val()!=''){
				var url = "idOverLap";
				var params = "Checkid="+$("#userid2").val();
				$.ajax({
					url : url,
					data : params,
					success : function(data){
						console.log(data);
						var result = "";
						if(idCheck()!=false){
							if(data>=1){
								result = "<div><h3>"+$("#userid2").val()+"는 사용할 수 없습니다.</h3></div>";
								result += "<div><h4>다른 아이디를 입력해주세요</h4></div>";
								$("#popupcloseBtn").css("margin-left","200px").css("margin-top","45px");
								$("#idCheckFin").css("display","none");
								
							}else{
								result = "<div><h3>"+$("#userid2").val()+"는 사용할 수 있습니다.</h3></div>";
								result += "<div><h4>사용하시려면 아래 버튼을 눌러주세요</h4></div>";
								/* result += "<div><input type='button' value='사용하기' id='idCheckSuccess'/></div>"; */
								$("#popupcloseBtn").css("margin-left","5px").css("margin-right","85px").css('margin-top',"45px");
								$("#idCheckFin").css('margin-top',"45px");
								$("#idCheckFin").css("display","block");
							}
								$("#idCheckResult").empty();
								$("#idCheckResult").append(result);
						}
					}, error : function(){
						console.log(params);
						alert("오류 발생... 고객센터로 연락 부탁드립니다..");
					}
				});
			}else{
				alert("아이디를 입력해주세요");
			}
		});
		
		
		// 중복검사 후 사용하기 눌렀을 때
		$("#idCheckFin").click(function(){
			if(idCheck()!=false){
				var checkid = $("#userid2").val();
				if($("#userid2").val()!=null && $("#userid2").val()!=''){
					$("#userid").val(checkid);
					$("#checkIdResult").val('Y');
					/* $("#userid").attr('disabled',true); */
					popupClose();
					$("#modal").css("display","none");
					$(document.body).css("overflow","visible");
				}
			}else{
				return false;
			}
		});
		
		// 중복검사 도중에 창을 닫을 때
		$("#popupcloseBtn").click(function(){
			popupClose();
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
		});
		
		// 중복검사 후 아이디 수정하면 못하게 하는 부분
		$("#userid").change(function(){
			$("#checkIdResult").val('N');
		});
		
		// 주소검색
		$("#zipSearch").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            $("#userzipcode").val(data.zonecode);
		            $("#useraddr").val(data.address);
		            document.getElementById('userdetailaddr').focus();
		        }
		    }).open();
		});
		
		// 이메일 인증코드 전송
		$("#emailSend").click(function(){
			if(emailCheckCustom()!=false){
				var url = 'emailSend';
				var param = "SendToEmail="+$("#useremail").val();
				$.ajax({
					url : url,
					data : param,
					success :function(data){
						alert("인증코드 전송에 성공했습니다. 이메일을 확인해주세요!");
					}, error : function(){
						alert("인증코드 전송에 실패하였습니다 잠시후 다시 시도해주세요");
					}
				})
			}
		})
		
		// 이메일 인증코드 확인
		$("#emailCheckBtn").click(function(){
			if($("#emailCheck").val()!=null || $("#emailCheck").val()!=''){
				var url = 'emailCheck';
				var param = "emailCode="+$("#emailCheck").val();
				$.ajax({
					url : url,
					data : param,
					success : function(data){
						console.log(data);
						if(data == 1){
							alert("인증에 성공하였습니다.");							
							$("#checkEmailResult").val('Y');
							$("#useremail").attr("readonly",true);
						}else{
							alert("인증코드가 일치하지 않거나 인증에 실패하였습니다.");
						}
					}, error : function(){
						alert("인증에 실패하였습니다.");
					}
				});
			}
		})
	});
	
	// 아이디 검색 팝업 닫기
	function popupClose(){
		$("#idCheckResult").empty();
		$(".idCheckDiv").css("display","none");
		$("#userid2").val('');
		$("#idCheckFin").css("display","none");
	}
	// 아이디 한번 더 검사
	function idCheck(){
		var idreg = /^[a-zA-z0-9]{6,15}$/;
		if(!idreg.test(document.getElementById("userid2").value)){
			alert("아이디는 6~15자리 사이의 영어와 숫자만 사용할 수 있습니다.");
			return false;
		}
	}
	
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
		if(!emailreg.test(document.getElementById("useremail").value)){
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
	}
	// 이메일 검사
	function emailCheckCustom(){
		var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if($("#useremail").val()==null||$("#useremail").val()==''){
			alert("이메일을 입력하세요")
			return false;
		}else if(!emailreg.test(document.getElementById("useremail").value)){
			alert("이메일이 잘못 입력되었습니다.");
			return false;			
		}
	}
</script>

<div class="section"id="regiclass">
	<div id="register" style="position: relative;">
		<h2>회원가입</h2><span class="spanstar">*</span>표시는 필수입력항목입니다
		<hr/>
		<div id="userinputDiv">
		<form method="post" action="cregiFinish" id="regiFrm">
		<input type="hidden" id="hinfocheck1" value="N"/>
		<input type="hidden" id="hinfocheck2" value="N"/>
		<input type="hidden" id="hinfocheck3" value="N"/>
		<input type="hidden" id="checkIdResult" value="N"/>
		<input type="hidden" id="checkEmailResult" value="N"/>
		
			<ul id="formUl">
				<li><span class="spanstar">*</span>아이디</li> 		<li><input type="text" name="userid" id="userid" style="margin-right:5px;" readonly/><input type="button" value="중복검사" class="btn" id="idCheckDibPop"/></li>
				<li><span class="spanstar">*</span>비밀번호</li>		<li><input type="password" name="userpwd" id="userpwd"/></li>	
				<li><span class="spanstar">*</span>비밀번호 확인</li>	<li><input type="password" id="userpwd2" style="float:left"/><div id="passwordCheck" style="margin-left:200px"></div></li>	
				<li><span class="spanstar">*</span>이름</li>			<li><input type="text" name="username" id="username"/></li>		
				<li><span class="spanstar">*</span>이메일</li>			<li><input type="text" name="useremail" id="useremail" style="margin-right:5px;"/><input type="button" value="인증코드 전송" class="btn" id="emailSend"/></li>
				<li></li>												<li><input type="text" name="emailCheck" id="emailCheck" style="margin-right:5px;"/><input type="button" value="인증하기" class="btn" id="emailCheckBtn"/></li>
							
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
																			<input type="text" name="userphone2" id="userphone2" style="width:80px;" maxlength="4"/> -
																			<input type="text" name="userphone3" id="userphone3" style="width:80px;" maxlength="4"/></li>
				<li><span class="spanstar">*</span>주소</li>			<li><input type="button"  id="zipSearch" value="우편번호 검색" style="margin-right:5px;" class="btn"/>
																		<input type="text" name="userzipcode" id="userzipcode" readonly  style="width:100px;"/>
																		<input type="text" name="useraddr" id="useraddr" style="margin-top:5px; width:400px;"readonly placeholder="우편 번호 검색을 통해 입력해주세요"/>
																		<input type="text" name="userdetailaddr" id="userdetailaddr" style="margin-top:5px; width:420px;" placeholder="상세 주소 입력"/></li>			
				<li><span class="spanstar">*</span>생년월일</li>		<li><input type="date" name="birthday" id="birthday"/></li>
			</ul>
		</form>
		</div>
		<div id="infoCheckDiv">
			<span class="infotitles">▼이용약관</span>
			<div id="infoView"class="radiusClass"></div>
			<input type="checkbox" id="infocheck1" value="infocheck1" class="checkboxright"/><span class="checkboxright">&nbsp;동의합니다.</span><br/>
			<span class="infotitles">▼개인정보 처리방침</span>
			<div id="infoView2"class="radiusClass"></div>
			<input type="checkbox" id="infocheck2" value="infocheck2" class="checkboxright"/><span class="checkboxright">&nbsp;동의합니다.</span><br/>
			<input type="checkbox" id="infocheck3" value="infocheck3" class="checkboxright"/><span class="checkboxright">본인은 만 14세 이상입니다.</span>
			<div style="margin-bottom:60px;margin-top: 70px;"><input type="submit" value="가입하기" class="btnClass" id="infosubmit"></div>
		</div>
		<div id="modal"></div>
			<div class="idCheckDiv">
				<input type="text" name="userid2" id="userid2" style="margin-right:5px;"/>
				<input type="button" value="중복검사" class="btn" id="idCheck"/>
				<div id="idCheckResult"></div>
				<input type="button" value="사용하기" class="btn" id="idCheckFin"/><input type="button" value="닫기" class="btn" id="popupcloseBtn"/>
			</div>
		<div id="usermap">
			
		</div>
		
	</div>
</div>
</body>
</html>