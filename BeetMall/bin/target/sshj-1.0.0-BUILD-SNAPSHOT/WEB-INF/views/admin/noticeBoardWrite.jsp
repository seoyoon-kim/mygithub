<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script><link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<style> 
	#box, #title, #content, #notiSubject, .note-editor note-frame panel panel-default{ position:relative; }
	.container{position:absolute; top:200px; left:180px; width:1080px; padding:0; }
	#topBar{ background-color:lightgray; float:left; width:1700px; height:50px; padding:10px 0 0 10px; margin-left:20px; }
	#box{ border:lightgray 1px solid; width:1700px; height:800px; top:60px; left:10px; border-radius:10px; }
	#title{ top:-30px; left:30px; border-bottom: lightgray 1px solid; width:1650px; padding-bottom:20px;}
	#noticeTitle{ padding-left:50px; }
	#writeTitle{ padding-left:1150px; }
	#summer{ display:none; }
	button{color: #444444; background: #F3F3F3; border: 1px #DADADA solid; outline: none; 
			padding: 5px 10px; margin:0 5px; border-radius: 5px; font-weight: bold; font-size: 12pt; }
	button:active, button:hover, button:focus{ background-color:rgb(153,153,153)}
	#notiSubject{ top:-30px; left:100px; height:30px; }
	.note-editor { top:10px; width:1700px; left:45px; }
	#who{ padding-left:1400px; }
	#who>input{margin-left:10px;} 
	.lbl{padding-bottom:10px;} 
	#submit{margin-left:750px;}
	input[type=checkbox] {zoom: 1.5;} 
</style> 
<script>

		$(document).ready(function() { 
			$('#summer').summernote({
				  height: 500,                  
				  minHeight: null,              
				  maxHeight: null,    
				  width: 1600,
				  focus: false,                   
				  lang: "ko-KR", 
				  placeholder: '공지 내용을 입력하세요',
				  disableResizeEditor: true 
			}); 
			$.summernote.options.lang = 'ko-KR'; 
            $.summernote.options.airMode = false; 
		});
		
		$(function(){	
			 
			
		$("#notiWritefrm").submit(function(){
			if($("#notiSubject").val()==""){
				alert("제목을 입력하세요");
				return false;
			}
			if(summernote.instances.content.getData()==""){
				alert("글 내용을 입력하세요");
				return false;
			}
			return true;
		});
		
		 
	});
</script>
</head>
<body>
<%@ include file="/inc/top.jspf" %>
<%@ include file="/inc/leftBar.jspf" %> 
	<div class="container">
	<div id="topBar">
		<p><strong>공지 작성</strong></p>   
	</div>
	<div id="box"> 
		<form method="post" id="notiWritefrm" action="noticeWriteOk.jsp">
			<div id="title">
			번호 : 다음번호?  <span id="noticeTitle">제목 : <input type="text" id="notiSubject" name="noticeSubject" placeholder="제목을 입력하세요"/> </span> <span id="writeTitle">등록일 today?</span>
			</div>
			<textarea name="summer" id="summer"></textarea>  
			<div id="who">
				<input type="checkbox" name="all" value="all"/><label class="lbl">전체?</label> 
				<input type="checkbox" name="customer" value="customer"/><label class="lbl">소비자?</label> 
				<input type="checkbox" name="seller" value="seller"/><label class="lbl">판매자?</label>
			</div>
			<div id="submit">
			<input type="submit" value="등록"/> 
				<input type="reset" value="다시쓰기"/> 
			</div>
		</form>
		
	</div>
	
	 
	</div> 
</body>
</html>