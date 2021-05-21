<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/inc/sellerHeader.jsp" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<c:set var="now"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

	
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/orderSaleStyle.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/basicStyle.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/headerStyle.css">
</head>

	<!-- 판매자 주문관리 -->
		<!-- 상단 검색 옵션 : 접수일/ 카테고리/ 주문번호/ 고객ID/ 검색 -->
		<!-- 탭 : 전체/ 미입금/ 입금완료/ 배송준비/ 배송중/ 배송완료/ 픽업대기중/ 픽업완료 -->
		<!-- 표: no, 주문번호, 상품번호,상품명, 수량, 주문일, 주문자명/Id, 전화번호, 결제금액, 주문상태, 배송정보, 체크박스 -->
		<!-- 페이징, 배송상태드롭박스, 변경 버튼 -->
<script>
	//체크박스 전체선택
	$(function(){
		$('#listAllCheck').click(function(){
			$('.management_table input[type=checkbox]').prop('checked',$('#listAllCheck').prop('checked'));
		});
	});
	//체크박스 값 보내기
	function selectOrderStatusUpdate(){
		var url = "orderStatusUpdate";
		var orderNumArr = new Array();
		var orderStatus = $('#option_sel').val(); //select한 주문정보	
		var list = $('input[name=oneOrderCheck]'); //listAllCheck, oneOrderCheck
		console.log('check num->', $('#oneOrderCheck').val());
		console.log('list.length->', list.length);
		console.log('list->',list);
		console.log('option select->',$('#option_sel').val());
		for(var i = 0; i < list.length; i++){
			if(list[i].checked){
				console.log('list[i].value->', list[i].value);
				orderNumArr.push(list[i].value);
				console.log('orderNumArr->',orderNumArr);
			} //if end
		}// for end
		if(orderNumArr.length==0){
			alert('선택된 주문번호가 없습니다.');
		}else{
			var msg = confirm('주문상태를 변경하시겠습니까?');
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data:{
					orderNumArr : orderNumArr,
					orderStatus : orderStatus
				},
				success : function(){
					alert('주문상태가 변경되었습니다.');
					location.replace('order_management');
				}, error : function(){
					alert('주문상태 변경이 취소되었습니다.');
				}
			}); //ajax end
		}
	}// function end
    	
	//검색하기
		//1. 카테고리 변경
	
	//탭

	//모달
	function modal(id) {
	    var zIndex = 9999;
	    var modal = $('#' + id);

	    // 모달 div 뒤에 회색 레이어
	    var bg = $('<div>')
	        .css({
	            position: 'fixed',
	            zIndex: zIndex,
	            left: '0px',
	            top: '0px',
	            width: '100%',
	            height: '100%',
	            overflow: 'auto',
	            // 회색 레이어 색 
	            backgroundColor: 'rgba(0,0,0,0.4)'
	        })
	        .appendTo('body');

	    console.log('what the...');
	    $('#my_modal').css('display','block');
	    $('#my_modal').children('table').css('display','');
	    $("body").off('scroll touchmove mousewheel'); 
	    
	    $('#my_modal').css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1)',

            // 회색 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 회색 레이어와 모달 div 지우기
        .find('.modal_close_btn')
        .on('click', function() {
            bg.remove();
            $('#my_modal').css('display','none');
        });
	}
	
	$('#popup_open_btn').on('click', function() {
	    // 모달창 띄우기
	    modal('my_modal');
	    console.log('modaldmoadfa');
	    $('my_modal').css('display','');
	   /*  $("body").off('scroll touchmove mousewheel');  */    
	});
// 검색
//검색어 확인
	$(function(){
		$("#searchForm").submit(function(){
			//searchWord있는지 없는지 찾기 , 있을때만 데이터 넘기기
			if($('#searchWord').val()=="" || $('#searchWord').val()==null){
				alert("검색어를 입력하세요.");
				return false;
			}
			return true;
		});
	});
	$(document).ready(function(){
		$('management_category li').click(function(){
			var tab_id = $(this).attr('data-tab');
			$('management_category li').removeClass('current');
			$('.menu').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
			});
	
	});
</script>	
	
