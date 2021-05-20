<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	/*맨 위 회색 top Bar*/
	#topBar h5{  
		padding-left:120px;
	}
	#topBar li{
		width:12%;
	} 
	#topBar li:nth-of-type(2){
		margin-left:108px;
	}  
	/*정렬 컨테이너*/
	#sortBox {
		margin:40px 0 0 900px;
	}
	#sortBox li{
		margin-top:30px;
	}
	#sortBox li:nth-of-type(1){
		width:108px;
		margin-top:40px;
	}
	#sortBox li:nth-of-type(2){
		width:38px;
	} 
	/*내용 전체 정렬*/
	#topBar li:nth-of-type(4){
		width:7%;
	}  
	#topBar li:nth-of-type(7){
		position:relative; left:-80px;
	}    
	#title>ul,.productList{
		position:relative; left:-40px;
	}  
	/* 본문 정렬*/
	#container li{ 
		list-style-type:none;
		float:left;
	}  
	#container li:nth-of-type(8){
		width:14%;
	}  
	.productList{
		height:28px;
	}
	.productList:nth-of-type(1){ 
		margin-top:10px;
	} 
	#contentList>ul{
		float:left;
		margin-bottom:0px;
	}
	#contentBox li{
		width:11%;
	} 
	#noticeSearchFrm{
		left:130px;
	}
	/*페이징 이미지 링크*/
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
	/*주문관리 검색*/
	select, input, .search_num{
		color:gray;
		height:30px;
		border:0.8px solid lightgray;
		width:100px;
		border-radius: 5px;
	}
	.search{
		margin-top:20px;
		height:130px;
		font-size:14px;
	}
	.search_num, .search_id{
		width:160px;
	}
	.search_date, .search_category, .search_sub_category{
		font-size:12px;
		width:125px;
	}
	label{
		font-size:16px;
		margin-bottom:8px;
	}
	.search_wrap>li{
		margin-top:25px;
		float:left;
		width:17%;
	}
	.search_wrap>li:first-child, .search_wrap li:nth-child(2) {
		width:26%;
	}
	.search_wrap>li:last-child{
		width:13%;
	}
	/*주문관리 탭*/
	.management_category{
		position:relative;
		height:44px;
	}
	.management_category ul{padding:0;}
	.management_category li{
		padding:0px;
		margin:0;
		float: left;
	    width: 12.5%;
	    height: 42px;
	    background-color: #f8f8f8;
	    border: 1px solid #dfe2e6;
	    border-right: 0;
	    box-sizing: border-box;
	}
	
	.management_category li.on{
		border-color: #b7bfc8 !important;
	    border-right: 1px solid #b7bfc8;
	    margin-right: -1px;
	    border-bottom: none;
	}
	.management_category li >a {
		display:block;
		height:28px;
		padding-top:12px;
		text-decoration:none;
		font-family: "Nanum Gothic Bold";
   		font-size: 14px;
  		font-weight: bold;
   		text-align: center;
    	color: #6c7580;
	}
	#management_container{
		position:relative;
		left:-40px;
	}
	#management_container li{
		width:11.7%;
	}
	.menu1{
		padding:18px 0;
	}
	/*주문관리 테이블*/
	.table_wrap, form{
		text-align:center;
		margin-top:10px;
	}
	table{
		empty-cells: show;
		text-indent: initial;
   		border-spacing: 2px;
   		font-size:13px;
   		border:1px solid lightgray;
   		text-align:center;
   		margin: 0 auto;
	}
	th{
		height:50px;
		text-align:center;	
		font-size:14px;	
	}
	th:first-child{
		width:35px;
	}
	thead{
		border-bottom:2px solid gray;
		background:#EEE;
	}
	tr{
		border-bottom:1px solid lightgray;
	}
	td{
		height:50px;
	}
	.table_checkbox, #listAllCheck{
		width:17px;
	}
	td:last-child{
		width:30px;
	}
	/*배송옵션 & 변경 버튼*/
	.option_change{
		margin-top:5px;
	}
	#option_sel{width:120px;}
	
	table input[type=checkbox]{
		top:0;
	}
