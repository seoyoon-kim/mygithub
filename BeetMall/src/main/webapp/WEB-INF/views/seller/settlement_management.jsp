<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/xstyle_settlementManagement.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='today' value="<%=new java.util.Date()%>" />
<c:set var='monthPtn'>
	<fmt:formatDate value="${today }" pattern="yyyy-MM" />
</c:set>
<c:set var='datePtn'>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" />
</c:set>
<script>
let startDate;
let endDate;
let selectBtnCheck;

$(()=>{
	$('#dateBtn').click( function(){
		if( $(this).css('background-color') == 'rgb(255, 255, 255)' ){
			$(this).css('background-color','rgb(221,221,221)');
			$('#orderBtn').css('background-color','rgb(255, 255, 255)');
		}
	});
	
	$('#orderBtn').click( function(){
		if( $(this).css('background-color') == 'rgb(255, 255, 255)' ){
			$(this).css('background-color','rgb(221,221,221)');
			$('#dateBtn').css('background-color','rgb(255, 255, 255)');
		}
	});
})
// 콤마 찍은 숫자 표현하기, 정규표현식
function reqularExpression(num){
	//							/ : 정규표현식 시작
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
}

// 검색 누를경우 시작 .... pageNum 초기화
function dataInsertCheck(){
	startDate = $('#startDate').val();
	endDate = $('#endDate').val();
	let pageNum = 1;
	
	if( startDate == '' || endDate == '' ){
		alert('조회기간을 설정해야 조회 가능합니다.');
		return false;
	}

	// 조회기준 '날짜' 선택되어 있을 경우
	if( $('#dateBtn').css('background-color') == 'rgb(221, 221, 221)' ){
		selectBtnCheck = "날짜";
		searchingData(pageNum);
		
	} else { // 주문건별 선택되어 있을 경우
		selectBtnCheck = "주문건별";
		searchingData(pageNum);
	}
	console.log(selectBtnCheck);
	
}

//날짜별 매출일자 선택시 초기화
function searchingData(pageNum){
	$.ajax({
		type: 'GET',
		url: 'sellerSettleSearchingData',
		traditional : true,
		data: $('#searchingFrm').serialize()+"&pageNum="+pageNum+"&selectBtnCheck="+selectBtnCheck,
		success: function(result){
			console.log(result);
			let tag = '<thead><tr>';
				tag += '<th scope="col">주문번호</th>';
				tag += '<th scope="col">매출일자</th>';
				tag += '<th scope="col">주문금액</th>';
				tag += '<th scope="col">실결제금액</th>';
				tag += '<th scope="col">결제수수료</th>';
				tag += '<th scope="col">이용수수료</th>';
				tag += '<th scope="col">정산금액</th>';
				tag += '<th scope="col">정산날짜</th>';
				tag += '</tr></thead><tbody>';

			if(result[1].length == 0){
				alert('검색된 데이터가 없습니다.');
				
				tag += '</tbody>';
				
				$('#totalMoney').html('');
				$('table').html(tag);
				return false;
			}
			
			let $result = $(result[1]);
			
			$result.each(function(idx,vo){
				tag += '<tr>';
				tag += '<td>' + vo.ordernum + '</td>';
				tag += '<td>' + vo.orderdate + '</td>';
				tag += '<td>' + reqularExpression(vo.orderprice) + '</td>';
				tag += '<td>' + reqularExpression(vo.realpayment) + '</td>';
				tag += '<td>' + reqularExpression(Math.round(vo.realpayment*0.05)) + '</td>';
				tag += '<td>' + reqularExpression(Math.round(vo.realpayment*0.058)) + '</td>';
				tag += '<td>' + reqularExpression(Math.round(vo.realpayment-(vo.realpayment*0.05)-(vo.realpayment*0.058))) + '</td>';
				if(vo.settlecheck=='Y '){
					tag +=  '<td>'+vo.settledate+'</td>';
				} else {
					tag +=  '<td>-</td>';
				}
				
				tag += '</tr>';
				
			});
			tag += '</tbody>';

			// 엑셀 페이징
			excelInitPaging(result[2].totalPage, result[2].pageNum, result[2].startPageNum, result[2].onePageNum);
			
			// 합계금액
			$('#totalMoney').html("정산 합계 금액 : " + reqularExpression(Math.round(result[0].totalMoney- (result[0].totalMoney*0.05) - (result[0].totalMoney*0.058)) ) + "원");
			
			// 테이블 렌더
			$('table').html(tag);
		},
		error: function(){
			console.log('데이터 가져오기 실패');
		},
	})
}

