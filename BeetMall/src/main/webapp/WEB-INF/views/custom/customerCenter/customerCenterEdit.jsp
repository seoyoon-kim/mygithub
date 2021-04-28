<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/jcss/basicStyle.css">
<style>
	.cs_message {
	    margin: 0 auto;
	    font-size: 15px;
	    width: 90%;
	    margin-bottom: 20px;
	    float: left;
	}
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif; font-size:14px;}
	#NoticeleftMenu{
   		display:block;
   }
	a:hover, a:active, a:visited, a:link {
   		color: black;
    }
    a{color:black;}
	answer_line{width:100%; 	background-color:#f6f6f6; height:20px; }
	#qmtitle, select{border:none;}
	#qmtitle{width:300px; color:lightgray;}
	#qmtitle{width:500px}
	#write_btn{width:150px; margin-left:20px;}
	a{color:black;}
   /*표*/
	table{
		width:100%;	
		border-spacing: 0;
		text-indent: initial;	
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
		font-size:15px;
	}
	th, .th{
		height:40px;
		font-size:15px;
		width:80px; text-align:center;
		display: table-cell;
	    vertical-align: inherit;
	    font-weight: bold;
	    text-align: -internal-center;
   		background-color:#f6f6f6;
   		/*#fcfcfc*/
	}
	thead, .answer_content, .td{
		border-bottom: 2px solid #ccc;
	    border-top: 2px solid #ccc;
	    width:100%;
	}
	tr{
		display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	    height:40px;
	}
	.td, .qmcontent{
		padding-left:20px;
		
	}
	.qmcontent{
		margin: 20px 0 20px;
	}
	td, .td{
		height:40px;
	}
	.tr_head{
		font-weight:bold;
	}
	.tr_head li{
		float:left;
	}
	.td, .th{ line-height:40px;}
	.td{
		width:30%; line-height:40px;
	}
	#bottommm{
		text-align:center; 
		margin-bottom:30px;
		margin-top: 30px;
	}
</style>
<div class="section">
	<!-- 문의하기 상단 메세지 -->	
	<div class="cs_message">
		질문 전 자주묻는 질문을 먼저 확인해주세요. <br/>
		<a href="<%=request.getContextPath() %>/FAQBoard"><span id="link">자주묻는질문 바로가기 </span></a><br/>
		<br/>
		<span id="notice">고객님께서 작성하신 질문은 관리자가 답변을 한 후에는 수정 또는 삭제하실 수 없습니다.</span>
	</div>
		
	<form method="post" action="cusomerCenterEditOk">
		<table>
			<tbody>
				<tr>
					<input type="hidden" name="qmnum" id="qmnum" value="${vo.qmnum}"/>
					<th colspan="4">문의 작성</th>
				</tr>
				<tr class="tr_head">
					<th class="menu" >제목</th>
					<td class="td" colspan="3"><input type="text" name="qmtitle" id="qmtitle" value="${vo.qmtitle}"/></td>
				</tr>
				<tr class="tr_head">
					<th class="menu">작성자</th>
					<td  class="td"><span>${vo.userid}</span></td>
				</tr>
				<tr>
					<th colspan="4">문의 내용</th>
				</tr>
				<tr>
					<td class="question_content" colspan="4">
						<textarea id="summernote" name="qmcontent">${vo.qmcontent}</textarea>
					</td>	
				</tr>
			</tbody>
		</table>
			<div id="bottommm">
				<input type="reset" value="초기화" class="btn" id="write_btn"/>
				<input type="submit" value="수정하기" class="btn" id="write_btn"/>				
			</div>
		</form>
</div>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
		  height: 500,                 // 에디터 높이 
		//콜백 함수
          callbacks : { 
          	onImageUpload : function(files, editor, welEditable) {
          // 파일 업로드(다중업로드를 위해 반복문 사용)
          for (var i = files.length - 1; i >= 0; i--) {
          uploadSummernoteImageFile(files[i],
          this);
          		}
          	}
          }
	  });
});
/**
* 이미지 파일 업로드
*/
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}
</script>