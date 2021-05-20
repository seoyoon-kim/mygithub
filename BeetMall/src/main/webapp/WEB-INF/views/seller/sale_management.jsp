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
		<!-- 표: no, 주문번호, 상품명, 수량, 주문일, 주문자명/Id, 전화번호, 배송요청, 결제금액, 주문상태, 배송정보, 체크박스 -->
		<!-- 페이징, 배송상태드롭박스, 변경 버튼 -->
<script>
//체크박스 전체선택
	$(function(){
		$('#listAllCheck').click(function(){
			$('.management_table input[type=checkbox]').prop('checked',$('#listAllCheck').prop('checked'));
		});
	});
//체크박스 값 보내기 & 변경
	function selectClaimStatusUpdate(){
		var url = "claimStatusUpdate";
		var orderNumArr = new Array();
		var claimStatus = $('#option_sel').val(); //select한 주문정보	
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
					claimStatus : claimStatus
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
	$(function(){
		
		var dried_fruits = ['감말랭이', '건망고','건바나나','건자두', '건포도', '곶감', '기타건과류'];
		var nut = ['대추','땅콩','마카다미아','밤','아몬드','은행','잣','캐슈너트','피스타치오','피칸','해바라기씨','호두','호박씨','기타견과류'];
		var fruits = ['감', '감귤', '과일바구니','딸기','레몬','리치','망고','매실','바나나','배','복분자','복숭아','블루베리','사과','석류','수박','아보카도','오렌지','자두', '자몽','참외','천혜향 ','체리','키위/참다래', '토마토', '파인애플','포도','한라봉','혼합과일세트', '기타과일'];
		var rice = ['기능성쌀','백미','찹쌀', '현미', '흑미'];
		var multigrain = ['기장','기타잡곡','녹두','들깨','메밀','보리','수수','옥수수','율무','참깨','콩','팥','혼합곡'];
		var vegetable =['감자','건나물','고구마','고추','기타채소류','단호박','당근','대파','더덕','도라지','마','마늘','무','배추','버섯','부추','브로콜리','산나물','삶은나물','상추','새싹채소','생강','시금치','쌈채소','아스파라거스','알로에','애호박','양배추','양파','연근','열무','오이','우엉','죽순','쪽파','피망/파프리카'];
		 
		$('.search_category').change(function(){
			var option=$(this).val();
			console.log(option);
			//견과류
			if(option=='nut'){
				for(var i=0; i<nut.length; i++){
					var tag; 
					tag = "<option value='"+nut[i]+"'>"+nut[i]+"</option>"
					$('.search_sub_category').append(tag);
				} //for end
			//건과류	
			}else if(option=='dried_fruits'){
				for(var i=0; i<dried_fruits.length; i++){
					var tag; 
					tag = "<option value='"+dried_fruits[i]+"'>"+dried_fruits[i]+"</option>"
					$('.search_sub_category').append(tag);
				}//for end
			}else if(option=='fruits'){
				for(var i=0; i<fruits.length; i++){
					var tag; 
					tag = "<option value='"+fruits[i]+"'>"+fruits[i]+"</option>"
					$('.search_sub_category').append(tag);
				}//for end
			}else if(option=='rice'){
				for(var i=0; i<rice.length; i++){
					var tag; 
					tag = "<option value='"+rice[i]+"'>"+rice[i]+"</option>"
					$('.search_sub_category').append(tag);
				}//for end
			}else if(option=='multigrain'){
				for(var i=0; i<multigrain.length; i++){
					var tag; 
					tag = "<option value='"+multigrain[i]+"'>"+multigrain[i]+"</option>"
					$('.search_sub_category').append(tag);
				}//for end
			}else if(option=='vegetable'){
				for(var i=0; i<dried_fruits.length; i++){
					var tag; 
					tag = "<option value='"+vegetable[i]+"'>"+vegetable[i]+"</option>"
					$('.search_sub_category').append(tag);
				}//for end
			}//if else end
		});
	});


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
		            // 레이어 색 
		            backgroundColor: 'rgba(0,0,0,0.4)'
		        })
		        .appendTo('body');

		    console.log('what the...');
		    $('#my_modal').css('display','block');
		    $('#my_modal').children('table').css('display','');
		    $("body").off('scroll touchmove mousewheel'); 
		    
		    $('#my_modal').css({
	            position: 'fixed',
	            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	            
	            // 회색레이어 보다 한칸 위에 보이기
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
	 
</script>		
<body>
<div class="main" >

	<!-- 가운데 content -->
	<div id="article">
	<div class="wrapTitle">판매관리</div>
		<!-- 상단 검색 옵션 : 접수일/ 카테고리/ 주문번호/ 고객ID/ 검색 -->
		<form>
		<div class="search">
			<ul class="search_wrap">
				<li><label for="">주문접수일</label><br/>
					<input type="date" name="" class="search_date"max="${now}"/>~<input type="date" name="" class="search_date" max="${now}"/>
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
					<input type="text" size="15" name="" class="search_num" placeholder="주문번호를 입력해주세요."/>
				</li>
				<li><label for="">구매자 ID</label><br/>
					<input type="text" size="15" name="" class="search_id" placeholder="ID를 입력해주세요."/>
				</li>
				<li>
					<input type="button" name="" class="save_excel" value="엑셀로 저장" onclick="save_excel()"/>
					<input type="button" name="" class="search_btn" value="검색"/><br/>				
				</li>
			</ul>
		
		</div>
		</form>
		
		<!-- 탭 : 전체/ 미입금/ 입금완료/ 배송준비/ 배송중/ 배송완료/ 픽업대기중/ 픽업완료 -->
		<div class="management_container">
			<ul class="management_category">
				<li class="menu1 on"><a href=""><span>전체</span></a></li>
				<li class="menu2"><a href=""><span>취소요청</span></a>
				<li class="menu3"><a href=""><span>취소진행중</span></a>
				<li class="menu4"><a href=""><span>취소완료</span></a>
				<li class="menu5"><a href=""><span>반품요청</span></a>
				<li class="menu6"><a href=""><span>반품진행중</span></a>
				<li class="menu7"><a href=""><span>반품완료</span></a>
				<li class="menu8"><a href=""><span>구매확정</span></a>
			</ul>
		</div>

			<fieldset>
					<!-- 표 -->
			<div class="table_wrap">
					<form>
						<table class="management_table">
							<thead>
								<tr>
									<th>주문번호</th>
									<th>상품명</th>
									<th>수량</th>
									<th>주문일</th>
									<th>주문자명/ID</th>
									<th>전화번호</th>
									<th>결제금액</th>
									<th>클레임날짜</th>
									<th>클레임정보</th>
									<th><input type="checkbox"  id="listAllCheck" checked/></th>
								</tr>
							</thead>
						<tbody>
						<c:forEach var="list" items="${list}">
							<tr>
								<td><a href="javascript:modal();">${list.ordernum}</a></td>
								<td>${list.productname}</td>
								<td>${list.orderquantity}</td>
								<td>${list.orderdate}</td>
								<td>${list.userid}<span>/</span>${list.username}</td>
								<td>${list.userphone}</td>
								<td><span>${list.orderprice}</span>원 </td>
								<td><span>${list.claimdate}</span></td>
								<td  class="claim"><span>${list.claimstatus}</span></td>
								<td><input type="checkbox" checked title="${list.ordernum}" value="${list.ordernum}" id="oneOrderCheck" name="oneOrderCheck" class="table_checkbox"/></td>
							</tr>	
						</c:forEach>
						</tbody>
						</table>	
					</form>
				</div>
		<!-- 클레임 정보 변경 -->
				<div class="option_change"style="text-align:right;">
				<span class="notice">선택상품의 클레임 상태를 변경하실 수 있습니다.  </span><br/>
					<select id="option_sel">
						<option value=" ">-</option>
						<option value="취소요청">취소요청</option>
						<option value="취소진행중">취소진행중</option>
						<option value="반품요청">반품요청</option>
						<option value="반품진행중">반품진행중</option>
						<option value="반품완료">반품완료</option>
					</select>
					<input type="button" id="selBtn" value="변경" onClick="selectClaimStatusUpdate()"/>
				</div>
				
		<!-- 페이징-->
		<div class="page_wrap">
			<div class="page_nation">
			  	<!--맨앞으로-->
  				<a class="arrow_pprev" href="sale_management?pageNum=1<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--앞으로-->
        		<a class="arrow_prev" href="sale_management?pageNum=${sapvo.pageNum-1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
 				<!--레코드 갯수에 따른 페이지 갯수 표시--> 
         		<c:forEach var="p" begin="${sapvo.startPageNum}" end="${(sapvo.startPageNum + sapvo.onePageNum)-1}">
	         		<!--p가 총페이지수보다 작거나같을때  레코드가 있는 페이지까지만 표시 -->
	            	<c:if test="${p<=sapvo.totalPage}">  
						<!--현재페이지 :  현재보고있는 페이지 표시 -->
		               <c:if test="${p==sapvo.pageNum}">
		                  <a class="on" href="sale_management?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
		               <!-- 현재페이지가 아닐 때 -->
		               <c:if test="${p!=sapvo.pageNum}">
		                  <a href="sale_management?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
	            	</c:if>
        		</c:forEach>
        		<!-- 다음 페이지가 있을 때 -->
				<!--뒤로-->            
	         	<a class="arrow next" href="sale_management?pageNum=${sapvo.pageNum+1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--맨뒤로-->
	         	<a class="arrow nnext" href="sale_management?pageNum=${sapvo.totalPage}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
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
						<td>202104190402</td>
						<td><span class="detail_menu">주문일</span></td>
						<td>21/04/19 16:02</td>
					</tr>
					<tr class="detail_line2">
						<td><span class="detail_menu">주문상품명</span></td>
						<td>햅쌀</td>
						<td><span class="detail_menu">결제일</span></td>
						<td>21/04/19 16:02</td>
					</tr>
					<tr class="detail_line3">
						<td><span class="detail_menu">수량</span></td>
						<td><span>1<span>kg</span></td>
						<td><span class="detail_menu">결제금액</span></td>
						<td>36,000<span class="won">원</span></td>
					</tr>
					<tr class="detail_line4">
						<td><span class="detail_menu">옵션</span></td>
						<td>-</td>
						<td><span class="etail_menu">포인트 사용</span></td>
						<td>3,000<span class="point">.P</span></td>
					</tr>
					<tr class="detail_line5">
						<td><span class="detail_menu">결제방법</span></td>
						<td><span>1<span>무통장입금</span></td>
						<td><span class="detail_menu">할인금액</span></td>
						<td>1,000<span class="won">원</span></td>
					</tr>
					<tr class="detail_line6">
						<td colspan="2"></td>
						<td><span class="detail_menu">실결제금액</span></td>
						<td>32,000<span class="won">원</span></td>
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
						<td>한싱싱</td>
						<td><span class="detail_menu">받는분 연락처</span></td>
						<td>010-1234-5678</td>
					</tr>
					<tr class="detail_line8">
						<td><span class="detail_menu">배송지</span></td>
						<td>집</td>
						<td><span class="detail_menu">베송 메모</span></td>
						<td>부재시 경비실에 맡겨주세요.</td>
					</tr>
					<tr class="detail_line10">
						<td><span class="detail_menu">주문자명</span></td>
						<td>한싱싱</td>
						<td><span class="detail_menu">주문자 연락처</span></td>
						<td>010-1234-5678</td>
					</tr>
					<tr class="detail_line11">
						<td><span class="detail_menu">주문자 ID</span></td>
						<td>singsing</td>
						<td><span class="detail_menu">택배사</span></td>
						<td>대한통운</td>
					</tr>
					<tr class="detail_line12">
						<td><span class="detail_menu">송장번호</span></td>
						<td>12345678</td>
						<td><span class="detail_menu">배송비</span></td>
						<td>무료배송</td>
					</tr>
				</tbody>
				<thead class="detail_head3">
					<tr>
						<th colspan="2">배송정보</th>
						<th colspan="2">히스토리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">21/04/19 18:12</td>
						<td colspan="2">배송준비중</td>
					</tr>
					<tr>
						<td colspan="2">21/04/19 22:00</td>
						<td colspan="2">배송출발</td>
					</tr>
					<tr>
						<td colspan="2">21/04/20 15:12</td>
						<td colspan="2">배송완료</td>
					</tr>
					<thead class="detail_head4">
					<tr>
						<th colspan="2">클레임 정보</th>
						<th colspan="2">히스토리</th>
					</tr>
					<tbody>
					<tr class="claim_line">
						<td colspan="2" class="detail_menu">클레임종류</td>
						<td colspan="2">반품</td>
					</tr>
					<tr>
						<td colspan="2" class="detail_menu">클레임사유</td>
						<td colspan="2">전부 다 썩었어요</td>
					</tr>
					<tr>
						<td colspan="2" >21/04/19 19:11</td>
						<td colspan="2"  class="claim">반품진행</td>
					</tr>
					</tbody>
				</thead>
				</tbody>
			</table>	
		</div>
		<!-- 모달 -->
		<div id="modal"></div>
	</div><!-- article div end -->
	</div><!-- main div end -->
</body>
</html>