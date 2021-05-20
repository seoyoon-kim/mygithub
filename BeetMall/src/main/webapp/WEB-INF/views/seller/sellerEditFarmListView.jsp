<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/basicStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/headerStyle.css">
<style>
	header,#seller_header,footer{display:none;}
	
	#article{margin:0 auto;}
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
	.product_table th:nth-child(5){width:12%}
	.product_table th:nth-child(11){width:6%;}
	.product_table th:nth-child(12){width:4%}
	.product_table th:nth-child(13){width:12%}
	.product_table th:last-child{width:5%}
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
 	
 		/* 페이징처리부분 */
	.page_wrap {
		text-align:center;
		font-size:0;
		padding-bottom: 30px;
		padding-top: 50px;
	}
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:35px;
		height:35px;
		line-height:35px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	.page_nation .pprev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat center center;
		margin-right:0;
	}
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	/* 페이징처리끝 */
</style>
<script>
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
	
	$('.selectMenu').click(function(){
		let productnum = $(this).parent().parent().parent().prev().prev().prev().find('span').text();
		let productname = $(this).text();
		let productimg = $(this).parent().parent().parent().next().find('input').val();
		let productprice = $(this).parent().parent().parent().next().next().next().next().find('#price_num').text();
		let saleprice = $(this).parent().parent().parent().next().next().next().next().next().find('#price_num').text();
		let sellprice = $(this).parent().parent().parent().next().next().next().next().next().next().find('#price_num').text();
		let salepercent = $(this).parent().parent().parent().next().next().next().next().next().next().next().find('span').text();
		let statusText = $(this).parent().parent().parent().next().next().next().next().next().next().next().next().next().find('span').text();
		
		console.log(productnum);
		console.log(productname);
		console.log(productimg);
		console.log(productprice);
		console.log(saleprice);
		console.log(sellprice);
		console.log(salepercent);
		console.log(statusText);
		if(statusText != '판매중'){
			alert('판매중인 상품만 선택 가능합니다');
			return false;
		}
		
		if(confirm('해당 삼품을 대표상품으로 선택하시겠습니까?')){
			opener.document.getElementById('openerProductname').innerText = productname;
			opener.imgChange('<%=request.getContextPath()%>/resources/img/'+productimg);
			opener.document.getElementById('productnum').value = productnum;
			if(salepercent != 0){
				opener.document.getElementById('openerProductPrice').vale = (productprice-saleprice);
			} else {
				opener.document.getElementById('openerProductPrice').vale = productprice;
			}
			window.close();
		}
		
	})
});	

</script>
<section>
	<!-- 가운데 content -->
	<div id="article" >
		<div class="wrapTitle">대표메뉴 선택</div>
			<div style="margin-top:20px;">			
				<!-- 검색하기 -->
				<form method="get" action="sellerEditFarmListView" id="searchForm">
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
						<th class="listMenu"></th>
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
						<td  class="tbl_line_cell"><div id="productCheck"></div></td>
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
						<td class="tbl_line_cell"><div id="product"><span id="productName"><a href="javascript:void(0)" onclick="return false;" class="selectMenu">${vo.productname}</a></span></div></td>	
						<td class="tbl_line_cell"><div id="thumbnail"><img src="<%=request.getContextPath()%>/resources/sellerProductImgs/${vo.thumbimg}"/><input type="hidden" value="${vo.thumbimg}"></div></td>
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
		
			<!-------------- 페이징------------------>
		<div class="page_wrap">
			<div class="page_nation">
				
			  	<!--맨앞으로-->
  				<a class="arrow_pprev" href="sellerEditFarmListView?pageNum=1<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--앞으로-->
        		<a class="arrow_prev" href="sellerEditFarmListView?pageNum=${sapvo.pageNum-1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
 				<!--레코드 갯수에 따른 페이지 갯수 표시--> 
         		<c:forEach var="p" begin="${sapvo.startPageNum}" end="${(sapvo.startPageNum + sapvo.onePageNum)-1}">
	         		<!--p가 총페이지수보다 작거나같을때  레코드가 있는 페이지까지만 표시 -->
	            	<c:if test="${p<=sapvo.totalPage}">  
						<!--현재페이지 :  현재보고있는 페이지 표시 -->
		               <c:if test="${p==sapvo.pageNum}">
		                  <a class="on" href="sellerEditFarmListView?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
		               <!-- 현재페이지가 아닐 때 -->
		               <c:if test="${p!=sapvo.pageNum}">
		                  <a href="sellerEditFarmListView?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
	            	</c:if>
        		</c:forEach>
        		<!-- 다음 페이지가 있을 때 -->
				<!--뒤로-->            
	         	<a class="arrow next" href="sellerEditFarmListView?pageNum=${sapvo.pageNum+1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--맨뒤로-->
	         	<a class="arrow nnext" href="sellerEditFarmListView?pageNum=${sapvo.totalPage}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
			</div>
		 </div> 
		 <!-------------- 페이징 끝 --------------->
			</div><!-- table wrap end -->
		</fieldset>	
	</div><!-- article div end -->
	
</section>