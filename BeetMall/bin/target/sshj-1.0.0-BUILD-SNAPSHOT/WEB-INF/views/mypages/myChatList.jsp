<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	<style>
	#cMyPageLeft{
		display: block;
	}
	#mypointList{
		height:1080px;
		position:relative;
	}
	.Pbuttons{
		height:40px;
		width:80px;
		background-color: rgb(252,118,45);
		color:white;
		line-height:40px;
		text-align:center;
		border-radius:7%;
		margin-left:1px;
	}
	#pointSelectDate{
		float:right;
	}
	#pointSelectDate>div{
		float:left;
	}
	#pointUl{
		padding:30px 0px;
		margin:0px;
		width:1080px;
	}
	#pointUl>li{
		width:180px;
		height:60px;
		line-height:60px;
		margin:5px 0;
		text-align:center;
	}
	#pointUl>li:nth-child(1), #pointUl>li:nth-child(2), #pointUl>li:nth-child(3){
		border-bottom:1px solid rgb(252,118,45);
		font-size:20px;
	}
	#pointUl>li:nth-child(3n){
		width:300px;
	}
	#pointUl>li:nth-child(3n+2){
		width:600px;
	}
	.chatttitle, .chatdetail{
		line-height:30px;
		text-align:left;
		float:left;
		width:542px;
	}
	#pointUl>li:nth-child(3n+2) img{
		line-height:60px;
		float:left;
	}
	#pointUl img{
		height:58px;
		width:58px;
		float:left;
	}
	#cMyPageLeft{
		display:block;
	}
	.chattitle{
		font-size:1.1em;
	}
	.chatdetail{
		font-size:0.9em;
		color:#999;
	}
	.wordcut{
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.chatbutton{
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
	.chatbuttonNo{
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
	#mypointList>h2{
		margin-top:20px;
		margin-left:20px;
		margin-bottom:20px;
	}
	/* 채팅창 설정부분 */
	.chatDiv{
		height:540px;
		width:500px;
		background-color:rgb(252,118,45);
		position:absolute;
		border:1px solid rgb(252,118,45); 
	}
	.chatDivBar{
		height:10px;
		width:500px;
	}
	.chatDivTitle{
		height:30px;
		widht:500px;
		background-color:white;
		text-align:center;
		line-height:30px;
		border-bottom:1px solid rgb(252,118,45); 
	}
	.chatDivcontent{
		height:400px;
		width:498px;
		background-color:#ddd;
	}
	.chatDivInputBox{
		height:101px;
	}
	.chatInput, .chatInput>textarea{
		width:400px;
		height:100px;
		background-color:white;
		float:left;
	}
	.chatInput>textarea{
		border: 3px solid rgb(252,118,45);
	}
	.chatSendBtn{
		width:97px;
		height:100px;
		background-color: rgb(252,118,45);
		float:left;
		border:none;
		color:white;
	}
	.chatSendBtn>input{
		background-image: url(/sshj/img/dpaper-plane.png);
		background-repeat:no-repeat;
		background-size:cover;
		width:97px;
		height:100px;
		float:left;
		border:none;
	}
	.chatPrint{
		position: relative;
	}
	.chatHeight{
		height:100px;
		background-color: 
	}
	.myChat, .theyChat{
		height:40px;
		width:300px;
		position: absolute;
		line-height:40px;
		border-radius: 10px;
		background-color: white;
	}
	.myChat{
		left:180px;
		text-align:right;
		padding-right:10px;
	}
	.theyChat{
		left:10px;
		padding-left:10px;
	}
	.myChatTime, .theyChatTime{
		height:20px;
		width:60px;
		line-height:20px;
		padding:0;
		margin:0;
		font-size:10px;
		color:#555;
		position: absolute;
		top:5px;
	}
	.myChatTime{
		left:-62px;
		text-align:right;
	}
	.theyChatTime{
		left:301px;
		text-align:left;
	}
	/*버튼*/
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
		width:70px;
		height:35px;
		line-height:29px;
		font-size:16px;
	}
	/*버튼*/
	.btn:hover{
		background: gray;
		color:white;
		display: inline-block;
	}
</style>
<script>
	$(function(){
		var popup = $(document)
		var eventX, eventY, divX, divY, moveX, moveY, flag=false;
		function setMoveStart(){
			eventX = event.clientX;
			eventY = event.clientY;
			divX = parseInt()
		}
		
	})
	
</script>
<div class="section">
	<div id="mypointList">
		<h2>김토끼님의 1:1대화 내역입니다. </h2>
		<div id="pointSelectDate">
			<div class="btn">3개월</div>
			<div class="btn">6개월</div>
			<div class="btn">1년</div>
		</div>
		<div>
			<ul id="pointUl">
				<li>일시</li>
				<li>마지막 대화 내용</li>
				<li>&nbsp;</li>
				
				<!-- 구분용 -->
				<li><span class="pointdate">2021-03-25 13:00</span></li>
				<li>
				<img src="/sshj/img/pi.gif"><span class="chatttitle wordcut">작은농부</span><span class="chatdetail wordcut">마지막대화내용입니다.마지막대화내용입니다.마지막대화내용입니다.마지막대화내용입니다.마지막대화내용입니다.</span>
				</li>
				<li><input type="button" class="btn" value="조회"/><input type="button" class="btn" value="삭제"/></li>
			</ul>
		</div>
		<div class="chatDiv">
			<div class="chatDivRelative">
				<div class="chatDivBar"></div>
				<div class="chatDivTitle">내고향샵 실시간 채팅상담<span style="float:right;text-align:right;margin-right:10px;font-size:30px;line-height:30px;">&times;</span></div>
				<div class="chatDivcontent">
					<div class="chatPrint">
						<div class="chatHeight"></div>
						<div class="myChat" style="top:0px;">안녕하세요<div class="myChatTime">21-04-22 13:30</div></div>
						<div class="theyChat" style="top:50px">안녕하세요<div class="theyChatTime">21-04-22 13:30</div></div>
						<div class="myChat" style="top:100px;">물어볼게 있어서 그러는데요..<div class="myChatTime">21-04-22 13:30</div></div>
					</div>
				</div>
				<div class="chatDivInputBox">
					<div class="chatInput"><textarea></textarea></div>
					<div class="chatSendBtn"><input type="button"/></div>
				</div>
			</div>
		</div>
	</div>
</div>