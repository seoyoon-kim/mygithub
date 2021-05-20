<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#topBar h5{ 
		padding-left:150px;
	}
	 #container li{ 
		 list-style-type:none; 
		 float:left; 
		 width:10%; 
	 }   
	#contentBox li:nth-of-type(8n+1){ 
		width:0%; 
		margin-top: 4px;
	}
	#title li:nth-of-type(8n-1), #contentBox li:nth-of-type(8n-1){ 
		width:30%; padding-left:20px; 
	} 	 
	#btns a>button, button:nth-of-type(4){ 
		margin-left:900px; 
	}  	 
	#title{
		padding-top:0 !important;
	} 
	#sortBox {
		margin: 30px 0 0 20px;
	} 
	#sortBox>ul{
		width:1110px !important;
	}
	#sortBox li:nth-of-type(2) {
		width: 6%;
	}
	#sortBox li:nth-of-type(4) {
		margin-right:45px;
	}
	#sortBox li:nth-of-type(6) {
		margin-left:340px;
	}
	#sortBox li:nth-of-type(7),#sortBox li:nth-of-type(8){
		width: 4%;
	}
	#fromTo{
		margin-left:90px;
	}
	#ascBtn{
		top:170px !important; 
	}
	#descBtn{ 
		top:170px !important; 
	}
	.page_nation .pprev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat center center;
		margin-right:0;
	}
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	/* 페이징처리끝 */
</style>
<script>
function pagelist(pagenum){
	var lin = "customerLeaveList?pageNum="+pagenum;
	
	if($("#searchWordhidden").val()!=null && $("#searchWordhidden").val()!=''){
		lin += "&searchKey="+$("#searchKeyhidden").val();
		lin += "&searchWord="+$("#searchWordhidden").val();
	}
	location.href=lin;
}
$(function(){
	$("#searchKeyhidden").val($("#searchKey").val());
	$("#searchKey").change(function(){
		console.log('searchKey바뀜');
		$("#searchKeyhidden").val($("#searchKey").val());
	});
	$("#searchWord").keyup(function(){
		console.log('searchWord바뀜');
		$("#searchWordhidden").val($("#searchWord").val());
	})
});
</script>
 
 
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="customerLeaveList">탈퇴회원관리</a></strong></h5></li> 
				<li><button class="success" value="add" name="add" id="addBtn">추가</button></li>
				<li><button class="success" value="del" name="del" id="delBtn">삭제</button></li>
			</ul> 
		</div> 
		</div>  
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="choose">
			<a href="customerLeaveList"><button class="success" value="" name="" id="" style="background-color:lightgray; color:black;">일반회원</button></a>
			<a href="sellerLeaveList"><button class="success" value="" name="" id="">판매자회원</button></a>
		</div> 
		<div id="sortBox">
			<ul>
				<li>
					<select name="searchDate">  
						<option value="birthdate">생년월일</option> 
						<option value="regDate">탈퇴일</option>
					</select>  
				</li>
				<li><input type="date" id="from"></li>
				<li><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>
				<li><input type="submit" value="검색" /></li>
				<li><select name="sort" > 
		   				<option value="이름" selected>이름</option>
		   				<option value="아이디">아이디</option>
		   				<option value="나이">나이</option> 
		   				<option value="이메일">이메일</option> 
		   				<option value="생년월일">생년월일</option> 
		   				<option value="주소">주소</option> 
		   				<option value="탈퇴일">탈퇴일</option> 
			  		</select> 
	   			</li> 
				<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>
			</ul>
   		</div>
   		<div id="contentBox"> 	
		<div id="title">
			<ul>
				<li><input type="checkbox" name="check"  ></li>
				<li>이름</li>
				<li>아이디</li>
				<li>나이</li>
				<li>이메일</li>
				<li>생년월일</li>
				<li>주소</li>
				<li>탈퇴일</li> 
				
			</ul>
		</div>  
		<c:forEach var="vo" items="${list}">
		<ul class="contentList">
			<li><input type="checkbox" name="check" id="check"></li>
			<li>${vo.username}</li>
			<li><a href="회원정보?">${vo.userid}</a></li>
			<li>${vo.age}</li>
			<li>${vo.useremail}</li>
			<li>${vo.point}</li>
			<li class="wordcut">(${vo.userzipcode})${vo.useraddr} ${vo.userdetailaddr}</li>
			<li>${vo.joindate }<br /></li>
		</ul>
		</c:forEach>
		<div class="page_wrap">	
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="javascript:pagelist(${pageVO.pageNum-1})"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum }"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="javascript:pagelist(${p})">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="javascript:pagelist(${pageVO.pageNum+1})"></a>
	           </c:if>
			</div>
		 </div>
		 <div>
			<form method="get" class="searchFrm" action="<%=request.getContextPath() %>/board/noticeBoardList.jsp">
				<select name="searchKey">
					<option value="username" selected>이름</option>
	   				<option value="userid">아이디</option> 
	   				<option value="useremail">이메일</option> 
	   				<option value="useraddr">주소</option> 
				</select>			
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" value="검색"/> 
			</form> 
		</div>  
	</div>
</div>
</div>