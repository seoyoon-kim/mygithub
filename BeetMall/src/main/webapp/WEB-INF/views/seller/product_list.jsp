<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		
		<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
		<!-- font-family: 'Nanum Gothic', sans-serif; -->
		
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/basicStyle.css">
</head>
<script>
	

</script>	
<style>

	.product_table,.table_wrap{
		margin: 0 auto;
		width:95%
	}
	thead{
		background: #fafafa;
		border-bottom: 2px solid lightgray;
	}
	/*테이블 상단*/
	th{
		width:1080px;
		height:60px;
		vertical-align:inherit;
		font-weight:bold;	
    	color:#666666;	
		font-size:10px;
		text-align:center;
	}

	.product_table, .tbl_line{
		border-bottom: 1px solid lightgray;
		padding:0px;
	}
	.product_table{
		display: table-row;	
		border-collapse: collapse;
		empty-cells: show;
		text-indent: initial;
   		border-spacing: 2px;
   		text-align:center;
	}
	
	.tbl_line{
		vertical-align:inherit;
		height: 60px; 	
	}
	.tbl_line_cell{
		display: table-cell;
		text-align:center;
		font-size:10px;
		padding:2px 2px 2px 2px;
	}
	/*테이블 폭 조정*/
	.productCheck, .hit, .productNum, th:first-child, th:nth-child(2) ,th:last-child{
		width:40px;
	}
	/*상품 이름*/
	.productName a{color:gray; font-weight:bold; }
	/*드롭메뉴와 삭제버튼*/
	.option_wrap{
		text-align:right; 
		margin: 0 auto;
		height:50px;
	}
	select{
		width:150px;	
		border:1px solid lightgray;
		margin-top:5px;
		font-size:14px;
	}
	select, .btn{ 
		margin-top:5px; 
		height:30px;
	}
	.btn{float:left;}
 
