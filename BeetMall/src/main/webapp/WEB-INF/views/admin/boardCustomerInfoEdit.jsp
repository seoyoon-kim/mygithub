<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin_2.css" type="text/css">
<style>
	/*맨 위 top Bar*/
	#topBar>h5{
		margin-left:15px;
		width:200px;
		color:white;
	} 
	#contentBox{
		height:3200px;
		top:50px;
	}
	table{
		-webkit-box-shadow: 4px 6px 15px -7px #C4C4C4; 
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
	input[type=text]{
		padding-left:5px;
		width:300px;
	} 
	button{
		color:black;
	} 
	thead{
		border-bottom:1px solid gray;	
	} 
	.tgr .mileTop:nth-of-type(1), .tga .favoriteTop:nth-of-type(1), .tgc .tg-yrou:nth-of-type(1){ 
		border-radius:10px 0 0 0 ;
	}
	.tgr .mileTop:nth-of-type(5), .tga .favoriteTop:nth-of-type(4), .tgc .tg-yrou:nth-of-type(3){ 
		border-radius:0 10px 0 0 ;
	} 
	tr{
		border-bottom:1px solid lightgray;
	 	background-color:white;
	}
	#infoTitle>p{ 
		top:-10px;
	}
	 #info{
	 	top:-383px;
	 	left:-230px;
	 }
	 #contentBox li:nth-of-type(5) {
	 	width:250px !important;
	 }
	 #contentBox ul {
    	margin-left: 0 !important; 
	}
	/*회원정보 항목 */
	#infoHeader{ 
		top:11px;
		left:-60px;
	}    
	#infoHeader li{
    	padding-top: 22px !important;
	}
	  /*회원정보 내용 */
	  #info li:nth-of-type(5){
	 	padding-left:390px;
	 }
	  #info li:nth-of-type(7)>input{
	  	width:190px;
	  	position:relative;
	  	left:55px;
	  }
	  #infoBox button{
	  	font-size:15px;
	  	border:1px solid lightgray;
	  	width:100x; 
	  }
	  #addrBtn{
	  	top:-42px;
	  	left:125px;
	  
	  }
	  button{
	  	height:30px;
	  	width:100px;
	  	border:1px solid lightgray;
	  }
	  /*회원정보 회색 바*/
	   #mileBar, #favoriteFarmBar, #cartBar{
		font-size:20px;
		letter-spacing:2px;
		background-color:rgb(40,40,100); 
	 	color:white;
	   }
	  /*회원정보 버튼*/
	  .btns{
	  	position:relative;
	  	float:left;
	  	top:-355px;
		left:65px;
	  	font-size:15px;  
	  }
	  .btns>button{
	  	margin-right:30px;  
	  } 
	  
	 /*오른쪽 구매현황*/	 
	 #buyHistory{
	 	position:relative;
	 	top:-550px !important;
	 	left:555px;
	 	height:320px;
	 }
	 #buyTitle{
	 	padding-top:10px;
	 }
	 #buyBox{
	 	position:relative;
	 	top:-20px;
	 }
	 #buyBox>div, #stopNum, #stopDays{
	 	border:1px solid lightgray;
	 	border-radius:5px;
	 	float:left; 
	  	text-align:center;
	  	padding:20px 10px;
	  	margin-right: 8px;
	 } 
	 #buyBox>div:nth-of-type(1),#buyBox>div:nth-of-type(2){
	 	position:relative;
	 	top:-175px;
	 	left:35px;
		width:200px;
		margin-right:30px;
	 }  
	 #buyBox>div:nth-of-type(3),#buyBox>div:nth-of-type(4),#buyBox>div:nth-of-type(5){
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
	 #buyHistory, #reportBox{ 
	 	margin:20px 0 0 570px;
	 } 
	  #reportBox{
	  	height:205px;
	  	position:relative;
	  	top:-550px !important;
	  	left:555px;
	  }
	   #reportsBox{
	   	position:relative;
	   	top:-30px;
	   }
	  #stopNum, #stopDays{
	  	display:flex;  
	  	position:relative;
	  	width:180px; 
	  }
	  #stopNum{ 
	  	left:60px;
	  	padding-left:35px;
	  	
	  }
	  #stopDays{ 
	  	left:80px;
	  	padding-left:20px; 
	  }
	 input{
		border:1px solid gray;  
	 }
	 
	 /*마일리지 내역*/
	 #mileHistory{
	 	margin-top:50px;
	 	position:relative;
	 	top:-600px;
	 	
	 }
	 #mileBar{ 
	 	position:relative;
	 	top:100px; 
	 	height:50px;
	 	padding: 20px 0 0 20px;
	 }
	 #mileBar>div{
	 	position:relative;
	 	width:200px;
	 	top:-10px;
	 }
	 #mileHistory button{
	 	border-color:lightgray;
	 }
	 #mileBigBtn{
	 	margin:150px 0 0 80px;
	 }
	  #mileBtn{
		position:relative;
		top:-30px;
		left:660px; 
	 }
	  #mileBtn>button{
	  	width:80px; 
	  }
	  .numSpace{
	  	margin-left:15px;
	  	font-weight:bold;
	  	color:fuchsia;
	  }
	  
	 /*마일리지 표*/  
	 #mileTbl{
	 	margin-left: 80px;
	 } 
	.tg  {
		border-collapse:collapse;
		border-color:#aaa;
		border-spacing:0;
	}
	.tgr td{
		border-bottom-width:1px;
		border-color:#aaa;
		border-style:solid;
		border-top-width:1px;
		border-width:0px;
		color:#333;
		font-size:14px;
		overflow:hidden;
		padding:10px 5px;
		word-break:normal;
	}
	.tgr th{
		background-color:#FAF9F6;
		border-bottom-width:1px #aaa solid; 
		border-top-width:1px;
	    border-width:0px;
	    color:#404040;
	    font-size:14px;
	    font-weight:normal;
	    overflow:hidden;
	    padding:10px 5px;
	    word-break:normal;
	 }
	.tgr .mileTop{
		font-weight:bold;
		text-align:center;
		vertical-align:middle
	}
	.tgr .tgr-vj7v, .tgr .mileDate, .tgr .mileRow, .tgr .tgr-xpxz, .tgr .tgr-0ok3{
		text-align:center;
		vertical-align:middle; 
	}
	.tgr .tgr-vj7v, .tgr .tg-xpxz{
		color:#3531ff;
	}   
	.tgr .tgr-0ok3{
		border-color:inherit;
		color:#fe0000;
	}  
	#milepage{
		position:relative;
		top:- 50px; 
	}
	.mileSubject{
		float:left;
		vertical-align: middle;
		margin:15px 0 0 20px; 
	}
	.mileName{
		font-size:16px;
		margin-bottom:5px;
	}
	
	/*즐겨찾는 농장*/ 
	 #favoriteFarm{
		position:relative;
		top:-600px;
	 }
	 #favoriteFarmBar{ 
	 	position:relative;
	 	top:100px; 
	 	height:50px;
	 	padding: 10px 0 0 20px;
	 }
	 
	 /*즐겨찾기 농장 테이블*/ 
	.tga  {border:none;border-collapse:collapse;border-color:#aaa;border-spacing:0;}
	.tga td{background-color:#fff;border-color:#aaa;border-style:solid;border-width:0px;color:#333;
	  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tga th{background-color:#FAF9F6;border:#aaa solid;border-width:0px;color:#404040;
	  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tga .tg-uron{border-color:#ffffff;color:#000000;font-size:15px;text-align:center;vertical-align:middle}
	.tga .favoriteTop{font-size:15px;font-weight:bold;text-align:center;vertical-align:middle}
	.tga .tg-8goc{font-size:15px;text-align:center;vertical-align:middle}
	.tga .favoriteIntro{border-color:#ffffff;font-size:15px;text-align:left;vertical-align:middle}
	.tga .tg-3hmd{border-color:#ffffff;font-size:15px;text-align:center;vertical-align:middle}
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
	#cart{
		position:relative;
		top:-600px;
	}
	#cartBar{ 
	 	position:relative;
	 	top:300px; 
	 	height:50px;
	 	padding: 10px 0 0 20px;
	}
	
	 /*장바구니 테이블*/
	.tgc  {border:none;border-collapse:collapse;border-color:#aaa;border-spacing:0;}
	.tgc td{background-color:#fff;border-color:#aaa;border-style:solid;border-width:0px;color:#333;
	  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tgc th{background-color:#FAF9F6;border:#aaa solid;border-width:0px;color:#404040;
	  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tgc .tg-yrou{border-color:inherit;font-size:15px;font-weight:bold;text-align:center;vertical-align:middle}
	.tgc .tg-7btt{border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
	.tgc .tg-hysb{border-color:inherit;text-align:center;vertical-align:middle}
	.tgc .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
	.tgc .favoriteIntro{border-color:#ffffff;font-size:15px;text-align:left;vertical-align:middle}
	.tgc .tg-3hmd{border-color:#ffffff;font-size:15px;text-align:center;vertical-align:middle}
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
	.cartProduct{
		font-size:16px;
		margin-bottom:5px; 
		padding-left:50px;
	}
	.cartDetail{
		padding-left:50px;
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
			<h5><strong>일반회원 정보수정</strong></h5>			
		</div>  
		<div id="contentBox"> 
		
		<!-- 회원정보 파트 -->
	   		<div id="infoBox">
		 	<div id="infoTitle"><p>일반회원 정보</p></div>
		 		<ul id="infoHeader">
		 			<li>이름</li>
					<li>아이디</li>
					<li>나이</li>
					<li>생년월일</li>
					<li>연락처</li>
					<li>이메일</li>
					<li>주소</li>
					<li><button class="success" value="주소검색" name="" id="addrBtn">주소 검색</button></li>
					<li>가입일</li> 
		 		</ul>
		 		<ul id="info">
		 			<li><input type="text" value="홍길동"/></li>
					<li><input type="text" value="singsing"/></li>
					<li><input type="text" value="27"/></li>
					<li><input type="text" value="1987/12/01"/></li>
					<li><input type="text" value="010-7426-8542"/></li>
					<li><input type="text" value="hongsing@google.com"/></li>
					<li><input type="text" value="서울시 마포구 백범로"/></li>
					<li><input type="text" value="563-3"/></li>
					<li><input type="text" value="2021/11/01"/></li>  
		 		</ul>
		 		<div class="btns">
					<button class="success" value="회원 목록" name="customerList" >회원 목록</button>
					<button class="success" value="수정" name="edit" >수정</button>
					<button class="success" value="삭제" name="del" >삭제</button>
				</div>
		 	</div>
		 	
		 	<!-- 구매내역 파트 -->
	   		<div id="buyHistory">
			 	<div id="buyTitle"><p>구매현황</p></div> 	
			 	<section id="buyBox">		 
					<div>구매 진행중 <br/><div id="buyINGfloat"><div id="buyING" style="color:red">6</div>건</div></div>
					<div>구매 완료 <br/><span id="buyDone" style="color:green">24</span>건</div>
					<div>취소 요청 <br/><span id="cancelReq" style="color:orange">2</span>건</div>
					<div>반품 요청 <br/><span id="refundReq" style="color:blue">0</span>건</div>
					<div>교환 요청 <br/><span id="changeReq" style="color:purple">1</span>건</div>	 
			 	</section> 	 
		 	</div> 
		 	
		 	<!-- 신고내역 파트 -->
		 	<div id="reportBox">
			 	<div id="reportTitle"><div id="reportHead">신고내역</div></div> 	
			 	<section id="reportsBox">		 
					<div id="stopNum">정지 횟수 <div class="numSpace">2</div>회</div>
					<div id="stopDays">정지 총 일수  <div class="numSpace">26</div>일</div>		
			 	</section> 	 
		 	</div> 
		 	
		 	<!-- 마일리지 파트 -->
			<div id="mileHistory">
				<div id="mileBar"><div><strong>회원 마일리지 내역</strong></div></div>
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
					<table class="tgr" style="undefined;table-layout: fixed; width: 912px">
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
					    <td class="mileRow"><img src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg" width="80" height="80"></td>
					    <td class="mileSubject">
					    	<div class="mileName" style="font-weight:bold">맛깔나는 귤</div> 
					    	<div class="mileDetail" style="color:#9B9B9B">맛깔나는 귤의 설명입니다</div>
					    </td>
					    <td class="mileRow">17,980원</td>
					    <td class="mileRow"><span style="color:#3531FF">17 p 적립</span></td>
					    <td class="mileRow">230p</td>
					  </tr>
					  <tr>
					    <td class="mileDate">2021-03-31<br>21:30</td>
					    <td class="mileRow"><img src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg" alt="Image" width="69" height="80"></td>
					    <td class="mileSubject">
						    <div class="mileName" style="font-weight:bold">맛깔나는 쌀</div> 
						    <div class="mileDetail" style="color:#9B9B9B">맛깔나는 쌀의 설명입니다</div>
					    </td>
					    <td class="mileRow">11,980원</td>
					    <td class="tgr-vj7v">19p 적립</td>
					    <td class="mileRow">213p</td>
					  </tr>
					  <tr>
					    <td class="mileDate">2021-04-02<br>01:27</td>
					    <td class="mileRow"><img src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg" alt="Image" width="69" height="80"></td>
					    <td class="mileSubject">
						    <div class="mileName" style="font-weight:bold">생일 축하 마일리지</div> 
						    <div class="mileDetail" style="color:#9B9B9B">생일 축하합니다!</div>
					    </td>
					    <td class="mileRow">-</td>
					    <td class="tgr-xpxz">1000p적립</td>
					    <td class="mileRow">202p</td>
					  </tr>
					  <tr>
					    <td class="mileDate">2021-04-13<br>19:24</td>
					    <td class="mileRow"><img src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg" alt="Image" width="69" height="80"></td>
					    <td class="mileSubject">
						    <div class="mileName" style="font-weight:bold">포인트 사용</div> 
						    <div class="mileDetail" style="color:#9B9B9B">결제시 포인트를 사용하여 할인받았습니다</div>
					    </td>
					    <td class="mileRow">-</td>
					    <td class="tgr-0ok3">1000p 사용</td>
					    <td class="mileRow">3000p</td>
					  </tr>
					  <tr>
					    <td class="mileDate">2021-05-01<br>01:52</td>
					    <td class="mileRow"><img src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg" alt="Image" width="69" height="80"></td>
					    <td class="mileSubject">
						    <div class="mileName" style="font-weight:bold">맛깔나는 토마토</div> 
						    <div class="mileDetail" style="color:#9B9B9B">맛깔나는 토마토 먹어보겠습니다</div>
					    </td>
					    <td class="mileRow">15,990원</td>
					    <td class="tg-vj7v">519p 적립</td>
					    <td class="mileRow">850p</td>
					  </tr>
					</tbody>
					</table>
				</div>
			<div class="page_wrap">
				<div class="page_nation" id="milepage">
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
			
			<!-- 즐겨찾기 농장 파트 -->
	 		<div id="favoriteFarm">
				<div id="favoriteFarmBar"><strong>회원 즐겨찾기 농장</strong></div>
				<div id="favoriteFarmTbl">
					<table class="tga" style="undefined;table-layout: fixed; width: 1021px">
						<colgroup>
						<col style="width: 103px">
						<col style="width: 465px">
						<col style="width: 138px">
						<col style="width: 181px">
						<col style="width: 134px">
						</colgroup>
						<thead>
						  <tr>
						    <th class="favoriteTop" colspan="2">소개</th>
						    <th class="favoriteTop">위치</th>
						    <th class="favoriteTop">즐겨찾기 한 사용자</th>
						    <th class="favoriteTop">샵 바로가기</th>
						  </tr>
						</thead>
						<tbody>
						  <tr>
						    <td class="tg-8goc"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 384 512'%3e%3cpath fill='%23000000' d='M120 72c0-39.765 32.235-72 72-72s72 32.235 72 72c0 39.764-32.235 72-72 72s-72-32.236-72-72zm254.627 1.373c-12.496-12.497-32.758-12.497-45.254 0L242.745 160H141.254L54.627 73.373c-12.496-12.497-32.758-12.497-45.254 0-12.497 12.497-12.497 32.758 0 45.255L104 213.254V480c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V368h16v112c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V213.254l94.627-94.627c12.497-12.497 12.497-32.757 0-45.254z'/%3e%3c/svg%3e" width="75" height="75"></td>
						    <td class="favoriteIntro"><span style="font-weight:bold">작은 농부의 농장</span><br><span style="color:#9B9B9B">언제나 정직하게 판매하는 작은 농부입니다!</span><br><span style="color:#9B9B9B">항상 찾아주셔서 감사합니다.</span></td>
						    <td class="tg-3hmd">충북 제천</td>
						    <td class="tg-uron"><span style="color:#FE0000"><img src="<%=request.getContextPath()%>/img/y_heart.png" alt="Image" width="20" height="20"> 999+</span></td>
						    <td class="tg-uron"><button class="success" value="이동" name="">이동</button></td>
						  </tr>
						  <tr>
						    <td class="tg-8goc"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 384 512'%3e%3cpath fill='%23000000' d='M120 72c0-39.765 32.235-72 72-72s72 32.235 72 72c0 39.764-32.235 72-72 72s-72-32.236-72-72zm254.627 1.373c-12.496-12.497-32.758-12.497-45.254 0L242.745 160H141.254L54.627 73.373c-12.496-12.497-32.758-12.497-45.254 0-12.497 12.497-12.497 32.758 0 45.255L104 213.254V480c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V368h16v112c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V213.254l94.627-94.627c12.497-12.497 12.497-32.757 0-45.254z'/%3e%3c/svg%3e" width="75" height="75"></td>
						    <td class="favoriteIntro"><span style="font-weight:bold">아침 고요 농장</span><br><span style="color:#9B9B9B">느리지만 안심하고 먹을 수 있는 먹거리를 만듭니다</span></td>
						    <td class="tg-3hmd">경북 예천</td>
						    <td class="tg-uron"><span style="color:#FE0000"><img src="<%=request.getContextPath()%>/img/y_heart.png" alt="Image" width="20" height="20"> 777</span></td>
						    <td class="tg-uron"><button class="success" value="이동" name="">이동</button></td>
						  </tr>
						  <tr>
						    <td class="tg-8goc"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 384 512'%3e%3cpath fill='%23000000' d='M120 72c0-39.765 32.235-72 72-72s72 32.235 72 72c0 39.764-32.235 72-72 72s-72-32.236-72-72zm254.627 1.373c-12.496-12.497-32.758-12.497-45.254 0L242.745 160H141.254L54.627 73.373c-12.496-12.497-32.758-12.497-45.254 0-12.497 12.497-12.497 32.758 0 45.255L104 213.254V480c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V368h16v112c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V213.254l94.627-94.627c12.497-12.497 12.497-32.757 0-45.254z'/%3e%3c/svg%3e" width="75" height="75"></td>
						    <td class="favoriteIntro"><span style="font-weight:bold">우리 싱싱농장</span><br><span style="color:#9B9B9B">우리 손으로 직접 재배한 채소만 판매합니다</span></td>
						    <td class="tg-3hmd">경기도 의정부</td>
						    <td class="tg-uron"><span style="color:#FE0000"><img src="<%=request.getContextPath()%>/img/y_heart.png" alt="Image" width="20" height="20"> 32</span></td>
						    <td class="tg-uron"><button class="success" value="이동" name="">이동</button></td>
						  </tr>
						  <tr>
						    <td class="tg-8goc"><img src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 384 512'%3e%3cpath fill='%23000000' d='M120 72c0-39.765 32.235-72 72-72s72 32.235 72 72c0 39.764-32.235 72-72 72s-72-32.236-72-72zm254.627 1.373c-12.496-12.497-32.758-12.497-45.254 0L242.745 160H141.254L54.627 73.373c-12.496-12.497-32.758-12.497-45.254 0-12.497 12.497-12.497 32.758 0 45.255L104 213.254V480c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V368h16v112c0 17.673 14.327 32 32 32h16c17.673 0 32-14.327 32-32V213.254l94.627-94.627c12.497-12.497 12.497-32.757 0-45.254z'/%3e%3c/svg%3e" width="75" height="75"></td>
						    <td class="favoriteIntro"><span style="font-weight:bold">언제나 유기농 농장</span><br><span style="color:#9B9B9B">모든 제품 유기농으로만, 최고급으로.</span></td>
						    <td class="tg-3hmd">충남 태안</td>
						    <td class="tg-uron"><span style="color:#FE0000"><img src="<%=request.getContextPath()%>/img/y_heart.png" alt="Image" width="20" height="20">156</span></td>
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
					<table class="tgc" style="undefined;table-layout: fixed; width: 973px">
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
					    <td class="tg-0pky"><img src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg" width="80" height="80"></td>
					    <td class="favoriteIntro">
						    <div class="cartProduct wordCut" style="font-weight:bold">맛깔나는 귤</div>
						    <div class="cartDetail wordCut">싱싱농산 귤은 언제나 맛있다! 우리 싱싱농장에서 정성으로 키운 싱싱한 귤을 빠른 배송으로 받아보세요!</div>
						</td>
					    <td class="tg-3hmd">17,960원</td>
					  </tr>
					  <tr>
					    <td class="tg-hysb">2021-05-25<br>12:30</td>
					    <td class="tg-0pky"><img src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg" width="80" height="80"></td>
					    <td class="favoriteIntro">
						    <div class="cartProduct wordCut" style="font-weight:bold">맛깔나는 귤</div>
						    <div class="cartDetail wordCut">싱싱농산 귤은 언제나 맛있다! 우리 싱싱농장에서 정성으로 키운 싱싱한 귤을 빠른 배송으로 받아보세요!</div>
						</td> <td class="tg-3hmd">28,650원</td>
					  </tr>
					  <tr>
					    <td class="tg-hysb">2021-05-30<br>19:25</td>
					    <td class="tg-0pky"><img src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg" width="80" height="80"></td>
					     <td class="favoriteIntro">
						    <div class="cartProduct wordCut" style="font-weight:bold">맛깔나는 귤</div>
						    <div class="cartDetail wordCut">싱싱농산 귤은 언제나 맛있다! 우리 싱싱농장에서 정성으로 키운 싱싱한 귤을 빠른 배송으로 받아보세요!</div>
						</td> <td class="tg-3hmd">85,620원</td>
					  </tr>
					  <tr>
					    <td class="tg-hysb">2021-05-30<br>11:21</td>
					    <td class="tg-0pky"><img src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg" width="80" height="80"></td>
					     <td class="favoriteIntro">
						    <div class="cartProduct wordCut" style="font-weight:bold">맛깔나는 귤</div>
						    <div class="cartDetail wordCut">싱싱농산 귤은 언제나 맛있다! 우리 싱싱농장에서 정성으로 키운 싱싱한 귤을 빠른 배송으로 받아보세요!</div>
						</td> <td class="tg-3hmd">26,600원</td>
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
</div>
</div>
</html>