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
	    border-bottom: 2px solid #ccc;
	    border-top: 2px solid #ccc;
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
	    border-radius: 8px;
	    background: #fff;
	    box-shadow: 0 0px 3px 0 rgb(0 0 0 / 50%);
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    border: none;
	    margin-left: 5px;
	}
	.cs_message {
	    margin: 0 auto;
	    font-size: 15px;
	    width: 90%;
	    margin-bottom: 20px;
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
			<div id="search_container">
			<!--문의하기 버튼 -->
			<a href="<%=request.getContextPath()%>/customerCenterWrite" class="btn" id="ask_btn">문의하기</a>
	
			<!-- 검색하기 -->
				<span id="search_box">
					<input type="text" id="search" name="search" placeholder="검색하기"><a href="#" onclick="return false;"><img id="search_icon" src="<%=request.getContextPath()%>/resources/img/xsearch_icon.png"/></a>
				</span>
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
			   <a class="arrow pprev" href="#"></a>
			   <a class="arrow prev" href="#"></a>
			   <a href="#" class="active">1</a>
			   <a href="#">2</a>
			   <a href="#">3</a>
			   <a href="#">4</a>
			   <a href="#">5</a>
			   <a class="arrow next" href="#"></a>
			   <a class="arrow nnext" href="#"></a>
			</div>
		 </div>
		</fieldset>
	</div>
</div>