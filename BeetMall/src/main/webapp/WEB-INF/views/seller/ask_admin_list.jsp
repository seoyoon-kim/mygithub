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

<style>
	/*표*/

	td:nth-child(1),td:nth-child(3),td:nth-child(4){
		text-align:center;
		width:140px;
	}
	td:nth-child(2){
		padding-left:30px;
	}
	td:nth-child(2) a, a{
		color:black;
		cursor: pointer;
	}
	th{
		margin-top:30px;
		text-align:center;
	}
	#search_btn{padding:5px;border-left:1px solid lightgray;}
	#sel{margin-top:10px;}
	/*답변대기중*/
	#no_answer{color:rgb(224,102,102);}
</style>
<script>
	//답변완료 답변대기중 select 
	$(document).ready(function(){
		$('#sel').change(function(){
			var option = $(this).val();

			if(option=='answer'){ //답변완료
				$('td:contains("답변완료")').parents('tr').css('display','');
				$('td:contains("답변대기중")').parents('tr').css('display','none');
			}			
			if(option=='no_answer'){ //답변대기중
				$('td:contains("답변대기중")').parents('tr').css('display','');
				$('td:contains("답변완료")').parents('tr').css('display','none');
			}
			if(option=='total'){ //전체
				$('tr').css('display','');
		}
		});
	 		
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
		<!-- 문의하기 -->
			<div class="cs_wrapTitle">문의하기</div>
		<!-- 문의하기 상단 메세지 -->	
			<div class="cs_message">
				질문 전 자주묻는 질문을 먼저 확인해주세요. <br/>
				<a href="<%=request.getContextPath() %>/faq"><span id="link">자주묻는질문 바로가기 >></span></a><br/>
				<br/>
				고객님께서 비트몰에 문의하신 내용을 확인할 수 있습니다.<br/>
			</div>
		<!-- 검색/ 문의하기 버튼 -->
			<div id="search_container">
			<!--문의하기 버튼 -->
			<button id="ask_btn" onClick="location.href='<%=request.getContextPath()%>/ask_admin_write'">문의하기</button>
	
			<!-- 검색하기 -->
				<span id="search_box">
					<input type="text" id="search" name="search" placeholder="검색하기"><a href="#" onclick="return false;"><span id="search_btn">검색</span></a>
				</span>
			</div>
		<fieldset>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>문의날짜</th>
					<th></th> <!-- 답변 여부 -->		
				</tr>
			</thead>
			<tbody>
			<c:forEach var="saavo" items="${list}">
				<tr>
					<td class="number">${saavo.qmnum}</td>
					<td class=><a href="<%=request.getContextPath()%>/ask_admin_view?qmnum=${saavo.qmnum}">${saavo.qmtitle}</a></td>
					<td>${saavo.qmdate }</td>
					<c:if test="${ssavo.qmanswer!=null && ssavo.qmanswer!=''}">
						<td><span class="answer_span" id="answer">답변완료</span></td>				
					</c:if>
					<c:if test="${ssavo.qmanswer==null && saavo.qmanswer==''}">
						<td><span class="answer_span" id="answer">답변대기중</span></td>				
					</c:if>
					<td><span class="answer_span" id="answer">답변대기중</span></td>	
				</tr>
			</c:forEach>	
			</tbody>
		</table>
		<div  id="select_container">
				<!-- 답변 셀렉트 옵션 -->
				<select id="sel">
					<option value="total">전체</option>
					<option value="answer">답변완료</option>
					<option value="no_answer">답변대기중</option>
				</select>
		</div>
		<!-------------- 페이징------------------>
		<div class="page_wrap">
			<div class="page_nation">
				
			  	<!--맨앞으로-->
  				<a class="arrow_pprev" href="ask_admin_list?pageNum=1<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--앞으로-->
        		<a class="arrow_prev" href="ask_admin_list?pageNum=${sapvo.pageNum-1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
 				<!--레코드 갯수에 따른 페이지 갯수 표시--> 
         		<c:forEach var="p" begin="${sapvo.startPageNum}" end="${(sapvo.startPageNum + sapvo.onePageNum)-1}">
	         		<!--p가 총페이지수보다 작거나같을때  레코드가 있는 페이지까지만 표시 -->
	            	<c:if test="${p<=sapvo.totalPage}">  
						<!--현재페이지 :  현재보고있는 페이지 표시 -->
		               <c:if test="${p==sapvo.pageNum}">
		                  <a class="on" href="ask_admin_list?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
		               <!-- 현재페이지가 아닐 때 -->
		               <c:if test="${p!=sapvo.pageNum}">
		                  <a href="ask_admin_list?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
	            	</c:if>
        		</c:forEach>
        		<!-- 다음 페이지가 있을 때 -->
				<!--뒤로-->            
	         	<a class="arrow next" href="ask_admin_list?pageNum=${sapvo.pageNum+1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--맨뒤로-->
	         	<a class="arrow nnext" href="ask_admin_list?pageNum=${sapvo.totalPage}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
			</div>
		 </div> 
		 <!-------------- 페이징 끝 --------------->
		</fieldset>
		</div>
	</div>
</body>
</html>