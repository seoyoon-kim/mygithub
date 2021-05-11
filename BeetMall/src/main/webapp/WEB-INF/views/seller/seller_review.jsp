<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/xstyle_sellerReview.css">

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
////////////////////////////////전역변수 선언 /////////////////////////////////
//선택된 날짜의 데이터를 저장해 높는 변수
let startCalendarDataValue = "";
let endCalendarDataValue = "";


//날짜 변경을 년별로 했었는지 체크하기 위한 yearCheck 변수 선언
let yearCheck="";

//년별, 월별, 일별인지 체크하기 위한 변수 선언
let dateCheck = "";


//날짜를 년별, 월별, 일별을 바꿀 경우 그 조건에 맞게 input 박스를 change 한다.
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


//대분류 카테고리 클릭시 : 데이터 베이스로 불러왔던 중분류 카테고리를 선택된 대분류 카테고리 종류에 따라 값을 불러와 li로 넣는 기능

$(document).on('click',"#category>li",function(){
	// 선택된 카테고리 넘버를 변수에 넣어둔다.
	let cateNum = $(this).val();
	// 태그를 이용해 선택된 카테고리의 중분류 카테고리를 담는 변수를 생성한다.
	let tag ="";
	
	// category 대분류 클릭시 색상 변화
	$('#category>li').css('font-weight','normal');
	$(this).css('font-weight','bold');
	
	
	// 카테고리 리스트가 널이 아닐경우
	<c:if test="${cateList!=null }">
		//  카테고리 넘버가 무엇인지에 따라서 불러온다, 카테고리 넘버가 1이면 중분류 카테고리 1번의 값들을 불러온다.
		<c:forEach var="mcateList" items="${cateList}">
			if(${mcateList.catenum}==cateNum){
				tag += "<li value='${mcateList.catename}'>"
						+"<input type='hidden' name='mcatenum' value='${mcateList.mcatenum}'/>"
						+"<a href='#' onclick = 'return false;'/>${mcateList.mcatename}</a></li>";
			}
		</c:forEach>
		$('#mcategory').html(tag);
	</c:if>

});


