<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/recipeMypageMenu.jspf"%>
<%@ include file="/inc/menu_c.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	
	<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
		<!-- font-family: 'Nanum Gothic', sans-serif; -->
		<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
		<!-- font-family: 'NanumSquare', sans-serif !important; -->

<script>
$(document).ready(function() {
  $('#summernote').summernote({
     placeholder: '글써지는지 테스트',
       height: 400
  });
});
</script>


<style>
#searchBtn {
	top: 0px;
	left: 0px;
}

.section {
	width: 1080px;
	background-color: white;
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}


.section>h6{
float:left;
width:100%;
}

ul>li {
	list-style: none;
}

#recipettile>b{
float:left;
width:100%;
color:rgb(252,118,45);
height:20px;
margin-top:10px;
margin-bottom:30px;
}

<!------------------------------------->
#writebox{
width:100%;
}

#writebox>div{
width:100%;
}

#filename,#subject{
width:50%;
}


#writebox>div:nth-child(7n+5),#writebox>div:nth-child(7n+6){
width:50%;
color:red;
font-size:0.5em;
}

#writebox>div:nth-child(7n+7){
margin-top:10px;
}

#btnbox{
text-align:center;
margin-top:10px;
margin-bottom:10px;
}

#btnbox>input{
margin:6px auto;
width:80px;
}

#btn{
		padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
	}
	/*버튼*/
	#btn:hover{
		background: gray;
		color:white;
		display: inline-block;
	}

</style>




</head>
<body>
	<div class="section">

			<div id="recipettile"><b>레시피 작성하기</b></div>




     <div id="writebox">
		<div>글 제목</div>
		<div><input type="text" name="subject" id="subject"/></div>
		<div>대표이미지</div>
		<div><input type="text" name="filename" id="filename" /><input type="submit" value="파일첨부" id="btn"/></div>
		<div>미첨부시 텍스트만 적용됩니다.</div>
		<div>이미지는 jpg.png.jpgf만 업로드해주세요</div>
		<div><textarea id="summernote" name="content"> </textarea></div>
    </div>
    
    
<div id="btnbox">
		<input type="submit" value="글등록" id="btn" />
		<input type="submit" value="다시쓰기" id="btn"/>
		<input type="submit" value="삭제" id="btn"/>
</div>






	</div>
	
</body>
</html>