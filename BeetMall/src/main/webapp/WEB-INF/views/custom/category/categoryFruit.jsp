<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif;}
	#leftMenu{ display:block;}
	/* 페이징처리부분 */
	.page_wrap {
		text-align:center;
		font-size:0;
		padding-bottom: 30px;
	}
	.page_nation {
		display:inline-block;
		padding-left: 300px;
    	padding-right: 300px;
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
	/* 상품페이지 부분 */
	#productMain{
		width: 1100px;
		overflow:auto;
		padding-left: 40px;
	}
	#productMain div{
		text-align: left;
		margin-right: 65px;
		margin-bottom: 30px;
	}
	#productDiv{
		width:200px;
		float: left;
	}
	#productDiv>ul>li>img{
		width:198px;
		height:198px;
		border-radius: 10%;
	}
	#productDiv>ul>li{
		width:200px;
		padding-top: 3px;
	}
	#productDiv>ul>li:nth-child(5n+2){
	    font-size: x-large;
	    font-weight: bold;
	}
	#productDiv>ul>li:nth-child(5n+1){
	    padding-top:15px;
	}
	
	#categoryAll>img, #categoryFruit>img, #categoryVege>img, #categorySall>img{
		width:95px;
		height:96px;
		border-radius:80%;
		object-fit:cover;
	}
	
	/* 상품페이지 부분 css끝 */
	.main{
		width:1080px;
	}
	#mainName{
		text-align: center;
		margin-bottom: 40px;
		margin-top: 80px;
	}
	#category{
		overflow: auto;
		height:200px;
		width:auto;
		padding-left:120px;
	}
	#category li{
		float: left;
		text-align: center;
		padding-left : 90px;
		padding-right : 10px;
	}
	#pickupMain{
		float: right;
		vertical-align: middle;
   		font-size: large;
	    padding-top: 5px;
	}
	#Sequence{
		margin-left:20px;
		width: 100px;
		padding: .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('<%=request.getContextPath()%>/img/karrow.jpg') no-repeat 95% 50%/30px;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	#pickup{
		width: 17px;
    	height: 17px;
	}
	#categorySubmenu> #pickupMain, #Sequence{
		position:relative;
		height:40px;
	}
	#category2{
		position:absolute;
		left:550px;
		top: 685px;
		width:830px;
		height:21px;
		overflow:hidden;
	}
	#category2>span>div>a{
		text-align: center;
		padding:20px;
		cursor:pointer;
	}
	#coloor{
		color:red;
	}
	#search_container{
		width: 100%;
    	margin: 0 auto;
    	margin-bottom: 10px;
    	overflow: auto;
    	padding-right: 50px;
	}
	#searchForm{
	    float: right;
	}
	#search_box{
		border: none;
	}
	#searchWord{
		height: 30px;
	}
	#searchBtn{
	    margin-left: -1px;
	    background: white;
	    width: 50px;
	    height: 30px;
        border: 1px solid black;
	}
	#categoryAll,#categoryFruit,#categoryVege,#categorySall{
		color:black;
	}
