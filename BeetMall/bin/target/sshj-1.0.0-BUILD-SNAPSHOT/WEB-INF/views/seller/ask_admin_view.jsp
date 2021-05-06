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
	.cs_message{
		margin: 0 auto;
		font-size:15px;
		width:90%;
	}
	#notice{font-size:12px;color: gray;}
	/*표*/
	table{
		width:90%;	
		border-spacing: 0;
		text-indent: initial;
		margin:0 0 20px 50px;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
		font-size:13px;
	}
	th, .th{
		height:40px;
		font-size:14px;
		width:80px; text-align:center;
		display: table-cell;
	    vertical-align: inherit;
	    font-weight: bold;
	    text-align: -internal-center;
   		background-color:#f6f6f6;
   		/*#fcfcfc*/
	}
	thead, .answer_content{
		border-bottom: 2px solid #ccc;
	    border-top: 2px solid #ccc;
	    width:100%;
	}
	tr{
		display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	    height:30px;
	}
	.td, .content{
		padding-left:20px;
		
	}
	.content{
		margin: 20px 0 20px;
	}
	td, .td{
		height:30px;
	}
	.tr_head{
		font-weight:bold;
	}
	.tr_head li{
		float:left;
	}
	.td, .th{ line-height:30px;}
	.td{
		width:30%; line-height:30px; 
		border-bottom: 2px solid #ccc;
	}
	/*이전글, 다음글*/
	.prev_next_wrap{
		width:90%;
		margin:20px 0px 0px 50px;
	}
	.prev_next_wrap li{
		height:30px;
		line-height:40px;
		border-bottom:1px solid lightgray;
	}
	.prev_next_wrap a{
		padding-left:20px;
		color: black;
	}
	.question_content, .answer_content{padding:10px;}
	.next{margin-bottom:30px}
	a{color:black;}
	.answer_line{width:100%; 	background-color:#f6f6f6; height:20px; }
	.bottom_wrap{margin:10px auto; width:90%;  text-align:center;}
	button, .btn{width:150px; height:26px; margin-left:20px;}
</style>
<script>
//테이블 collapse
  //showHideFaq
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
		<div class="cs_wrapTitle">문의하기</div>
		<!-- 문의하기 상단 메세지 -->	
		<div class="cs_message">
			무엇을 도와드릴까요?<br/>
			<span id="notice">고객님께서 작성하신 질문은 관리자가 답변을 한 후에는 수정 또는 삭제하실 수 없습니다.</span>
		</div>
		<!-- 내글 보기 -->	
		<fieldset>
			<table>
				<tbody>
					<tr>
						<th colspan="4">고객 문의</th>
					</tr>
					<tr class="tr_head">
						<th class="menu" >제목</th>
						<td class="td" colspan="3" ><span >상품을 등록했는데 등록이 안됐어요! ㅠ</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">작성자</th>
						<td class="td"><span >로그인한 아이디</span></td>
							<th class="menu">문의날짜</th>
						<td class="td"><span>21/04/21</span></td>
					</tr>
				
					<tr>
						<td class="question_content" colspan="4">
							<span class="content" >
							
							고객 문의 사항 
							</span>
						</td>	
					</tr>
				</tbody>
				<!-- 답변 -->
				</br>
				<tbody style="margin-top:20px;">
					<tr>
						<th colspan="4">
						답변
						</th>
					</tr>
					<tr class="tr_head">
						<th class="menu">문의번호</th>
						<td  class="td"><span>1213</span></td>
						<th class="menu">답변일</th>
						<td class="td" ><span>21/04/21</span></td>
					</tr>
				
					<tr>
						<td class="question_content" colspan="4">
							<span class="content" >
							
							상품등록이 안돼요
							</br>
							상품등록이 안돼요
							</br>
							상품등록이 안돼요
							상품등록이 안돼요
							</br>
							상품등록이 안돼요
							</br>
							상품등록이 안돼요
							상품등록이 안돼요
							</br>
							상품등록이 안돼요
							</br>
							상품등록이 안돼요
							</span>
						</td>	
					</tr>
				</tbody>
			</table>
		</fieldset>
			<div class="bottom_wrap">
				<input type="button" value="확인" class="btn" id="btn" onClick="location.href='<%=request.getContextPath() %>/ask_admin_list'"/>
				<input type="button"  value="수정하기" class="btn" onClick="location.href='<%=request.getContextPath() %>/ask_admin_edit'"/>
				<input type="button" value="삭제하기" class="btn" id="btn" onClick=""/>
			</div>
		</div>
	</div>
</body>
</html>