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
<style>
	/*맨 위 회색 top Bar*/
	#topBar>h5{
		margin-left:30px;
	}
	/*회원정보 전체*/
	#infoBox{ 
		position:relative;
		left:-80px;
		top:30px;
	}
	
	/*회원정보 항목 */  
	  #infoBox>ul{
	 	 list-style-type:none;
	 	 margin-top:30px;
	 	 float:left;
	 	 width:300px;
	  }
	  #infoBox>ul:nth-of-type(1)>li{
	  	width:200px;
	  }
	  #infoItem{
	  	position:relative;
	  	left:40px;
		text-align:center;
	  }
	  #infoItem>li{
	  	padding-top:4px;
	  } 
	  
	  /*회원정보 내용 */
	  #infoBox li{
	  	margin-top:20px;
	  }
	  #infoText{
	  	padding:0px;
	  }
	  #infoItem button{
	  	font-size:15px;
	  	width:81px;
	  }
	  button{
	  	height:30px;
	  }
	  #btns>button{
	  	margin-right:10px; 
	  }
	  /*회원정보 버튼*/
	  #btns{
	  	position:relative;
	  	float:left;
	  	top:560px;
	  	left:-440px; 
	  	font-size:15px;
	  }
	  
	 /*오른쪽 구매현황, 신고받은 내역*/	 
	 .grayBar{
	 	background-color:lightgray;
	 	border-radius:10px;  
	 	padding-left:200px;
	 }
	 .grayBar>div{
	 	float:left;
	 }
	 #buyHistory, #reportHistory{
	 	border:1px gray solid;
	 	border-radius:10px;
	 	width:500px;
	 	height:300px;
	 	margin:20px 0 0 570px;
	 }
	 #buyHistory{
	 	margin-top:90px;  
	 }
	 #buyHistory>div:not( #buyHistory>div:nth-of-type(1)){
	 	border:1px solid lightgray;
	 	border-radius:10px;
	 	float:left; 
	  	text-align:center;
	  	padding:20px 10px;
	  	margin-right: 8px;
	 }
	 #buyHistory>div:nth-of-type(2),#buyHistory>div:nth-of-type(3){
	 	width:200px;
	 	margin-top:20px;
	  	margin-left: 8px;
	 }
	  #buyHistory>div:nth-of-type(4),#buyHistory>div:nth-of-type(5),#buyHistory>div:nth-of-type(6){
	  	width:140px;
	 	margin-top:20px;
	  	margin-left: 2px; 
	  } 
	 input{
		border:1px solid lightgray; 
		border-radius: 8px; 
	 }
	 
	 /*마일리지 내역*/
	 #mileBar{
	 	background-color:lightgray;
	 	position:relative;
	 	top:100px;
	 	left:-10px;
	 	height:50px;
	 	padding: 10px 0 0 20px;
	 }
	 #mileBigBtn{
	 	margin:150px 0 0 50px;
	 }
	  #mileBtn{
		position:relative;
		top:-30px;
		left:700px; 
	 }
	  #mileBtn>button{
	  	width:80px; 
	  }
	 /*마일리지 표*/  
	 #mileTbl{
	 	margin: 30px 0 0 80px;
	 }
	.tg  {border-collapse:collapse;border-color:#aaa;border-spacing:0;}
	.tg td{background-color:#fff;border-bottom-width:1px;border-color:#aaa;border-style:solid;border-top-width:1px;
	  border-width:0px;color:#333;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;
	  word-break:normal;}
	.tg th{background-color:#f38630;border-bottom-width:1px;border-color:#aaa;border-style:solid;border-top-width:1px;
	  border-width:0px;color:#fff;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;
	  padding:10px 5px;word-break:normal;}
	.tg .mileTop{font-weight:bold;text-align:center;vertical-align:middle}
	.tg .tg-vj7v{color:#3531ff;text-align:center;vertical-align:middle}
	.tg .mileDate{font-size:11px;text-align:center;vertical-align:middle}
	.tg .mileRow{text-align:center;vertical-align:middle}
	.tg .tg-xpxz{color:#3166ff;text-align:center;vertical-align:middle}
	.tg .tg-0ok3{border-color:inherit;color:#fe0000;text-align:center;vertical-align:middle} 

	#milepage{
		position:relative;
		top:- 50px; 
	}
	/*즐겨찾는 농장*/
	favoriteFarm{
	
	}
	 #favoriteFarmBar{
	 	background-color:lightgray;
	 	position:relative;
	 	top:100px;
	 	left:-10px;
	 	height:50px;
	 	padding: 10px 0 0 20px;
	 }
	 /*즐겨찾기 농장 테이블*/ 
	.tg  {border:none;border-collapse:collapse;border-color:#aaa;border-spacing:0;}
	.tg td{background-color:#fff;border-color:#aaa;border-style:solid;border-width:0px;color:#333;
	  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{background-color:#f38630;border-color:#aaa;border-style:solid;border-width:0px;color:#fff;
	  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-uron{border-color:#ffffff;color:#000000;font-size:15px;text-align:center;vertical-align:middle}
	.tg .tg-fgp1{font-size:15px;font-weight:bold;text-align:center;vertical-align:middle}
	.tg .tg-8goc{font-size:15px;text-align:center;vertical-align:middle}
	.tg .tg-qksj{border-color:#ffffff;font-size:15px;text-align:left;vertical-align:middle}
	.tg .tg-3hmd{border-color:#ffffff;font-size:15px;text-align:center;vertical-align:middle}
	#favoriteFarm button{
		width:80px;
	}		
	#favoriteFarmTbl{
		position:relative;
		top:150px;
		left:20px;
	}
	#farmpage{
		position:relative;
		top:150px; 
	}
	/*장바구니*/
	#cartBar{
		background-color:lightgray;
	 	position:relative;
	 	top:300px;
	 	left:-10px;
	 	height:50px;
	 	padding: 10px 0 0 20px;
	}
	
	 /*장바구니 테이블*/
	.tg  {border:none;border-collapse:collapse;border-color:#aaa;border-spacing:0;}
	.tg td{background-color:#fff;border-color:#aaa;border-style:solid;border-width:0px;color:#333;
	  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{background-color:#f38630;border-color:#aaa;border-style:solid;border-width:0px;color:#fff;
	  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-yrou{border-color:inherit;font-size:15px;font-weight:bold;text-align:center;vertical-align:middle}
	.tg .tg-7btt{border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
	.tg .tg-hysb{border-color:inherit;font-size:13px;text-align:center;vertical-align:middle}
	.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
	.tg .tg-qksj{border-color:#ffffff;font-size:15px;text-align:left;vertical-align:middle}
	.tg .tg-3hmd{border-color:#ffffff;font-size:15px;text-align:center;vertical-align:middle}
	 /*장바구니 테이블*/
	#cartTbl{
		position:relative;
		top:350px;
		left:40px;
	}
	#cartpage{
		position:relative;
		top:330px;  
	}
	
	/*페이징 이미지 링크*/
	.page_nation .pprev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/resources/img/kpage_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/resources/img/kpage_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('<%=request.getContextPath()%>/resources/img/kpage_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('<%=request.getContextPath()%>/resources/img/kpage_nnext.png') no-repeat center center;
		margin-right:0;
	}
</style>
</head>
<body>
<%@ include file="/inc/top.jspf" %>
<%@ include file="/inc/leftBar.jspf" %>
<div id="container">
		<div id="topBar">			
			<h5><strong>일반회원 정보수정</strong></h5>			
		</div>  
   		<div id="infoBox">
			<ul id="infoItem">
				<li>이름</li>
				<li>아이디</li>
				<li>나이</li>
				<li>생년월일</li>
				<li>연락처</li>
				<li>이메일</li>
				<li>주소</li>
				<li><button class="success" value="주소검색" name="" >주소 검색</button></li>
				<li>가입일</li> 
			</ul>
			<ul id="infoText">
				<li><input type="text" value="홍길동?"/></li>
				<li><input type="text" value="1234"/></li>
				<li><input type="text" value="27?"/></li>
				<li><input type="text" value="07/12/01?"/></li>
				<li><input type="text" value="010-0000-0000"/></li>
				<li><input type="text" value="서울시 마포구 백범로"/></li>
				<li><input type="text" value="주소?"/></li>
				<li><input type="text" value="상세주소?"/></li>
				<li><input type="text" value="가입일?"/></li> 
			</ul>
			<div id="btns">
				<button class="success" value="회원 목록" name="customerList" >회원 목록</button>
				<button class="success" value="수정" name="edit">수정</button>
				<button class="success" value="삭제" name="del">삭제</button>
			</div>
		</div>  
		<div id="buyHistory">
			<div class="grayBar"><strong>구매현황</strong></div>
			<div>구매 진행중 <br/><span style="color:red">6</span>건</div>
			<div>구매 완료 <br/><span style="color:green">24</span>건</div>
			<div>취소 요청 <br/><span style="color:orange">2</span>건</div>
			<div>반품 요청 <br/><span style="color:blue">0</span>건</div>
			<div>교환 요청 <br/><span style="color:purple">1</span>건</div>			
		</div>
		<div id="reportHistory">
			<div class="grayBar"><strong>신고내역	</strong></div>
			<div>정지 횟수 <br/><span>2</span>회</div>
			<div>정지 총 일수 <br/><span>26</span>일</div>			
		</div>
		<div id="mileHistory">
			<div id="mileBar"><strong>회원 마일리지 내역</strong></div>
			<div id="mileBigBtn">
				<button class="success" value="전체" name="" >전체</button>
				<button class="success" value="적립" name="" >적립</button>
				<button class="success" value="사용" name="" >사용</button>
				<div id="mileBtn">
					<button class="success" value="3개월" name="" >3개월</button>
					<button class="success" value="6개월" name="" >6개월</button>
					<button class="success" value="1년" name="" >1년</button>
				</div>
			</div>
			<div id="mileTbl">  
				<table class="tg" style="undefined;table-layout: fixed; width: 912px">
				<colgroup>
				<col style="width: 83px">
				<col style="width: 91px">
				<col style="width: 398px">
				<col style="width: 112px">
				<col style="width: 115px">
				<col style="width: 113px">
				</colgroup>
				<thead>
				  <tr>
				    <th class="mileTop">일시</th>
				    <th class="mileTop" colspan="2">상품</th>
				    <th class="mileTop">판매가</th>
				    <th class="mileTop">마일리지</th>
				    <th class="mileTop">잔여 마일리지</th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
				    <td class="mileRow">2021-03-25<br>13:00</td>
				    <td class="mileRow"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'%3e%3cpath fill='%23000000' d='M350.85 129c25.97 4.67 47.27 18.67 63.92 42 14.65 20.67 24.64 46.67 29.96 78 4.67 28.67 4.32 57.33-1 86-7.99 47.33-23.97 87-47.94 119-28.64 38.67-64.59 58-107.87 58-10.66 0-22.3-3.33-34.96-10-8.66-5.33-18.31-8-28.97-8s-20.3 2.67-28.97 8c-12.66 6.67-24.3 10-34.96 10-43.28 0-79.23-19.33-107.87-58-23.97-32-39.95-71.67-47.94-119-5.32-28.67-5.67-57.33-1-86 5.32-31.33 15.31-57.33 29.96-78 16.65-23.33 37.95-37.33 63.92-42 15.98-2.67 37.95-.33 65.92 7 23.97 6.67 44.28 14.67 60.93 24 16.65-9.33 36.96-17.33 60.93-24 27.98-7.33 49.96-9.67 65.94-7zm-54.94-41c-9.32 8.67-21.65 15-36.96 19-10.66 3.33-22.3 5-34.96 5l-14.98-1c-1.33-9.33-1.33-20 0-32 2.67-24 10.32-42.33 22.97-55 9.32-8.67 21.65-15 36.96-19 10.66-3.33 22.3-5 34.96-5l14.98 1 1 15c0 12.67-1.67 24.33-4.99 35-3.99 15.33-10.31 27.67-18.98 37z'/%3e%3c/svg%3e" width="80" height="80"></td>
				    <td class="mileRow"><span style="font-weight:bold">맛깔나는 귤</span><br><span style="color:#9B9B9B">맛깔나는 귤의 설명입니다</span></td>
				    <td class="mileRow">17,980원</td>
				    <td class="mileRow"><span style="color:#3531FF">17 p 적립</span></td>
				    <td class="mileRow">230p</td>
				  </tr>
				  <tr>
				    <td class="mileDate">2021-03-31<br>21:30</td>
				    <td class="mileRow"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'%3e%3cpath fill='%23000000' d='M350.85 129c25.97 4.67 47.27 18.67 63.92 42 14.65 20.67 24.64 46.67 29.96 78 4.67 28.67 4.32 57.33-1 86-7.99 47.33-23.97 87-47.94 119-28.64 38.67-64.59 58-107.87 58-10.66 0-22.3-3.33-34.96-10-8.66-5.33-18.31-8-28.97-8s-20.3 2.67-28.97 8c-12.66 6.67-24.3 10-34.96 10-43.28 0-79.23-19.33-107.87-58-23.97-32-39.95-71.67-47.94-119-5.32-28.67-5.67-57.33-1-86 5.32-31.33 15.31-57.33 29.96-78 16.65-23.33 37.95-37.33 63.92-42 15.98-2.67 37.95-.33 65.92 7 23.97 6.67 44.28 14.67 60.93 24 16.65-9.33 36.96-17.33 60.93-24 27.98-7.33 49.96-9.67 65.94-7zm-54.94-41c-9.32 8.67-21.65 15-36.96 19-10.66 3.33-22.3 5-34.96 5l-14.98-1c-1.33-9.33-1.33-20 0-32 2.67-24 10.32-42.33 22.97-55 9.32-8.67 21.65-15 36.96-19 10.66-3.33 22.3-5 34.96-5l14.98 1 1 15c0 12.67-1.67 24.33-4.99 35-3.99 15.33-10.31 27.67-18.98 37z'/%3e%3c/svg%3e" alt="Image" width="69" height="80"></td>
				    <td class="mileRow"><span style="font-weight:bold">맛깔나는 쌀</span><br><span style="color:#9B9B9B">맛깔나는 쌀의 설명입니다</span></td>
				    <td class="mileRow">11,980원</td>
				    <td class="tg-vj7v">19p 적립</td>
				    <td class="mileRow">213p</td>
				  </tr>
				  <tr>
				    <td class="mileDate">2021-04-02<br>01:27</td>
				    <td class="mileRow"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'%3e%3cpath fill='%23000000' d='M350.85 129c25.97 4.67 47.27 18.67 63.92 42 14.65 20.67 24.64 46.67 29.96 78 4.67 28.67 4.32 57.33-1 86-7.99 47.33-23.97 87-47.94 119-28.64 38.67-64.59 58-107.87 58-10.66 0-22.3-3.33-34.96-10-8.66-5.33-18.31-8-28.97-8s-20.3 2.67-28.97 8c-12.66 6.67-24.3 10-34.96 10-43.28 0-79.23-19.33-107.87-58-23.97-32-39.95-71.67-47.94-119-5.32-28.67-5.67-57.33-1-86 5.32-31.33 15.31-57.33 29.96-78 16.65-23.33 37.95-37.33 63.92-42 15.98-2.67 37.95-.33 65.92 7 23.97 6.67 44.28 14.67 60.93 24 16.65-9.33 36.96-17.33 60.93-24 27.98-7.33 49.96-9.67 65.94-7zm-54.94-41c-9.32 8.67-21.65 15-36.96 19-10.66 3.33-22.3 5-34.96 5l-14.98-1c-1.33-9.33-1.33-20 0-32 2.67-24 10.32-42.33 22.97-55 9.32-8.67 21.65-15 36.96-19 10.66-3.33 22.3-5 34.96-5l14.98 1 1 15c0 12.67-1.67 24.33-4.99 35-3.99 15.33-10.31 27.67-18.98 37z'/%3e%3c/svg%3e" alt="Image" width="69" height="80"></td>
				    <td class="mileRow"><span style="font-weight:bold">생일 축하 마일리지</span><br><span style="color:#9B9B9B">생일 축하합니다!</span></td>
				    <td class="mileRow">-</td>
				    <td class="tg-xpxz">1000p적립</td>
				    <td class="mileRow">202p</td>
				  </tr>
				  <tr>
				    <td class="mileDate">2021-04-13<br>19:24</td>
				    <td class="mileRow"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'%3e%3cpath fill='%23000000' d='M350.85 129c25.97 4.67 47.27 18.67 63.92 42 14.65 20.67 24.64 46.67 29.96 78 4.67 28.67 4.32 57.33-1 86-7.99 47.33-23.97 87-47.94 119-28.64 38.67-64.59 58-107.87 58-10.66 0-22.3-3.33-34.96-10-8.66-5.33-18.31-8-28.97-8s-20.3 2.67-28.97 8c-12.66 6.67-24.3 10-34.96 10-43.28 0-79.23-19.33-107.87-58-23.97-32-39.95-71.67-47.94-119-5.32-28.67-5.67-57.33-1-86 5.32-31.33 15.31-57.33 29.96-78 16.65-23.33 37.95-37.33 63.92-42 15.98-2.67 37.95-.33 65.92 7 23.97 6.67 44.28 14.67 60.93 24 16.65-9.33 36.96-17.33 60.93-24 27.98-7.33 49.96-9.67 65.94-7zm-54.94-41c-9.32 8.67-21.65 15-36.96 19-10.66 3.33-22.3 5-34.96 5l-14.98-1c-1.33-9.33-1.33-20 0-32 2.67-24 10.32-42.33 22.97-55 9.32-8.67 21.65-15 36.96-19 10.66-3.33 22.3-5 34.96-5l14.98 1 1 15c0 12.67-1.67 24.33-4.99 35-3.99 15.33-10.31 27.67-18.98 37z'/%3e%3c/svg%3e" alt="Image" width="69" height="80"></td>
				    <td class="mileRow"><span style="font-weight:bold">포인트 사용</span><br><span style="color:#9B9B9B">결제시 포인트를 사용하여 할인받았습니다</span></td>
				    <td class="mileRow">-</td>
				    <td class="tg-0ok3">1000p 사용</td>
				    <td class="mileRow">3000p</td>
				  </tr>
				  <tr>
				    <td class="mileDate">2021-05-01<br>01:52</td>
				    <td class="mileRow"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'%3e%3cpath fill='%23000000' d='M350.85 129c25.97 4.67 47.27 18.67 63.92 42 14.65 20.67 24.64 46.67 29.96 78 4.67 28.67 4.32 57.33-1 86-7.99 47.33-23.97 87-47.94 119-28.64 38.67-64.59 58-107.87 58-10.66 0-22.3-3.33-34.96-10-8.66-5.33-18.31-8-28.97-8s-20.3 2.67-28.97 8c-12.66 6.67-24.3 10-34.96 10-43.28 0-79.23-19.33-107.87-58-23.97-32-39.95-71.67-47.94-119-5.32-28.67-5.67-57.33-1-86 5.32-31.33 15.31-57.33 29.96-78 16.65-23.33 37.95-37.33 63.92-42 15.98-2.67 37.95-.33 65.92 7 23.97 6.67 44.28 14.67 60.93 24 16.65-9.33 36.96-17.33 60.93-24 27.98-7.33 49.96-9.67 65.94-7zm-54.94-41c-9.32 8.67-21.65 15-36.96 19-10.66 3.33-22.3 5-34.96 5l-14.98-1c-1.33-9.33-1.33-20 0-32 2.67-24 10.32-42.33 22.97-55 9.32-8.67 21.65-15 36.96-19 10.66-3.33 22.3-5 34.96-5l14.98 1 1 15c0 12.67-1.67 24.33-4.99 35-3.99 15.33-10.31 27.67-18.98 37z'/%3e%3c/svg%3e" alt="Image" width="69" height="80"></td>
				    <td class="mileRow"><span style="font-weight:bold">맛깔나는 토마토</span><br><span style="color:#9B9B9B">맛깔나는 토마토 먹어보겠습니다</span></td>
				    <td class="mileRow">15,990원</td>
				    <td class="tg-vj7v">519p 적립</td>
				    <td class="mileRow">850p</td>
				  </tr>
				</tbody>
				</table>
			</div>
		</div>
		<div class="page_wrap" id="milepage">
			<div class="page_nation">
			   <a class="arrow pprev" href="<%=request.getContextPath()%>/img/kpage_pprev.png"></a>
			   <a class="arrow prev" href="#"></a>
			   <a href="#" class="active">1</a>
			   <a href="#">2</a>
			   <a href="#">3</a>
			   <a href="#">4</a>
			   <a href="#">5</a>
			   <a href="#">6</a>
			   <a href="#">7</a>
			   <a href="#">8</a>
			   <a href="#">9</a>
			   <a href="#">10</a>
			   <a class="arrow next" href="#"></a>
			   <a class="arrow nnext" href="#"></a>
			</div>
		 </div>  
 		<div id="favoriteFarm">
			<div id="favoriteFarmBar"><strong>회원 즐겨찾기 농장</strong></div>
			<div id="favoriteFarmTbl">
				<table class="tg" style="undefined;table-layout: fixed; width: 1021px">
					<colgroup>
					<col style="width: 103px">
					<col style="width: 465px">
					<col style="width: 138px">
					<col style="width: 181px">
					<col style="width: 134px">
					</colgroup>
					<thead>
					  <tr>
					    <th class="tg-fgp1" colspan="2">소개</th>
					    <th class="tg-fgp1">위치</th>
					    <th class="tg-fgp1">즐겨찾기 한 사용자</th>
					    <th class="tg-fgp1">샵 바로가기</th>
					  </tr>
					</thead>
					<tbody>
					  <tr>
					    <td class="tg-8goc"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 384 512'%3e%3cpath fill='%23000000' d='M120 72c0-39.765 32.235-72 72-72s72 32.235 72 72c0 39.764-32.235 72-72 72s-72-32.236-72-72zm254.627 1.373c-12.496-12.497-32.758-12.497-45.254 0L242.745 160H141.254L54.627 73.373c-12.496-12.497-32.758-12.497-45.254 0-12.497 12.497-12.497 32.758 0 45.255L104 213.254V480c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V368h16v112c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V213.254l94.627-94.627c12.497-12.497 12.497-32.757 0-45.254z'/%3e%3c/svg%3e" width="75" height="75"></td>
					    <td class="tg-qksj"><span style="font-weight:bold">작은 농부의 농장</span><br><span style="color:#9B9B9B">언제나 정직하게 판매하는 작은 농부입니다!</span><br><span style="color:#9B9B9B">항상 찾아주셔서 감사합니다.</span></td>
					    <td class="tg-3hmd">충북 제천</td>
					    <td class="tg-uron"><span style="color:#FE0000">♥ 999+</span></td>
					    <td class="tg-uron"><button class="success" value="이동" name="">이동</button></td>
					  </tr>
					  <tr>
					    <td class="tg-8goc"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 384 512'%3e%3cpath fill='%23000000' d='M120 72c0-39.765 32.235-72 72-72s72 32.235 72 72c0 39.764-32.235 72-72 72s-72-32.236-72-72zm254.627 1.373c-12.496-12.497-32.758-12.497-45.254 0L242.745 160H141.254L54.627 73.373c-12.496-12.497-32.758-12.497-45.254 0-12.497 12.497-12.497 32.758 0 45.255L104 213.254V480c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V368h16v112c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V213.254l94.627-94.627c12.497-12.497 12.497-32.757 0-45.254z'/%3e%3c/svg%3e" width="75" height="75"></td>
					    <td class="tg-qksj"><span style="font-weight:bold">아침 고요 농장</span><br><span style="color:#9B9B9B">느리지만 안심하고 먹을 수 있는 먹거리를 만듭니다</span></td>
					    <td class="tg-3hmd">경북 예천</td>
					    <td class="tg-uron"><span style="color:#FE0000">♥ 777</span></td>
					    <td class="tg-uron"><button class="success" value="이동" name="">이동</button></td>
					  </tr>
					  <tr>
					    <td class="tg-8goc"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 384 512'%3e%3cpath fill='%23000000' d='M120 72c0-39.765 32.235-72 72-72s72 32.235 72 72c0 39.764-32.235 72-72 72s-72-32.236-72-72zm254.627 1.373c-12.496-12.497-32.758-12.497-45.254 0L242.745 160H141.254L54.627 73.373c-12.496-12.497-32.758-12.497-45.254 0-12.497 12.497-12.497 32.758 0 45.255L104 213.254V480c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V368h16v112c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V213.254l94.627-94.627c12.497-12.497 12.497-32.757 0-45.254z'/%3e%3c/svg%3e" width="75" height="75"></td>
					    <td class="tg-qksj"><span style="font-weight:bold">우리 싱싱농장</span><br><span style="color:#9B9B9B">우리 손으로 직접 재배한 채소만 판매합니다</span></td>
					    <td class="tg-3hmd">경기도 의정부</td>
					    <td class="tg-uron"><span style="color:#FE0000">♥ 32</span></td>
					    <td class="tg-uron"><button class="success" value="이동" name="">이동</button></td>
					  </tr>
					  <tr>
					    <td class="tg-8goc"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 384 512'%3e%3cpath fill='%23000000' d='M120 72c0-39.765 32.235-72 72-72s72 32.235 72 72c0 39.764-32.235 72-72 72s-72-32.236-72-72zm254.627 1.373c-12.496-12.497-32.758-12.497-45.254 0L242.745 160H141.254L54.627 73.373c-12.496-12.497-32.758-12.497-45.254 0-12.497 12.497-12.497 32.758 0 45.255L104 213.254V480c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V368h16v112c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V213.254l94.627-94.627c12.497-12.497 12.497-32.757 0-45.254z'/%3e%3c/svg%3e" width="75" height="75"></td>
					    <td class="tg-qksj"><span style="font-weight:bold">언제나 유기농 농장</span><br><span style="color:#9B9B9B">모든 제품 유기농으로만, 최고급으로.</span></td>
					    <td class="tg-3hmd">충남 태안</td>
					    <td class="tg-uron"><span style="color:#FE0000">♥156</span></td>
					    <td class="tg-uron"><button class="success" value="이동" name="">이동</button></td>
					  </tr>
					</tbody>
					</table>
			</div>
			<div class="page_wrap" id="farmpage">
			<div class="page_nation">
			   <a class="arrow pprev" href="<%=request.getContextPath()%>/img/kpage_pprev.png"></a>
			   <a class="arrow prev" href="#"></a>
			   <a href="#" class="active">1</a>
			   <a href="#">2</a>
			   <a href="#">3</a>
			   <a href="#">4</a>
			   <a href="#">5</a>
			   <a href="#">6</a>
			   <a href="#">7</a>
			   <a href="#">8</a>
			   <a href="#">9</a>
			   <a href="#">10</a>
			   <a class="arrow next" href="#"></a>
			   <a class="arrow nnext" href="#"></a>
			</div>
		 </div>  
 		</div>
 		<div id="cart">
 		<div id="cartBar"><strong>회원 장바구니</strong></div>
			<div id="cartTbl">
				<table class="tg" style="undefined;table-layout: fixed; width: 973px">
				<colgroup>
				<col style="width: 130px">
				<col style="width: 93px">
				<col style="width: 554px">
				<col style="width: 196px">
				</colgroup>
				<thead>
				  <tr>
				    <th class="tg-yrou">일시</th>
				    <th class="tg-7btt" colspan="2">상품</th>
				    <th class="tg-yrou">판매가</th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
				    <td class="tg-hysb">2021-05-29<br>13:00</td>
				    <td class="tg-0pky"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'%3e%3cpath fill='%23000000' d='M350.85 129c25.97 4.67 47.27 18.67 63.92 42 14.65 20.67 24.64 46.67 29.96 78 4.67 28.67 4.32 57.33-1 86-7.99 47.33-23.97 87-47.94 119-28.64 38.67-64.59 58-107.87 58-10.66 0-22.3-3.33-34.96-10-8.66-5.33-18.31-8-28.97-8s-20.3 2.67-28.97 8c-12.66 6.67-24.3 10-34.96 10-43.28 0-79.23-19.33-107.87-58-23.97-32-39.95-71.67-47.94-119-5.32-28.67-5.67-57.33-1-86 5.32-31.33 15.31-57.33 29.96-78 16.65-23.33 37.95-37.33 63.92-42 15.98-2.67 37.95-.33 65.92 7 23.97 6.67 44.28 14.67 60.93 24 16.65-9.33 36.96-17.33 60.93-24 27.98-7.33 49.96-9.67 65.94-7zm-54.94-41c-9.32 8.67-21.65 15-36.96 19-10.66 3.33-22.3 5-34.96 5l-14.98-1c-1.33-9.33-1.33-20 0-32 2.67-24 10.32-42.33 22.97-55 9.32-8.67 21.65-15 36.96-19 10.66-3.33 22.3-5 34.96-5l14.98 1 1 15c0 12.67-1.67 24.33-4.99 35-3.99 15.33-10.31 27.67-18.98 37z'/%3e%3c/svg%3e" width="80" height="80"></td>
				    <td class="tg-qksj"><span style="font-weight:bold">맛깔나는 귤</span><br>귤은 언제나 맛있다</td>
				    <td class="tg-3hmd">17,960원</td>
				  </tr>
				  <tr>
				    <td class="tg-hysb">2021-05-25<br>12:30</td>
				    <td class="tg-0pky"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'%3e%3cpath fill='%23000000' d='M350.85 129c25.97 4.67 47.27 18.67 63.92 42 14.65 20.67 24.64 46.67 29.96 78 4.67 28.67 4.32 57.33-1 86-7.99 47.33-23.97 87-47.94 119-28.64 38.67-64.59 58-107.87 58-10.66 0-22.3-3.33-34.96-10-8.66-5.33-18.31-8-28.97-8s-20.3 2.67-28.97 8c-12.66 6.67-24.3 10-34.96 10-43.28 0-79.23-19.33-107.87-58-23.97-32-39.95-71.67-47.94-119-5.32-28.67-5.67-57.33-1-86 5.32-31.33 15.31-57.33 29.96-78 16.65-23.33 37.95-37.33 63.92-42 15.98-2.67 37.95-.33 65.92 7 23.97 6.67 44.28 14.67 60.93 24 16.65-9.33 36.96-17.33 60.93-24 27.98-7.33 49.96-9.67 65.94-7zm-54.94-41c-9.32 8.67-21.65 15-36.96 19-10.66 3.33-22.3 5-34.96 5l-14.98-1c-1.33-9.33-1.33-20 0-32 2.67-24 10.32-42.33 22.97-55 9.32-8.67 21.65-15 36.96-19 10.66-3.33 22.3-5 34.96-5l14.98 1 1 15c0 12.67-1.67 24.33-4.99 35-3.99 15.33-10.31 27.67-18.98 37z'/%3e%3c/svg%3e" width="80" height="80"></td>
				    <td class="tg-qksj"><span style="font-weight:bold">맛깔나는 쌀</span><br><span style="color:#9B9B9B">안심하고 먹는 우리쌀!!</span></td>
				    <td class="tg-3hmd">28,650원</td>
				  </tr>
				  <tr>
				    <td class="tg-hysb">2021-05-30<br>19:25</td>
				    <td class="tg-0pky"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'%3e%3cpath fill='%23000000' d='M350.85 129c25.97 4.67 47.27 18.67 63.92 42 14.65 20.67 24.64 46.67 29.96 78 4.67 28.67 4.32 57.33-1 86-7.99 47.33-23.97 87-47.94 119-28.64 38.67-64.59 58-107.87 58-10.66 0-22.3-3.33-34.96-10-8.66-5.33-18.31-8-28.97-8s-20.3 2.67-28.97 8c-12.66 6.67-24.3 10-34.96 10-43.28 0-79.23-19.33-107.87-58-23.97-32-39.95-71.67-47.94-119-5.32-28.67-5.67-57.33-1-86 5.32-31.33 15.31-57.33 29.96-78 16.65-23.33 37.95-37.33 63.92-42 15.98-2.67 37.95-.33 65.92 7 23.97 6.67 44.28 14.67 60.93 24 16.65-9.33 36.96-17.33 60.93-24 27.98-7.33 49.96-9.67 65.94-7zm-54.94-41c-9.32 8.67-21.65 15-36.96 19-10.66 3.33-22.3 5-34.96 5l-14.98-1c-1.33-9.33-1.33-20 0-32 2.67-24 10.32-42.33 22.97-55 9.32-8.67 21.65-15 36.96-19 10.66-3.33 22.3-5 34.96-5l14.98 1 1 15c0 12.67-1.67 24.33-4.99 35-3.99 15.33-10.31 27.67-18.98 37z'/%3e%3c/svg%3e" width="80" height="80"></td>
				    <td class="tg-qksj"><span style="font-weight:bold">제주 오렌지</span><br><span style="color:#9B9B9B">한번 드셔봅서예</span></td>
				    <td class="tg-3hmd">85,620원</td>
				  </tr>
				  <tr>
				    <td class="tg-hysb">2021-05-30<br>11:21</td>
				    <td class="tg-0pky"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'%3e%3cpath fill='%23000000' d='M350.85 129c25.97 4.67 47.27 18.67 63.92 42 14.65 20.67 24.64 46.67 29.96 78 4.67 28.67 4.32 57.33-1 86-7.99 47.33-23.97 87-47.94 119-28.64 38.67-64.59 58-107.87 58-10.66 0-22.3-3.33-34.96-10-8.66-5.33-18.31-8-28.97-8s-20.3 2.67-28.97 8c-12.66 6.67-24.3 10-34.96 10-43.28 0-79.23-19.33-107.87-58-23.97-32-39.95-71.67-47.94-119-5.32-28.67-5.67-57.33-1-86 5.32-31.33 15.31-57.33 29.96-78 16.65-23.33 37.95-37.33 63.92-42 15.98-2.67 37.95-.33 65.92 7 23.97 6.67 44.28 14.67 60.93 24 16.65-9.33 36.96-17.33 60.93-24 27.98-7.33 49.96-9.67 65.94-7zm-54.94-41c-9.32 8.67-21.65 15-36.96 19-10.66 3.33-22.3 5-34.96 5l-14.98-1c-1.33-9.33-1.33-20 0-32 2.67-24 10.32-42.33 22.97-55 9.32-8.67 21.65-15 36.96-19 10.66-3.33 22.3-5 34.96-5l14.98 1 1 15c0 12.67-1.67 24.33-4.99 35-3.99 15.33-10.31 27.67-18.98 37z'/%3e%3c/svg%3e" width="80" height="80"></td>
				    <td class="tg-qksj"><span style="font-weight:bold">맛깔나는 토마토</span><br><span style="color:#9B9B9B">모든 제품 유기농으로만, 최고급으로.</span></td>
				    <td class="tg-3hmd">26,600우 ㅓㄴ</td>
				  </tr>
				</tbody>
			</table> 
		 </div>  
		 <div class="page_wrap" id="cartpage">
			<div class="page_nation">
			   <a class="arrow pprev" href="<%=request.getContextPath()%>/img/kpage_pprev.png"></a>
			   <a class="arrow prev" href="#"></a>
			   <a href="#" class="active">1</a>
			   <a href="#">2</a>
			   <a href="#">3</a>
			   <a href="#">4</a>
			   <a href="#">5</a>
			   <a href="#">6</a>
			   <a href="#">7</a>
			   <a href="#">8</a>
			   <a href="#">9</a>
			   <a href="#">10</a>
			   <a class="arrow next" href="#"></a>
			   <a class="arrow nnext" href="#"></a>
			</div>
		 </div>  
 		</div>
	</div>  
</body>
</html>