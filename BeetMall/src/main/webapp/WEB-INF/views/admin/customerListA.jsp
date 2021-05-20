<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#topBar h5{
		padding-left: 110px;
	}
	#container {
		height: 1200px;
	}  
	#container li {
		float: left;
		width: 10%;
	}
	
	#contentBox li:nth-of-type(8n-7) {
		width: 0%;
		margin-top: 3px;
	}
	
	#title li:nth-of-type(8n-1), #contentBox li:nth-of-type(8n-1) {
		width: 30%;
		padding-left: 20px;
	}
	
	#topBar li:nth-of-type(3) {
		width: 5.5%;
	}
	
	#topBar li:nth-of-type(4) {
		width: 14%;
	}
	
	#content input, textarea, select, #noticeSearchFrm input {
		border: 1px solid lightgray;
		border-radius: 3px;
	}
	
	#content li, label {
		list-style-type: none;
		padding-bottom: 10px;
	}
	
	#content select {
		height: 28px;
	}
	
	.searchFrm {
		margin:30px 0 30px 300px;
	}
	/*버튼*/
	#btns {
		top: -115px;
		left: 460px;
	}
	
	#btns a>button, button:nth-of-type(4) {
		margin-left: 900px;
	}
	
	#topBar Button:nth-of-type(1), #topBar Button:nth-of-type(2), #topBar Button:nth-of-type(3),
		#topBar Button:nth-of-type(4) {
		padding: 2px 7px;
	}
	
	#title {
		padding-top: 0 !important;
	}
	
	/* #sortBox {
		margin: 30px 0 0 20px;
	}  */
	#sortBox>ul{
		width:1110px !important;
	}
	#sortBox li:nth-of-type(2) {
		width: 6%;
	}
	#sortBox li:nth-of-type(4) {
		margin-right:45px;
	}
	#sortBox li:nth-of-type(6) {
		margin-left:340px;
	}
	#sortBox li:nth-of-type(7),#sortBox li:nth-of-type(8){
		width: 4%;
	}
	#fromTo{
		margin-left:90px;
	}
	#ascBtn{
		top:170px !important;
		left:1030px;
	}
	#descBtn{ 
		top:170px !important;
		left:1070px;
	}
	
	/* 페이징처리부분 */
	.page_nation .pprev {
		background: #f8f8f8
			url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat
			center center;
		margin-left: 0;
	}
	
	.page_nation .prev {
		background: #f8f8f8
			url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat
			center center;
		margin-right: 7px;
	}
	
	.page_nation .next {
		background: #f8f8f8
			url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat
			center center;
		margin-left: 7px;
	}
	
	.page_nation .nnext {
		background: #f8f8f8
			url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat
			center center;
		margin-right: 0;
	}
	
	.page_nation a.active {
		background-color: #42454c;
		color: #fff;
		border: 1px solid #42454c;
	}
	/* 페이징처리끝 */
	.wordcut{
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	#listul{
		padding-left:25px;
	}
	#listul>li{
		margin:0;
		padding-left:5px;
		height:45px;
		line-height: 45px;
		font-size:13px;
		border-bottom: 1px solid #ddd;
	}
	#listul>li:nth-child(1), #listul>li:nth-child(2), #listul>li:nth-child(3), #listul>li:nth-child(4), #listul>li:nth-child(5), #listul>li:nth-child(6), #listul>li:nth-child(7){
		border-top:1px solid #ddd;
		text-align:center;
	}
	#listul>li:nth-child(7n+1){
		width:10%;
		text-align:center;
	}
	#listul>li:nth-child(7n+2){
		width:10%;
		text-align:center;
	}
	#listul>li:nth-child(7n+3){
		width:12%;
		text-align:center;
	}
	#listul>li:nth-child(7n+4){
		width:20%;
	}
	#listul>li:nth-child(7n+5){
		width:6%;
		text-align:right;
	}
	#listul>li:nth-child(7n+6){
		width:29%;
		padding-left:20px;
	}
	#listul>li:nth-child(7n){
		width:12%;
	}
	#sortBox,#addBtn, #delBtn{
		visibility: hidden;
	}
	#container{
		top:0px;
	}
	#choose{
		margin: 50px 0 0 20px !important;
	}
