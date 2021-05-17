<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html> 
<style>
	#body1{
		font-size:14px; 
		font-family: 'Noto Sans KR', sans-serif;
	}
	div[id^=box],img,.last,#imgs,#claim,#secondBox,#imgs>li:nth-of-type(2),#sta,#noti,#deli,#claim {
		position:relative; 
	}
	#imgBox img{
		height:75px;
	}
	#imgs{
		list-style-type:none; 
		display:flex; 
		top:100px; 
		left:-460px;
	}
	#imgs>li{
		margin-right:150px;
	}
	#imgs>li:nth-of-type(2){
		margin-right:200px;
		left:-15px;
	}
	#imgs>li:nth-of-type(3){
		margin-right:150px;
		left:-15px;
	}
	#total{
		position:absolute; 
		top:-10px; 
		left:175px; 
		width:1080px; 
		margin-left:20px;
	}
	img{
		width:100px; 
		height:100px; 
	}    
	#deli, #claim, #sta, #noti, #ques, #accept, #rep{
		border: lightgray 1px solid; 
		width:48.5% !important; 
		height:350px; 
		float:left; 
		margin:7px;  
	}
	#ques, #accept, #rep{
		width:32% !important;
	}
	#total>div p{
		border-bottom:gray 2px solid; 
		padding:10px 0 10px 20px;
	}
	#box0{ 
		padding:160px 0 0 86px; 
	}
	#box1,#box2{ 
		top:-120px; 
	}
	#box1{ 
		left:305px; 
		padding-top:75px;
	}
	#box2{ 
		left:85px; 
		padding-top:260px;
	}
	#box3{ 
		top:-170px; 
		left:325px;
	} 
	#box4,#box5,#box6{ 
		top:45px; left:110px;
	}
	.last{
		left:120px; top:10px;
	}   
	div[id^=box]>div{
		display:contents;
	}
	div[id^=box]{
		width:300px;
	}
	#deli{
		top:0 !important;
		margin-left:10px !important;
	} 
	#claim{ 
		top:-364px !important;
		margin-left:550px !important;
		z-index:-1;
	} 
	#notiContent{
		padding:5px 20px;
	}
	#sta{
		top:-240px !important;
		margin-left:10px !important;
	}
	#noti{
		top:-605px !important;
		margin-left:550px !important;
	}
	#ques, #accept{
		position:relative;
		top:-605px !important;
		margin-left:10px !important;
	}
	#rep{
		position:relative;
		top:-969px !important;
		margin-left:730px !important;
	}
	#secondBox{
		top:-120px;
	} 
</style> 
	<%@ include file="/inc/top.jspf" %> 
<div id="body1"> 
	<%@ include file="/inc/leftBar.jspf" %>
	<div id="total">   
		<div id="deli"> 
			<div id="deliTitle">주문/배송</div><br/> 
			   <div id="box0">신규 주문 <div>13</div> 건</div> 
			  		<div id="box1">배송 준비 <div>3</div> 건<br/>
			   			 배송 중 <div>7</div> 건<br/>
			   			 배송 완료 <div>13</div> 건 </div> 
		</div>
		<ul id="imgs">
			<li><img id="odd1" src="<%=request.getContextPath()%>/img/y_new.png"/></li>
			<li><img id="even" src="<%=request.getContextPath()%>/img/y_truck.png"/></li>
			<li><img  id="odd2" src="<%=request.getContextPath()%>/img/y_undo.png"/></li>
			<li><img id="evenwon" src="<%=request.getContextPath()%>/img/y_won.png"/><br/></li>
		</ul>
		<div id="claim">
			<div id="claimTitle">클레임/매출</div><br/>
			   
			    	<div id="box2">취소 요청 <div>0</div> 건<br/>
			    	 	 반품 요청 <div>1</div> 건<br/>
			     		 교환 요청 <div>2</div> 건
			     </div>
			  
			    	<div id="box3">매출 <div>3,000,000</div>원<br/>
			    		 환불 <div>30,000</div>원</div>
		</div>
		<div id="secondBox">
		<div id="sta">
			   <div id="staTitle">매출 통계</div><br/>
			   <img id="grape" src="<%=request.getContextPath()%>/img/y_grape.PNG" style="width:300px;"/>
		</div>
		<div id="noti">
			 <div id="notiTitle">공지사항</div><br/>
			 <div id="notiContent">
				 <span>  [시스템 공지]보안 업데이트로 인한 알림 21/05/02</span><br/>
				 <span>  [시스템 공지]보안 업데이트로 인한 알림 21/05/02</span><br/>
				 <span>  [시스템 공지]보안 업데이트로 인한 알림 21/05/02</span><br/>
				 <span>  [시스템 공지]보안 업데이트로 인한 알림 21/05/02</span><br/>
			 </div>
		</div>
		<div id="ques">
			<div id="quesTitle">미답변 문의/리뷰</div><br/>
			  <img class="last" src="<%=request.getContextPath()%>/img/y_question.png"/> 
			 		<div id="box4">미답변 문의 <div>12</div>건<br/>
			  			 미답변 리뷰 <div>3</div>건</div>
		</div>
		<div id="accept">
			<div id="acceptTitle">판매자 승인 요청</div><br/>
			   <img class="last" src="<%=request.getContextPath()%>/img/y_accept.png"/>
			   		<div id="box5">승인 신청 건수 <div>6</div>건<br/> 
			   			 미처리 건수 <div>7</div>건</div>
		</div>
		<div id="rep">
			<div id="repTitle">신고내역</div><br/>
			 <img class="last" src="<%=request.getContextPath()%>/img/y_report.png"/>
			   		<div id="box6">접수 건수 <div>3</div>건<br/> 
			   			 미처리 건수 <div>0</div>건</div>
			</div>
		</div> 
	</div> 
</div>
</html>
