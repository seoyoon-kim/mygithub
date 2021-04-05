<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<style>
	#dataFrm li{
		padding:10px 5px;
	}
	#title{width:100%;}
</style>
<script>
$(function(){
	CKEDITOR.replace("content");
	$("#dataFrm").submit(function(){
		if($("#title").val()==""){
			alert("제목을 입력하세요");
			return false;
		}
		if(CKEDITOR.instances.content.getData()==""){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	});
	//첨부파일 처리///////////////////
	$(document).on('click','b.f',function(){
		$(this).parent().css("display","none");//파일이름과 x 표시가 있는 div
		$(this).parent().next().attr("type","file"); //input box
		$(this).parent().next().next().attr("name","delfile");//삭제 파일명이 있는 객체의 name 부여해 EditOk로 보내기
	});
	
});
</script>
<div class="container">
	<h1>자료실 글 수정하기</h1>														<!-- 파일 업로드일 경우 반드시 enctype 속성 작성 -->
	<form method="post" action="<%=request.getContextPath()%>/data/dataEditOk.do" id="dataFrm" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${vo.no}"/><!-- EditOk.do로 글 번호 보내주기 -->
		<ul>
			<li>제목 : <input type="text" name="title" size="50" value="${vo.title}"/></li>
			<li>
				<textarea name="content" id="content">${vo.content}</textarea>
			</li>
			<!-- 첫번째 첨부파일 : vo.filename1, vo.filename[0] -->
			<li>첨부 파일 :<br/>
				<div>${vo.filename1}<b class="f">X</b></div>
				<input type="hidden" name="filename1" id="filename1"/>
				<!-- 삭제 파일명을 dataEditOk.do로 보내기 /name이 없어서 활성화가 안되었으나, X 클릭해 삭제시 name부여-->
				<input type="hidden" name="" id="delfile1" value="${vo.filename1}"/>
			</li>
			<!-- 두번째 첨부파일 : vo.filename2, vo.filename[1] -->
			<li>
				<c:if test="${vo.filename2!=null && vo.filename2!='' }">
					<div>${vo.filename2}<b class="f">X</b></div>
					<input type="hidden" name="filename2" id="filename2"/>
					<input type="hidden" name="" id="delfile2" value="${vo.filename2}"/>
				</c:if>
			<!-- 두번째 첨부파일이 없을 때 추가 가능하도록 -->	
				<c:if test="${vo.filename2==null || vo.filename2=='' }">
					<input type="file" name="filename2" id="filename2"/>
				</c:if>
			</li>
			<li>	
				<input type="submit" value="수정하기"/>
				<input type="reset" value="취소"/>
			</li>
		</ul>
	</form>
</div> 