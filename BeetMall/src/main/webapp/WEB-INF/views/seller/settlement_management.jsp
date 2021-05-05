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

function dataInsertCheck(){
	let startDate = $('#startDate').val();
	let endDate = $('#endDate').val();
	if( startDate == '' || endDate == '' ){
		alert('조회기간을 설정해야 조회 가능합니다.');
		return false;
	}

	// 조회기준 '날짜' 선택되어 있을 경우
	if( $('#dateBtn').css('background-color') == 'rgb(221, 221, 221)' ){

		$.ajax({
			type: 'GET',
			url: 'sellerDateSearchingData',
			traditional : true,
			data: $('#searchingFrm').serialize(),
			success: function(result){
				console.log('test');
				let tag = '<thead><tr>'
						+ '<th scope="col">주문번호</th>'
						+ '<th scope="col">매출일자</th>'
						+ '<th scope="col">주문금액</th>'
						+ '<th scope="col">실결제금액</th>'
						+ '<th scope="col">결제수수료</th>'
						+ '<th scope="col">이용수수료</th>'
						+ '<th scope="col">정산금액</th>'
						+ '<th scope="col">정산날짜</th>'
						+ '</tr></thead><tbody>';
				
				let $result = $(result);
				console.log($result);
				$result.each(function(idx,vo){
					console.log('test = '+idx);
					console.log(vo);
					console.log(vo.ordernum);
					tag += '<tr>'
						+  '<td>'+vo.ordernum+'</td>'
						+  '<td>'+vo.orderdate+'</td>'
						+  '<td>'+vo.orderprice+'</td>'
						+  '<td>'+vo.realpayment+'</td>'
						+  '<td>'+(vo.realpayment*0.05)+'</td>'
						+  '<td>'+(vo.realpayment*0.058)+'</td>'
						+  '<td>'+vo.realpayment-(vo.realpayment*0.05)-(vo.realpayment*0.058)+'</td>'
						if(${vo.settlecheck == 'Y'}){
							+  '<td>'+vo.settledate+'</td>'
						} else {
							+  '<td>-</td>'
						}
						+  '</tr>';
				});
				tag += '</tbody>';
				console.log(tag);
				$('table').html(tag);
			},
			error: function(){
				console.log('데이터 가져오기 실패');
			},
		})
	}
	
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
							<select>
								<option selected="selected">전체</option>
								<option>정산 날짜</option>
								<option>매출일자</option>
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
				</div>
			</div>
	</article>
</section>