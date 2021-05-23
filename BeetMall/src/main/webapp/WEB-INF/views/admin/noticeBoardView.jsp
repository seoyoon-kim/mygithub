<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/inc/top.jspf" %>  
 
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
	#mypageMenubar{
		display:block;
	}
	#topBar h5{
		padding-left: 500px;
	    width: 700px !important; 
    }  
	a:hover, a:active, a:visited, a:link {
   		color: black;
    }
    a{
    	color:black;
    }
    #box{
    	height:600px;	
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
  	input{
  		border:none;
  		font-weight:normal;
  	}
   /*표*/
   form{
	   	position:absolute;
	   	top:-50px;
	   	left:210px;
	   	width:1351px;
   }   
   th, .th{
   		background-color:#E9E9E9;
   		
	}
	.td, form input{
	  background-color:#F8F7F7;
	  text-align:left;
	  padding-left:10px;
	} 
	table{
		width:1080px;
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
	.td, .infocontent{
		padding-left:20px;
		
	}
	.infocontent{
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
		display:flex;  
		top:30px; 
	}
	#bottommm>input{
		border:1px solid gray;
		width:150px;
	}
	.write_btn{
		height:40px;
	}
	.write_btn{
		width:150px;
	} 
	input[type="submit"].btn:hover, input[type="button"].btn:hover{
   	  background: #b3b3b3 !important;
	  color:white;
	  display: inline-block;
	  outline: 0;
	} 
	input[type="file"]{
		display:none;
	}
	#attach{
		height:28px;
		width:120px;
		font-size:14px;
		color:black;
		background-color:lightgray;
		padding-left:15px;
		border:1px solid gray;
		border-radius:3px; 
		font-weight:normal;
	}
	#attach>div{
		position:relative;
		top:-5px;
	}
	#infoWriteDate{
		font-weight:normal;
	}
</style>
<script> 
//오늘날짜
let today = new Date();   
let year = today.getFullYear();  
let month = today.getMonth() + 1;   
let date = today.getDate();
$(document).ready(function(){ 
	$("#infoWriteDate").html(year + '/' + month + '/' + date);
}); 
//파일명 추출
$(document).ready(function(){ 
	  function fn_downloadFile(obj){
	        var idx = obj.parent().find("#infonum").val();
	        var comSubmit = new ComSubmit();
	        comSubmit.setUrl("<c:url value='/admin/downloadFile.do' />");
	        comSubmit.addParam("infonum", infonum);
	        comSubmit.submit();
	    }
	  var fileTarget = $('#file'); 
	  fileTarget.on('ready', function(){ // 값이 변경되면
		  if(window.FileReader){ //modern browser
			  var filename = $(this)[0].files[0].name; 
		  } else { // old IE 
	        	var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
	        } 
	        // 추출한 파일명 삽입 
	        $(this).siblings('.uploadFile').val(filename); 
	    }); 
	}); 
	
//공지 추가
$(document).on('click',"#addBtn",function(){ 
	location.href="noticeBoardList";
	var url = "noticeBoardWrite";
	$.ajax({
		url : url, 
		success : function(result){ 
			if(result == 1){
				location.href="noticeBoardList";
			}else{
				alert('공지 작성 실패했습니다 \n error_code:BD1');
			}
		}, error : function(){
			alert('삭제 실패했습니다. \n error_code:BD2');
		}
	});
});
$(()=>{
	$("#boardDel").click(()=>{
		if(confirm("삭제하시겠습니까?")){
			location.href = "noticeBoardDelete?infonum=${vo.infonum}"
			}
	});	
});
</script>
	<div id="topBarContainer">
	<div id="topBar">
		<h5><strong><a href="noticeBoardWrite">공지 보기</a></strong></h5>   
	</div>
	</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %> 
<div class="container">
	<div id="box"> 	
		<form method="post" action="noticeBoardEdit?infonum=${vo.infonum}" enctype="multipart/form-data">
			<table>
				<tbody> 
					<tr class="tr_head">
						<th class="menu" >공지 번호</th>
						<td class="td" colspan="3" id="infonum">${vo.infonum}</td>
					</tr>
					<tr class="tr_head">
						<th class="menu">제목</th>
						<td  class="td">${vo.infotitle}</td>
					</tr>
					<tr class="tr_head">
						<th class="menu">대상</th>
						<td  class="td"> 
							<c:if test="${vo.infotype==1}">
								소비자
							</c:if>
							<c:if test="${vo.infotype==2}">
								판매자
							</c:if>
							<c:if test="${vo.infotype==3}">
								전체
							</c:if>  
						</td>
					</tr>
					<tr class="tr_head">
						<th class="menu">등록일</th>
						<td  class="td" >${vo.infowritedate}</td>
					</tr>
					<tr class="tr_head">
						<th class="menu">첨부파일</th>
						<td  class="td">
							<div style="display:flex;">
								<label for="infoattach" id="attach" style="display:none;">  
								</label>
								<input type="file" style="width: 500px;" name="file" id="infoattach">
								<input class="uploadFile" style="width: 500px;" id="uploadFile" readonly>
							</div>
						</td> 
					</tr>
					<tr>
						<th id="smallTitle" colspan="4">공지 내용</th>
					</tr>
					<tr>
						<td class="question_content" colspan="4">
							<textarea id="infocontent" name="infocontent" class="summernote">${vo.infocontent}</textarea>
						</td>	
					</tr>
				</tbody>
			</table>
	<div id="bottommm">
		<input type="submit" value="수정하기" class="btn write_btn" id="write_btn" /> 
		<a href="#" id="boardDel"><input type="button" value="삭제하기" class="btn write_btn" id="reWrite_btn"/></a>	
		<input type="button" value="목록보기" class="btn write_btn" id="cancle_btn" onClick="location.href='<%=request.getContextPath() %>/noticeBoardList'"/>
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