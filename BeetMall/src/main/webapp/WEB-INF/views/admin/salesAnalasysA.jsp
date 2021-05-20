<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/xstyle_sellerSales.css">
<!-- 차트 라이브러리 chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js" integrity="sha512-vBmx0N/uQOXznm/Nbkp7h0P1RfLSj0HQrFSzV8m7rOGyj30fYAOKHYvCNez+yM8IrfnW0TCodDEjRqf6fodf/Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- chart.js pdf 변환 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js'></script>

<style>
#contentBox ul {
	margin-left: 0px !important;
}
/*맨 위 top Bar*/
#topBar li {
	width: 12%;
}

#topBar h5 {
	padding-left: 120px;
}

article {
	width: 1080px;
	position: relative;
	top: -100px;
	left: -20px;
	z-index: 0;
}

.wrapContainer {
	background-color: white;
	border-radius: 10px;
	border-color: lightgray;
	-webkit-box-shadow: 4px 6px 15px -7px #C4C4C4;
	box-shadow: 4px 6px 15px -7px #C4C4C4;
	margin: 50px 30px;
	width: 95% !important;
}

#pdfDown {
	margin: 10px 20px 0 0;
}

button {
	border-radius: 5px;
}

#categoryList, #categoryListMiddle ul {
	border-color: lightgray;
}

#calendarApply {
	width: 120px;
}

#categorySearch_container {
	position: relative;
	top: -150px;
	left: 10px;
	height:30px;
}

#categorySearch_container input[type=checkbox] {
	top: -3px;
	left: 20px;
}

#categorySearch_container label {
	background-color: white;
	margin-left:10px;
	line-height:30px;
	font-size: 14px;
}

b {
	position: relative;
	top: -7px;
	left: -6px;
}

#excelViewNum, #excelDown {
	position: relative;
	top: -135px;
}

#salesBox1 {
	width: 100%;
}

#categoryDate {
	max-width: 70px;
	margin-left: 2px;
}

table {
	width: 100%;
	height: 175px;
	border: 1;
	text-align: center;
	table-layout: fixed;
}

table th{
	background-color: #eee;
	text-align: center;
	width: 120px;
	height: 55px;
}
table td{
	font-size: 14px;
}

#excelList {
	margin-left: 0 !important;
	width: 929px !important;
}

#excelList li {
	flex-basis: 18%;
	border: none;
	border-right: 1px solid #eee;
}

#excelList li:nth-of-type(1) {
	border-radius: 10px 0 0 0;
}

#excelList li:nth-of-type(6) {
	border-radius: 0 10px 0 0;
}

/*수익 매출분석 컨테이너*/
#salesBox1, #salesBox2 {
	width: 980px !important;
	margin-top: 40px;
	height: 630px;
}

#sales1Title {
	text-align: center;
	font-weight: bold;
	font-size: 16px;
	letter-spacing: 2px;
	border-bottom: 1px solid lightgray;
	border-radius: 10px 10px 0px 0px;
	background-color: #FAF9F6;
	height: 40px;
}

#sales1Title strong, #sales2Title strong {
	position: relative;
	top: -10px;
}

#calendarApply>div {
	position: relative;
	top: -7px;
}
/*매출분석*/
#excelViewNum, #excelDown {
	margin: 90px 20px 0 0;
}

#excelContainer {
	position: relative;
	top: 20px;
}
/*임시*/
#sales2Title {
	text-align: center;
	font-weight: bold;
	font-size: 16px;
	letter-spacing: 2px;
	border-bottom: 1px solid lightgray;
	border-radius: 10px 10px 0px 0px;
	background-color: #FAF9F6;
	height: 40px;
}
</style>
<script>
//선택된 날짜의 데이터를 저장해 높는 변수
let startCalendarDataValue = "";
let endCalendarDataValue = "";
//날짜 변경을 년별로 했었는지 체크하기 위한 yearCheck 변수 선언
let yearCheck="";
//년별, 월별, 일별인지 체크하기 위한 변수 선언
let dateCheck = "";
/////////////////////////////// 차트 함수 /////////////////////////////
let myChart ;


//기능

//차트 추가하기
function addData(chart, data) {
chart.data.datasets.push(data);
chart.update();
}

//차트 삭제하기
function removeData(chart,delData) {
chart.data.datasets.splice(delData,1);
chart.update();
}

