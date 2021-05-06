<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@include file="/WEB-INF/views/inc/sellerHeader.jsp" %> --%>
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

	
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/basicStyle.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/headerStyle.css">
</head>

<script>
	

</script>	
<style>
	#productName a{color:black;}
	.product_table,.table_wrap{
		margin: 0 auto;
		width:100%
	}
	.product_table thead{
		
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
	}
	/*테이블 상단*/
	.product_table th{
		width:1280px;
		height:60px;
		vertical-align:inherit;
		font-weight:bold;	
    	color:#666666;	
		font-size:12px;
		text-align:center;
	}
	.product_table td{
		font-size:12px;
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
		height: 50px; 	
	}
	.tbl_line_cell{
		display: table-cell;
		text-align:center;
		font-size:12px;
		padding:1px 5px 1px 5px;
		border-left:1px solid lightgray;
	}
	.product_table td:first-child{border-left:none}
	/*테이블 폭 조정*/
	.productCheck, .productNum, .product_table th:first-child, .product_table th:nth-child(2) {
		width:2%;
	}
	.product_table th:nth-child(4){width:8%}
	.product_table th:nth-child(5){width:16%}
	.product_table th:nth-child(13){width:12%}
	/*상품 이름*/
	.productName a{color:gray; font-weight:bold; }
	/*드롭메뉴와 삭제버튼*/
	.option_wrap{
		text-align:right; 
		margin: 0 auto;
		height:50px;
	}
	select{
		width:130px;	
		border:1px solid lightgray;
		margin-top:5px;	
	}
	select, .btn{ 
		margin-top:5px; 
		height:30px;
		font-size:12px;
	}
	input{height:30px; border:1px solid lightgray; font-size:12px;}
	input[type="text"]{width:200px;}
	input[type="button"]{width:50px; margin-right:10px; background:white;}
	
	.btn{float:left;}
 	#remove_product{margin-right:10px;}
 	.option_wrap{margin-top:8px;} 
 	
