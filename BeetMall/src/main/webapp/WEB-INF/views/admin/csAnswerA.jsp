<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/inc/top.jspf" %> 
 
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 
<style>
	#topBar>h5{
		padding-left: 270px;
	    width: 600px !important;
    }
	#mypageMenubar{
		display:block;
	}
	
	*{margin:0px; padding:0px; list-style-type :none;}

	a:hover, a:active, a:visited, a:link {
   		color: black;
    }
    a{
    	color:black;
    }
	answer_line{
		width:100%; 	
		background-color:#f6f6f6; 
		height:20px; 
	}
	#qmtitle, select{border:none;}
	#qmtitle{width:300px; color:lightgray;}
	#qmtitle{width:500px}
	.write_btn{width:150px; margin-left:20px;}
	a{color:black;}
  	/*왼쪽 메뉴바*/
  	label{
  		margin-bottom:0;
  		display:block;
  	}
  	/*제목 바*/
  	#topBar{ 
	  	position:absolute;
	  	top:200px;
	  	left:-25px;
	  	font-size:20px;
	  	color:white;
  	}
  	#topBar>p{
  		padding-left:60px;
  	}
  	input{
  		border:none;
  		font-weight:normal;
  	}
   /*표*/ 
   form{
	   	position:absolute;
	   	top:-205px;
	   	left:180px;
	   	width:1351px;
   }
   
   th, .th{
   		background-color:#E9E9E9;
	}
	.td, form input{
	  background-color:#F8F7F7;
	} 
	table{
		width:1080px;	
		border-spacing: 0;
		text-indent: initial;	
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
		font-size:15px;
		margin-left:30px; 
	}
	th, .th{
		height:40px;
		font-size:15px;
		width:80px; text-align:center;
		display: table-cell;
	    vertical-align: inherit;
	    font-weight: bold;
	    text-align: -internal-center; 
	}
	th:not(#smallTitle){
	    border-right:1px solid lightgray;
	}
	thead, .answer_content, .td{
		border-bottom: 1px solid #ccc;
	    border-top: 1px solid #ccc;
	    width:100%;
	}
	tr{
		display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	    height:40px;
	    border-bottom:1px solid lightgray;
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
	.td{
		width:0;
	}
	#bottommm{ 
		margin: 1550px 0 40px 0; 
		left:-800px;
		top:-70px;
		display:flex;
	}
	#bottommm>input{
		border:1px solid gray;
	}
	.write_btn{
		height:40px;
	}
	#write_btn{
		width:150px;
	}
	#cancel_btn{ 
		margin-left:20px;
	}
	
	input[type="submit"].btn:hover, input[type="button"].btn:hover, input[type="reset"].btn:hover{
   	  background: #b3b3b3 !important;
	  color:white;
	  display: inline-block;
	  outline: 0;
	}
	
	#file-upload-button{
		height:28px;
	}
	#qContent{
		font-weight:normal; 
		height:300px;
		padding:15px;
		overflow: auto;
	}
	.empty{
		background-color:white;
		border-right:none !important;
		height:25px;
	}
</style>
	<div id="topBarContainer">
	<div id="topBar">
		<h5><strong><a href="csAnswerA">문의 답변 작성</a></strong></h5>   
	</div>
	</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %> 
<div class="container">
	<div id="box"> 	
	<form method="post" action="csAnswerWriteOk">
		<input type="hidden" name="qmnum" value="${vo.qmnum }"/>
		<table>
			<tbody> 
				<tr class="tr_head">
					<th class="menu" >문의 번호</th>
					<td class="td" colspan="3">
						<div id="qNum" name="qmnum">
							${vo.qmnum}
						</div>
					</td>
				</tr>
				<tr class="tr_head">
					<th class="menu" >구분</th>
					<td class="td" colspan="3">
						<div id="who">
							<c:if test="${vo.qmoption==1}">
								소비자
							</c:if>
							<c:if test="${vo.qmoption==2}">
								판매자
							</c:if>
						</div>
					</td>
				</tr>
				<tr class="tr_head">
					<th class="menu" >아이디</th>
					<td class="td" colspan="3">
						<div id="writer">
							${vo.userid }
						</div>
					</td>
				</tr>
				<tr class="tr_head">
					<th class="menu">제목</th>
					<td  class="td">
						<div id="qTitle">
							${vo.qmtitle}
						</div>	
					</td>
				</tr>
				<tr class="tr_head">
					<th class="menu">등록일</th>
					<td  class="td">
						<div id="writedate">
							${vo.qmdate}
						</div>
					</td>
				</tr> 
				<tr class="tr_head">
					<th class="menu">문의 내용</th>
					<td  class="td">
						<div id="qContent">
							${vo.qmcontent }
						</div>
					</td>
				</tr>  
				<tr class="tr_head empty">
					<th class="menu empty"></th>
					<td  class="td empty">
					</td>
				</tr> 
				<tr>
					<th id="smallTitle" colspan="4">답변 내용</th>
				</tr>
				<tr>
					<td class="question_content" colspan="4">
						<c:if test="${vo.qmanswer == null }">
							<textarea id="qmcontent" name="qmanswer" class="summernote" placeholder="답변내용을 입력해주세요."></textarea>
						</c:if>
						<c:if test="${vo.qmanswer != null }">
							<textarea id="qmcontent" name="qmanswer" class="summernote" placeholder="답변내용을 입력해주세요.">${vo.qmanswer}</textarea>
						</c:if>
					</td>	
				</tr>
			</tbody>
		</table>
			<div id="bottommm">
				<input type="submit" value="작성하기" class="btn write_btn" id="write_btn"/>	
				<input type="reset" value="다시쓰기" class="btn write_btn" id="reset_btn"/>
				<input type="button" value="취소" class="btn write_btn" id="cancel_btn" onClick="location.href='javascript:history.back()'"/>
			 </div>
		</form>
		</div>
</div>
</div>
<script>
$(document).ready(function() {
	  $('.summernote').summernote({
		  height: 500,                 // 에디터 높이 
		  focus: false,
		  callbacks: {	//이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				},
				onPaste: function (e) {
					var clipboardData = e.originalEvent.clipboardData;
					if (clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
			}
	  });
	});
/**
* 이미지 파일 업로드
*/
function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/uploadSummernoteImageFile",
		contentType : false,
		processData : false,
		success : function(data) {
        	//항상 업로드된 파일의 url이 있어야 한다.
			$(editor).summernote('insertImage', data.url);
		}
	});
}
</script>