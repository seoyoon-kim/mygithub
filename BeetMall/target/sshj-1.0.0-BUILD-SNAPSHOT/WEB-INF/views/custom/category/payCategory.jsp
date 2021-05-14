<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif;}
	#leftMenu{ display:block;}
	/*버튼*/
	button, .btn{
		padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
	}
	/*버튼*/
	.btn:onclick{
		background: gray;
		color:white;
	} 
	/* 페이징처리부분 */
	.page_wrap {
		text-align:center;
		font-size:0;
		padding-bottom: 30px;
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
		text-align: left;
		margin-bottom: 20px;
	}
	#pickupMain{
		float: right;
		vertical-align: middle;
		padding-top: 15px;
   		font-size: large;
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
	
	#searchBtn{
		left:0px;
		top:0px;
	}
	#hrMain{
		overflow:auto;
    	height: 100px;
	}
	#hrMain>#Sequence, #hrMain>div, #hrMain>pickupMain{
		float:left;
	    padding-left: 30px;
	}
	#hrMain>div{
		padding-top:10px;
	}
	
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	#minNum{
		width:120px;
	}
	#MaxNum{
		width:150px;
	}
</style>
<script>
</script>
<div class="section">
	<div class="main">
		<div id="mainName"><h1>가격대별 찾기</h1></div>
			<div id="hrMain">
				<hr/>
					<select id="Sequence" style="padding-left: 10px;">
						<option value="평점높은순" selected="selected">평점높은순</option>
						<option value="평점낮은순">평점낮은순</option>
						<option value="가격높은순">가격높은순</option>
						<option value="가격낮은순">가격낮은순</option>
					</select>
					<div style="cursor: pointer;">5,000원 이하</div>
					<div style="cursor: pointer;">10,000원 이하</div>
					<div style="cursor: pointer;">50,000원 이하</div>
					<div style="cursor: pointer;">50,000원 이상</div>
					<div>
						<form>
							<input type="number" id="minNum" min="1000"/>~ <input type="number" id="MaxNum" min="1000"/>
							<input type="submit" class="btn" value="검색하기"/>
						</form>
					</div>
			</div>
			<hr/>
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
		</div>
		<div class="page_wrap" style="text-align:center;">
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/categoryMain?pageNum=${pageVO.pageNum-1}"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum }"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/categoryMain?pageNum=${p}">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="/sshj/categoryMain?pageNum=${pageVO.pageNum+1}"></a>
	           </c:if>
			</div>
		 </div>
	</div>
</div>