<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style>
 	#viewContent{padding:5px; border-bottom:1px solid #ddd;} 
</style>
<script>
	$(function(){
		$("#del").click(function(){
			if(confirm("글을 삭제하시겠습니까?")){
				//글번호, id(session에 있다), 현재 페이지, 검색키, 검색어 갖고가기              delAddr from viewCommand
				location.href="<%=request.getContextPath()%>/board/boardDel.do?${delAddr}"; 
			}
		});
	});
</script> 
<div class="container">
	<h1>글 내용 보기</h1>
	<ul id="viewContent">
		<li>번호 : ${vo.no}</li>
		<li>작성자 : ${vo.userid}</li>
		<li>등록일 : ${vo.writedate}, 조회수 : ${vo.hit}</li>
		<li>제목 : ${vo.subject}</li>
		<li>${vo.content}</li>
		<li></li>
	</ul>
	<div>
		<a href="<%=request.getContextPath()%>/board/list.do?pageNum=${pVO.pageNum}<c:if test="${pVO.searchWord!=null && pVO.searchWord!=''}">&searchKey=${pVO.searchWord}</c:if>">글목록</a>
		<c:if test="${userid==vo.userid}">
			<a href="<%=request.getContextPath()%>/board/boardEdit.do?${delAddr}">수정</a> 
			<span id="del">삭제</span><!-- or <a href="javascript:delCheck()">삭제</a> -->
		</c:if>
	</div>
</div>