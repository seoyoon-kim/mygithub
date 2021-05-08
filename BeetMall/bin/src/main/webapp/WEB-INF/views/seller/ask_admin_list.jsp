<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		
		<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
		<!-- font-family: 'Nanum Gothic', sans-serif; -->
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/jcss/basicStyle.css">
</head>
<style>

	
	#link{color: gray;}
	/*표*/
		table{
		width:90%;	
		border-spacing: 0;
		text-indent: initial;
		margin:0 0 0px 50px;	
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
		margin-bottom:10px;
	}
	th{
		height:60px;
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
	td:nth-child(1),td:nth-child(3),td:nth-child(4){
		text-align:center;
		width:140px;
	}
	td:nth-child(2){
		padding-left:30px;
	}
	td:nth-child(2) a, a{
		color:black;
		cursor: pointer;
	}
	th{
		margin-top:30px;
		text-align:center;
	}
	.answer_span{
		background-color: rgb(252,118,45);
		border-radius:10px;
		color:white;
		padding:5px;
		font-size:14px;	
	}
	#no_answer{ /*레이아웃 보기용 스타일 삭제예정*/
		color:gray;
		background: gray;
		color:white;
		padding:5px;
	}

	.btn:hover{
		background: gray;
		color:white;
		display: inline-block;
	}
	.btn. select{
		margin-left:50px;
		width:130px;
		height:30px;
	}
	#search_container, #select_container{width:90%; margin:0 auto; margin-bottom:10px;}
	#select_container{margin:0 auto; height:40px;}
	select{float:right}
	#ask_btn{color:black; width:100px;}
</style>
<script>
	//답변완료 답변대기중 select 
	$(document).ready(function(){
		$('#sel').change(function(){
			var option = $(this).val();

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
<body>
<div class="main">
	<!-- 고객센터 사이드바 -->
	<nav class="cs_nav" style="margin-rignt:0">
		<ul class="cs_ul">
			<li><span class="cs_title">고객센터</span></li>
			<li><a href="<%=request.getContextPath() %>/notice">공지사항</a></li>
			<li><a href="<%=request.getContextPath() %>/faq">자주묻는질문</a></li>
			<li><a href="<%=request.getContextPath() %>/ask_admin_list">문의하기</a></li>
		</ul>
	</nav>
	<!-- 가운데 메인 div -->
	<div id="article">
		<!-- 문의하기 주황색 윗부분 -->
			<div class="cs_wrapTitle">문의하기</div>
		<!-- 문의하기 상단 메세지 -->	
			<div class="cs_message">
				질문 전 자주묻는 질문을 먼저 확인해주세요. <br/>
				<a href="<%=request.getContextPath() %>/faq"><span id="link">자주묻는질문 바로가기 >></span></a><br/>
				<br/>
				고객님께서 비트몰에 문의하신 내용을 확인할 수 있습니다.<br/>
			</div>
		<!-- 검색/ 문의하기 버튼 -->
			<div id="search_container">
			<!--문의하기 버튼 -->
			<a href="<%=request.getContextPath()%>/ask_admin_write" class="btn" id="ask_btn">문의하기</a>
	
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
				<tr>
					<td class="number">1</td>
					<td class=><a href="<%=request.getContextPath()%>/ask_admin_view">상품등록했는데 등록이 안됐어요</a></td>
					<td>등록일</td>
					<td><span class="answer_span" id="answer">답변완료</span></td>				
				</tr>
				<!-- 임시로 넣은 정보 -->
				<tr>
					<td>2</td>
					<td><a href="">질문1</a></td>
					<td>등록일</td>
					<td><span  class="answer_span" id="no_answer">답변대기중</span></td>				
				</tr>
				<tr>
					<td>3</td>
					<td><a href="">질문2</a></td>
					<td>등록일</td>
					<td><span  class="answer_span" id="answer">답변완료</span></td>					
				</tr>
				<tr>
					<td>4</td>
					<td><a href="">질문3</a></td>
					<td>등록일</td>
					<td><span  class="answer_span" id="no_answer">답변대기중</span></td>			
				</tr>
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
</body>
</html>