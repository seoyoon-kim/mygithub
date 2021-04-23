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
  /*--------------상단 메뉴바들-------------------->*/
 
 #recitb{
height:30px;
 }
 
 
 #reciTitle{
 width:100%;
 float:left;
 }
 
 #myrecipeTop{
 float:left; width:55%;
 }
 
 ##myrecipeTop2{
 float:right;
 width:60%
 }


 
   /*------------------------하단 게시판메뉴-----------------------------------*/
  
#recimainbox{
		width: 1100px;
		overflow:auto;
		padding-left: 100px;
	}  
	
  
#recipebox{
		width:30%;
		float: left;
	}


#recipebox>ul>li>img{
		width:270px;
		height:170px;
	}


 
 
 
</style>

<body>
<div class="section">

  <h3 id="reciTitle">마이레시피</h3>
  
<!--------------상단 메뉴바들-------------------->  
  <div id="recitb">
        <div id="myrecipeTop">
		  	<input type="button" value="나의 레시피"/>
			<input type="button" value="즐겨찾기 레시피"/>
		</div>  
		  
       <ul id="myrecipeTop2">
		  <li><select name="selectOrder" style="float:right">
		                   <option>최신순</option>
		                   <option>추천순</option>
		                   <option>조회수순</option>	                  
		    </select></li>
		  <li><input type="button" value="선택즐겨찾기제거"/></li>
		  <li><input type="text" id="search" name="search" placeholder="검색하기"></li>
	  </ul>
</div>

<!--------------게시판 이미지들-------------------->
<div id="recimainbox">
           <div id="recipebox">
				<ul>
					<li><img src="img/cr3.jfif"></li>
					<li>멋진토마토 레시피 만들기</li>
					<li>닉네임</li>
					<li>★★★★★(15) 조회수 25</li>
					<li><input type="checkbox" name="recipeCheckBox" value=""/></li>
				</ul>
			</div>
			
			
			<div id="recipebox">	
				<ul>
					<li><img src="img/cr3.jfif"></li>
					<li>멋진토마토 레시피 만들기</li>
					<li>닉네임</li>
					<li>★★★★★(15) 조회수 25</li>
					<li><input type="checkbox" name="recipeCheckBox" value=""/></li>
				</ul>			
			</div>
			
			
		   <div id="recipebox">	
				<ul>
					<li><img src="img/cr3.jfif"></li>
					<li>멋진토마토 레시피 만들기</li>
					<li>닉네임</li>
					<li>★★★★★(15) 조회수 25</li>
					<li><input type="checkbox" name="recipeCheckBox" value=""/></li>
				</ul>				
			</div>
			
			
			<div id="recipebox">	
				<ul>
					<li><img src="img/cr3.jfif"></li>
					<li>멋진토마토 레시피 만들기</li>
					<li>닉네임</li>
					<li>★★★★★(15) 조회수 25</li>
					<li><input type="checkbox" name="recipeCheckBox" value=""/></li>
				</ul>				
			</div>
</div>
<!--------------페이징 표시-------------------->


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











</div>
</body>

</html>