$(function(){
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
		
		
		//========================제한사항 걸러내기 끝 ===============================//
		

		if($('#categoryManagement>li').length != 0){

			//데이터 컨트롤러 실행, 차트, 엑셀 재설정
			dataController();	
		
		}
		
	})
	//////////////////// 수익 매출분석에 들어갈 labels 끝 /////////////////////
	
	// 중분류 카테고리 선택시 추가하는 기능 categoryManagement
	$(document).on('click', '#mcategory>li', function(){
		/*========================  category에 포함  ==========================*/
		
		// 선택한 목록의 중분류 이름, 번호를 구한다.
		let selectName = $(this).text();
		let selectNum = $(this).children().val();
		
		// li 개수 구하여 10개 이상은 고르지 못하도록 막는다
		let liLength = $('#categoryManagement>li').length;
		if(liLength>=10){
			return alert('최대 10개의 품목만 선택 가능합니다.');
			
		}
		
		
		// li에 존재하는 품목 이름이 있으면 추가하지 못하도록 제한해야 한다.
		for(let i=0; i<liLength; i++){
			let getSelect = $('#categoryManagement>li:nth-child('+(i+1)+')').text();
			let gtPosition = getSelect.indexOf(">")+1;
			let boxPosition = getSelect.indexOf("⊠");
			let result = getSelect.substring(gtPosition,boxPosition);
			if(result===selectName){
				return alert("선택되어 있는 품목은 추가 할 수 없습니다.");	
			}
		}
		
		// 선택된 목록 추가 ( Management에서도 보여주고, 차트, 엑셀에도 추가가 되어야 한다.)
		let tag = "<li value="+selectNum+">"+"<input type='hidden' value="+selectName+">"+"<a href='#' onclick='return false'>"+$(this).attr('value')+"&gt;"+selectName+"<span>⊠</span></a></li>";
		$('#categoryManagement').append(tag);
		
	
		// 데이터 컨트롤러 실행
		dataController();
		
	});
	
	function dataController(){
		//계산은 언제 발동하는가?
		// 중분류 카테고리가 눌렸을 때,
		// 중분류 카테고리 삭제할 때
		   // 이 두가지는 값이 들어왔을 때마다 리스트의 값을 받아서 확인하고 쿼리문을 돌리는 방식으로..?
		// 날짜 적용 눌렀을 때
		   // -> 날짜에 따른 데이터를 불러와야 함
		
		// 계산은 어떻게 해야하나?
		// 월 단위인지, 년 단위인지, 일 단위인지에 따라서 계산되는 값이 달라져야 한다
		
		
		// 년, 월 일때 합계를 계산하기 위해 저장할 맵
		// ex) 년별을 골랐을때, 2018년 1월 01일 부터 ~ 2018년 12월 31일까지
		// ex) 월별을 골랐을때, 2018년 03월 01일 부터 ~ 2018년 04월 41일까지
		//let map = new Map();
		//map.clear();// 두번째 실행할 경우 데이터가 들어있기 때문에 초기화 시켜준다
		// 데이터의 날짜를 계산하기 위한 객체화  
		let minDate = new Date(startCalendarDataValue);
		
		$.ajax({
			type: "POST",
			url: "getListData",
			traditional : true,
			data: {
				"startCalendarDataValue":startCalendarDataValue,
				"endCalendarDataValue":endCalendarDataValue
			}, success: function(result){
				// 엑셀 리스트를 초기화 시킨다.
				let tag = "<li>매출일자</li>"
						+ "<li>주문번호</li>"
				  	    + "<li>상품명</li>"
					    + "<li>수량</li>"
					    + "<li>단가</li>"
				        + "<li>매출금액</li>";
				// 엑셀 리스트 li에 산출된 데이터 값을 넣는다.
				let $result = $(result);
				excelArrList = $result;
				$result.each(function(idx,vo){
				});
			}
		})
	}
	
	
	/////////////////////////////////////// 중분류 삭제 할 때 사용할 기능
	//append로 값을 동적으로 추가해줄 경우 새로 html이 실행 된 것이 아니기 때문에 html에서는 그 값을 읽지 못한다.
	// 그렇기 때문에 document를 사용해 다시 html을 읽기만 해서 싹 둘러보고 찾아서 삭제한다고 생각하면 된다.
	$(document).on('click','#categoryManagement>li',function(){
		
		// 삭제하기 위해서는 어떤 것이 선택되었는지?
		// 그리고 삭제하는 데이터가 추가 된 것 중에 몇번째에 있는지 알 수 있어야 한다.
		let liLength = $('#categoryManagement>li').length;
		
		// 선택된 목록의 이름과 번호를 구한다.
		let selectName = $(this).text();
		let selectNum = $(this).children().val();
		
		
		// 선택된 아이템의 텍스트를 걸러야 한다.
		let selectGtPosition = selectName.indexOf(">")+1;
		let selectBoxPosition = selectName.indexOf("⊠");
		let selectNameResult = selectName.substring(selectGtPosition,selectBoxPosition);
		
		// 이건 선택되서 아래에 내려온것들 클릭했을때 지워주는거 ex) 채소>땅콩
		$(this).remove();
		
		
		if($('#categoryManagement>li').length != 0){
			
			//데이터 컨트롤러 실행, 차트, 엑셀 재설정
			dataController();	
		
		} else {
			// 엑셀 리스트를 초기화 시킨다.
			let tag = "<li>매출일자</li>"
					+ "<li>주문번호</li>"
			  	    + "<li>상품명</li>"
				    + "<li>수량</li>"
				    + "<li>단가</li>"
			        + "<li>매출금액</li>";
			
			$('#excelList').html(tag);
			$('#totalMoney').html('');
		}
	})// 삭제 함수 끝
	
})
</script>

