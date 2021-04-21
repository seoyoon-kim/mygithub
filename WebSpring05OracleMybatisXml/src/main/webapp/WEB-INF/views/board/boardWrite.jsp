<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>  
<style>
	ul, li{margin:0px; padding:0; list-style-type:none;}
	#subject{width:100%;}
</style>
<script>
$(function(){
	CKEDITOR.replace("content"); 
	$("#boardFrm").on('submit',(function(){
		//=document.getElementById("subject").value <-id 이용
		//=if(document.boardFrm.subject.value) <- name 이용
		//=$("#subject").val() <-component 이용
		if($("#subject").val()==""){ 
			return false;
		}
		if(CKEDITOR.instances.content.getData()==""){ 
			return false;
		}
		return true;
	});
});

</script>
</head>
<body>
	<div class="container">
		<h1>글쓰기</h1>
		<form method="post" name="boardFrm" id="boardFrm" action="boardWriteOk">
			<ul>
				<li>제목 <input type="text" id="subject" name="subject"/></li>
				<li><textarea name="content" id="content"></textarea></li>
				<li><input type="submit" value="등록"/>
				<input type="reset" value="다시쓰기"/></li>
			</ul>
		</form>
	</div>
</body>
</html>