<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#cMyPageLeft{
		display: block;
	}
	#myInfoDiv{
		height:1180px;
		font-size:20px;
	}
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
	button, .btn{
		padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
		margin:0 3px;
	}
	/*버튼*/
	.btn:hover{
		background: gray;
		color:white;
		display: inline-block;
	}
</style>
<div class="section" id="myInfoDiv">
	<div id="userinputDiv">
		<h2>정보수정</h2><span class="spanstar">*</span>표시는 필수입력항목입니다
		<hr/>
		<form>	
			<ul class="formUl">
				<li><span class="spanstar">*</span>아이디</li> 		<li><input type="text" name="userid" style="margin-right:5px;" disabled value="userid"/></li>
				<li><span class="spanstar">*</span>비밀번호</li>		<li><input type="text" name="userpwd"/></li>	
				<li><span class="spanstar">*</span>비밀번호 확인</li>	<li><input type="text" name="userpwd2" style="float:left"/><div id="passwordCheck" style="margin-left:200px"></div></li>	
				<li><span class="spanstar">*</span>이름</li>			<li><input type="text" name="username" value="username" disabled/></li>		
				<li><span class="spanstar">*</span>이메일</li>			<li><input type="text" name="useremail" style="margin-right:5px;"/><input type="button" class="btn" value="인증하기"/></li>			
				<li><span class="spanstar">*</span>휴대폰</li>			<li><input type="text" name="userphone"/></li>			
				<li><span class="spanstar">*</span>주소</li>			<li><input type="button" name="userzipcode" class="btn"  style="width:145px;"value="우편번호 검색" style="margin-right:5px;"/><input type="text" name="useraddr" readonly/><br/><input type="text" name="userdetailaddr" style="margin-top:5px; width:302px;"></li>			
				<li><span class="spanstar">*</span>생년월일</li>		<li><input type="text" name="birthday" value="birth" disabled/></li>		
			</ul>
		</form>
		</div>
		<h4>나중에 여기 페이지 올때 판매자, 소비자 구분해서 아래 부분 생략할 것</h4>
		<div id="sellerForm">
			<ul class="formUl" id="sFrm">
				<li><span class="spanstar">*</span>상호명</li> 			<li><input type="text" name="storename" style="margin-right:5px;"/><input type="button" class="btn" value="중복검사"/></li>
				<li><span class="spanstar">*</span>대표자</li>				<li><input type="text" name="sellername"/></li>	
				<li><span class="spanstar">*</span>사업장등록번호</li>		<li><input type="text" name="sellerreginum" style="float:left"/><div id="passwordCheck" style="margin-left:200px"></div></li>	
				<li><span class="spanstar">*</span>사업자등록증 첨부</li>	<li><input type="file" name="sellerregiimg" class="btn"/></li>
				<li></li>								<li><div id="notice">※사업자등록번호 도용 방지를 위해 기업인증을 시행하고 있습니다.<br/>
																※사업자등록증을 첨부해주세요. 관리 절차에 따라 가입이 승인됩니다.<br/>
																※인증이 되지 않을 경우 고객센터(02-111-1111)로 문의해주세요.<br/>
																<span class="spanstar">※안전한 거래를 위해서 관리자의 승인 후에 수정이 이루어집니다.</span></div></li>		
				<li><span class="spanstar">*</span>사업장소재지</li>		<li><input type="button" name="storeaddr" class="btn"  style="width:145px;"value="우편번호 검색" style="margin-right:5px;"/><input type="text" name="useraddr" readonly/><br/><input type="text" name="userdetailaddr" style="margin-top:5px; width:302px;"></li>				
				<li><span class="spanstar">*</span>은행</li>				<li><select name="bank">
															<option value="index">은행명선택</option>  
															<option value="nonghub">농협</option>  
															<option value="sinhan">신한은행</option>  
															<option value="kakaobank">카카오뱅크</option>  
														</select></li>			
				<li><span class="spanstar">*</span>계좌번호</li>			<li><input type="text" name="bankaccount"/></li>
				<li><span class="spanstar">*</span>예금주</li>				<li><input type="text" name="bankname"/></li>
				<li><span class="spanstar">*</span>이메일</li>				<li><input type="text" name="storeemail" style="margin-right:5px;"/><input type="button" class="btn" value="인증하기"/></li>
			</ul>
			<div style="margin-bottom:20px; padding-top:20px"><input type="submit" value="가입하기" class="btn" id="infosubmit"></div>
		</div>

</div>