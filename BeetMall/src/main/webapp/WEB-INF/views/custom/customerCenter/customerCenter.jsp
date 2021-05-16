<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif;}
   #NoticeleftMenu{
   		display:block;
   }
	a:hover, a:active, a:visited, a:link {
   		color: black;
   }
   .wrapTitle{
	   margin-top: 50px;
	   height: 60px;
	   line-height: 60px;
	   /* color: #fff; */
	   color:black;
	   font-weight:bold;
	   font-size:2em;
	   text-indent: 0.4em;
	   /* background-color: rgb(224,102,102); */
	   margin-bottom:30px;
	}
	ul, li, a{
		list-style: none; padding:0; margin:0;
	}

	/*표*/
	table{
		border-spacing: 0;
		text-indent: initial;
		margin-bottom:10px;
	}
	th{
		height:50px;
		display: table-cell;
	    vertical-align: inherit;
	    font-weight: bold;
	    text-align: -internal-center;
	    border-bottom: 1px solid #ccc;
	    border-top: 1px solid #ccc;
   		background-color: #fcfcfc;
   		font-size: 16px;
	}
	td{
		height:50px;
		border-bottom:1px solid lightgray;
	}
	td:nth-child(1), td:nth-child(3){
		text-align:center;
		width:100px;
	}
	td:nth-child(2){
		padding-left:30px;
	}
	td:nth-child(2) a, a{
		color:black;
		cursor: pointer;
	}
	#kwrite{
		float:right;
		margin-right:5px;
		margin-bottom:10px;
	}
	/*페이징*/
	.paging,th{
		margin-top:30px;
		text-align:center;
	}
	.wrap_paging, .option_change, table, fieldset, .paging{
		width:100%;
	}
	
	button, .btn {
	    padding: 3px 10px;
	    color: #666666;
	    background: #fff;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    border: 1px solid black;
	    margin-left: 5px;
        width: 130px;
	}
	.cs_message {
	    margin: 0 auto;
	    font-size: 15px;
	    width: 90%;
	    margin-bottom: 30px;
	}
	select {
	    float: right;
	    height: 28px;
	    border: 1px solid lightgray;
	    border-radius: 8px;
	    font-family: inherit;
	    font-size: inherit;
	    line-height: inherit;
	    text-transform: none;
	    color: inherit;
	    font: inherit;
	    margin: 0;
	}
	
	.answer_span {
	    background-color: rgb(252,118,45);
	    border-radius: 10px;
	    color: white;
	    padding: 5px;
	    font-size: 14px;
	}
	
	#no_answer {
	    color: gray;
	    background: gray;
	    color: white;
	    padding: 5px;
	}
	
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
	#search_container{
    	margin: 0 auto;
    	margin-bottom: 10px;
    	overflow: auto;
    	padding-right: 50px;
    	margin-left: 738px;
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
	#searchDiv>a, #searchDiv>div{
		float:left;
	}
	
</style>
<script>
	//답변완료 답변대기중 select 
	$(document).ready(function(){
		$('#sel').change(function(){
			var option = $(this).val();
			console.log(option);
			
			if(option=='answer'){ //답변완료
				$('td:contains("답변완료")').parents('tr').css('display','');
				$('td:contains("답변대기중")').parents('tr').css('display','none');
			}			
			if(option=='no_answer'){ //답변대기중
				$('td:contains("답변대기중")').parents('tr').css('display','');
				$('td:contains("답변완료")').parents('tr').css('display','none');
			}
			if(option=='total'){ //전체
				$('tr').css('display','');
		}
		});
	 		
	});

</script>
<div class="section">
	<div class="main">
		<div class="wrapTitle">1:1문의</div>
		<!-- 문의하기 상단 메세지 -->	
			<div class="cs_message">
				질문 전 자주묻는 질문을 먼저 확인해주세요. <br/>
				<a href="<%=request.getContextPath() %>/FAQBoard"><span id="link">자주묻는질문 바로가기 >></span></a><br/>
				<br/>
				고객님께서 비트몰에 문의하신 내용을 확인할 수 있습니다.<br/>
			</div>
			<!-- 검색/ 문의하기 버튼 -->
			<div id="searchDiv">
				<!--문의하기 버튼 -->
				<c:if test="${logId !=null}">
					<a href="<%=request.getContextPath()%>/customerCenterWrite" class="btn" id="ask_btn">문의하기</a>
				</c:if>
				<!-- 검색하기 -->
				<div id="search_container">
					<form method="get" action="customerCenter" id="searchForm">
						<span id="search_box">
							<input type="text" id="searchWord" name="searchWord" placeholder="검색하기"><input type="submit" id="searchBtn" value="검색"/>
						</span>
					</form>
				</div>
			</div>
		<fieldset>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>문의날짜</th>
					<th></th> <!-- 답변 여부 -->		
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${list}">
				<tr>
					<td class="number">${data.qmnum}</td>
					<td class=><a href="<%=request.getContextPath()%>/customerCenterView?qmnum=${data.qmnum}">${data.qmtitle}</a></td>
					<td>${data.qmdate}</td>
					<td>
						<c:if test="${data.qmanswer==null}">
							<span class="answer_span" id="no_answer">답변대기중</span>
						</c:if>
						<c:if test="${data.qmanswer != null}">
							<span class="answer_span" id="answer">답변완료</span>
						</c:if>
					</td>				
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div  id="select_container">
				<!-- 답변 셀렉트 옵션 -->
				<select id="sel">
					<option value="total">전체</option>
					<option value="answer">답변완료</option>
					<option value="no_answer">답변대기중</option>
				</select>
		</div>
		
		<!-- 페이징 by kangsan -->
		<div class="page_wrap">
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/customerCenter?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum}"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/customerCenter?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="/sshj/customerCenter?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
	           </c:if>
			</div>
		 </div>
		</fieldset>
	</div>
</div>