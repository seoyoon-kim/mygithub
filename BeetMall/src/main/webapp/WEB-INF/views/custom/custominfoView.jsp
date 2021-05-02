<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
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
	
	#article{
		width:100%;
	}
  #cMyPageLeft {
	display: block;
}
   a:hover, a:active, a:visited, a:link {
   		color: black;
   }
</style>
<script>
	function Deletebtn(){
		if(confirm("내가 문의한 내용을 삭제하시겠습니까?")){
			location.href="customerCenterDelete?qmnum=${vo.qmnum}"
		}
		
	};
</script>
<div class="section">
	<div class="main">
	<!-- 가운데 메인 div -->
	<div id="article">
		<!-- 문의하기 상단 메세지 -->	
		<div class="cs_message">
			무엇을 도와드릴까요?<br/>
			<span id="notice">고객님께서 작성하신 질문은 판매자가 답변을 한 후에는 수정 또는 삭제하실 수 없습니다.</span>
		</div>
		<input type="hidden" value="${vo.qnum}"/>
		<!-- 내글 보기 -->	
		<fieldset>
			<table>
				<tbody>
					<tr>
						<th colspan="4">고객 문의</th>
					</tr>
					<tr class="tr_head">
						<th class="menu" >상품명</th>
						<td class="td" colspan="3" ><span >상품명</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">작성자</th>
						<td class="td"><span >${vo.userid}</span></td>
							<th class="menu">문의날짜</th>
						<td class="td"><span>${vo.qwritedate}</span></td>
					</tr>
				
					<tr>
						<td class="question_content" colspan="4">
							<span class="content" >
								${vo.qcontent}
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
					<tr>
						<td class="question_content" colspan="4">
							<span class="content" >
							
							<c:if test="${vo.qanswer==null}">
								<!-- qmanswer -->
								판매자의 답변을 기다리는 중입니다.<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
							</c:if>
							<c:if test="${vo.qanswer!=null}">
								${vo.qanswer}
							</c:if>
							</span>
						</td>	
					</tr>
				</tbody>
			</table>
		</fieldset>
			<div class="bottom_wrap">
				<input type="button" value="확인" class="btn" id="btn" onClick="location.href='<%=request.getContextPath() %>/customerCenter'"/>
				<input type="button"  value="수정하기" class="btn" onClick="location.href='<%=request.getContextPath() %>/customerCenterEdit?qmnum=${vo.qmnum}'"/>
				<input type="button" value="삭제하기" class="btn" id="btn" onClick="Deletebtn()"/>
			</div>
		</div>
	</div>
</div>