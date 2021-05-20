<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- font-family: 'Nanum Gothic', sans-serif; -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/jcss/basicStyle.css">

<style>
	.cs_message{
		margin: 0 auto;
		font-size:15px;
		width:90%;
	}
	#notice{font-size:12px;color: gray;}
	/*표*/
	table{
		width:90%;	
		border-spacing: 0;
		text-indent: initial;
		margin:0 0 20px 50px;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
		font-size:13px;
	}
	th, .th{
		height:40px;
		font-size:14px;
		width:80px; text-align:center;
		display: table-cell;
	    vertical-align: inherit;
	    font-weight: bold;
	    text-align: -internal-center;
   		background-color:#f6f6f6;
   		/*#fcfcfc*/
	}
	thead, .answer_content{
		border-bottom: 2px solid #ccc;
	    border-top: 2px solid #ccc;
	    width:100%;
	}
	tr{
		display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	    height:30px;
	}
	.td, .content{
		padding-left:20px;
		
	}
	.content{
		margin: 20px 0 20px;
	}
	td, .td{
		height:30px;
	}
	.tr_head{
		font-weight:bold;
	}
	.tr_head li{
		float:left;
	}
	.td, .th{ line-height:30px;}
	.td{
		width:30%; line-height:30px; 
		border-bottom: 2px solid #ccc;
	}
	/*이전글, 다음글*/
	.prev_next_wrap{
		width:90%;
		margin:20px 0px 0px 50px;
	}
	.prev_next_wrap li{
		height:30px;
		line-height:40px;
		border-bottom:1px solid lightgray;
	}
	.prev_next_wrap a{
		padding-left:20px;
		color: black;
	}
	.question_content, .answer_content{padding:10px;}
	.next{margin-bottom:30px}
	a{color:black;}
	.answer_line{width:100%; 	background-color:#f6f6f6; height:20px; }
	.bottom_wrap{margin:10px auto; width:90%;  text-align:center;}
	button, .btn{width:150px; height:26px; margin-left:20px;}
	
	#article{
		width:100%;
	}
  #cMyPageLeft {
	display: block;
}
   a:hover, a:active, a:visited, a:link {
   		color: black;
   }
</style>
<script>
	function Deletebtn(){
		if(confirm("내가 문의한 내용을 삭제하시겠습니까?")){
			location.href="customerCenterDelete?qmnum=${vo.qmnum}"
		}
		
	};
	
</script>
<div class="section">
	<div class="main">
	
	<!-- 가운데 메인 div -->
	<div id="article">
		<!-- 문의하기 상단 메세지 -->	
		<div class="cs_message">
			무엇을 도와드릴까요?<br/>
			<span id="notice">고객님께서 작성하신 질문은 판매자가 답변을 한 후에는 수정 또는 삭제하실 수 없습니다.</span>
		</div>
		<input type="hidden" value="${vo.qnum}"/>
		
			<div id="productInfoPage">
			<div id="productInfoPage3">

				<div id="qtitle">상품에 대한 문의를 남기는 공간입니다 해당 게시판의 성격과 다른 글은 사전동의
					없이 담당 게시판으로 이동될 수 있습니다.</div>
					

				<ul id="qnaTitle">
					<li><b>번호</b></li>
					<li><b>내용</b></li>
					<li><b>작성자</b></li>
					<li><b>작성일</b></li>
					<li><b>공개여부</b></li>
				</ul>

		   <c:if test="${empty faqlist}">
		       <div id="noreview">작성된 문의가 없습니다.</div>
		   </c:if>

           <c:forEach var="qlist" items="${faqlist}">
				<ul id="qnaList">
					 <li>${qlist.qnum}</li> <!-- 문의 숫자 -->
					<c:if test="${qlist.qopen==0 && logId!=qlist.userid}"> <!-- 비공개일경우 제목표시 -->
					 <li class="qnaViewbtn">비공개로 작성된 글입니다.</li>
					</c:if>
					<c:if test="${qlist.qopen==1 || logId==qlist.userid}"> <!-- 공개일경우 제목표시 -->
					 <li class="qnaViewbtn">${qlist.qtitle}</li>
					</c:if>
					 <li>${qlist.userid}</li> <!-- 유저아이디 -->
					 <li>${qlist.qwritedate}</li><!-- 날짜 -->
				  <c:if test="${qlist.qopen==0}">	<!-- 비공개일경우 그림표시 -->
					 <li><img src="img/ciconlock2.png"></li>
				  </c:if>
				  <c:if test="${qlist.qopen==1}">	 <!-- 공개일경우 그림표시 -->
					 <li><img src="img/ciconlock.png"></li>
				  </c:if>
				</ul>
				
				<div id="qnaViewbox" style="display:none" >
				<c:if test="${qlist.qopen==1 || logId==qlist.userid}">	<!-- 공개일경우 내용표시 -->	
							<div id="qnatxtbox">				
							     ${qlist.qcontent}
							</div>
						 <c:if test="${qlist.qanswer==null}"> <!-- 답변없을경우 -->	
						    <div id="qnatxtbox2">	
							  아직 작성된 답변이 없습니다.
							</div>
						 </c:if>
						 
						 <c:if test="${qlist.qanswer!=null}">
						    <div id="qnatxtbox2">					
							     ${qlist.qanswer}
							</div>
						</c:if>	
				</c:if>	
				
				<c:if test="${qlist.qopen==0 && logId!=qlist.userid}">	
				           <div id="qnatxtbox2">
				                비공개로 작성된 글입니다.
				           </div>
				</c:if>	
				
				</div>
				
		  </c:forEach>	

				<div id="pagelibtn"><a href="/sshj/mybuyList">문의 작성</a></div>
				
				<div id="nonebox">   </div>

			<c:if test="${not empty faqlist}">
			
			
				<!-- 페이징 표시--------- -->
	<div class="page_wrap">
			<div class="page_nation">
			   <c:if test="${pageVO2.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/customproduct?productnum=${pvo.productnum}&fpageNum=${pageVO2.pageNum-1}#productInfoPage3<c:if test="${pageVO2.searchWord != null && pageVO2.searchWord != ''}">&searchKey=${pageVO2.searchKey}&searchWord=${pageVO2.searchWord}</c:if>"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO2.startPageNum}" step="1" end="${pageVO2.startPageNum + pageVO2.onePageNum-1}">
	              <c:if test="${p<=pageVO2.totalPage}">
	                 <c:if test="${p==pageVO2.pageNum}"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO2.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/customproduct?productnum=${pvo.productnum}&fpageNum=${p}#productInfoPage3<c:if test="${pageVO2.searchWord != null && pageVO2.searchWord != ''}">&searchKey=${pageVO2.searchKey}&searchWord=${pageVO2.searchWord}</c:if>">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO2.pageNum < pageVO2.totalPage}">
	              <a class="arrow next" href="/sshj/customproduct?productnum=${pvo.productnum}&fpageNum=${pageVO2.pageNum+1}#productInfoPage3<c:if test="${pageVO2.searchWord != null && pageVO2.searchWord != ''}">&searchKey=${pageVO2.searchKey}&searchWord=${pageVO2.searchWord}</c:if>"></a>
	           </c:if>
			</div>
	 </div>
				<!-- 페이징 표시--------- -->
  			</c:if>
  			
  			
			<div class="bottom_wrap">
				<input type="button" value="확인" class="btn" id="btn" onClick="location.href='<%=request.getContextPath() %>/customerCenter'"/>
				<input type="button" value="삭제하기" class="btn" id="btn" onClick="Deletebtn()"/>
			</div>
		</div>
	</div>
</div>


</div>
</div>