<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/inc/sellerHeader.jsp" %> 
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
<style>
	#productName a{color:black; cursor:pointer;}
	.table_wrap{margin-top:20px;}
	.product_table,.table_wrap{
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
    	background:#f8faf7;
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
		/*border-left:1px solid lightgray;*/
	}
	.product_table td:first-child{border-left:none}
	/*테이블 폭 조정*/
	.productCheck, .productNum, .product_table th:first-child, .product_table th:nth-child(2) {
		width:2%;
	}
	.product_table th:nth-child(3){width:6%}
	.product_table th:nth-child(4){width:6%}
	.product_table th:nth-child(5){width:16%}
	.product_table th:nth-child(12){width:4%}
	.product_table th:nth-child(13){width:12%}
	.product_table th:last-child{width:4%}
	/*상품 이름*/
	.productName a{color:gray; font-weight:bold; }
	/*드롭메뉴와 삭제버튼*/
	.option_wrap{
		text-align:right; 
		margin: 0 auto;
		margin-top:10px;
		height:50px;
	}
	select{
		width:130px;	
		border:1px solid lightgray;
		margin-top:5px;	
	}
	select, .btn{ 
		margin-top:5px; 
		height:40px;
		font-size:12px;
	}
	input{height:40px; border:1px solid lightgray; font-size:12px;}
	input[type="text"]{width:200px;}
	#searchWord{height:40px; border: 1px solid lightgray;}
	#searchBtn{margin-left:-1px; background:white; width:50px;}
	.btn{float:left;}
 	#remove_product{margin-right:10px;}
 	.option_wrap{margin:8px 0 20px 0;} 
 	img{width:100px; height: 100px; margin:5px 0 5px 0;}
</style>
<script>
//체크박스 삭제
function productDel(){
	var url = "productDelete"; //controller url
	var valueArr = new Array();
	var list = $('input[name=oneProductCheck]');
	console.log('list.length ->', list.length);
	console.log('list -> ', list);
	for (var i = 0; i<list.length; i++){  
		if(list[i].checked){ //선택된 값 배열에 저장
			console.log('list[i].value->', list[i].value);
			valueArr.push(list[i].value);
			console.log('valueArr->',valueArr);
		}
	}
	if(valueArr.length==0){
		alert('선택된 상품이 없습니다.');
	}else{
		var msg = confirm('해당 상품을 삭제하시겠습니까?');
		$.ajax({
			url : url,
			type :'POST',
			traditional : true,
			data: {
				valueArr : valueArr
			},
			success: function(){
				
					alert('선택한 상품이 삭제되었습니다.');
					location.replace('product_list');
			},error :function(){
				alert('삭제가 실패하였습니다.');
			}
		});
		
	}

	
};

