<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content");
	});
</script>  
<!-- 
	다중 업로드
	http://commons.apache.org/
	FileUpload, IO를 다운로드
	라이브러리에 복사 붙여넣기
 -->
 <div class="container">
 <br/>
	<h1>자료실 글 올리기</h1>														<!-- 파일 업로드일 경우 반드시 enctype 속성 작성 -->
	<form method="post" action="<%=request.getContextPath()%>/data/multiUploadOk.do" id="dataFrm" enctype="multipart/form-data">
		<ul>
			<li>제목 : <input type="text" name="title" size="50" placeholder="글제목"/><br/></li>
			<li>
				<textarea name="content" id="content" placeholder="글내용"></textarea>
			</li>
			<li>첨부 파일 : <input type="file" name="filename1" id="filename1" multiple/></li>
			<li>	
				<input type="submit" value="자료올리기(다중업로드)"/>
				<input type="reset" value="취소"/>
			</li>
		</ul>
	</form>
</div> 