</style>
<script>
//검색어 확인
$(function(){
	$("#searchForm").submit(function(){
		//searchWord있는지 없는지 찾기 , 있을때만 데이터 넘기기
		if($('#searchWord').val()=="" || #('#searchWord').val()==null){
			alert("검색어를 입력하세요.");
			return false;
		}
		return true;
	});
	
	$(document).ready(function(){
	    $("#pickup").change(function(){
	        if($("#pickup").is(":checked")){
	            var url = "/sshj/pickupCheckTure";		
	            $.ajax({
	            	url:url,
	    			success:function(result){
	    				console.log('픽업여부가져오기 성공');
	    				$("#productMain").empty();
	    				$("#productMain").html(result);
	    				console.log("result = "+result);
	    			},error:function(e){
	    				console.log(e.responseText);
	    				console.log("픽업여부가져오기 실패");
	    			}
	            });
	        }else{
	            var url = "/sshj/pickupCheckFalse";		
	            $.ajax({
	            	url:url,
	    			success:function(result){
	    				console.log('픽업여부가져오기 성공');
	    				$("#productMain").empty();
	    				$("")
	    				$("#productMain").html(result);
	    				console.log("result = "+result);
	    			},error:function(e){
	    				console.log(e.responseText);
	    				console.log("픽업여부가져오기 실패");
	    			}
	            });
	        }
	    });
	});
	$(document).ready(function(){
 		$('#Sequence').change(function(){
	   		if($('#Sequence option:selected').val() == "평점높은순"){
	            var url = "/sshj/highhigh1";		
	            $.ajax({
	            	url:url,
	    			success:function(result){
	    				console.log('평점높은순 가져오기 성공');
	    				$("#productMain").empty();
	    				$("#.page_wrap").remove();
	    				$("#productMain").html(result);
	    				console.log("result = "+result);
	    			},error:function(e){
	    				console.log(e.responseText);
	    				console.log("평점높은순 가져오기 실패");
	    			}
	            });
	   		}else if($('#Sequence option:selected').val() == "평점낮은순"){
	            var url = "/sshj/lowlow1";		
	            $.ajax({
	            	url:url,
	    			success:function(result){
	    				console.log('평점낮은순 가져오기 성공');
	    				$("#productMain").empty();
	    				$("#productMain").html(result);
	    				console.log("result = "+result);
	    			},error:function(e){
	    				console.log(e.responseText);
	    				console.log("평점낮은순 가져오기 실패");
	    			}
	            });
	   		}else if($('#Sequence option:selected').val() == "가격높은순"){
/* 	   			var url = "/sshj/lowlow1";		
	            $.ajax({
	            	url:url,
	    			success:function(result){
	    				console.log('평점낮은순 가져오기 성공');
	    				$("#productMain").empty();
	    				$("#productMain").html(result);
	    				console.log("result = "+result);
	    			},error:function(e){
	    				console.log(e.responseText);
	    				console.log("평점낮은순 가져오기 실패");
	    			}
	            }); */
	   		}else if($('#Sequence option:selected').val() == "가격낮은순"){
	   			alert("가격낮은순");
	   		}
 		});
 	});
</script>
<div class="section">
	<div class="main">
		<div id="mainName"><h1>상품 품목별(과일)</h1></div>
			<ul id="category">
				<li><a href="categoryMain"><span id="categoryAll" style="cursor:pointer"><img src="/sshj/img/kmain.png"><br/><br/>전체</span></a></li>
				<li><a href="categoryFruit"><span id="categoryFruit" style="cursor:pointer"><img src="/sshj/img/kfruit.png"><br/><br/>과일</span></a></li>
				<li><a href="categoryvegetable"><span id="categoryVege" style="cursor:pointer"><img src="/sshj/img/kvegetable.png"><br/><br/>채소</span></a></li>
				<li><a href="categoryRice"><span id="categorySall" style="cursor:pointer"><img src="/sshj/img/krice.png"><br/><br/>쌀/잡곡</span></a></li>
			</ul>
			<div id="search_container">
				<form method="get" action="categoryMain" id="searchForm">
					<span id="search_box">
						<input type="text" id="searchWord" name="searchWord" placeholder="검색하기"><input type="submit" id="searchBtn" value="검색"/>
					</span>
				</form>
			</div>
			<div id="categorySubmenu">
			<hr/>
				<select id="Sequence" name="Sequence">
					<option value="평점높은순" selected="selected">평점높은순</option>
					<option value="평점낮은순">평점낮은순</option>
					<option value="가격높은순">가격높은순</option>
					<option value="가격낮은순">가격낮은순</option>
				</select>
				<span id="pickupMain"><input type="checkbox" id="pickup" value="pickup"/>&nbsp;픽업여부</span>
			<hr/>
			</div>
		<div id="productMain">
			<c:forEach var="data" items="${list}">
				<div id="productDiv">
					<ul style="width:200px;">
						<li><img src="/sshj/img/${data.thumbimg}"></li>
						<li>
							<c:if test="${data.saleprice==null || data.saleprice=='' || data.salefinish=='1' || data.salestart=='1'}">
								${data.productprice}원
							</c:if>
							<c:if test="${data.saleprice != null && data.saleprice != '' && data.salefinish !='1' && data.salestart !='1'}">
								${data.proprice}원
							</c:if>
						</li>
						<li>${data.productname}</li>
						<c:if test="${data.totalscore==1}">
							<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★☆☆☆☆</span></li>
						</c:if>
						<c:if test="${data.totalscore==2}">
							<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★☆☆☆</span></li>
						</c:if>
						<c:if test="${data.totalscore==3}">
							<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★☆☆</span></li>
						</c:if>
						<c:if test="${data.totalscore==4}">
							<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★★☆</span></li>
						</c:if>
						<c:if test="${data.totalscore==5}">
							<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★★★</span></li>
						</c:if>
						<li>${data.storeaddr}</li>
						<li>${data.username}</li>
					</ul>
				</div>
			</c:forEach>
			<div class="page_wrap" style="text-align:center;">
				<div class="page_nation">
				   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
				   		<a class="arrow prev" href="/sshj/categoryFruit?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
				   </c:if>
				   <!-- 페이지 번호                   1                                    5                     -->
		           <c:forEach var="p" begin="${pageVO.startPageNum}" end="${(pageVO.startPageNum + pageVO.onePageNum)-1}">
	         		<!--p가 총페이지수보다 작거나같을때  레코드가 있는 페이지까지만 표시 -->
	            	<c:if test="${p<=pageVO.totalPage}">  
						<!--현재페이지 :  현재보고있는 페이지 표시 -->
		               <c:if test="${p==pageVO.pageNum}">
		                  <a class="active" href="categoryFruit?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a>
		               </c:if>
		               <!-- 현재페이지가 아닐 때 -->
		               <c:if test="${p!=pageVO.pageNum}">
		                  <a href="categoryFruit?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a>
		               </c:if>
	            	</c:if>
        		</c:forEach>
		           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
		              <a class="arrow next" href="/sshj/categoryFruit?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
		           </c:if>
				</div>
			 </div>
		</div>
	</div>
</div>