</style>
<script>
/* <option value="전체보기" selected>전체보기</option>
<option value="최신등록순">최신등록순</option>
<option value="누적판매순">누적판매순</option>
<option value="높은가격순">높은가격순</option>
<option value="낮은가격순">낮은가격순</option> */
//답변완료 답변대기중 select 
$(document).ready(function(){
	$('#selectList').change(function(){
		var option = $(this).val();
		console.log(option);
		if(option=='전체보기'){ //전체
			$('tr').css('display','');
	}
	});
 		
});
</script>		
<body>
<div class="main">
		
	<!-- 사이드바 -->
	<nav>
		<ul>
			<li><a href="<%=request.getContextPath()%>/product_list">상품관리</a></li>
			<li><a href="<%=request.getContextPath()%>/product_regi">상품등록</a></li>
			<li><a href="<%=request.getContextPath()%>/order_management">주문 관리</a></li>
			<li><a href="<%=request.getContextPath()%>/sale_management">판매 관리</a></li>
			<li><a href="seller_sales">매출 관리</a></li>
			<li><a href="#">정산 관리</a></li>
			<li><a href="#">배송 관리</a></li>
			<li><a href="seller_review">리뷰/문의 관리</a></li>
			<li><a href="intro_farm">회원정보수정</a></li>
		</ul>
	</nav>
	
	<!-- 가운데 content -->
	<div id="article">
		<div class="wrapTitle">내 판매목록</div>
	
			<!-- 전체보기 / select에 따라서 이름 바꾸기 -->
			<fieldset>
			<div class="table_wrap">
			<!-- 판매상품 테이블 -->
			<table class="product_table">
				<thead>
					<!-- table 메뉴 14개-->
					<tr>
						<th class="listMenu"><input type="checkbox" checked id="productItem" name="" value=" title="판매상품 전체 선택"></th>
						<th class="listMenu">상품번호</th>
						<th class="listMenu">대분류</th>
						<th class="listMenu">중분류</th>
						<th class="listMenu">상품이름</th>
						<th class="listMenu" id="thumbImg">대표이미지</th>
						<th class="listMenu">판매가</th>
						<th class="listMenu">재고수량</th>
						<th class="listMenu">상품등록일</th>
						<th class="listMenu">할인가</th>
						<th class="listMenu">할인율</th>
						<th class="listMenu">할인기간</th>
						<th class="listMenu">판매상태</th>
						<th class="listMenu">조회수</th>
					</tr>
				</thead>
				<!-- 전체보기 판매상품 리스트 -->
				<!-- 판매상태: 판매중 or 판매완료 -->
				<!-- 판매 완료는 회색처리 -->
				<!-- 할인율은 할인가로 계산(내림)해서 넣기 -->
				<!-- 페이징추가 -->
				<tbody>
					<!-- table 1 line -->
					<tr class="tbl_line">
						<td  class="tbl_line_cell"><div class="productCheck"><input type="checkbox" checked id="oneItemCk" name="oneItemCk" checked="checked" title="상품 선택"></div></td>
						<td class="tbl_line_cell"><div class="productNum"><span class="productNum">1</span></div></td>
						<!-- 대분류 번호 숨기기 -->
						<td class="tbl_line_cell"><div class="mCategory"><span class="mCateName">과일</span></div></td>
						<!-- 중분류 번호 숨기기 -->
						<td class="tbl_line_cell"><div class="category"><span class="cateName">사과</span></div></td>
						<td class="tbl_line_cell"><div class="product"><span class="productName"><a href="">가을햇살 영동사과</a></span></div></td>	
						<td class="tbl_line_cell"><div class="thumbnail"><img src=""/></div></td>
						<td class="tbl_line_cell"><div class="salePrice"><span class="price"><span class="price_num">10,000</span>원</span></div></td>
						<td class="tbl_line_cell"><div class="stock"><span class="unsoldStock">90</span>/<span class="totalStock">100</span></div></td>
						<td class="tbl_line_cell"><div class="regiDate">21/04/17</div></td>
						<td class="tbl_line_cell"><div class="discountPrice"><span class="price"><span class="price_num">1,000</span>원</span></div></td>
						<td class="tbl_line_cell"><div class="discountPercent"><span class="percent">10</span>%</div></td>
						<td class="tbl_line_cell"><div class="discountDate"><span class="discountStart">21/04/17</span> ~ <span class="discountFinish">21/04/30</span></div></td>
						<td class="tbl_line_cell"><div class="saleStatus"><span class="statusText">판매중</span></div></td>
						<td class="tbl_line_cell"><div class="hit">10</div></td>
					</tr>
					<!-- 반복 삭제할것-->
					<tr class="tbl_line">
						<td  class="tbl_line_cell"><div class="productCheck"><input type="checkbox" checked id="oneItemCk" name="oneItemCk" checked="checked" title="상품 선택"></div></td>
						<td class="tbl_line_cell"><div class="productNum"><span class="productNum">1</span></div></td>
						<!-- 대분류 번호 숨기기 -->
						<td class="tbl_line_cell"><div class="mCategory"><span class="mCateName">과일</span></div></td>
						<!-- 중분류 번호 숨기기 -->
						<td class="tbl_line_cell"><div class="category"><span class="cateName">사과</span></div></td>
						<td class="tbl_line_cell"><div class="product"><span class="productName"><a href="">가을햇살 영동사과</a></span></div></td>	
						<td class="tbl_line_cell"><div class="thumbnail"><img src=""/></div></td>
						<td class="tbl_line_cell"><div class="salePrice"><span class="price"><span class="price_num">10,000</span>원</span></div></td>
						<td class="tbl_line_cell"><div class="stock"><span class="unsoldStock">90</span>/<span class="totalStock">100</span></div></td>
						<td class="tbl_line_cell"><div class="regiDate">21/04/17</div></td>
						<td class="tbl_line_cell"><div class="discountPrice"><span class="price"><span class="price_num">1,000</span>원</span></div></td>
						<td class="tbl_line_cell"><div class="discountPercent"><span class="percent">10</span>%</div></td>
						<td class="tbl_line_cell"><div class="discountDate"><span class="discountStart">21/04/17</span> ~ <span class="discountFinish">21/04/30</span></div></td>
						<td class="tbl_line_cell"><div class="saleStatus"><span class="statusText">판매중</span></div></td>
						<td class="tbl_line_cell"><div class="hit">10</div></td>
					</tr>
				</tbody>
			</table>
			<div class="option_wrap">
				<!-- select pull-down menu넣기 -->
				<select id="selectList">
				<option value="전체보기" selected>전체보기</option>
				<option value="최신등록순">최신등록순</option>
				<option value="누적판매순">누적판매순</option>
				<option value="높은가격순">높은가격순</option>
				<option value="낮은가격순">낮은가격순</option>
				</select>
				<!-- 버튼 -->
				<input type="submit" value="판매상품 삭제" class="btn"/>
				<!-- 테이블 내 체크박스 폼안에 넣기? -->
					
			<!-- https://www.oliveyoung.co.kr/store/cart/getCart.do 참조중 -->
			</div>
			<!-- 페이징-->
				<div class="page_wrap">
					<div class="page_nation">
					   <a class="arrow pprev" href="#"></a>
					   <a class="arrow prev" href="#"></a>
					   <a href="#" class="active">1</a>
					   <a href="#">2</a>
					   <a class="arrow next" href="#"></a>
					   <a class="arrow nnext" href="#"></a>
					 </div>
				</div>
			<!-- 페이징 end -->
			</div><!-- table wrap end -->
		</fieldset>	
	</div><!-- article div end -->
</div> <!-- main div end -->
</body>
</html>