//체크박스 전체선택
$(function(){
	$('.product_table input[type=checkbox]').click(function(){
		console.log('this checkbox value>>', $(this).val());
	});
	$('#productCheck').click(function(){
		$('.product_table input[type=checkbox]').prop('checked',$('#productCheck').prop('checked'));
	});
});
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
//select 
$(document).ready(function(){
	var sort = document.getElementsByClassName('selectList');
	var count = 0;
	var sortquery = '';
	$('#selectList').change(function(){
		var option = $(this).val();
		console.log(option);
	
		if(option =='판매중'){
			$('td:contains("판매중")').parents('tr').css('display','');
			$('td:contains("판매종료")').parents('tr').css('display','none');
		}
		if(option =='판매종료'){
			$('td:contains("판매종료")').parents('tr').css('display','');
			$('td:contains("판매중")').parents('tr').css('display','none');
		}
		if(option=='전체보기'){ //전체
			$('td:contains("판매중")').parents('tr').css('display',' ');
			$('td:contains("판매종료")').parents('tr').css('display',' ');
		}
		//누적판매순
		//높은가격순
		//낮은가격순
	});
 		
});
</script>		
<body>
<div class="main">

	<!-- 가운데 content -->
	<div id="article" >
		<div class="wrapTitle">상품 관리</div>
			<div style="margin-top:20px;">			
				<!-- 검색하기 -->
				<form method="get" action="product_list" id="searchForm">
					<input type="text" name="searchWord" id="searchWord" placeholder="검색어를 입력하세요."><input type ="submit" id ="searchBtn" value="검색" /> 
				</form>
			</div>
			<!-- 전체보기 / select에 따라서 이름 바꾸기 -->
			<fieldset>
			<div class="table_wrap">
			<!-- 판매상품 테이블 -->
			<table class="product_table">
				<thead>
					<!-- table 메뉴 14개-->
					<tr>
						<th class="listMenu"><input type="checkbox" checked id="productCheck" name="productCheck" value=""title="판매상품 전체 선택"></th>
						<th class="listMenu">상품번호</th>
						<th class="listMenu">대분류</th>
						<th class="listMenu">중분류</th>
						<th class="listMenu">상품이름</th>
						<th class="listMenu" id="thumbImg">대표이미지</th>
						<th class="listMenu">재고수량</th>
						<th class="listMenu">판매기간</th>
						<th class="listMenu">판매가</th>
						<th class="listMenu">할인금액</th>
						<th class="listMenu">할인판매가</th>
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
						<td  class="tbl_line_cell"><div id="productCheck"><input type="checkbox"  id="oneProductCheck" name="oneProductCheck" checked="checked" title="${vo.productname}" value="${vo.productnum}"></div></td>
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
						<td class="tbl_line_cell"><div id="product"><span id="productName"><a href="custom/customproduct?productnum=${vo.productnum}">${vo.productname}</a></span></div></td>	
						<td class="tbl_line_cell"><div id="thumbnail"><img src="<%=request.getContextPath()%>/resources/sellerProductImgs/${vo.thumbimg}"/></div></td>
						<td class="tbl_line_cell"><div id="stock"><span id="unsoldStock">${vo.nowstock}</span>/<span id="totalStock">${vo.totalstock }</span></div></td>
						<td class="tbl_line_cell"><div id="regiDate">${vo.sellstart}~${ vo.sellfinish}</div></td>
						<td class="tbl_line_cell"><div id="productprice"><span id="price_num">${vo.productprice }</span><span id="won">원</span></div></td>
						<td class="tbl_line_cell"><div id="saleprice"><span id="price_num">${vo.saleprice}</span><span id="won">원</span></div></td>
						<td class="tbl_line_cell"><div id="sellprice"><span id="price_num">${vo.sellprice}</span><span id="won">원</span></div></td>
						<td class="tbl_line_cell"><div id="salepercent"><span id="salepercent">${vo.salepercent}</span>%</div></td>
						<td class="tbl_line_cell"><div id="saleperiod"><span id="salestart">${vo.salestart }</span> ~ <span id="salefinish">${vo.salefinish }</span></div></td>
						<c:if test="${vo.nowstock!=0}">
						<td class="tbl_line_cell"><div id="saleStatus"><span id="statusText">판매중</span></div></td>
						</c:if>
						<c:if test ="${vo.nowstock==0}">
						<td class="tbl_line_cell"><div id="saleStatus"><span id="statusText" style="color:red">판매종료</span></div></td>
						</c:if>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="option_wrap">
			
				<!-- select pull-down menu넣기 -->
				<select id="selectList" name="sortRecord">
				<option value="전체" selected>전체보기</option>
				<option value="판매중">판매중</option>
				<option value="판매종료">판매종료</option>
				<option value="누적판매순">누적판매순</option>
				<option value="높은가격순">높은가격순</option>
				<option value="낮은가격순">낮은가격순</option>
				</select>
				<!-- 버튼 -->
				<input type="button" value="판매상품 삭제" id="remove_product" class="btn" onClick="productDel()"/>
				<input type="submit" value="판매상품 수정" id="edit_product"class="btn"/>
				
		
					
		
			</div>
			<!-------------- 페이징------------------>
		<div class="page_wrap">
			<div class="page_nation">
				
			  	<!--맨앞으로-->
  				<a class="arrow_pprev" href="product_list?pageNum=1<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--앞으로-->
        		<a class="arrow_prev" href="product_list?pageNum=${sapvo.pageNum-1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
 				<!--레코드 갯수에 따른 페이지 갯수 표시--> 
         		<c:forEach var="p" begin="${sapvo.startPageNum}" end="${(sapvo.startPageNum + sapvo.onePageNum)-1}">
	         		<!--p가 총페이지수보다 작거나같을때  레코드가 있는 페이지까지만 표시 -->
	            	<c:if test="${p<=sapvo.totalPage}">  
						<!--현재페이지 :  현재보고있는 페이지 표시 -->
		               <c:if test="${p==sapvo.pageNum}">
		                  <a class="on" href="product_list?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
		               <!-- 현재페이지가 아닐 때 -->
		               <c:if test="${p!=sapvo.pageNum}">
		                  <a href="product_list?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
	            	</c:if>
        		</c:forEach>
        		<!-- 다음 페이지가 있을 때 -->
				<!--뒤로-->            
	         	<a class="arrow next" href="product_list?pageNum=${sapvo.pageNum+1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--맨뒤로-->
	         	<a class="arrow nnext" href="product_list?pageNum=${sapvo.totalPage}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
			</div>
		 </div> 
		 <!-------------- 페이징 끝 --------------->
			</div><!-- table wrap end -->
		</fieldset>	
	</div><!-- article div end -->
</div> <!-- main div end -->
</body>
</html>