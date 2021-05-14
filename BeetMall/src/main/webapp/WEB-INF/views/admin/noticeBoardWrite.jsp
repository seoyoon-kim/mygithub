<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/inc/top.jspf" %>
<%@ include file="/inc/leftBar.jspf" %> 
 
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
	#mypageMenubar{
		display:block;
	}
	
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif; }

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
  	}
  	#topBar>p{
  		padding-left:60px;
  		color:white;
  	}
  	input{
  		border:none;
  		font-weight:normal;
  	}
   /*표*/
   form{
	   	position:absolute;
	   	top:180px;
	   	left:210px;
	   	width:1351px;
   }
   
   th, .th{
   		background-color:#E9E9E9;
	}
	.td, form input{
	  background-color:#F8F7F7;
	} 
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
		text-align:center;  
		margin: 980px 0 40px 0 ;
		position:relative;
		left:-722px;
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
	#cancle_btn{
		position:relative; 
		left:80px;
	} 
	input[type="submit"].btn:hover, input[type="button"].btn:hover{
   	  background: #b3b3b3;
	  color:white;
	  display: inline-block;
	  outline: 0;
	} 
	input[type="file"]{
		display:none;
	}
	#attach{
		height:28px;
		width:100px;
		font-size:14px;
		color:black;
		background-color:lightgray;
		padding-left:7px;
		border:1px solid gray;
		border-radius:3px; 
		font-weight:normal;
	}
	#attach>span{
		position:relative;
		top:-5px;
	}
</style>
<script>
$(document).ready(function(){ 
	  var fileTarget = $('#file'); 
	  fileTarget.on('change', function(){ // 값이 변경되면
		  if(window.FileReader){ //modern browser
			  var filename = $(this)[0].files[0].name; 
		  } else { // old IE 
	        	var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
	        } 
	        // 추출한 파일명 삽입 
	        $(this).siblings('.uploadFile').val(filename); 
	    }); 
	}); 
</script>
<div id="body1">
<div class="container">
	<div id="topBar">
		<p><strong>공지 작성</strong></p>   
	</div>
	<div id="box"> 	
	<form method="post" action="noticeWriteOk">
		<table>
			<tbody> 
				<tr class="tr_head">
					<th class="menu" >공지 번호</th>
					<td class="td" colspan="3"><input type="text" name="qmtitle" id="qmtitle" placeholder=""/></td>
				</tr>
				<tr class="tr_head">
					<th class="menu">제목</th>
					<td  class="td"><input type="text" name="noticeSubject" id="noticeSubject" placeholder="공지 제목을 입력하세요"/></td>
				</tr>
				<tr class="tr_head">
					<th class="menu">등록일</th>
					<td  class="td"><input type="text" placeholder="" style="width: 500px;"></td>
				</tr>
				<tr class="tr_head">
					<th class="menu">첨부파일</th>
					<td  class="td">
						<div style="display:flex;">
							<label for="file" id="attach"> 
								<span>파일 첨부하기</span>
							</label>
							<input type="file" style="width: 500px;" id="file">
							<input class="uploadFile" style="width: 500px;" id="uploadFile" value="">
						</div>
					</td> 
				</tr>
				
				<tr>
					<th id="smallTitle" colspan="4">공지 내용</th>
				</tr>
				<tr>
					<td class="question_content" colspan="4">
						<textarea id="qmcontent" name="qmcontent" class="summernote" placeholder="문의내용을 입력해주세요."></textarea>
					</td>	
				</tr>
			</tbody>
		</table>
			<div id="bottommm">
				<input type="submit" value="작성하기" class="btn write_btn" id="write_btn"/>	
				<input type="reset" value="다시쓰기" class="btn write_btn id="reset_btn"/>
				<input type="button" value="취소" class="btn write_btn" id="cancel_btn" onClick="location.href='<%=request.getContextPath() %>/recipeView'"/>
			 </div>
		</form>
		</div>
</div>
</div>
<script>
$(document).ready(function() {
	  $('.summernote').summernote({
		  height: 500,                 // 에디터 높이 
		  focus: true,
		  callbacks: {	//여기 부분이 이미지를 첨부하는 부분
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