</style>
<script>
function pagelist(pagenum){
	var lin = "customerListA?pageNum="+pagenum;
	location.href=lin;
}
</script>
<%@ include file="/inc/top.jspf"%>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5>
						<strong><a href="customerListA">회원관리</a></strong>
					</h5></li>
				<li><button class="success" value="add" name="add" id="addBtn">추가</button></li>
				<li><button class="success" value="del" name="del" id="delBtn">삭제</button></li>
			</ul>
		</div>
	</div>
<div id="body1">
	<%@ include file="/inc/leftBar.jspf"%>
	<div id="container">
		<div id="choose">
			<a href="customerListA"><button class="success" value="" name=""
					id="" style="background-color: lightgray; color:black;">일반회원</button></a> <a
				href="sellerListA"><button class="success" value="" name=""
					id="">판매자회원</button></a>
		</div>
		<div id="sortBox">
			<ul>
				<li>
					<select name="searchDate">  
						<option value="birthdate">생년월일</option> 
						<option value="regDate">가입일</option>
					</select>  
				</li>
				<li><input type="date" id="from"></li>
				<li><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>
				<li><input type="submit" value="검색" /></li>
				<li><select name="sort">
						<option value="정렬하기" selected>정렬하기</option>
						<option value="이름">이름</option>
						<option value="아이디">아이디</option>
						<option value="나이">나이</option>
						<option value="이메일">이메일</option>
						<option value="생년월일">생년월일</option>
						<option value="주소">주소</option>
						<option value="가입날짜">가입날짜</option>
				</select></li>
				<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc"
						id="descBtn">▼</button></li>
			</ul>
		</div>
		<div id="">
			<div id="">
				<ul id="listul">
					<li>구분</li>
					<li>이름</li>
					<li>아이디</li>
					<!-- <li>나이</li> -->
					<li>이메일</li>
					<li>포인트</li>
					<li>주소</li>
					<li>가입일</li>
					<c:forEach var="vo" items="${list}">
						<li><c:if test="${vo.storenum<0}">구매자</c:if><c:if test="${vo.storenum>=0}">판매자</c:if></li>
						<li>${vo.username}</li>
						<li><a href="boardCustomerInfoEdit?userid=${vo.userid}&prevPageNum=${pageVO.pageNum}">${vo.userid}</a></li>
						<li>${vo.useremail}</li>
						<li>${vo.point}</li>
						<li class="wordcut">(${vo.userzipcode})${vo.useraddr} ${vo.userdetailaddr}</li>
						<li>${vo.joindate }<br /></li>
					</c:forEach>
				</ul>
			</div>
			
			
			<!--  
		<c:forEach var="data" items="${list}">
			<ul class="contentList">
				<li><input type="checkbox" name="check" id="check"> </li>
				<li> 홍길동</li>
				<li><a href="회원정보?">id</a></li>
				<li>23</li>
				<li>abc@email.com</li>  
				<li>93-02-21</li>
				<li>서울시 마포구 백범로</li>
				<li>2021-02-16<br/></li> 
			</ul>
		</c:forEach>-->
		</div>
		<div class="page_wrap">	
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="javascript:pagelist(${pageVO.pageNum-1})"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum }"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="javascript:pagelist(${p})">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="javascript:pagelist(${pageVO.pageNum+1})"></a>
	           </c:if>
			</div>
		 </div>
		<div>
			<form method="get" class="searchFrm"
				action="<%=request.getContextPath()%>/board/noticeBoardList.jsp"> 
				<select name="searchKey">
					<option value="userid" selected>아이디</option>
					<option value="email">이메일</option> 
					<option value="addr">주소</option> 
				</select> <input type="text" name="searchWord" id="searchWord" /> <input
					type="submit" value="검색" />
			</form>
		</div>
	</div>
</div>
</html>