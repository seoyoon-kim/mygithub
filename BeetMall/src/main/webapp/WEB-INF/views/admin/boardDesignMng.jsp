<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin.css" type="text/css"> 
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin_2.css" type="text/css">
<style>
	.randomUl{
		position:relative;
	}
	/*첨부파일*/ 
	.attach{
		height:28px;
		width:150px;
		font-size:14px;
		color:dimgray;
		background-color:#eee;
		padding:7px 0;
		border:1px solid gray;
		border-radius:3px;
		margin-right:10px;
		font-weight:normal;
	}
	input[type=text]{
		border-color:lightgray;
		border-radius:3px;	 
		padding-left:5px;
		width:300px;
		font-weight:normal;
	} 
	.delBtn{
		border-color:lightgray;
	}
	.uploadFile{
		width:220px;
		font-weight:normal;
	} 
	/*맨 위 top Bar*/
	#topBar>h5{
		margin-left:15px;
		width:200px;
		color:white;
	} 
	#contentBox{
		height:3200px;
	}
	/*회원정보 전체*/
	#infoBox, button, #infoTitle>p{
		position:relative;
	}
	#infoBox{  
		left:15px;
		top:20px;
		width:500px;
		height:550px;
		background-color:white;
		border-radius:10px;
	 	-webkit-box-shadow: 4px 6px 15px -7px #C4C4C4; 
		box-shadow: 4px 6px 15px -7px #C4C4C4;
	}
	input{
		border:1px solid gray;  
	}
	button{
		color:black; 
		margin:0 5px !important; 
	  	height:30px;
	  	width:100px; 
	  }
	#contentBox li:nth-of-type(5) {
    	width: 250px;
	} 
	  
	 /*배너 이미지*/	 
	 #bannerContainer{
	 	position:relative;
	 	top:100px;
	 	left:-10px;
	 	height:320px;
	 }
	 #bannerTitle{
	 	padding-top:10px;
	 }
	 #bannerBox{
	 	position:relative;
	 	top:-20px;
	 }
	 #bannerBox>div, #stopNum, #stopDays{
	 	border:1px solid lightgray;
	 	border-radius:5px;
	 	float:left; 
	  	text-align:center;
	  	padding:20px 10px;
	  	margin-right: 8px;
	 } 
	 #bannerBox>div:nth-of-type(1),#bannerBox>div:nth-of-type(2){
	 	position:relative;
	 	top:-175px;
	 	left:35px;
		width:200px;
		margin-right:30px;
	 }  
	 #bannerBox>div:nth-of-type(3),#bannerBox>div:nth-of-type(4),#bannerBox>div:nth-of-type(5){
	 	position:relative;
	 	top:-155px;
	 	left:40px;
	 	width:128px;
	 	margin-right:20px;
	 } 
	  #buyHistory>div:nth-of-type(2){
	  	margin-left:45px;
	  } 
	  #buyHistory>div:nth-of-type(4){
	  	margin-left:30px;
	  }
	 #buyHistory>div:nth-of-type(2),#buyHistory>div:nth-of-type(3){
	 	width:200px;
	 	margin-top:40px; 
	 }
	  #buyHistory>div:nth-of-type(4),#buyHistory>div:nth-of-type(5),#buyHistory>div:nth-of-type(6){
	  	width:140px;
	 	margin-top:20px; 
	  } 
	  #buyING, #buyDone, #cancelReq, #refundReq, #changeReq{
	  	font-weight: bold;
	  }
	  #buyINGfloat{
	  	display:flex;
	  	margin-left:80px;
	  }
	 #buyHistory, #todayBox{ 
	 	margin:20px 0 0 570px;
	 } 
	  #todayBox{
	  	height:205px;
	  	position:relative;
	  	top:-550px;
	  	left:-10px;
	  }
	   #todaysBox{
	   	position:relative;
	   	top:-30px;
	   } 
	 
	/*컨테이너 공통*/
	#randomBox, #bannerContainer{ 
		position:relative;
	 	width:1000px;
	 	height:300px;     
	 }  
	 
	/*랜덤 룰렛*/
	 #randomBox ul{
	 	margin-left:80px;
	 }
	 #randomBox li{
	  	padding-top:15px;
	} 
	 #randomBox li:nth-of-type(2){
		margin-right:10px;
	}
	#randomBox input[type="file"]{
		display:none;
	} 
	
	.randomUl{ 
	 	left:-40px;
	 	width:250px !important;
	 	display:flex;
	 }
	.randomUl div{
		display:flex; 
		width:400px;
	}
	.randomUl li{
	  	font-weight:bold;
	  	padding-top:20px;
	  } 
	  #randomTitle>div{
	  	position:relative;
	  	top:-40px;
	  } 
	  
	/*페이징 이미지 링크*/
	.page_nation .pprev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat center center;
		margin-right:0;
	}