<section>
	<%@include file="/WEB-INF/views/inc/sellerHeader.jsp" %>
	<!-- 본문 시작 -->
	<article>
		<div class='seller_title'>리뷰관리</div>
		<div class="wrap">
			<!-- 리뷰 보기 -->
			<div class="wrapTitle">리뷰보기</div>
			<div class="wrapContainer">
				
				<ul id="reviewInfo">
					<li>새 리뷰</li>
					<li>${resultData.newReview }건</li>
					<li>미답변</li>
					<li>${resultData.nullReview }건</li>
					<li>사용자 총 평점</li>
					<li>${resultData.totalScore }/5</li>
					<li>전체 리뷰 수</li>
					<li>${resultData.totalReview }건</li>
				</ul>
			</div><!-- 리뷰 보기 끝 -->
			
			<!-- 리뷰 검색 -->
			<div class="wrapTitle">리뷰 검색</div>
			<div class="wrapContainer">
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
						<button id="calendarApply" style="margin-left: 10px;">날짜 적용</button>
					</div>

				</div><!-- categoryList 끝 -->
			</div><!-- 리뷰 검색 끝 -->
			
			<!-- 리뷰 출력 -->
			<!-- 정렬방법 고르기 -->
			<div id="sortContainer">
				<select id="sortSelect">
					<option>최신순</option>
					<option>평점 높은 순</option>
					<option>평점 낮은 순</option>
				</select>
			</div>
			
			<ul id="reviewList">
				<li>상품명</li>
				<li>평점</li>
				<li>포토</li>
				<li>리뷰 내용</li>
				<li>등록자</li>
				<li>등록일</li>
				<li>답변 여부</li>
				
				<li>고구마</li>
				<li>4.5</li>
				<li>이미지</li>
				<li><a href="">좋아요좋아요좋아요좋아요</a></li>
				<li>고구마맛탕좋아</li>
				<li>21/04/08</li>
				<li>답변 완료</li>
			</ul>
			<!-- 리뷰 출력 끝 -->
		</div>
	</article><!-- 본문 끝 -->
	
	<div id="popup">
		<div class="wrapContainer_Edit1">
			<form method="" action="">
				<div class="wrapTitle">리뷰</div>
				<ul id="reivewManagement">
					<li>
						<b>구매상품</b>
						<img src="<%=request.getContextPath()%>/resources/img/xprofile_img.png" id="repMenu_img"/>
						<div>싸고 맛있는 빵빠레빵빠빵</div>
					</li>
					<li>
						<b>등록자</b>
						tkaudeotk00
					</li>
					<li>
						<b>등록일</b>
						2021.05.02
					</li>
					<li>
						<b>평점</b>
						<div>★★★★★</div>
						<img src="<%=request.getContextPath() %>/resources/img/xgood.png" id="good_img"/> : 2
					</li>
				</ul>
				<div>
					<br/><b>&nbsp;&nbsp;&nbsp;리뷰 내용</b><br/>
					<div id="reviewContent">
						<p> 이제 드디어 대저 토마토 먹을 수 있네요 대저 토마토 처음 먹어봤는데요 너무 맛있어요</p>
						<img src="<%=request.getContextPath() %>/resources/img/xprofile_img.png" id="repMenu_img"/>
					</div>
				</div>
				
				<!-- 섬머노트 -->
			  	<div id="summernote"><p></p></div>
				  <script>
				    $(document).ready(function() {
				        $('#summernote').summernote({
				        	placeholder: '300자 이내로 입력해주세요',
				        	tabsize: 2,
				            height: 150
				        });
				    });
				  </script>
				<div id="popupBtnContainer">
					<input type="submit" name="popupOk" value="확인"/>
					<input type="submit" name="popupClose" value="닫기"/>
					<input type="submit" name="popupDeclaration" value="신고">
				</div>
			</form>  	  
		</div>
	</div><!-- 리뷰 보기 팝업 끝 -->
	
	<!-- 신고하기 -->
	<div id="declaration">
		<div class="wrapContainer_Edit1">
			<div class="wrapTitle">신고하기</div>
			<form method="" action="" id="declarationFrm">
				<div>2021/03/26</div>
				<div>
					신고 대상 리뷰 : 21.03.02<br/>
					신고 대상 아이디 : tkaudeotk02<br/>
					구매품명: 대저짭짤이 토마토(10Kg)
				</div>
				<div>
					<select>
						<option>신고 사유</option>
						<option>비방/욕설</option>
						<option>허위</option>
						<option>성희롱</option>
						<option>기타</option>
					</select>
				</div>
				<div>
					<input type="text" width="200px" placeholder="300자 이내로 작성">
					<input type="submit" value="보내기"/>
				</div>
			</form>
		</div>
	</div>
</section>