//콤마 찍은 숫자 표현하기, 정규표현식
function reqularExpression(num){
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
}

//콤마 풀고 계산하기 위한 기능
function revertNumType(num){
	return num.replace(/\,/g,'');
}



//날짜를 년별, 월별, 일별을 바꿀 경우 그 조건에 맞게 input 박스를 change 한다.
function typeChange(e){
	let optionCheck = $(e).val();
	
	if(optionCheck=="년별"){
		// 년별 넣을때 스타트와 엔드를 드롭박스로 만든다.
		// start date
		let start = "<select id='categoryCalendar_start' name='categoryCalendar_start'>";
			for(let i=2018; i<=${yearCheck};i++){
				start += "<option>"+i+"</option>";
			}
			start += "</select>";
		
		// end date
		let end = "<select id='categoryCalendar_end' name='categoryCalendar_end'>";
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
			let start = "<input class='categorySearch_container_child' ";
				start+= " type='month' min='2018-01' max='${monthPtn }' id='categoryCalendar_start' name='categoryCalendar_start'/>";
				
			let end = "<input class='categorySearch_container_child' ";
				end+= " type='month' min='2018-01' max='${monthPtn }' id='categoryCalendar_end' name='categoryCalendar_end'/>";
			
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
				start+= " type='date' min='2018-01-01' max='${datePtn }' id='categoryCalendar_start' name='categoryCalendar_start'/>";
				
			let end = "<input class='categorySearch_container_child' ";
				end+= " type='date' min='2018-01-01' max='${datePtn }' id='categoryCalendar_end' name='categoryCalendar_end'/>";
			
			$("#categoryCalendar_start").replaceWith(start);
			$("#categoryCalendar_end").replaceWith(end);
					
		} else{// 년별 선택이 아니었을 경우 원래대로 넣는다.
			$("#categoryCalendar_start").attr('type','date').attr('max',"${datePtn}");
			$("#categoryCalendar_end").attr('type','date').attr('max',"${datePtn}");
		}
		yearCheck="";
	}
	
}

