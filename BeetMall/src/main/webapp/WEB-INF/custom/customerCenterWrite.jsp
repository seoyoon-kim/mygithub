<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
	#NoticeleftMenu{
   		display:block;
   }
   #WriteMain>ul>li{
   		list-style-type:none;
   }
   #WriteMain{
   		margin-top : 50px;
   		/* border: 1px solid black; */
   }
   #WriteMain>ul{
    	padding-left: 0px;  		
   }
   #title{
   		width:80%;
   }
   #filefile{
   		margin-top: 10px;
   		margin-bottom: 10px;
   		width:100%;
   		border: 1px solid black;
   }
   #buttonsss{
   		text-align:right;
   }
</style>
<div class="section">
	<form method="post" action="/jdbc/upload1" enctype="multipart/form-data">
		<div id="WriteMain">
			<ul>
				<li>제목 : <input type="text" id="title"/></li>
				<li>내용
					<textarea id="summernote" name="editordata"></textarea>
				</li>
			</ul>
		</div>
		<div id="filefile">
			<input type="file" name="filename1"/>
		</div>
		<div id="buttonsss">
			<input type="submit" value="문의하기">
			<input type="button" value="취소">
		</div>
	</form>
</div>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
		  placeholder: '글써지는지 테스트',
          height: 400
	  });
	});
</script>