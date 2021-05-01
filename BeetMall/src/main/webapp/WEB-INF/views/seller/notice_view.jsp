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
</head>

<style>

	/*표*/
	table{
		width:90%;	
		border-spacing: 0;
		text-indent: initial;
		margin:0 0 20px 50px;	
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
	}
	th, .th{
		display: table-cell;
	    vertical-align: inherit;
	    font-weight: bold;
	    text-align: -internal-center;
   		background-color:#f6f6f6;;
   		/*#fcfcfc*/
	}
	thead{
		border-bottom: 2px solid #ccc;
	    border-top: 2px solid #ccc;
	    width:100%;
	}
	tr{
		display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	    height:50px;
	}
	.td, .content{
		padding-left:20px;
	}
	.content{
		padding: 20px 0 20px;
	}
	.tr_head{
		font-weight:bold;
	}
	.tr_head li{
		float:left; padding:0; width:150px; height:50px;
	}
	.menu, .th{
		width:150px; text-align:center;
	}
	.td, .th{ line-height:50px;}
	td{border-bottom: 2px solid #ccc; padding:0;}
	/*이전글, 다음글*/
	.prev_next_wrap{
		width:90%;
		margin:20px 0px 0px 50px;
	}
	.prev_next_wrap li{
		height:40px;
		line-height:40px;
		border-bottom:1px solid lightgray;
	}
	.prev_next_wrap a{
		padding-left:20px;
		color: black;
	}
	.next{margin-bottom:30px}
	
	#seller_cs_menu{
		width:600px;
	}
</style>
<script>
//테이블 collapse
  //showHideFaq
</script>
<body>
	<div class="main">
		<!-- 고객센터 사이드바 -->
	    <!-- 상단 메뉴 바 -->
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
		<div class="cs_wrapTitle">공지사항</div>
		
		<fieldset>
		<table>
			<tbody>
				<tr class="tr_head">
					<th class="menu">제목</th>
					<td class="td"><span>코로나19로 인한 픽업 서비스 중단 안내</span></td>
				</tr>
				<tr class="tr_head">
					<th class="menu">작성자</th>
					<td  class="td"><span>Beetmall</span></td>
				</tr>
				<tr class="tr_head">
				<td colspan="2">
					<ul>
						<li class="th">작성일</li>
						<li class="td" style="padding-left:20px">21/04/21</li>
						<li class="th">조회수</li>
						<li class="td" style="padding-left:20px">21</li>
					</ul>
				</tr>
			
				<tr>
					<td colspan="2">
						<span class="content" >
						
						고객님 안녕하세요.
						코로나19로 인한 픽업 서비스 중단 안내드립니다.
						2021.04.21 부터 어쩌구 저쩌구 
						저쩌구
					
						</span>
					</td>	
				</tr>
			</tbody>
		</table>
		<div class="prev_next_wrap">
			<ul class="prev_next_ul">
				<li class="prev"><strong>&#9651;이전글</strong><a href="">이전글이 없습니다.</a></li>
				<li class="next"><strong>&#9661;다음글</strong><a href="">다음글이 없습니다.</a></li>
			</ul>
		</div>
		</fieldset>
		</div>
	</div>
</body>
</html>