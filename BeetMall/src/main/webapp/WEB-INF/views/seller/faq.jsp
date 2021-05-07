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
	.cs_wrapTitle{text-align:left; width:100%;}
	table, fieldset{
		width:100%;
	}
	/*표*/
	table{
		border-spacing: 0;
		text-indent: initial;
		margin:0 auto;
		margin-bottom:30px;
		width:95%;
	}
	td{border-bottom:1px solid lightgray;}
	td:nth-child(1), td:nth-child(2){
		text-align:center;
		width:100px;
	}
	td:nth-child(3){
		padding-left:30px;
	}
	td:nth-child(3) a, a{
		color:black;
		cursor:pointer;
	}
	th{
		margin-top:30px;
		text-align:center;
	}
	/*답변*/
	.answer{
			display:none;	
	}
	.answer_td{
		padding: 20px 10px 20px 10px;
		font-size:12px;
	}
	.answer_td:nth-child(1){
		color:red;
		font-weight:bold;
	}
	.answer_td:nth-child(2){
		text-align:left;
		padding-left:30px;
	}
/* 검색하기 */
	#cs_search_container{
		width: 100%;
	
		float: center;
		text-align:center;
		margin:0 auto;
	}
	#cs_search_box{
		border:none;
	}
	#search{
		height:40px;
		width:400px;
		text-indent: 0.2em;
		border: white;
		float: center;
		border:1px solid lightgray; 
		border-radius: 0px 8px 8px 0px;
		margin:30px 0px 60px -2px;		
	}
	#cs_search_q{
		font-weight:bold;
		color:gray;
		font-size:17px;
	}
	select{
		float:left; 
		height:40px;
		width:130px;
		margin-top:30px;
		margin-left:330px;
		border-radius: 8px 0px 0px 8px;
	}
	/* 고객센터 상단 메뉴 */
	#seller_cs_menu{
		width:600px;
	}
</style>
<script>

 $(function(){
//선택한 faq tr열고 닫히기	 
//수정할 것: this만 열리도록 고치기
  	 
  	  $(function() {
  		//선택한 faq tr열고 닫히기    
  		//수정할 것: this만 열리도록 고치기
  		$(".faq_td").click(function() {
  			$(this).parent().next().toggle(
  				function(){
  					$(this).parent().next().css("display", " "); 
  				},
  				function(){
  					$(this).parent().next().css("display", "hide"); 
  				}
  			);
  		});

  	});
//선택한 select option별로 보기
//수정할 것 나머지 option선택에 대한 script 추가하기
  		
  		$('#sel').change(function(){
  			var option = $(this).val();
  			console.log(option);
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
		<div class="cs_wrapTitle">자주묻는 질문</div>
		<!-- 검색하기 -->
		<div id="cs_search_container">	
			<span id="cs_search_q">자주묻는 질문을 검색해보세요.<br/></span>
			<select id="sel">
				<option value="total">전체</option>
				<option value="product">상품</option>
				<option value="member">회원/포인트</option>
				<option value="sale">판매</option>
				<option value="order">주문/결제</option>
				<option value="delivary">배송</option>
				<option value="claim">교환/반품/환불</option>
			</select>
			<span id="cs_search_box">
				<input type="text" id="search" name="search" placeholder="궁금하신 내용을 입력해주세요.">
			</span>
		</div>
		<!-- 자주묻는질문 테이블-->
		<fieldset>
		<table>
		<!-- 테이블 헤더-->
			<thead>
				<tr>
					<th>번호</th>
					<th>문의사항</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<tr class="question">
					<td class="number">1</td>  <!--a href="javascript:showHideFaq()"  -->
					<td class="fa1_category">[상품]</td>
					<td class="faq_td"><strong>상품등록은 어떻게 하나요?</strong></td>
				</tr>
				<tr class="answer">
					<td class="answer_td">답변</td>
					<td class="answer_td" colspan="3" >  
						보다 자세한 매장의 안내는 아래 오프라인 페이지 이동을 통해 각 매장의 위치 또는 이벤트 진행상황을 확인하실 수 있습니다.<br/> 
						<br/> 
						상품등록은 어쩌구 저쩌구 <br/>
						<br/> 
						보다 자세한 매장의 안내는 아래 오프라인 페이지 이동을 통해 각 매장의 위치 또는 이벤트 진행상황을 확인하실 수 있습니다.<br/> 
						<br/> 
						상품등록은 어쩌구 저쩌구 <br/>
						<br/> 
						<a href="#" style="color:red">상픔등록 페이지 바로 가기 >></a>
						<br/> 
						<p>
							답변이 충분하지 않으시다면 관리자에게 문의하기를 이용해 주세요.
							<a href="<%=request.getContextPath() %>/ask_admin_list" style="font-weight:bold"><span style="color:black">문의하기</span></a>
						</p>
					 </td>
				</tr>
				
				<!-- 임시로 넣은 정보 삭제예정-->
				<tr>
					<td>2</td>
					<td class="fa1_category">[회원]</td>
					<td class="faq_td"><strong>농장 정보를 수정하고 싶어요.</strong></td>
					
				</tr>
				<tr class="answer">
					<td class="answer_td">답변</td>
					<td class="answer_td" colspan="3" >  
						레이아웃 확인 display : none 미적용<br/> 
						<br/> 
						script: click display none-> block적용 <br/>
						<br/> 
						<a href="#" style="color:red">농장정보 수정하기 바로 가기 >></a>
						<br/> 
						<p>
							답변이 충분하지 않으시다면 관리자에게 문의하기를 이용해 주세요.
							<a href="<%=request.getContextPath() %>/ask_admin_list" style="font-weight:bold"><span style="color:black">문의하기</span></a>
						</p>
					 </td>
				</tr>
				
			</tbody>
		</table>
			<!-- 페이징-->
		<div class="page_wrap">
			<div class="page_nation">
			   <a class="arrow pprev" href="#"></a>
			   <a class="arrow prev" href="#"></a>
			   <a href="#" class="active">1</a>
			   <a href="#">2</a>
			   <a class="arrow next" href="#"></a>
			   <a class="arrow nnext" href="#"></a>
			</div>
		 </div>
		</fieldset>
		</div>
	</div>
</body>
</html>