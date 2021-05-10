<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

	
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/basicStyle.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/headerStyle.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/csStyle.css">
</head>


<script>
$(document).ready(function() {
	  $('#summernote').summernote();
	  $("#askFrm").submit(function(){
		 	 if($('#subject').val()=="" || #('#subject').val()==null){
				alert("문의 제목을 입력해주세요.");
				return false;
			}
			if($('#userid').val()=="" || #('#userid').val()==null){
				alert("문의 내용을 입력해주세요.");
				return false;
			}
			return true;	
	});
</script>
<body>
	<div class="main">
	<!------------------ 고객센터 상단 사이드바 ----------------------->
         <nav>
         <div id="headerMember">
            <c:if test="${logStatus != 'Y'}">
               <div class="sellerLoginBtn">   <!-- 로그인 전 -->
                  <input type="button" value="회원가입" class="sellerMenuButtons"/>
                  <input type="button" value="로그인" class="sellerMenuButtons"/>
                  <input type="button" value="고객센터" class="sellerMenuButtons"/>
               </div>
            </c:if>
            <c:if test="${logStatus == 'Y' }">
               <div class="sellerLoginBtn">   <!-- 로그인 후 -->
                  <c:if test="${logType==2}">
                     <input type="button" value="판매자 페이지로 이동하기" class="sellerMenuButtons"/>
                  </c:if>
                  <a href="myinfoEdit">${logName}님</a><span id="sellerMenuButtons">▼</span>
                  <input type="button" value="로그아웃" class="sellerMenuButtons"/>
                  <input type="button" value="고객센터" class="sellerMenuButtons"  onClick="location.href='<%=request.getContextPath() %>/ask_admin_list'"/>
               </div>
            </c:if>
         </div>   
         <ul id="seller_cs_menu">
            <li><a href="#">BEETMALL</a></li>
            <li><a href="notice">공지사항</a></li>
            <li><a href="faq">자주묻는 질문</a></li>
            <li><a href="ask_admin_list">문의하기</a></li>
         </ul>
      </nav>
   </div> 
	<!-- 가운데 메인 div -->
	<div id="article">
		<div class="cs_wrapTitle">문의하기</div>
		<!-- 문의하기 상단 메세지 -->	
		<div class="cs_message">
			질문 전 자주묻는 질문을 먼저 확인해주세요. <br/>
			<a href="<%=request.getContextPath() %>/faq"><span id="link">자주묻는질문 바로가기 </span></a><br/>
			<br/>
			무엇을 도와드릴까요?<br/>
			<span id="notice">고객님께서 작성하신 질문은 관리자가 답변을 한 후에는 수정 또는 삭제하실 수 없습니다.</span>
		</div>
			
		<form method="post" action="ask_admin_write_ok" id="askFrm">
		<table>
			<tbody>
				<tr>
					<th colspan="4">문의 작성</th>
				</tr>
				<tr class="tr_head">
					<th class="menu" >제목</th>
					<td class="td"><input type="text" name="qmtitle" id="subject" placeholder="문의사항 제목을 입력해주세요."/></td>
					<th class="menu">작성자</th>
					<td  class="td"><span>${saavo.userid}</span></td>	
				</tr>
				
				<tr>
					<th colspan="4">문의 내용</th>
				</tr>
				<tr>
					<td class="question_content" colspan="4">
						<textarea id="summernote"  name="qmcontent" placeholder="문의내용을 입력해주세요."></textarea>
					</td>	
				</tr>
			</tbody>
		</table>
			<div style="text-align:center; margin-top:20px;">
				<input type="button" value="취소" id="btn" onClick="location.href='<%=request.getContextPath() %>/ask_admin_list'"/>
				<input type="submit" value="문의하기" id="btn"/>				
			</div>
	
		</form>
		</div>
	</div>
</body>
</html>