<body>
	<div class="main" >

	
	<!-- 가운데 content -->
	<div id="article">
	<div class="wrapTitle">주문관리</div>
	
		<!-- 상단 검색 옵션 : 접수일/ 카테고리/ 주문번호/ 고객ID/ 검색 -->
		<form method="get" action="order_management" id="searchForm">
		<div class="search">
			<ul class="search_wrap">
				<li><label for="">주문접수일</label><br/>
					<input type="date" name="" class="search_date" max="${now}"/>~<input type="date" name="" class="search_date" max="${now}"/>
				</li>
				<li><label for="">카테고리</label><br/>
					<select class="search_category">
						<option value="choose">대분류 선택</option>
						<option value="nut">견과류</option>
						<option value="dried_fruits">건과류</option>
						<option value="fruits">과일</option>
						<option value="rice">쌀</option>
						<option value="multigrain">잡곡/혼합곡</option>
						<option value="vegetable">채소</option> 
						
					</select>
					<!-- 중뷴류 카테고리 선택 -->
					<!-- 건과류 -->
					<select class="search_sub_category">
						<option>중분류 선택</option>
						
					</select>
					<!-- 견과류 -->
					<!-- 과일 -->
					<!-- 쌀 -->
					<!-- 잡곡/혼합곡 -->
					<!-- 채소 -->
				</li>
				<li><label for="">주문번호</label><br/>
					<input type="number" size="15" name="searchWord" class="search_num" placeholder="주문번호를 입력해주세요."/>
				</li>
				<li><label for="">구매자 ID</label><br/>
					<input type="text" size="15" name="searchWord" class="search_id" placeholder="ID를 입력해주세요."/>
				</li>
				<li>
					<input type="button" name="" class="save_excel" value="엑셀로 저장" onclick="save_excel()"/>
					<input type="submit" name="searchBtn" class="search_btn" value="검색"/><br/>				
				</li>
			</ul>
		
		</div>
		</form>
		
		<!-- 탭 : 전체/ 미입금/ 입금완료/ 배송준비/ 배송중/ 배송완료/ 픽업대기중/ 픽업완료 -->
		<div class="management_container">
				<ul class="management_category">
				<li class="menu current" data-tab="tab1"><a href=""><span>전체</span></a></li>
				<li class="menu" data-tab="tab2"><a href=""><span>미입금</span></a>
				<li class="menu" data-tab="tab3"><a href=""><span>입금완료</span></a>
				<li class="menu" data-tab="tab4"><a href=""><span>배송준비</span></a>
				<li class="menu" data-tab="tab5"><a href=""><span>배송중</span></a>
				<li class="menu" data-tab="tab6"><a href=""><span>배송완료</span></a>
				<li class="menu" data-tab="tab7"><a href=""><span>픽업대기중</span></a>
				<li class="menu" data-tab="tab8"><a href=""><span>픽업완료</span></a>
			</ul>
		</div>
			<fieldset>
		<!--테이블-->
				<div class="table_wrap">
					<form>
						<table class="management_table" >
							<thead>
								<tr >
									<th>주문번호</th>
									<th>상품번호</th>
									<th>상품명</th>
									<th>수량</th>
									<th>주문일</th>
									<th>주문자명/ID</th>
									<th>전화번호</th>
									<th>결제금액</th>
									<th>주문상태</th>
									
									<th><input type="checkbox" checked id="listAllCheck"/></th>
								</tr>
							</thead>
						<tbody>
						<c:forEach var="list" items="${list}" >
							<tr>
								<td><a href="javascript:modal()">${list.ordernum}</a></td><!-- id="popup_open_btn" -->
								<td>${list.productnum}</td>
								<td>${list.productname}</td>
								<td>${list.orderquantity}</td>
								<td>${list.orderdate}</td>
								<td>${list.userid}<span>/</span>${list.username}</td>
								<td>${list.userphone}</td>
								<td><span>${list.orderprice}</span>원 </td>
								<td><span>${list.orderstatus}</span></td>
								<td><input type="checkbox" checked title="${list.ordernum}" value="${list.ordernum}" id="oneOrderCheck" name="oneOrderCheck" class="table_checkbox"/></td>
							</tr>	
						</c:forEach>
						</tbody>
						</table>	
					</form>
				</div>
				<div class="option_change"style="text-align:right;">
				<span class="notice">선택상품을 원하는 주문상태로 변경하실 수 있습니다. </span><br/>
					<select id="option_sel">
						<option value=" ">-</option>
						<option value="배송준비중">배송준비중</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
						<option value="픽업대기중">픽업대기중</option>
						<option value="픽업대기중">픽업완료</option>
					</select>
					
					<input type="button" id="selBtn" value="변경" onClick="selectOrderStatusUpdate()"/>
				</div>
			<!-- 페이징-->
		<div class="page_wrap">
			<div class="page_nation">
			  	<!--맨앞으로-->
  				<a class="arrow_pprev" href="order_management?pageNum=1<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--앞으로-->
        		<a class="arrow_prev" href="order_management?pageNum=${sapvo.pageNum-1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
 				<!--레코드 갯수에 따른 페이지 갯수 표시--> 
         		<c:forEach var="p" begin="${sapvo.startPageNum}" end="${(sapvo.startPageNum + sapvo.onePageNum)-1}">
	         		<!--p가 총페이지수보다 작거나같을때  레코드가 있는 페이지까지만 표시 -->
	            	<c:if test="${p<=sapvo.totalPage}">  
						<!--현재페이지 :  현재보고있는 페이지 표시 -->
		               <c:if test="${p==sapvo.pageNum}">
		                  <a class="on" href="order_management?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
		               <!-- 현재페이지가 아닐 때 -->
		               <c:if test="${p!=sapvo.pageNum}">
		                  <a href="order_management?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
	            	</c:if>
        		</c:forEach>
        		<!-- 다음 페이지가 있을 때 -->
				<!--뒤로-->            
	         	<a class="arrow next" href="order_management?pageNum=${sapvo.pageNum+1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--맨뒤로-->
	         	<a class="arrow nnext" href="order_management?pageNum=${sapvo.totalPage}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
			</div>
		 </div>
		 <!-- 페이징 끝 -->
			</fieldset>

	<!-- 주문 상세정보 modal -->
		<div class="detail_modal" id="my_modal">
			<table  class="detail_table" style="background:white" >
				<thead class="detail_head1">
					<tr>
						<th id="close_th" colspan="4"><a class="modal_close_btn"><span id="close">닫기</span></a></th>
					</tr>
					<tr>
						<th colspan="2">주문</th>
						<th colspan="2">정보</th>
					</tr>
				</thead>
				<tbody>
					<tr class="detail_line1">
						<td><span class="detail_menu">주문번호</span></td>
						<td>${oneList.ordernum}</td>
						<td><span class="detail_menu">주문일</span></td>
						<td>${oneList.orderdate}</td>
					</tr>
					<tr class="detail_line2">
						<td><span class="detail_menu">주문상품명</span></td>
						<td>${oneList.productname}</td>
						<td><span class="detail_menu">결제일</span></td>
						<td>${orderList.orderdate}</td>
					</tr>
					<tr class="detail_line3">
						<td><span class="detail_menu">수량</span></td>
						<td>${oneList.orderquantity}</td>
						<td><span class="detail_menu">결제금액</span></td>
						<td>${oneList.orderprice}<span class="won">원</span></td>
					</tr>
					<tr class="detail_line4">
						<td><span class="detail_menu">옵션</span></td><!-- 구매한 옵션의 수량은 어떻게 구하죠? -->
						<td>${oneList.optionname}<span>|</span>${v.optionprice}</td>
						<td><span class="detail_menu">포인트 사용</span></td>
						<td>${oneList.usedpoint}<span class="point">.P</span></td>
					</tr>
					<tr class="detail_line5">
						<td><span class="detail_menu">결제방법</span></td>
						<td><span>${oneList.paymentoption}</span></td>
						<td><span class="detail_menu">할인금액</span></td>
						<td>${oneList.saleprice}<span class="won">원</span></td>
					</tr>
					<tr class="detail_line6">
						<td><span class="detail_menu">상품실결제금액</span></td>
						<td>${oneList.realpayment}<span class="won">원</span></td>
						<td><span class="detail_menu">배송비포함실결제금액</span></td>
						<td>${oneList.realtotalpayment}<span class="won">원</span></td>
					</tr>
			
				</tbody>
				<thead class="detail_head2">
					<tr>
						<th colspan="2">배송</th>
						<th colspan="2">정보</th>
					</tr>
				</thead>
				<tbody>
					<tr class="detail_line7">
						<td><span class="detail_menu">받는분</span></td>
						<td>${oneList.receiver}</td>
						<td><span class="detail_menu">받는분 연락처</span></td>
						<td>${oneList.receiverphone}</td>
					</tr>
					<tr class="detail_line8">
						<td><span class="detail_menu">배송지</span></td>
						<td>(${oneList.deliveryzipcode}) ${oneList.deliveryaddr}, ${oneList.deliverdetailaddr}</td>
						<td><span class="detail_menu">베송 메모</span></td>
						<td>${oneList.deliverymemo}</td>
					</tr>
					<tr class="detail_line10">
						<td><span class="detail_menu">주문자명</span></td>
						<td>${oneList.username}</td>
						<td><span class="detail_menu">주문자 연락처</span></td>
						<td>${oneList.userphone}</td>
					</tr>
					<tr class="detail_line11">
						<td><span class="detail_menu">주문자 ID</span></td>
						<td>${oneList.userid}</td>
						<td><span class="detail_menu">택배사</span></td>
						<td>${oneList.deliverycompany}</td>
					</tr>
					<tr class="detail_line12">
						<td><span class="detail_menu">송장번호</span></td>
						<td>${oneList.invoice}</td>
						<td><span class="detail_menu">배송비</span></td>
						<td>${oneList.deliveryprice}</td>
					</tr>
	
				</tbody>
				<thead class="detail_head3">
					<tr>
						<th colspan="2">배송정보</th>
						<th colspan="2">히스토리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="deliverynow" items="${oneList}">
					<tr>
						<td colspan="2">${deliverynow.deliverystatus}</td>
						<td colspan="2">${deliverynow.deliverydate}</td>		
					</tr>
					</c:forEach>
					<tr><td colspan="4" style="text-align:center"><button id="talk_customer">구매자와 대화하기</button></td></tr>
				</tbody>
			</table>	
		</div>
	<!-- 모달 -->
		<div id="modal" > </div>
	<!-- 구매자와의 대화 -->
		<div >
			<form>
				
			</form>
		</div>
	</div> <!-- article div end -->
	</div><!-- main div end -->
	
</body>
</html>