$(function(){
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
		
		// 체크박스가 1개 이상 눌려 있어야함
		if(!$('#accumulate').prop('checked') && !$('#company').prop('checked') && 
				!$('#seller').prop('checked') && !$('#customer').prop('checked')){
			alert('체크박스를 선택하고 데이터를 적용하시기 바랍니다.');
			return false;
		}
		
		//========================제한사항 걸러내기 끝 ===============================//
		
		$.ajax({
			type: "POST",
			url:'salesAdminChartData',
			data: $('#dataFrm').serialize(),
			success: function(result){
				// 가지고 있는 key값 거꾸로 되어있으니 sort한다
				let keys = Object.keys(result).sort();
				let valueLength ; // 값이 얼마나 들어있는지 확인하기 위한 변수

				
				// 차트 라벨과 데이터셋에 들어있는 데이터 삭제
				myChart.data.labels.splice(0,12);
				myChart.data.datasets.splice(0,12);
				myChart.update();
				
				// 매출분석 엑셀데이터 넣기
				let excelData = "<thead>";
						excelData += "<tr>";
						excelData += "<th>분류</th>";
				// 차트 x축 label 데이터 ex) 2021-1월, 2021-2월 .....
				for( let i = 0; i < keys.length; i++){
					if(keys[0] == 'ac'){
						let labelData = Object.keys(result.ac).sort();
						for(let j = 0 ; j < labelData.length; j++){
							myChart.data.labels.push(labelData[j]);
							excelData += "<th>" + labelData[j] + "</th>";
						}
						valueLength = Object.keys(result.ac).length;
						break;
					} else if(keys[0] == 'co'){
						let labelData = Object.keys(result.co).sort();
						for(let j = 0 ; j < labelData.length; j++){
							myChart.data.labels.push(labelData[j]);
							excelData += "<th>" + labelData[j] + "</th>";
						}
						valueLength = Object.keys(result.co).length;
						break;
					} else if(keys[0] == 'se'){
						let labelData = Object.keys(result.se).sort();
						for(let j = 0 ; j < labelData.length; j++){
							myChart.data.labels.push(labelData[j]);
							excelData += "<th>" + labelData[j] + "</th>";
						}
						valueLength = Object.keys(result.se).length;
						break;
					} else if(keys[0] == 'cu'){
						let labelData = Object.keys(result.cu).sort();
						for(let j = 0 ; j < labelData.length; j++){
							myChart.data.labels.push(labelData[j]);
							excelData += "<th>" + labelData[j] + "</th>";
						}
						valueLength = Object.keys(result.cu).length;
						break;
					}
				}
					excelData += "<th>매출평균</th>";
					excelData += "<th>매출합계</th>";
					excelData += "</thead></tr>";
					excelData += "<tbody>";

				
				// 배열 데이터 저장할 변수 선연
				let valueData = []; // 밑의 InsertData 배열 값들을 저장하는 값
				let acInsertData = [];
				let coInsertData = [];
				let seInsertData = [];
				let cuInsertData = [];
				
				let labelName = [];
				let yAxisData = [];
				let colorData = [];
				let typeData = [];

				// 불러온 데이터 각각의 배열로 순서대로 저장
				keys.forEach(function(checkKey){
					if(checkKey == 'ac'){
						for(let i = 0; i < valueLength; i++){
							acInsertData.push(result.ac[ Object.keys(result.ac).sort()[i] ]);
						}
						valueData.push(acInsertData);
						labelName.push('누적수익');
						yAxisData.push('A');
						colorData.push('#5eaa5f');
						typeData.push('line');
					} else if(checkKey == 'co'){
						for(let i = 0; i < valueLength; i++){
							coInsertData.push(result.co[ Object.keys(result.co).sort()[i] ]);
						}
						valueData.push(coInsertData);
						labelName.push('회사수익');
						yAxisData.push('A');
						colorData.push('rgba(255, 70, 46,1)');
						typeData.push('line');
					} else if(checkKey == 'se'){
						for(let i = 0; i < valueLength; i++){
							seInsertData.push(result.se[ Object.keys(result.se).sort()[i] ]);
						}
						valueData.push(seInsertData);
						labelName.push('판매자수익');
						yAxisData.push('A');
						colorData.push('#728ef0');
						typeData.push('line');
					} else if(checkKey == 'cu'){
						for(let i = 0; i < valueLength; i++){
							cuInsertData.push(result.cu[ Object.keys(result.cu).sort()[i] ]);
						}
						valueData.push(cuInsertData);
						labelName.push('구매추이');
						yAxisData.push('B');
						colorData.push('rgba(255,178,46,0.6)');
						typeData.push('bar');
					}
					
				})
				
				
				//인덱스 변수
				let index = 0;
				keys.forEach(function(checkKey){
						
					excelData += "<tr>";
					excelData += "<th>" + labelName[index] + "</th>";
					// 매출평균용 저장 변수
					let payAvg = 0;
					// 매출합계 저장 변수
					let paySum = 0;
					// 데이터를 쉽표를 찍어서 넣는다.
					for(let i = 0; i < valueLength; i++){
						payAvg += valueData[index][i];
						paySum += valueData[index][i];
						if(labelName[index] != '구매추이'){
							excelData += "<td>" + reqularExpression(valueData[index][i]) + "원</td>";
						} else {
							excelData += "<td>" + reqularExpression(valueData[index][i]) + "개</td>";
						}
						
					}
					// 위ㅔ서 매출평균, 매출합계에 저장된 데이터를 이용해 데이터를 쉼표를 찍어서 넣는다.
					if(labelName[index] != '구매추이'){
						excelData += "<td style='font-weight:bold'>" + reqularExpression(Math.round(payAvg/valueLength)) + "원</td>";
						excelData += "<td style='font-weight:bold; color:red;'>" + reqularExpression(paySum) + "원</td>";
					} else {
						excelData += "<td style='font-weight:bold'>" + reqularExpression(Math.round(payAvg/valueLength)) + "개</td>";
						excelData += "<td style='font-weight:bold; color:red;'>" + reqularExpression(paySum) + "개</td>";
					}
					excelData += "</tr>";
					
					let data = {
						type : typeData[index],
						label: labelName[index],
						yAxisID: yAxisData[index],
						data: valueData[index],
						borderColor : colorData[index],
						backgroundColor : colorData[index],
						fill: false
					}
					myChart.data.datasets.push(data);
						
					index++;	
				})// foreach문 종료...
				
				// 차트에 데이터 삽입
				excelData += "</tbody>";
				$('table').html(excelData);
				
				// chart update (push한 데이터로 수정한다);
				myChart.update();
				
				
			}, error: function(){
				console.log('ajax 실패');
			}
		})
		
	})
	
})