/*주문상세 테이블 modal*/
 .detail_modal{display:none;}   
 .detail_modal{width:30%;}
	.detail_table{
		width:100%;
		font-size:12px;
	}

	.detail_table td{
		width:20%;
		height:30px;
	}
	.detail_table th{
		font-size:15px;
		font-weight:bold;
		height:30px;
	}
	.detail_table td{
		border-left:1px solid lightgray;
	}
	.detail_menu{
		font-weight: bold;
	}
	/*닫기버튼*/
	#close{
		font-weight:bold;
		font-size:16px;
		width:50px;
		float:right;
	}
	fieldset{width:100%;}
	.management_table>td a{ color: black;}
	.search_btn, .save_excel{
		width:85.7px;
		height:30px;
		margin-bottom:10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
	}
	#searchBox{
		position:relative;
		left:-35px;
		top:-20px;
	}
	#searchBox label{
		background-color:white;
		height:30px;
		font-size:16px;
		color:black;  
	}
	#searchBox li{
		margin-right:10px;
	}
	#searchBox li:nth-of-type(1), #searchBox li:nth-of-type(2){
		width:270px;
	} 
	#searchBox li:nth-of-type(2){
		margin-right:15px;
	}
	#searchBox li:nth-of-type(3){
		width:200px;
	}
	#searchBox li:nth-of-type(4)>label{
		padding-left:40px;
	}
	#searchBox li:nth-of-type(4)>input{
		position:relative; 
	}
	#searchBox input[type=text]{
		width:180px;
		padding-left:10px;
	}
	#flexType{
		display:flex;
	}
	#searchBtns{
		position:relative;
		left:30px;
		top:12px;
	}
	#searchBtn{
		margin-top:5px;
	}
	/*데이터 테이블*/
	table{
		width:1070px;
		position:relative;
		left:-20px; 
	}
	#tblHead>th{
		 text-align:center;
	}
	input[type=checkbox]{
		background-color:lightgray; 
		top:0px;	
	}
	a:link{
		text-decoration:none;
		color:black;
	}
	a:hover, a:active, a:visited{
		color:blue; 
	}
	#chooseId{
		width:180px;
		margin:10px 0 20px 0;	
	}
	.option_change button{
		border:1px solid lightgray;
		border-radius:5px;
	}
	
</style>
<script>
 
