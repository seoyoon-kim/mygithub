<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head> 
<style>
	div[id^=box],img,.last,#imgs,#claim,#secondBox {position:relative; }
	#claim,#secondBox{top:-120px;} 
	#imgs{list-style-type:none; display:flex; top:100px; left:-500px;}
	#imgs>li{margin-right:150px;}
	#imgs>li:nth-of-type(2){margin-right:200px;}
	#total{position:absolute; top:240px; left:175px; width:1080px; margin-left:20px;}
	img{width:100px; height:100px; }    
	#deli, #claim, #sta, #noti, #ques, #accept, #rep{border: gray 1px solid; width:48.5%; height:350px; float:left; margin:7px; border-radius:10px;}
	#ques, #accept, #rep{width:32%;}
	#total>div p{border-bottom:gray 2px solid; padding:10px 0 10px 20px;}
	#box0{ padding:150px 0 0 50px; }
	#box1,#box2{ top:-140px; }
	#box1{ left:300px; padding-top:75px;}
	#box2{ left:70px; padding-top:255px;}
	#box3{ top:-220px; left:320px;} 
	#box4,#box5,#box6{ top:25px; left:100px;}
	.last{left:120px; top:-10px;}   
	div[id^=box]>div{display:contents;}
	div[id^=box]{width:300px;}
</style>
</head>
<body>  
	<%@ include file="/inc/top.jspf" %>
	<%@ include file="/inc/leftBar.jspf" %>
	<div id="total"> 
		<div id="deli"> 
			<p>주문/배송</p><br/> 
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
			<p>클레임/매출</p><br/>
			   
			    	<div id="box2">취소 요청 <div>0</div> 건<br/>
			    	 	 반품 요청 <div>1</div> 건<br/>
			     		 교환 요청 <div>2</div> 건
			     </div>
			  
			    	<div id="box3">매출 <div>3,000,000</div>원<br/>
			    		 환불 <div>30,000</div>원</div>
		</div>
		<div id="secondBox">
		<div id="sta">
			   <p>매출 통계</p><br/>
			   <img id="grape" src="<%=request.getContextPath()%>/img/y_grape.PNG" style="width:300px;"/>
		</div>
		<div id="noti">
			 <p>공지사항</p><br/>
			 <span>  [시스템 공지]보안 업데이트로 인한 알림 21/05/02</span><br/>
			 <span>  [시스템 공지]보안 업데이트로 인한 알림 21/05/02</span><br/>
			 <span>  [시스템 공지]보안 업데이트로 인한 알림 21/05/02</span><br/>
			 <span>  [시스템 공지]보안 업데이트로 인한 알림 21/05/02</span><br/>
		</div>
		<div id="ques">
			<p>미답변 문의/리뷰</p><br/>
			  <img class="last" src="<%=request.getContextPath()%>/img/y_question.png"/> 
			 		<div id="box4">미답변 문의 <div>12</div>건<br/>
			  			 미답변 리뷰 <div>3</div>건</div>
		</div>
		<div id="accept">
			<p>판매자 승인 요청</p><br/>
			   <img class="last" src="<%=request.getContextPath()%>/img/y_accept.png"/>
			   		<div id="box5">승인 신청 건수 <div>6</div>건<br/> 
			   			 미처리 건수 <div>7</div>건</div>
		</div>
		<div id="rep">
			<p>신고내역</p><br/>
			 <img class="last" src="<%=request.getContextPath()%>/img/y_report.png"/>
			   		<div id="box6">접수 건수 <div>3</div>건<br/> 
			   			 미처리 건수 <div>0</div>건</div>
			</div>
		</div> 
	</div> 
</body>
</html>
