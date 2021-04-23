<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/xstyle_sellerSales.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js"></script>
<!-- 오늘의 날짜를 계산해서 오늘 기준으로 년도, 월, 일이 언제인지를 기준으로 값이 입력 될 수 있도록 한다. -->
<c:set var='today' value="<%=new java.util.Date() %>"/>
<c:set var='monthPtn'><fmt:formatDate value="${today }" pattern="yyyy-MM"/></c:set>
<c:set var='datePtn'><fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/></c:set>
<c:set var='yearCheck'><fmt:formatDate value="${today }" pattern="yyyy"/></c:set>

<script>
	// 날짜 변경 yearCheck하는 변수 선언
	let yearCheck="";
	// 날짜를 년별, 월별, 일별을 바꿀 경우 그 조건에 맞게 input 박스를 change 한다.
	function typeChange(e){
		let optionCheck = $(e).val();
		
		if(optionCheck=="년별"){
			// 년별 넣을때 스타트와 엔드를 드롭박스로 만든다.
			// start date
			let start = "<select id='categoryCalendar_start'>";
				for(let i=2018; i<=${yearCheck};i++){
					start += "<option>"+i+"</option>";
				}
				start += "</select>";
			
			// end date
			let end = "<select id='categoryCalendar_end'>";
				for(let i=2018; i<=${yearCheck};i++){
					//마지막 년도는 selected 하도록 한다.
					if(i==${yearCheck}){
						end += "<option selected>"+i+"</option>";
					} else {
						end += "<option>"+i+"</option>";
					}
				}
				end += "</select>";	
				
			// tag를 변수를 넣어서 치환한다.
			$("#categoryCalendar_start").replaceWith(start);
			$("#categoryCalendar_end").replaceWith(end).attr('selected',${yearCheck});
			yearCheck="년별";
		}else if(optionCheck=="월별"){
			// 년별을 눌렀었을 경우에는 태그가 변경 되었기 때문에 다시 치환해줘야 한다.
			if(yearCheck=="년별"){
				console.log("test");
				let start = "<input class='categorySearch_container_child' ";
					start+= " type='month' min='2018-01' max='${monthPtn }' id='categoryCalendar_start'/>";
					
				let end = "<input class='categorySearch_container_child' ";
					end+= " type='month' min='2018-01' max='${monthPtn }' id='categoryCalendar_end'/>";
				
				$("#categoryCalendar_start").replaceWith(start);
				$("#categoryCalendar_end").replaceWith(end);
						
			} else{ // 년별 선택이 아니었을 경우 원래대로 넣는다.
				$("#categoryCalendar_start").attr('type','month').attr('max','${monthPtn}');
				$("#categoryCalendar_end").attr('type','month').attr('max','${monthPtn}');
			}
			yearCheck="";
		}else if(optionCheck=="일별"){
			// 년별을 눌렀었을 경우에는 태그가 변경 되었기 때문에 다시 치환해줘야 한다.
			if(yearCheck=="년별"){
				let start = "<input class='categorySearch_container_child' ";
					start+= " type='date' min='2018-01-01' max='${datePtn }' id='categoryCalendar_start'/>";
					
				let end = "<input class='categorySearch_container_child' ";
					end+= " type='date' min='2018-01-01' max='${datePtn }' id='categoryCalendar_end'/>";
				
				$("#categoryCalendar_start").replaceWith(start);
				$("#categoryCalendar_end").replaceWith(end);
						
			} else{// 년별 선택이 아니었을 경우 원래대로 넣는다.
				$("#categoryCalendar_start").attr('type','date').attr('max',"${datePtn}");
				$("#categoryCalendar_end").attr('type','date').attr('max',"${datePtn}");
			}
			yearCheck="";
		}
		
	}
	
	$(()=>{
		
	})
