<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#cMyPageLeft{
		display: block;
	}
	.buytitle{
		font-size:1.1em;
	}
	.buydetail{
		font-size:0.9em;
		color:#999;
	}
	.wordcut{
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.buybutton{
		width:70px;
		height:35px;
		line-height:35px;
		text-align:center;
		margin:1px;
		padding:0px;
		border: none;
		background-color:rgb(252,118,45);
		color:white;
		border-radius: 5px;
	}
	.buybuttonNo{
		width:70px;
		height:35px;
		line-height:35px;
		text-align:center;
		margin:1px;
		padding:0px;
		border: none;
		background-color:rgb(252,118,45);
		color:white;
		border-radius: 5px;
		opacity:60%;
	}
	.buyListDiv{
		position:absolute;
		top:500px;
		background-color: white;
	}
	.buyListDiv, .leavepopupBar, .leavepopupContent{
		width:680px;
	}
	.leavepopupBar{		
		height:50px;
		background-color: rgb(252,118,45);
		position:absolute;
		color:white;
		text-align: center;
		line-height: 50px;
	}
	.leaveListBarClose{
		height:50px;
		width:50px;
		background-color: white;
		position:absolute;
		font-size:40px;
		line-height:40px;
		text-align:center;
		border:1px solid rgb(252,118,45);
		left:630px;
	}
	.leavepopupContent{
		height:700px;
		border:1px solid rgb(252,118,45);
	}
	.leaveBtn{
		position:absolute;
		width:100px;
		height: 50px;
		top:600px;
		left:290px;
		background-color:rgb(252,118,45);
		color:white;
		border:none;
	}
	#leaveDiv{
		padding-top:20px;
		padding-left:20px;
		height:900px;
	}
	#leaveDiv>div>form{
		margin-top:40px;
		text-align:center;
	}
	#leaveDiv>div>h3{
		text-align:center;
	}
	#pwdInput{
		width:300px;
		height:40px;
	}
	#leaveCheck, #leaveCancel{
		width:100px;
		height:40px;
		background-color:rgb(252,118,45);
		color:white;
		border:none;
	}
	#leaveCheck{
		margin-top:30px;
	}
</style>
<script>
	$(function(){
		$(".leaveBtn").click(function(){
			$(this).parent().parent().css('display',"none");
		})
		$(".leaveListBarClose").click(function(){
			$(this).parent().css("display","none");
		})
	});
</script>
<div class="section" id="leaveDiv">
	<h2>회원 탈퇴</h2>
	<h4>정말로 탈퇴하시겠습니까?</h4>
	<div>
		<h3>비밀번호를 입력해주세요</h3>
		<form method="post" action="leaveMemberOk">
			<input type="password" placeholder="비밀번호를 입력해주세요" id="pwdInput"/><br/>
			<input type="submit" value="탈퇴" id="leaveCheck"/>
			<input type="button" value="취소" id="leaveCancel"/>
		</form>
	</div>
	
	<div class="buyListDiv" id="buyCancelRollBack">
		<div class="leavepopupBar" style="font-size:21px;">탈퇴 실패</div><div class="leaveListBarClose">&times;</div>
		<div class="leavepopupContent" style="text-align: center;padding-top:100px; height:340px;">
			<h2>현재 등록중/배송중인 상품이 있습니다.</h2>
			<h2>회원탈퇴가 불가능합니다.</h2>
			<input type="button" value="확인" class="leaveBtn" id="leaveBtn" style="top:240px"/>
		</div>
	</div>	
</div>