</style>
<script>
/* <option value="전체보기" selected>전체보기</option>
<option value="최신등록순">최신등록순</option>
<option value="누적판매순">누적판매순</option>
<option value="높은가격순">높은가격순</option>
<option value="낮은가격순">낮은가격순</option> */
//체크박스 전체선택
$(function(){
	$('#productCheck').click(function(){
		$('.product_table input[type=checkbox]').prop('checked',$('#productCheck').prop('checked'));
	});
});
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
		  <div id="seller_header">
      <!-- 상단 메뉴 바 -->
      <nav>
         <div id="headerMember">
            <c:if test="${logStatus != 'Y'}">
               <div class="sellerLoginBtn">   <!-- 로그인 전 -->
                  <input type="button" value="회원가입" class="sellerMenuButtons"/>
                  <input type="button" value="로그인" class="sellerMenuButtons"/>
                  <input type="button" value="고객센터" class="sellerMenuButtons"/>
               </div>
            </c:if>
            <c:if test="${logStatus == 'Y' }">
               <div class="sellerLoginBtn">   <!-- 로그인 후 -->
                  <c:if test="${logType==2}">
                     <input type="button" value="판매자 페이지로 이동하기" class="sellerMenuButtons"/>
                  </c:if>
                  <a href="myinfoEdit">${logName}님</a><span id="sellerMenuButtons">▼</span>
                  <input type="button" value="로그아웃" class="sellerMenuButtons"/>
                  <input type="button" value="고객센터" class="sellerMenuButtons"  onClick="location.href='<%=request.getContextPath() %>/ask_admin_list'"/>
               </div>
            </c:if>
         </div>   
         <ul>
            <li><a href="#">BEETMALL</a></li>
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
   </div>
	
	<!-- 가운데 content -->
	<div id="article" style="margin-top:0px;">
		<div class="wrapTitle">상품 관리</div>
	
			<!-- 전체보기 / select에 따라서 이름 바꾸기 -->
			<fieldset>
			<div class="table_wrap">
			<!-- 판매상품 테이블 -->
			<table class="product_table">
				<thead>
					<!-- table 메뉴 14개-->
					<tr>
						<th class="listMenu"><input type="checkbox" checked id="productCheck" name="" value=" title="판매상품 전체 선택"></th>
						<th class="listMenu">상품번호</th>
						<th class="listMenu">대분류</th>
						<th class="listMenu">중분류</th>
						<th class="listMenu">상품이름</th>
						<th class="listMenu" id="thumbImg">대표이미지</th>
						<th class="listMenu">재고수량</th>
						<th class="listMenu">판매시작일</th>
						<th class="listMenu">판매가</th>
						<th class="listMenu">할인금액</th>
						<th class="listMenu">할인적용판매가</th>
						<th class="listMenu">할인율</th>
						<th class="listMenu">할인기간</th>
						<th class="listMenu">판매상태</th>
					</tr>
				</thead>
				<!-- 전체보기 판매상품 리스트 -->
				<!-- 판매상태: 판매중 or 판매완료 -->
				<!-- 판매 완료는 회색처리 -->
				<!-- 할인율은 할인가로 계산(내림)해서 넣기 -->
				<!-- 페이징추가 -->
				<tbody>
					<!-- table 1 line -->
					<c:forEach var="vo" items="${productList}">
					<tr class="tbl_line">
						<td  class="tbl_line_cell"><div id="productCheck"><input type="checkbox" checked id="oneItemCk" name="oneItemCk" checked="checked" title="상품 선택"></div></td>
						<td class="tbl_line_cell"><div id="productNum"><span id="productNum">${vo.productnum}</span></div></td>
						<!-- 대분류 번호 숨기기 -->
						<td class="tbl_line_cell">	
							<div id="mCategory">
								<span id="mCateName">${vo.catename }</span>
								<input type="hidden" value="${vo.catenum}"/>
							</div>
						</td>
						<!-- 중분류 번호 숨기기 -->
						<td class="tbl_line_cell">
							<div id="category">
								<span id="cateName">${vo.mcatename }</span>
								<input type="hidden" value="${vo.mcatenum}"/>
							</div>
						</td>
						<td class="tbl_line_cell"><div id="product"><span id="productName"><a href="">${vo.productname}</a></span></div></td>	
						<td class="tbl_line_cell"><div id="thumbnail"><img src="${vo.thumbimg}"/></div></td>
						<td class="tbl_line_cell"><div id="stock"><span id="unsoldStock">90</span>/<span id="totalStock">${vo.totalstock }</span></div></td>
						<td class="tbl_line_cell"><div id="regiDate">${vo.sellstart}</div></td>
						<td class="tbl_line_cell"><div id="productprice"><span id="price"><span id="price_num">${vo.productprice }</span>원</span></div></td>
						<td class="tbl_line_cell"><div id="saleprice"><span id="price"><span id="price_num">${vo.saleprice}</span>원</span></div></td>
						<td class="tbl_line_cell"><div id="sellprice"><span id="price"><span id="price_num">${vo.sellprice}</span>원</span></div></td>
						<td class="tbl_line_cell"><div id="salepercent"><span id="salepercent">${vo.salepercent}</span>%</div></td>
						<td class="tbl_line_cell"><div id="saleperiod"><span id="salestart">${vo.salestart }</span> ~ <span id="salefinish">${vo.salefinish }</span></div></td>
						<td class="tbl_line_cell"><div id="saleStatus"><span id="statusText">판매중</span></div></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="option_wrap">
			
				<!-- 검색하기 -->
				<input type="text" placeholder="검색어를 입력하세요."><input type ="button" value="검색" /> 
				<!-- select pull-down menu넣기 -->
				<select id="selectList">
				<option value="전체보기" selected>전체보기</option>
				<option value="최신등록순">최신등록순</option>
				<option value="누적판매순">누적판매순</option>
				<option value="높은가격순">높은가격순</option>
				<option value="낮은가격순">낮은가격순</option>
				</select>
				<!-- 버튼 -->
				<input type="submit" value="판매상품 삭제" id="remove_product" class="btn"/>
				<input type="submit" value="판매상품 수정" id="edit_product"class="btn"/>
				
		
					
		
			</div>
			<!-- 페이징-->
				<div class="page_wrap">
				<div class="page_nation">
				   <a class="arrow pprev" href="#"></a>
				   <a class="arrow prev" href="#"></a>
				   <a href="#" class="active">1</a>
				   <a href="#">2</a>
				   <a href="#">3</a>
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