</script>
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="salesListA">판매 내역</a></strong></h5></li> 
			</ul> 
		</div>  
		</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="sortBox">
			<ul>
				<li><select name="sort" > 
				<option value="정렬하기" selected>정렬하기</option>  
						<option value="구매번호" >구매번호</option>  
		   				<option value="주문현황">주문현황</option>   
		   				<option value="배송현황">배송현황</option>   
		   				<option value="상품명">상품명</option>   
		   				<option value="아이디">주문자 아이디</option>
		   				<option value="법인명">법인명</option>
		   				<option value="구매일">구매일</option>         
		   			 </select>
	   			</li> 
	   			<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>  
			 </ul>
   		</div> 
   		<div id="contentBox"> 	
		  <!-- 상단 검색 옵션 : 접수일/ 카테고리/ 주문번호/ 고객ID/ 검색 -->
		<form id="searchBox">
		<div class="search">
			<ul class="search_wrap">
				<li><label for="">주문접수일</label><br/>
						<div class="flexType">
							<input type="date" name="" class="search_date"/>~<input type="date" name="" class="search_date" />
						</div></li>
				<li><label for="">카테고리</label><br/>
					<div class="flexType">
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
							<option> 1</option>
							<option> 2</option>
							<option> 3</option>
							<option> 4</option>
							<option> 5</option>
							<option> 6</option>
							<option> 7</option> 
						</select>
						<!-- 견과류 -->
						<!-- 과일 -->
						<!-- 쌀 -->
						<!-- 잡곡/혼합곡 -->
						<!-- 채소 -->
					</div>
				</li>
				<li><label for="">주문번호</label><br/>
					<input type="text" size="15" name="" class="search_num" placeholder="주문번호를 입력해주세요."/>
				</li>
				<li>
					<select id="chooseId">
						<option value="customerId">구매자 아이디</option>
						<option value="sellerId">판매자 아이디</option>
					</select>
					<input type="text" size="15" name="" class="search_id" placeholder="ID를 입력해주세요."/>
				</li>
				<li>
					<div id="searchBtns">
						<input type="button" name="" class="save_excel" value="엑셀로 저장" onclick="save_excel()"/>
						<input type="button" name="" class="search_btn" value="검색" id="searchBtn"/><br/>				
					</div>
				</li>
			</ul>
		
		</div>
		</form>
		
		<!-- 탭 : 전체/ 미입금/ 입금완료/ 배송준비/ 배송중/ 배송완료/ 픽업대기중/ 픽업완료 -->
		<div class="management_container" id="management_container">
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
		<!--테이블-->
				<div class="table_wrap">
					<form>
						<table class="management_table" >
							<thead>
								<tr id="tblHead">
									<th>NO</th>
									<th>주문번호</th>
									<th>상품명</th>
									<th>수량</th>
									<th>주문일</th>
									<th>주문자명/ID</th>
									<th>법인명</th>
									<th>배송요청</th>
									<th>결제금액</th>
									<th>주문현황</th>
									<th>배송현황</th>
									<th><input type="checkbox" checked id="listAllCheck"/></th>
								</tr>
							</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="javascript:modal();" >2021041809090</a></td><!-- id="popup_open_btn" -->
								<td>햅쌀</td>
								<td>10kg</td>
								<td>21/04/18 09:10</td>
								<td>김가지/ kim12</td>
								<td>010-1234-5678</td>
								<td>Y</td>
								<td><span>30,000</span>원 </td>
								<td><span>배송지연</span></td>
								<td><span>취소진행중</span></td>
								<td><input type="checkbox" checked name="" class="table_checkbox"/></td>
							</tr>	
							<tr>
								<td>1</td>
								<td><a href="javascript:modal();">2021041809090</a></td>
								<td>햅쌀</td>
								<td>10kg</td>
								<td>21/04/18 09:10</td>
								<td>김가지/ kim12</td>
								<td>010-1234-5678</td>
								<td>Y</td>
								<td><span>30,000</span>원 </td>
								<td><span>상품파손</span></td>
								<td><span>반품완료</span></td>
								<td><input type="checkbox" checked name="" class="table_checkbox"/></td>
							</tr>	
								<tr>
								<td></td>
								<td><a href=""></a></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>N</td>
								<td><span></span>원 </td>
								<td><span></span></td>
								<td><span></span></td>
								<td><input type="checkbox" checked name="" class="table_checkbox"/></td>
							</tr>
						</tbody>
						</table>	
					</form>
				</div>
				<div class="option_change"style="text-align:right; padding-right:30px;">
					<select id="option_sel">
						<option>-</option>
						<option>배송준비중</option>
						<option>배송중</option>
						<option>배송완료</option>
						<option>픽업대기중</option>
						<option>픽업완료</option>
					</select>
					<button class="success" value="" name="" id="">변경</button>
				</div>
			
		 
		</div>
		<div class="page_wrap">
			<div class="page_nation">
			   <a class="arrow pprev" href="#"></a>
			   <a class="arrow prev" href="#"></a>
			   <a href="#" class="active">1</a>
			   <a href="#">2</a>
			   <a href="#">3</a>
			   <a href="#">4</a>
			   <a href="#">5</a>
			   <a href="#">6</a>
			   <a href="#">7</a>
			   <a href="#">8</a>
			   <a href="#">9</a>
			   <a href="#">10</a>
			   <a class="arrow next" href="#"></a>
			   <a class="arrow nnext" href="#"></a>
			</div>
		 </div>  
		</div> 
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
						<td><span class="detail_menu">포인트 사용</span></td>
						<td>3,000<span class="point">.P</span></td>
					</tr>
					<tr class="detail_line5">
						<td><span class="detail_menu">결제방법</span></td>
						<td><span>무통장입금</span></td>
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
					<tr >
						<td colspan="4" style="text-align:right"><button>구매자와 대화하기</button></td>
					</tr>
				</tbody>
			</table>	
		</div>
	<!-- 모달 -->
		<div id="modal" > </div>
</div>