$( ()=>{
	//pdf 다운로드 누르면 실행
	$('#pdfDown').click( () => {
		// 페이지의 크기를 구한다.
		var reportPageHeight = $('#chartContainer').innerHeight();
		var reportPageWidth = $('#chartContainer').innerWidth();

		  // 캔버스 개체를 만든다.
		  var pdfCanvas = $('<canvas />').attr({
		    id: "canvaspdf",
		    width: reportPageWidth,
		    height: reportPageHeight
		  });
		  
		  // 캔버스 포지션을 정한다.
		  var pdfctx = $(pdfCanvas)[0].getContext('2d');
		  var pdfctxX = 0;
		  var pdfctxY = 0;
		  var buffer = 100;
		  
			  // for each chart.js chart
		  $("canvas").each(function(index) {
		    // 차트의 크기를 구한다.
		    var canvasHeight = $(this).innerHeight();
		    var canvasWidth = $(this).innerWidth();
		    
		    // 새로운 캔버스 안에 넣는다.
		    pdfctx.drawImage($(this)[0], pdfctxX, pdfctxY, canvasWidth, canvasHeight);
		    pdfctxX += canvasWidth + buffer;
	     
		    if (index % 2 === 1) {
		      pdfctxX = 0;
		      pdfctxY += canvasHeight + buffer;
		    }
		  }); 
		  
		  // pdf 객체를 생성하여 넣는다.
		  var pdf = new jsPDF('l', 'pt', [reportPageWidth, reportPageHeight]);
		  pdf.addImage($(pdfCanvas)[0], 'PNG', 0, 0);
		  
		  // pdf 다운로드
		  pdf.save('BEETMALL 매출내역.pdf');
		  alert('BEETMALL 매출내역 PDF 파일 다운로드가 실행되어 다운로드 폴더에 생성됩니다.');
	});
})


$(()=>{
	// 엑셀저장
	$('#excelDown').click( () => {
		if($('table>thead>tr>th:nth-child(1)').text() != '분류'){
			alert('데이터를 조회 후 사용 가능합니다.');
			return false;
		}
		// thead 컬럼의 갯수
		let columnLength = $('table>thead>tr>th').length;
		// tbody 행의 갯수
		let rowLength = $('table>tbody>tr').length;
		
		
		console.log($('table>thead>tr>th:nth-child(1)').text());
		console.log($('table>thead>tr>th:nth-child(2)').text());
		console.log($('table>tbody>tr:nth-child(1)>th').text());
		console.log($('table>tbody>tr:nth-child(1)>td:nth-child(1)').text());
		console.log($('table>tbody>tr:nth-child(1)>td:nth-child(2)').text());
		console.log($('table>tbody>tr:nth-child(1)>td:nth-child(3)').text());
		console.log($('table>tbody>tr:nth-child(1)>td:nth-child(4)').text());
		console.log($('table>tbody>tr:nth-child(1)>td:nth-child(5)').text());
		
		let excelData = [];
		// thead 데이터 먼저 넣기
		for(let i = 1; i <= columnLength; i++){
			excelData.push($('table>thead>tr>th:nth-child('+i+')').text());
		}
		for(let i = 1; i <= rowLength; i++){
			excelData.push($('table>tbody>tr:nth-child('+i+')>th').text());
			for(let j = 1; j <= columnLength-1; j++){
				excelData.push($('table>tbody>tr:nth-child('+i+')>td:nth-child('+(j+1)+')').text());
			}
		}
		
		console.log(excelData);
		
		$.ajax({
			type: "POST",
			url: "adminSalesExcelDown",
			traditional : true,
			data: {
				"excelData":excelData,
				"rowLength": rowLength,
				"columnLength": columnLength
			}, success: function(result){
				alert('BEETMALL 매출관리 엑셀파일이 다운로드에 성공하여 다운로드 폴더에 다운되었습니다.');
			}, error: function(error){
				alert('엑셀 다운로드 실패');
			}
		});
	});
})


