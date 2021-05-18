<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/xstyle_sellerSales.css">
<!-- 차트 라이브러리 chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js"></script>
<!-- chart.js pdf 변환 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js'></script>

<!-- 오늘의 날짜를 계산해서 오늘 기준으로 년도, 월, 일이 언제인지를 기준으로 값이 입력 될 수 있도록 한다. -->
<c:set var='today' value="<%=new java.util.Date()%>" />
<c:set var='monthPtn'>
	<fmt:formatDate value="${today }" pattern="yyyy-MM" />
</c:set>
<c:set var='datePtn'>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" />
</c:set>
<c:set var='yearCheck'>
	<fmt:formatDate value="${today }" pattern="yyyy" />
</c:set>
<style>
	#topBar h5{  
		padding-left:190px;
		width:450px !important;
	}
	#topBar li{
		width:12%;
	}   
	article{
		width:1080px;
		position:relative;
		top:-130px; 
	}
	.wrapContainer {
		background-color:white;
		border-radius:10px;
		border-color:lightgray;  
		margin:50px 30px;
		width:95% !important;
	}  
	#pdfDown{
		margin: 10px 20px 0 0;
	}
	button{
		border-radius:5px;
	}
	#categoryList, #categoryListMiddle ul {
		border-color:lightgray;
	}
	#calendarApply{
		width:120px; 
	}
	#categorySearch_container{
		position:relative;
		top:100px;
		left:25px;
	}
	b{
		position:relative;
		top:-7px;
		left:-6px;
	}
	#excelViewNum, #excelDown{
		position:relative;
		top:-80px;
		margin:90px 20px 0 0;
	}  
	/* 페이징처리부분 */ 
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
	#excelList{
		margin-left:0 !important;
		width:929px !important;
	}
	#excelList li {
    	flex-basis: 18%;
		border:none;
		border-right:1px solid #eee;
    }
    #excelList li:nth-of-type(1) {
    	border-radius:10px 0 0 0 ;
    }
    #excelList li:nth-of-type(6) {
    	border-radius:0 10px 0 0 ;
    }
    
    /*카테고리 선택, 수익, 매출분석 컨테이너*/
    #salesBox1, #salesBox2, #salesCateBox{
    	width:980px !important; 
    	margin-top:40px;
		margin-left:0 !important;
		position:relative;
    } 
    #salesCateBox{
    	height:500px; 
    }
	#salesBox1, #salesBox2{ 
		position:relative;
		top:460px !important;
    	height:630px; 
	} 
    #sales1Title{
	  	text-align:center;
	  	font-weight:bold;
	  	font-size:16px;
	  	letter-spacing:2px;
	  	border-bottom:1px solid lightgray;
		border-radius: 10px 10px 0px 0px;
	  	background-color:#FAF9F6;
	  	height:60px; 
	  }  
	  #calendarApply>div{
	  	position:relative;
	  	top:-7px;
	  }
	  /*매출분석*/
	#excelContainer{
		position:relative;
		top:-70px;
	} 
	#salesCateTitle, #sales1Title, #sales2Title{
		padding-top:10px !important;
	}
	
</style>
<script>
 