</style>
<%@ include file="/inc/top.jspf" %>
<%@ include file="/inc/leftBar.jspf" %>
 
<div id="body1">
<div id="container">
		<div id="topBar">			
			<h5><strong>디자인 관리</strong></h5>			
		</div>  
		<div id="contentBox">  
		<!-- 랜덤룰렛 파트 -->
	   		<div id="randomBox">
		 	<div id="randomTitle"><div>랜덤룰렛</div></div>
		 		<ul class="randomUl">
		 			<li><div >
							<label for="file" class="attach"> 
								이미지 첨부하기
							</label>
							<input type="file" style="width: 500px;" id="file">
							<input class="uploadFile" id="uploadFile" value="" placeholder="이미지 파일만 업로드해주세요">
						</div>
					</li> 
					<li><input type="text" value="" placeholder="링크 입력"/></li> 
					<li><button class="success" value="" name="" >추가</button></li> 
					<li><button class="success delBtn" value="" name="" >삭제</button></li> 
		 		</ul>
		 		<ul class="randomUl">
		 			<li><div >
							<label for="file" class="attach"> 
								이미지 첨부하기
							</label>
							<input type="file" style="width: 500px;" id="file">
							<input class="uploadFile" id="uploadFile" value="" placeholder="이미지 파일만 업로드해주세요">
						</div>
					</li> 
					<li><input type="text" value="" placeholder="링크 입력"/></li> 
					<li><button class="success" value="" name="" >추가</button></li> 
					<li><button class="success delBtn" value="" name="" >삭제</button></li> 
		 		</ul>
		 		<ul class="randomUl">
		 			<li><div >
							<label for="file" class="attach"> 
								이미지 첨부하기
							</label>
							<input type="file" style="width: 500px;" id="file">
							<input class="uploadFile" id="uploadFile" value="" placeholder="이미지 파일만 업로드해주세요">
						</div>
					</li> 
					<li><input type="text" value="" placeholder="링크 입력"/></li> 
					<li><button class="success" value="" name="" >추가</button></li> 
					<li><button class="success delBtn" value="" name="" >삭제</button></li> 
		 		</ul>
		 		<ul class="randomUl">
		 			<li><div >
							<label for="file" class="attach"> 
								이미지 첨부하기
							</label>
							<input type="file" style="width: 500px;" id="file">
							<input class="uploadFile" id="uploadFile" value="" placeholder="이미지 파일만 업로드해주세요">
						</div>
					</li> 
					<li><input type="text" value="" placeholder="링크 입력"/></li> 
					<li><button class="success" value="" name="" >추가</button></li> 
					<li><button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 		</ul> 
		 	</div>
		 	
		 	<!-- 배너 이미지 파트 -->
	   		<div id="bannerContainer">
			 	<div id="bannerTitle"><p>배너 이미지</p></div> 	
			 	<section id="bannerBox">	
			 		<ul>
			 			<li>
			 				<div>
			 				
			 				</div>
			 			</li>
			 			<li></li>
			 			<li></li>
			 			<li></li>
			 		</ul>		
				</section> 	 
		 	</div> 
		 	
		 	<!-- 오늘의 상품 파트 -->
		 	<div id="todayContainer">
			 	<div id="todayTitle"><div id="todayHead">오늘의 상품</div></div> 	
			 	<section id="todayBox">		 
					 </section> 	 
		 	</div>  
	</div>  
</div>
</div>
</html>