</script>
<%@ include file="/inc/top.jspf"%>
<div id="topBarContainer">
	<div id="topBar">
		<ul>
			<li><h5>
					<strong><a href="salesAnalasysA">매출 분석</a></strong>
				</h5></li>
		</ul>
	</div>
</div>
<div id="body1">
	<%@ include file="/inc/leftBar.jspf"%>
	<div id="container">
		<div id="contentBox">
			<section>
				<!-- 본문 시작 -->
				<article>
					<div class="wrap">
						<!-- 수익 매출 분석 -->
						<div id="salesBox1">
							<div class="wrapTitle">
								<div id="sales1Title">
									<p>
										<strong>수익 매출분석</strong>
									</p>
								</div>
								<button class="normalBtn" id="pdfDown">PDF 저장</button>
							</div>
							<div class="wrapContainer">
								<div id="chartContainer">
									<canvas id="myChart" style="width: 400px; height: 200px;"></canvas>

									<script>
										// 차트 선언, 카테고리, 날짜, 차트, 엑셀 관여하는 스크립트

										let ctx = document.getElementById("myChart").getContext("2d");
										myChart = new Chart(ctx, {
											type : 'line',
											data : {
												labels : [], // 몇년 몇월 몇일 표시하는 데이터
												datasets : []
											// 차트에 그려지는 데이터를 표시하는 데이터
											},
											options: {
												
												//responsive: false,
												tooltips: { 
											           mode: 'label', 
											           label: 'mylabel', 
											           callbacks: { 
											               label: function(tooltipItem, data) { 
											                   return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); }, }, 
											        }, 
											   /*      scaleLabel:
											            function(label){return  '$' + label.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");}, */
												scales:{
												      yAxes: [{
												          id: 'A',
												          type: 'linear',
												          position: 'left',
												          ticks: {
												              fontColor: 'lightgray',
												              userCallback(value, index, values) {
												                  // return nf.format(value)
												                  return value.toLocaleString()
												          		}
													      	
												          },
												          gridLines: {
										                        color: "rgba(0, 0, 0, 0)",
										                  }, 
										                  beginAtZero:true
											           
												      		
												        }, {
												        
												          id: 'B',
												          type: 'linear',
												          position: 'right',
												          ticks: {
											          	    fontColor: '#ffbaa2',
											          	  	userCallback(value, index, values) {
											                    // return nf.format(value)
											                    return value.toLocaleString()
										                  	
											          	    }
										                  	
												          },
												          beginAtZero:true
												        
												        }]
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
								<div id="sales2Title">
									<p>
										<strong>매출분석</strong>
									</p>
								</div>
								<!-- 날짜 적용 할 수 있는 기능들 모여있는 컨테이너 -->
								
									<div id="categorySearch_container">
										<form method="post" id="dataFrm">
										<select class="categorySearch_item" id="categoryDate" name="categoryDate" onchange="typeChange(this)">
											<option value="년별" >년별</option>
											<option value="월별" selected>월별</option>
											<option value="일별">일별</option>
										</select> 
										<input type="month" min="2018-01" max="${monthPtn }" id="categoryCalendar_start" name="categoryCalendar_start"/> <b>&nbsp;~&nbsp;</b> 
										<input type="month" min="2018-01" max="${monthPtn }" id="categoryCalendar_end" name="categoryCalendar_end"/>
										
										<input type="checkbox" value="누적수익" name="accumulate" id="accumulate" checked="checked"><label for="accumulate">누적수익</label> 
										<input type="checkbox" value="회사수익" name="company" id="company" checked="checked"><label for="company">회사수익</label> 
										<input type="checkbox" value="판매자수익" name="seller" id="seller" checked="checked"><label for="seller">판매자수익</label> 
										<input type="checkbox" value="구매추이" name="customer" id="customer" checked="checked"><label for="customer">구매추이</label>
										<button id="calendarApply" style="margin-left: 10px; padding: 0; line-height:5px;" onclick="return false;">데이터 적용</button>
										</form>
									</div>
									<button class="normalBtn" id="excelDown">엑셀 저장</button>
								
							</div>
							<div class="wrapContainer" style="margin-bottom:0; overflow-x: scroll; width: 500px; height: 300px;">
								<table>
									
								</table>
							</div>
						</div>
					</div>
				</article>
			</section>

		</div>
	</div>
</div>