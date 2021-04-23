<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="/inc/recipeMypageMenu.jspf"%>    
<%@ include file="/inc/menu_c.jspf"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
		<!-- font-family: 'Nanum Gothic', sans-serif; -->
		<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
		<!-- font-family: 'NanumSquare', sans-serif !important; -->
		
</head>
<style>

/*  기본설정----------------------------------------------                 */
.section{
	width: 1080px;
	background-color: white;
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
	
}

#searchBtn{
top:0px;
left:0px;
}

 /* ------------------페이징처리부분-------------------- */
	.page_wrap {
		text-align:center;
		font-size:0;
		padding-bottom: 30px;
	}
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:35px;
		height:35px;
		line-height:35px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
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
	
 /* ---------------페이징 처리끝-------------------- */

/*  문의상단----------------------------------------------                 */

.infobtn{
float:right;
margin-bottom:4%;
width:100%;
}


/*  게시판----------------------------------------------                 */



.infoListTitle{
width: 100%;
border-bottom:2px solid #ddd;
}

.infoList{
	width: 100%;
}


.infoList>li,.infoListTitle>li{
	width: 10%;
	float: left;
	line-height:40px;
}

.infoList>li:nth-child(6n+1),.infoListTitle>li:nth-child(6n+1) {
	width: 5%;
}

.infoList>li:nth-child(6n+3),.infoListTitle>li:nth-child(6n+3) {
	width: 45%;
}

.infoList>li:nth-child(6n+4),.infoListTitle>li:nth-child(6n+4) {
	width: 15%;
}

.infoList>li:nth-child(6n+6),.infoListTitle>li:nth-child(6n+6) {
	width: 15%;
}

/* ------게시판 버튼-----------*/

#infobutton{
 color:white;
 background-color:rgb(224,102,102);
 border-radius:10px;
 border:1px solid #ddd;
 line-height: 30px;
}

</style>



<body>

<div class="section">

 <!-- ----------------문의 상단------------------------ -->
  <h3>*******의 문의내역 입니다.</h3>
  
  <div class="infobtn">
  <input type="submit" value="문의 작성"/>
  <input type="submit" value="문의 삭제"/>
  </div>
  
 <!-- ----------------게시판------------------------ -->
  <div class="infolistbox">
	  <ul class="infoListTitle">
	    <li></li>
	    <li><b>번호</b></li>
	    <li><b>내용</b></li>
	    <li><b>일시</b></li>
	    <li><b>상태</b></li>
	    <li><b>답변보기</b></li>
	  </ul>	    
	   
	   
	  <ul class="infoList">
	   
	    <li><input type="checkbox" name="boardCheckBox" value=""/></li>
	    <li>123</li>
	    <li>너무 맛이 없어요</li>
	    <li>2020-03-28 13:00</li>
	    <li>확인중</li>
	    <li><input type="button" value="확인하기" id="infobutton"/></li>
	    
	    <li><input type="checkbox" name="boardCheckBox" value=""/></li>
	    <li>123</li>
	    <li>너무 맛이 없어요</li>
	    <li>2020-03-28 13:00</li>
	    <li>확인중</li>
	    <li><input type="button" value="확인하기" id="infobutton"/></li>
	  </ul>
  </div>
  
  <!-- -----------------페이징 표시--------------------------- -->
  
  <div class="page_wrap">
			<div class="page_nation">
			   <a class="arrow pprev" href="#"></a>
			   <a class="arrow prev" href="#"></a>
			   <a href="#" class="active">1</a>
			   <a href="#">2</a>
			   <a href="#">3</a>
			   <a href="#">4</a>
			   <a href="#">5</a>
			   <a href="#">6</a>
			   <a href="#">7</a>
			   <a href="#">8</a>
			   <a href="#">9</a>
			   <a href="#">10</a>
			   <a class="arrow next" href="#"></a>
			   <a class="arrow nnext" href="#"></a>
			</div>
	</div>
 
 <div style="clear:both;"></div>
 
</div>

</body>
</html>