</script>
<section>
	<!-- 사이드바 -->
	<nav>
		<ul>
			<li><a href="#">상품 관리</a></li>
			<li><a href="#">상품 등록</a></li>
			<li><a href="#">주문 관리</a></li>
			<li><a href="#">판매 관리</a></li>
			<li><a href="seller_sales">매출 관리</a></li>
			<li><a href="#">정산 관리</a></li>
			<li><a href="#">배송 관리</a></li>
			<li><a href="seller_review">리뷰/문의 관리</a></li>
			<li><a href="intro_farm">회원정보수정</a></li>
		</ul>
	</nav>
	<!-- 본문 시작 -->
	<article>
		<!-- 검색창 -->
		<div id="search_container">
			<span id="search_box">
				<input type="text" id="search" name="search" placeholder="검색하기"><a href="#" onclick="return false;"><img id="search_icon" src="<%=request.getContextPath()%>/resources/img/xsearch_icon.png"/></a>
			</span>
		</div>
		
		
		<div class="wrap">
			<!-- 카테고리 선택 -->
			<div class="wrapContainer">
				<div class="wrapTitle">카테고리</div>
				<div id="categoryList">
					<strong>&nbsp;&nbsp;카테고리</strong>
					
					<div id="categoryListMiddle">
						<ul id="category"><!-- 카테고리 리스트에서 대분류 카테고리만 받아오기 -->
							<c:if test="${cateList!=null}">
								<!-- 변수 i를 선언해주고 -->
								<c:set var="i" value="1"/>
									<c:forEach var="categoryList" items="${cateList}">
										<!-- 변수 i 즉, catenum이 i와 일치하는 데이터 하나를 가지고 오면 
											i를 더해주어 다음 조건을 만들어 다음 번호 것만 가져오게 한다 -->
										<c:if test="${categoryList.catenum==i}">
											<li>${categoryList.catename}<span>&gt;</span></li>
											<c:set var="i" value="${i+1 }"/>
										</c:if>
									</c:forEach>
								<c:remove var="i"/>
							</c:if>
						</ul>
						<ul id="mcategory">
							<li>땅콩</li>
							<li>11</li>
							<li>22</li>
							<li>33</li>
						</ul>
					</div>
					
					
					<ul id="categoryManagement">
						<li>채소&gt;땅콩<span>⊠</span></li>
						<li>채소&gt;11<span>⊠</span></li>
						<li>채소&gt;22<span>⊠</span></li>
						<li>채소&gt;33<span>⊠</span></li>
						
					</ul>
					
					<div id="categorySearch_container">
						<select class="categorySearch_container_child" id="categoryDate" name="categoryDate" onchange="typeChange(this)">
							<option value="년별">년별</option>
							<option value="월별" selected>월별</option>
							<option value="일별">일별</option>
						</select>
						<input class="categorySearch_container_child" type="month" min="2018-01" max="${monthPtn }" id="categoryCalendar_start"/>
						<input class="categorySearch_container_child" type="month" min="2018-01" max="${monthPtn }" id="categoryCalendar_end"/>
						<button id="calendarApply">날짜 적용</button>
					</div>
					
				</div><!-- categoryList 끝 -->
			</div><!-- 카테고리 선택 끝 -->
			
			<!-- 수익 매출 분석 -->
			<div class="wrapContainer">
				<div class="wrapTitle">수익 매출분석</div>
				<div id="chartContainer">
					<canvas id="myChart" style="width:400px;height:200px;"></canvas>
					
					<script>
					
					let ctx = document.getElementById("myChart").getContext("2d");
					let myChart = new Chart(ctx, {
						type: 'line',
						data:{
							labels: [
								'January',
							    'February',
							    'March',
							    'April','April'
							],
							datasets: [{
								label: '채소',
								data: [10000, 25302, 12347, 73946],
								borderColor: 'rgb(255, 99, 132)',
							},{
								label: '가지',
								data: [29477, 83924, 39463, 80736],
								borderColor: 'rgb(54, 162, 235)',
							}]
						},
						options: {
							scales:{
								y:{
									beginAtZero: true
								}
								
							}
						}
					});
					
					
					
					
					// li 개수 구하기 함수
					function lengthCheck(){
						let liLength = $('#categoryManagement>li').length;
						if(liLength>=10){
							alert('최대 10개의 품목만 선택 가능합니다.');
							return false;
						}
						return liLength;
					}
					//차트 추가하기
					function addData(chart, label, data) {
					    //chart.data.labels.push(label);
					    chart.data.datasets.push(data);
					    chart.update();
					}

					//차트 삭제하기
					function removeData(chart,delData) {
					    //chart.data.labels.pop();
					    //alert(chart.data.datasets[1].label);
					    //chart.data.datasets.splice(1,1)
					    chart.data.datasets.splice(delData,1);
					    chart.update();
					}
					
					// 선택한 날짜가 시작일이 종료일보다 뒤일 경우 경고창
					function dateGapCheck(){
						
					}
					
					
					///////////////////////////////////////////////////////////////////////// 카테고리, 차트, 엑셀
					$(function(){
						// 중분류 카테고리 선택시 추가하는 기능 categoryManagement
						$('#mcategory>li').click(function(){
							/*========================  category에 포함  ==========================*/
							
							// li 개수 구하기
							let liLength = lengthCheck();
							
							// 목록 선택 한 것이 무엇인가?
							let selectItem = $(this).text();
							
							// li에 존재하는 품목 이름이 있으면 걸러야 한다.
							for(let i=0; i<liLength; i++){
								let getSelect = $('#categoryManagement>li:nth-child('+(i+1)+')').text();
								let gtPosition = getSelect.indexOf(">")+1;
								let boxPosition = getSelect.indexOf("⊠");
								let result = getSelect.substring(gtPosition,boxPosition);
								
								if(result===selectItem){
									return alert("선택되어 있는 품목은 추가 할 수 없습니다.");	
								}
							}
							
							
							// 선택된 목록 추가 ( Management에서도 보여주고, 차트, 엑셀에도 추가가 되어야 한다.)
							let tag = "<li>"+"채소"+"&gt;"+selectItem+"<span>⊠</span></li>";
							$('#categoryManagement').append(tag);
							
							
							/*========================  chart추가  ==========================*/
							// borderColor random
							let color1 = Math.floor(Math.random() * 256); 
							let color2 = Math.floor(Math.random() * 256);
							let color3 = Math.floor(Math.random() * 256);
							
							// datasets에 들어갈 data 세팅
							let data = {
								label: "땅콩",
								data: [10000, 25302, 12347, 73946],
								borderColor: 'rgb('+color1+','+color2+','+color3+')'
							};
							
							// 차트 추가 함수
							addData(myChart, 'test', data)
						})
						
						
						
						// 중분류 삭제 할 때 사용할 기능
						//append로 값을 동적으로 추가해줄 경우 새로 html이 실행 된 것이 아니기 때문에 html에서는 그 값을 읽지 못한다.
						// 그렇기 때문에 document를 사용해 다시 html을 읽기만 해서 싹 둘러보고 찾아서 삭제한다고 생각하면 된다.
						$(document).on('click','#categoryManagement>li',function(){
							
							// 삭제하기 위해서는 어떤 것이 선택되었는지?
							// 그리고 삭제하는 데이터가 추가 된 것 중에 몇번째에 있는지 알 수 있어야 한다.
							let liLength = lengthCheck();
							
							// 삭제할 선택된 아이템
							let selectItem = $(this).text();
							
							// 선택된 아이템의 텍스트를 걸러야 한다.
							let selectGtPosition = selectItem.indexOf(">")+1;
							let selectBoxPosition = selectItem.indexOf("⊠");
							let selectItemResult = selectItem.substring(selectGtPosition,selectBoxPosition);
							
							///////////////////////////////차트 데이터 삭제
							// li에 존재하는 품목 이름이 있으면 걸러야 한다.
							for(let i=0; i<liLength; i++){
								let getSelect = $('#categoryManagement>li:nth-child('+(i+1)+')').text();
								let gtPosition = getSelect.indexOf(">")+1;
								let boxPosition = getSelect.indexOf("⊠");
								let result = getSelect.substring(gtPosition,boxPosition);
								
								// result와 selectItemResult가 맞는 차트데이터를 삭제한다
								if(result===selectItemResult){
									alert("result="+result+", "+"selectItemResult="+selectItemResult);
									removeData(myChart, i);
								}
								
							}
							// 이건 선택되서 아래에 내려온것들 클릭했을때 지워주는거 ex) 채소>땅콩
							$(this).remove();
						})
						
						
						
						//////////////////// 수익 매출분석에 들어갈 labels 시작 /////////////////////
						// 날짜 적용 버튼 클릭시,, labels 추가
						$('#calendarApply').click(function(){
							// 월별 일별에 사용될 스플릿 값 저장할 전역변수 생성!
							let startSplit = null;
							let endSplit = null;

							// 차이값에 대한 계산 결과를 저장하는데 사용할 전역변수 생성!
							let gapResult = 0;
							
							// startDate, endDate 선택된 값을 가져온다.
							let startDateCheck = $('#categoryCalendar_start').val();
							let endDateCheck = $('#categoryCalendar_end').val();
							
							
							//=======================제한사항 걸러내기 3가지 ===========================//
							// 날짜 시작, 종료를 입력하지 않을 경우 걸러낸다.
							if(startDateCheck == '' ||endDateCheck == ''){
								alert('검색할 시작 날짜와 종료 날짜를 반드시 선택해야 합니다.');
								return false;
							}
							
							// 날짜 시작, 종료의 기준일을 반대로 누르는 사람 있으면 걸러야 한다..
							if(startDateCheck > endDateCheck){
								alert('검색 시작 날짜를 종료 날짜보다 미래로 지정 할 수 없습니다.');
								return false;
							}
							
							// 최대 선택 가능 날짜의 차이는 6개월 이다. 일수로 치면 180일 이고,
							// 년도 기준과 6개월 이상, 180일 이상은 차트만 기입되고 엑셀이 기입되지 않도록 한다.
							// 왜냐? 데이터가 너무 많아질 경우 오히려 서비스 저하가 발생 할 수 있기 때문이다.
							
							//========================제한사항 걸러내기 끝 ===============================//
							// 년도, 월별, 일별 어떤 조건인지 확인하고 이동한다.!!!
							let dateCheck = $('#categoryDate>option:selected').val();
							
							
							if(dateCheck != "년별"){ // 년별이 아닐경우 스플릿 변전역변수를 스플릿 해준다!
								// 날짜 - 표시 스플릿해서 없애기
								startSplit = startDateCheck.split("-");
								endSplit = endDateCheck.split("-");
							}
							
							// 차트에 새로운 값 업데이트 하기 전에 모두 지운다.
							// 지우는건 제한사항으로 걸러 낸 다음에 한다.
							let labelsLength = parseInt(Object.keys(myChart.data.labels).length);
							myChart.data.labels.splice(0,labelsLength);
							myChart.update();
							
							/* 생각하자..................
							1. 년도, 월, 일 을 기준으로 endDate와 startDate의 차이를 비교해서 
								년 차이가 있을 경우는 2가지다 ( 같은 년도가 같을 경우, 시작 년도가 작을경우)
								월은 1월 12월 기준으로 변화된 값에 대한 계산
								일은 해당 월의 일이 언제까지인지 계산해서 차이를 계산해야한다.
							2. 해당 차이 값(날짜)을 구해서 차트 labels에 넣어주어야 한다.
							3. "일". 그러니까 해당 월의 마지막 날을 구하는 것은 lastday가 언제인지 식으로 구해야한다.
							//const startCheck = new Date(startDateCheck);
							//const endCheck = new Date(endDateCheck).getFullYear();
							//const gapCheck = new Date(startSplit[0], startSplit[1], 0).getDate();
						
							*/
							
							
							// 월별, 년별, 일별 그리고 지정한 날짜에 따라 차트에 들어가지는 값이 달라진다.
							if(dateCheck=="월별"){
								// split 해 준 값을 계산하기 위해서 정수로 변환해준다.
								startSplit[0] = parseInt(startSplit[0],10);
								startSplit[1] = parseInt(startSplit[1],10);
								
								// 날짜의 차이(년)을 구한다.
								if( startSplit[0] < endSplit[0] ){// 년도 차이가 있다! 
									gapResult = endSplit[1] - startSplit[1] +12; // "월" 계산된 값에 + 12를 해준다.
									for(let i = 0; i <= gapResult; i++){ // gapResult 만큼 반복한다.
										myChart.data.labels.push(startSplit[0]+"-"+startSplit[1]);
										if(startSplit[1]!=12){
											startSplit[1] += 1;
										} else { //startSplit[1]이 12월이 되면 년도와 월을 바꿔서 대입 해줘야 한다.
											startSplit[0] += 1;
											startSplit[1] = 1;
										}
									}
								} else { // 년도 차이가 없다!
									gapResult = endSplit[1] - startSplit[1];
									for(let i = 0; i <= gapResult; i++){ // gapResult 만큼 반복한다.
										myChart.data.labels.push(startSplit[0]+"-"+startSplit[1]);
										startSplit[1] += 1;
									}
								}
								
							} else if(dateCheck=="일별"){
								// split 해 준 값을 계산하기 위해서 정수로 변환해준다.
								startSplit[0] = parseInt(startSplit[0],10);
								startSplit[1] = parseInt(startSplit[1],10);
								startSplit[2] = parseInt(startSplit[2],10);
								
								let startInstance = new Date(startDateCheck).getTime();
								let endInstance = new Date(endDateCheck).getTime();
								
								// 시간으로 바꾼 날짜의 차이를 구한다. 밀리초는 1초를 1000으로 나눈것 + 60초 + 60분 + 24시간을 나누면 1일이 구해진다
								let resultDate = (endInstance-startInstance)/1000/60/60/24;
								
								/* 
									일별에 대해 구하기 위해서는
									1. 년도 차이가 있는지 확인
										--> 년도 차이가 있으면 월과 일의 마지막 날에 변화가 되어야 하고
									2. 월 차이가 있는지 확인
										--> 월의 차이가 있을 경우 일의 마지막 날에 변화가 되어야 한다.
									
									------------ 위에것은 취소!
									아래와 같이 date + 1만으로 년, 월 일 변화를 확인 할 수 있다.
								*/
								
								// 날짜를 객체화 한다.
								let dateCheck = new Date(startSplit);
								
								// 차트에 +1을 하며 넣어준다.
								for(let i = 0; i <= resultDate; i++){
									
									myChart.data.labels.push(dateCheck.getFullYear()+"-"+(dateCheck.getMonth()+1)+"-"+dateCheck.getDate());
									
									dateCheck.setDate(dateCheck.getDate()+1);
								}
							} else if(dateCheck=="년별"){
								gapResult = endDateCheck-startDateCheck;
								
								for(let i = 0; i <= gapResult; i++){
									myChart.data.labels.push(startDateCheck);
									startDateCheck++;
								}
								
							}
							//myChart에 담긴 것을 업데이트한다.
							myChart.update();
						})
						//////////////////// 수익 매출분석에 들어갈 labels 끝 /////////////////////
						
						
						
					})
					
					
					
					</script>
				</div>
			</div><!-- 수익 매출분석 끝 -->
			
			<div class="wrapContainer">
				<div class="wrapTitle">카테고리별 매출분석</div>
				<div id="excelContainer">
					<ul id="excelList">
						<li>No</li>
						<li>매출일자</li>
						<li>상품명</li>
						<li>수량</li>
						<li>단가</li>
						<li>매출금액</li>
						
						<li>No</li>
						<li>매출일자</li>
						<li>상품명</li>
						<li>수량</li>
						<li>단가</li>
						<li>매출금액</li>
					</ul>
				</div>
			</div>
			
		</div>
	</article>
</section>
