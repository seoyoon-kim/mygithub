<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/menu_c.jspf"%>

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!-- font-family: 'Nanum Gothic', sans-serif; -->
<link rel="stylesheet" type="text/css"	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- font-family: 'NanumSquare', sans-serif !important; -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/jcss/basicStyle.css">

<script>
	
</script>

</head>
<style>
/*  기본설정----------------------------------------------                 */
a:hover, a:active, a:visited, a:link {
    text-decoration: none;
    color: black;
}
#mypageMenubar{
	display:block;
	font-size:17px;
}

#searchBtn {
	top: 0px;
	left: 0px;
}

.section {
	width: 1080px;
	margin: 0 auto;
}
/* ------------------페이징처리부분-------------------- */
.page_wrap {
	text-align: center;
	font-size: 0;
	padding-bottom: 30px;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 35px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

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

/* ---------------페이징 처리끝-------------------- */

/* 전체설정----------------------------------------------                 */
ul>li {
	list-style-type: none;
}

#reciList, #recivb, #reciContenView {
	padding: 0px;
	margin: 0px;
}

#recipettile>b {
	float: left;
	width: 100%;
	color: rgb(252, 118, 45);
	height: 20px;
	margin-top: 10px;
	margin-bottom:40px;
}

/*  큰제목----------------------------------------------                 */
#recit {
	width: 300px;
	padding: 0px;
	margin: 0px;
	color: rgb(252, 118, 45);
}

/*  게시글 리스트----------------------------------------------                 */
#slist {
	width: 100%;
	height:500px;
	margin-bottom: 30px;
}

#reciListT {
	padding: 0px;
	margin-top: 10px;
	border-bottom: 1px solid #ddd;
}

#reciList, #reciListT {
	width: 100%;
}

#reciList>li, #reciListT>li {
	width: 10%;
	float: left;
	height: 30px;
	line-height: 30px;
}

#reciList>li {
	border-bottom: 1px solid #ddd;
	margin-bottom: 5px;
}

#reciList>li:nth-child(6n+2), #reciListT>li:nth-child(6n+2) {
	width: 50%;
}

/*  글안에 내용----------------------------------------------                 */
#reciContenView {
	width: 100%;
	height: 40px;
	background-color: #eee;
	border-bottom: 1px solid #ddd;
}

#reciContenView>li {
	width: 10%;
	float: left;
	line-height: 40px;
}

#reciContenView>li:nth-child(6n+2) {
	width: 50%;
}

/*  해당 게시글 보기----------------------------------------------                 */
#rcontent {
	float: left;
	padding: 5%;
	width: 100%;
	text-align: center;
}

/*  하단표시----------------------------------------------                 */
#recivb {
	width: 100%;
	padding-top: 10px;
	margin-bottom: 15px;
	border-top: 1px solid #ddd;
}

#recivb>li {
	width: 2%;
	float: left;
	line-height: 20px;
}

#recivb>li:nth-child(6n+1) {
	width: 10%;
}

#recivb>li:nth-child(6n+2) {
	width: 82%;
}

#recivb>li>img {
	width: 20px;
}

#recivb>li>a>img {
	width: 20px;
}

/*  검색표시----------------------------------------------                 */
#searchbox {
	text-align: center;
	margin-bottom: 30px;
	margin-top: 10px;
}



/*표*/

table{
	width:100%%;	
	border-spacing: 0;
	text-indent: initial;
	border-top:2px solid lightgray;
	border-bottom:2px solid lightgray;
}
th, .th{
	display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
  		background-color:#f6f6f6;;
  		/*#fcfcfc*/
}
thead{
	border-bottom: 2px solid #ccc;
    border-top: 2px solid #ccc;
    width:100%;
}
tr{
	display: table-row;
    vertical-align: inherit;
    border-color: inherit;
    height:50px;
}
.td, .content{
	padding-left:20px;
}
.content{
	padding: 20px 0 20px;
}
td, .td{
	height:50px;
	width:930px;
}
.tr_head{
	font-weight:bold;
	border-top:2px solid lightgray;
	border-bottom:2px solid lightgray;
}
.tr_head li{
	float:left;
}
.menu, .th{
	width:150px; text-align:center;
}
.td, .th{ line-height:50px;}
.td{
	width:930px; line-height:50px;
}



