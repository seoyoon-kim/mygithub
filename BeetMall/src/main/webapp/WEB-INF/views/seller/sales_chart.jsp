<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/xstyle_sales_chart.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js"></script>
<c:set var='today' value="<%=new java.util.Date() %>"/>
<c:set var='monthPtn'><fmt:formatDate value="${today }" pattern="yyyy-MM"/></c:set>
<c:set var='datePtn'><fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/></c:set>
<c:set var='yearCheck'><fmt:formatDate value="${today }" pattern="yyyy"/></c:set>

<script>
	// 날짜 변경 yearCheck하는 것 
	let yearCheck="";
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
</script>
<section>
	<!-- 사이드바 -->
	<nav>
		<ul>
			<li><a href="#">상품 관리</a></li>
			<li><a href="#">상품 등록</a></li>
			<li><a href="#">주문 관리</a></li>
			<li><a href="#">판매 관리</a></li>
			<li><a href="#">매출 관리</a></li>
			<li><a href="#">정산 관리</a></li>
			<li><a href="#">배송 관리</a></li>
			<li><a href="#">리뷰/문의 관리</a></li>
			<li><a href="#">회원정보수정</a></li>
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
						<ul id="category">
							<li>견과류<span>&gt;</span></li>
							<li>건과류<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							
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
				<div>
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
					
					
					// ================================== 카테고리, 차트, 엑셀
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
							
							
							/*========================  chart에 포함  ==========================*/
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
							
							$(this).remove();
						})
						
						
						
						
						//날짜 적용 선택시 labels 추가
						$('#calendarApply').click(function(){
							let startDateCheck = $('#categoryCalendar_start').val();
							let endDateCheck = $('#categoryCalendar_end').val();
							console.log(startDateCheck);
							if(startDateCheck == '' ||endDateCheck == ''){
								alert('검색할 시작 날짜와 종료 날짜를 반드시 선택해야 합니다.');
							}
							//alert($('#categoryCalendar_start').val());
						})

						
						
						
					})
					
					
					
					</script>
				</div>
			</div><!-- 수익 매출분석 끝 -->
			
			<div class="wrapContainer">
				<div class="wrapTitle">카테고리별 매출분석</div>
				<div></div>
			</div>
			
		</div>
	</article>
</section>