// 주문 건별 매출일자 선택시 초기화
function searchingData(pageNum){
	$.ajax({
		type: 'GET',
		url: 'sellerSettleSearchingData',
		traditional : true,
		data: $('#searchingFrm').serialize()+"&pageNum="+pageNum+"&selectBtnCheck="+selectBtnCheck,
		success: function(result){
			console.log(result);
			let tag = '<thead><tr>';
				tag += '<th scope="col">주문번호</th>';
				tag += '<th scope="col">매출일자</th>';
				tag += '<th scope="col">주문금액</th>';
				tag += '<th scope="col">실결제금액</th>';
				tag += '<th scope="col">결제수수료</th>';
				tag += '<th scope="col">이용수수료</th>';
				tag += '<th scope="col">정산금액</th>';
				tag += '<th scope="col">정산날짜</th>';
				tag += '</tr></thead><tbody>';
 
			if(result[1].length == 0){
				alert('검색된 데이터가 없습니다.');
				
				tag += '</tbody>';
				
				$('#totalMoney').html('');
				$('table').html(tag);
				return false;
			}
			
			let $result = $(result[1]);
			if(selectBtnCheck == "날짜"){
				
			} else {
				$result.each(function(idx,vo){
					tag += '<tr>';
					tag += '<td>' + vo.ordernum + '</td>';
					tag += '<td>' + vo.orderdate + '</td>';
					tag += '<td>' + reqularExpression(vo.orderprice) + '</td>';
					tag += '<td>' + reqularExpression(vo.realpayment) + '</td>';
					tag += '<td>' + reqularExpression(Math.round(vo.realpayment*0.05)) + '</td>';
					tag += '<td>' + reqularExpression(Math.round(vo.realpayment*0.058)) + '</td>';
					tag += '<td>' + reqularExpression(Math.round(vo.realpayment-(vo.realpayment*0.05)-(vo.realpayment*0.058))) + '</td>';
					if(vo.settlecheck=='Y '){
						tag +=  '<td>'+vo.settledate+'</td>';
					} else {
						tag +=  '<td>-</td>';
					}
					
					tag += '</tr>';
					
				});
			}
			tag += '</tbody>';

			// 엑셀 페이징
			excelInitPaging(result[2].totalPage, result[2].pageNum, result[2].startPageNum, result[2].onePageNum);
			console.log(result[2].startPageNum);
			// 합계금액
			$('#totalMoney').html("정산 합계 금액 : " + reqularExpression(Math.round(result[0].totalMoney- (result[0].totalMoney*0.05) - (result[0].totalMoney*0.058)) ) + "원");
			
			// 테이블 렌더
			$('table').html(tag);
		},
		error: function(){
			console.log('데이터 가져오기 실패');
		},
	})
}

// 페이징 설정
function excelInitPaging(totalPage, pageNum, startPageNum, onePageNum){
	console.log(startPageNum);
	console.log(startPageNum+onePageNum-1);
	console.log(totalPage);
	console.log(pageNum);
	console.log('--------------------');
	let tag = '<div class="page_nation">';
	if( totalPage == 1 ){
		tag += '<a class="arrow pprev" href="#" onclick="return false;"></a>';
		tag += '<a class="arrow prev" href="#" onclick="return false;"></a>'; 
		tag += '<a class="active" href="#" onclick="return false;">1</a>';
		tag += '<a class="arrow next" href="#" onclick="return false;"></a>';
		tag += '<a class="arrow nnext" href="#" onclick="return false;"></a>';
	} else { // total page가 1페이지를 초과하면 실행한다.
		if( pageNum > 1){ // 1페이지가 아닐때, 이전, 맨끝을 만든다.
			tag += '<a class="arrow pprev" href="javascript:searchingData(1)"></a>';
			tag += '<a class="arrow prev" href="javascript:searchingData('+(pageNum-1)+')"></a>';
		}
	//					1 ~ 10  11 ~ 20    (11이면 + onepageNum(10) -1 == 20)
		for( let i = startPageNum; i <= startPageNum+onePageNum-1; i++){
			if( i == pageNum){
				tag += '<a class="active" href="#">'+ i +'</a>';
			} else {
				tag += '<a class="arrow" href="javascript:searchingData('+i+')">'+ i +'</a>';
			}
			if(i == totalPage) break;
		}
		if(pageNum < totalPage){
			tag += '<a class="arrow next" href="javascript:searchingData('+(pageNum+1)+')"></a>';
			tag += '<a class="arrow nnext" href="javascript:searchingData('+totalPage+')"></a>';
		}
			
	}
	tag += '</div>';

	$('.page_wrap').html(tag);
}


	
</script>
<section>
	<%@include file="/WEB-INF/views/inc/sellerHeader.jsp"%>
	<article>
		<div class="seller_title">정산관리</div>
			<div class="wrap">
				<div class="wrapTitle">조회하기</div>
				<div class="wrapContainer">
					<form method="post" action="javascript:dataInsertCheck()" id="searchingFrm">
						<div id="searchingStandard">
							<p>조회기준</p>
							<input type="button" id="dateBtn" value="날짜"/>
							<input type="button" id="orderBtn" value="주문 건별"/>
						</div>
						<div id="searchingTerm">
							<p>조회기간</p>
							<select name="selectOption">
								<option selected="selected">매출일자</option>
								<option>정산 날짜</option>
							</select>
							<input type="date" id="startDate" name="startDate" min="2018-01-01" max="${datePtn}"/>
							~&nbsp;&nbsp;
							<input type="date" id="endDate" name="endDate" min="2018-01-01" max="${datePtn}"/>
						</div>
						<div id="searchingBtnContainer">
							<input class="normalBtn" type="submit" value="검색"/>
							<input class="normalBtn" type="reset" value="초기화"/>
						</div>
					</form>
				</div>
				<div class="wrapTitle">주문 건별 정산분석</div>
				<div class="wrapContainer" style="border:none;">
					<table>
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">매출일자</th>
								<th scope="col">주문금액</th>
								<th scope="col">실결제금액</th>
								<th scope="col">결제수수료</th>
								<th scope="col">이용수수료</th>
								<th scope="col">정산금액</th>
								<th scope="col">정산날짜</th>
							</tr>
						</thead>
					</table>
					<hr>
					<div id="totalMoney"></div>
					<div class="page_wrap">
						<div class="page_nation">
							<a class="arrow pprev" href="#" onclick="return false;"></a> 
							<a class="arrow prev" href="#" onclick="return false;"></a> 
							<a class="active" href="#" onclick="return false;">1</a> 
							<a class="arrow next" href="#" onclick="return false;"></a> 
							<a class="arrow nnext" href="#" onclick="return false;"></a>
						</div>
					</div>
				</div>
				
			</div>
	</article>
</section>