#searchKey{
float:left;
}

#searchWord{
float:left;
margin-right:0px;
border:1px solid #ddd;
height:28px;
width:170px;

}

#searb{
width:100%;
float:left;
}


</style>
<script>




</script>
<body>

	<div class="section">

		<!-- ------------------------큰제목----------------------------------- -->
		<div id="recipettile">
			<b>레시피를 올리는 곳입니다.</b>
		</div>
		
	<!-- ------------------------검색 기능----------------------------------- -->
	
	<div id="searb">
	<form method="get" action="recipeList" id="searchFrm">
				<select name="searchKey" id="searchKey">
					<option value="recipetitle">제목</option>
					<option value="recipecontent">내용</option>
					<option value="userid">작성자</option>
				</select>
				<span id="cs_search_box">
					<input type="text" id="searchWord" name="searchWord" placeholder="내용을 입력해주세요." style="margin-right: 250px;">
				    <input type="submit" value="검색"/> 
				</span>
				
	 </form>
	 </div>
<!-- ------------------------게시글 리스트----------------------------------- -->
		<div>

			<select name="selectOrder" style="float: right">
				<option>최신순</option>
				<option>추천순</option>
				<option>조회수순</option>
			</select>
			
<!-- ------------------------게시글 리스트----------------------------------- -->
			<div id="slist">
				<ul id="reciListT">
					<li><b>번호</b></li>
					<li><b>제목</b></li>
					<li><b>작성자</b></li>
					<li><b>추천수</b></li>
					<li><b>조회수</b></li>
					<li><b>작성일</b></li>
				</ul>

				<ul id="reciList">
					<c:forEach var="data" items="${list}">
					<li>${data.recipenum}</li>
					<li><a href="recipeView?recipenum=${data.recipenum}&id=${logId}">${data.recipetitle}</a></li>
					<li>${data.userid}</li>
					<li>${data.reciperecommend}</li>
					<li>${data.recipehit}</li>
					<li>${data.recipewritedate}</li>
					</c:forEach>
				</ul>
			</div>
			<!-- slist -->



		</div>



		<!-- -----------------------------페이지 표시----------------------------------------- -->

	    <div class="page_wrap">
					<div class="page_nation">
					   <c:if test="${pageVO1.pageNum>1}"><!-- 이전페이지가 있을때 -->
					   		<a class="arrow prev" href="/sshj/recipeList?pageNum=${pageVO1.pageNum-1}<c:if test="${pageVO1.searchWord != null && pageVO1.searchWord != ''}">&searchKey=${pageVO1.searchKey}&searchWord=${pageVO1.searchWord}</c:if>"></a>
					   </c:if>
					   <!-- 페이지 번호                   1                                    5                     -->
			           <c:forEach var="p" begin="${pageVO1.startPageNum}" step="1" end="${pageVO1.startPageNum + pageVO1.onePageNum-1}">
			              <c:if test="${p<=pageVO1.totalPage}">
			                 <c:if test="${p==pageVO1.pageNum}"> <!-- 현재페이지일때 실행 -->
			                    <a class="active">${p}</a>
			                 </c:if>   
			                 <c:if test="${p!=pageVO1.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
			                    <a href="/sshj/recipeList?pageNum=${p}<c:if test="${pageVO1.searchWord != null && pageVO1.searchWord != ''}">&searchKey=${pageVO1.searchKey}&searchWord=${pageVO1.searchWord}</c:if>">${p}</a>
			                 </c:if>
			              </c:if>
			           </c:forEach>
			           <c:if test="${pageVO1.pageNum < pageVO1.totalPage}">
			              <a class="arrow next" href="/sshj/recipeList?pageNum=${pageVO1.pageNum+1}<c:if test="${pageVO1.searchWord != null && pageVO1.searchWord != ''}">&searchKey=${pageVO1.searchKey}&searchWord=${pageVO1.searchWord}</c:if>"></a>
			           </c:if>
					</div>
			 </div>  
	
	






	</div>
</body>
</html>