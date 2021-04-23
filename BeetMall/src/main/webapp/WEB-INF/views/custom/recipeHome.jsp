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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />

<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
		<!-- font-family: 'Nanum Gothic', sans-serif; -->
		<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
		<!-- font-family: 'NanumSquare', sans-serif !important; -->
		
<script>



</script>



</head>
<style>
/*  기본설정----------------------------------------------                 */
#section2{
	height:100%;
}

#searchBtn{
top:0px;
left:0px;
}

#section{
background-color:white;
margin:0 auto;
font-family: 'Nanum Gothic', sans-serif;
}

ul>li{
list-style-type:none;
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

/*  슬라이더----------------------------------------------                 */ 
   
#slider>li{
 margin:0;
 padding:0;
}

#slider>li>img{
 width:700px;
 height:500px;
 margin:0 auto; 
 
}

#slider>li>div{
 position:absolute; top:420px;
 width:400px;
 font-size:1.5em;
 left:100px;
 color:rgb(224,102,102);
}

/* 탑서치부분----------------------------------------------                 */

ul#searchLine,ul#searchLine2{
margin:0px; padding:0px; width:500px;
}

#searchLine{float:left;}
#searchLine2{float:right;}
#searchLine>li{width:100px; display:inline;}


/*  레시피 리스트----------------------------------------------                 */

.recipeList{
   float:left; 
   width:100%;
   height:100%;
   margin:0 auto;
   padding:0 auto;
    }    
 
 .recipeList>div{
 width:100%;
 heigh:220px;
 
 }
 
 .recipeList>div>ul{
 width:100%;
 height:100%;
 }
 
 .recipeList>div>ul>li>img{
    width:150px;
    height:200px;
    float:left;
 }   
 
 
 .recipeList>div>ul>li:nth-child(5n+2){
    height:20px;
    float:left;
 }
 
  .recipeList>div>ul>li:nth-child(5n+3){
    height:20px;
    float:left;
    width:80%;
 }
 
   .recipeList>div>ul>li:nth-child(5n+4){
    height:150px;
    width:80%;
    float:left;
 }
 
   .recipeList>div>ul>li:nth-child(5n){
   width:30%;
    float:right;
    
 }
 

 
    
/*
 .recipeList>ul{
  background-color:#EBDFE2;
 
 }   
 
 .recipeList>ul>li{
 
 border-bottom:3px solid #ddd; 
 margin:0 auto;
 padding:0 auto;
 margin-top:3px;
 
 
 }
 
 .recipeList>div{
  margin:0 auto;
  padding:0 auto;
  float:left;
    }
    
    
.recipeList>ul>li>div>img{
 width:150px;
 height:200px;
}    
*/


</style>

<script>

$(function(){
	  $('#slider').bxSlider({
	  auto: true,
	  mode: 'horizontal',
      speed: 500,
      captions: true,
      pager: true,
      infiniteLoop:true         
	});
	  
});

</script>

<body>


  <div class="section" id="section">
  
<!-- -------------------------슬라이더-------------------------------------- -->  
	    <h4 style="color:rgb(224,102,102)"><b>HOME</b></h4>
	     <div class="bxslider">
	      <ul id="slider" >
			  <li><div><b>멋진 레시피로 제철 토마토로 만드는 멋드러진 레시피</b></div><img src="img/cr3.jfif"/></li>
			  <li><div><b>맛있는 요리법2</b></div><img src="img/cr3.jfif"/></li>	
			  <li><div><b>맛있는 요리법3</b></div><img src="img/cr3.jfif"/></li>
			  <li><div><b>맛있는 요리법4</b></div><img src="img/cr3.jfif"/></li>  
		  </ul>
	     </div>

<!-- -------------------------탑서치부분-------------------------------------- -->		    
	    <ul id="searchLine">
	    <li><select name="selectOrder">
	                   <option>인기글순</option>
	                   <option>추천순</option>
	                   <option>조화수순</option>
	                   <option>최신순</option>
	                </select></li>
	    <li>TOP10</li>
	    <li>NEW10</li>
	    </ul>
	    
	    <ul id="searchLine2">
	    <li><select name="selectSearch" id="selectSearchid">
	                   <option>제목</option>
	                   <option>글쓴이</option>
	                   <option>글내용</option>
	                </select>
	    <input type="text" name="search" placeholder="검색어를 입력하세요"/>
	    <input type="submit" value="Search"/>
	    <input type="submit" value="글쓰기"/></li>
	    </ul>
	    <br/>
	
<!-- -------------------------레시피 리스트들-------------------------------------- -->	
        <br/>
        <!--  
	    <div id="recipeList">
	    
	    
	    <c:forEach var="data" items="${list}">
		       <div class="recipeListposition">
			       <img src="img/r3.jfif">
			        <div id="firststdatelist">
			        <a href="recipeView?recipenum=${data.recipenum}">${data.recipetitle}</a>
			        작성자: ${data.userid}
			        내용: ${data.recipecontent}
			        </div>
		        </div>
		        <div id="lastdatelist">추천수 ${data.reciperecommend}, 조회수${data.recipehit} , 날짜${data.recipewritedate}</div> 
	         </c:forEach> 
	      
	    </div>
	    -->
	    <div class="recipeList">
	    
		   
		      <div>
		        <!-- <c:forEach var="data" items="${list}"> -->
		               
			              
			              
			              <ul>
			                 <li><img src="img/cr3.jfif"></li>
				             <li> 제목: <a href="recipeView?recipenum=${data.recipenum}">${data.recipetitle}</a> </li>
				             <li> 작성자: ${data.userid} </li>
							 <li> 내용: ${data.recipecontent} </li> 
							 <li>추천수 ${data.reciperecommend}, 조회수${data.recipehit} , 날짜${data.recipewritedate}</li>
							 
						  </ul>
						  
						  <ul>
			                 <li><img src="img/cr3.jfif"></li>
				             <li> 제목: <a href="recipeView?recipenum=${data.recipenum}">${data.recipetitle}</a> </li>
				             <li> 작성자: ${data.userid} </li>
							 <li> 내용: ${data.recipecontent} </li> 
							 <li>추천수 ${data.reciperecommend}, 조회수${data.recipehit} , 날짜${data.recipewritedate}</li>
							 
						  </ul>
						
			             
			             
			           
		          <!-- </c:forEach> -->
		      </div>
		      

	    </div>
	    
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