</script>
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="salesCateAnalasysA">카테고리별 매출 분석</a></strong></h5></li> 
			</ul> 
		</div>  
	</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
   		<div id="contentBox">
   			<section> 

	<!-- 본문 시작 -->
	<article>
		<div class="wrap"> 
			<!-- 카테고리 선택 -->
			<div id="salesCateBox">
				<div class="wrapTitle">
					<div id="salesCateTitle">카테고리</div> 
					
			 
			<div class="wrapContainer" id="salesCateContainer">
				<div id="categoryList">
					<div id="categoryListMiddle">
						<!-- 대분류 카테고리!!!! -->
						<ul id="category">
							<!-- 카테고리 리스트에서 모든 카테고리 리스트를 가져오지만 우선 대분류만 보이게 한다.-->
							<c:if test="${cateList!=null}">
								<!-- 변수 i를 선언해주고 -->
								<c:set var="i" value="1" />
								<!-- 변수 i 즉, catenum이 i와 일치하는 데이터 하나를 가지고 오면 
											i를 더해주어 다음 조건을 만들어 다음 번호 것만 가져오게 한다 -->
								<c:forEach var="categoryList" items="${cateList}">
									<c:if test="${categoryList.catenum==i}">
										<li value="${categoryList.catenum}"><a href="#" onclick="return false">${categoryList.catename}</a><span>&gt;</span></li>
										<c:set var="i" value="${i+1 }" />
									</c:if>
								</c:forEach>
								<c:remove var="i" />
							</c:if>
						</ul>

						<!-- 중분류 카테고리 -->
						<ul id="mcategory"></ul>
					</div>

					<!-- 중분류 카테고리 선택하면 선택된 사항이 삽입되는 위치 -->
					<ul id="categoryManagement"></ul>

					<!-- 날짜 적용 할 수 있는 기능들 모여있는 컨테이너 -->
					<div id="categorySearch_container">
						<select class="categorySearch_item" id="categoryDate" name="categoryDate" onchange="typeChange(this)">
							<option value="년별">년별</option>
							<option value="월별" selected>월별</option>
							<option value="일별">일별</option>
						</select> <input type="month" min="2018-01" max="${monthPtn }" id="categoryCalendar_start" /> <b>&nbsp;&nbsp;~&nbsp;&nbsp;</b> <input type="month" min="2018-01" max="${monthPtn }" id="categoryCalendar_end" />
						<button id="calendarApply" style="margin-left: 10px;"><div>날짜 적용</div></button>
					</div>

				</div>
				<!-- categoryList 끝 -->
			</div>
			</div>
			<!-- 카테고리 선택 끝 -->

				<!-- 수익 매출 분석 -->
			<div id="salesBox1">
				<div class="wrapTitle">
					<div id="sales1Title"><p><strong>수익 매출분석</strong></p></div> 
					<button class="normalBtn" id="pdfDown">PDF 저장</button>
				</div>
				<div class="wrapContainer">
					<div id="chartContainer">
						<canvas id="myChart" style="width: 400px; height: 200px;"></canvas>
	
						<script> // 차트 선언, 카테고리, 날짜, 차트, 엑셀 관여하는 스크립트
						
						let ctx = document.getElementById("myChart").getContext("2d");
						myChart = new Chart(ctx, {
							type: 'line',
							data:{
								labels: [], // 몇년 몇월 몇일 표시하는 데이터
								datasets: [] // 차트에 그려지는 데이터를 표시하는 데이터
							},
							options: {
								scales:{
									y:{
										beginAtZero: true // 차트 숫자는 0부터 표시
									}
									
								}
								
							}
						});
						
						</script>
					</div>
				</div>
			</div>
			<!-- 수익 매출분석 끝 -->
			<!-- 매출분석 시작 -->
			<div id="salesBox2">
				<div class="wrapTitle">
					<div id="sales2Title"><p><strong>매출분석</strong></p></div>
					<button class="normalBtn" id="excelDown">엑셀 저장</button>
					<select id="excelViewNum">
						<option selected="selected">10</option>
						<option>50</option>
						<option>100</option>
					</select>
				</div>
			<div class="wrapContainer">
				<div id="excelContainer">
					<ul id="excelList">
						<li>주문번호</li>
						<li>매출일자</li>
						<li>상품명</li>
						<li>수량</li>
						<li>단가</li>
						<li>매출금액</li>
					</ul>
				</div>
				<div id="totalMoney"></div>
				<!--------------페이징 표시-------------------->
				<div class="page_wrap" style="margin-top:60px;">
					<div class="page_nation">
						<a class="arrow pprev" href="#" onclick="return false;"></a> <a class="arrow prev" href="#" onclick="return false;"></a> <a class="active" href="#" onclick="return false;">1</a> <a class="arrow next" href="#" onclick="return false;"></a> <a class="arrow nnext" href="#" onclick="return false;"></a>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
	</article> 
</section>
   		 	
		 </div> 
</div>
</div>