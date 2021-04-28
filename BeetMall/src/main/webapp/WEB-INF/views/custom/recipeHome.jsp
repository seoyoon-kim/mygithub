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

a:active,a:link,a:visited,a:hover{
      text-decoration: none;
      color:black;
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

.bx-wrapper { -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;}

#slider>li{
 width:900px;
 margin:0;
 padding:0;
}


#slider>li>a>img{
width:800px;
height:500px;
margin:0 auto; 
}

#recipettile>b{
float:left;
width:100%;
color:rgb(252,118,45);
height:20px;
margin-top:10px;
}


/* 탑서치부분----------------------------------------------                 */

#searchLine{
margin:0px; padding:0px; width:670px;
height:50px;
line-height:40px;
float:left;
margin-bottom:30px;
}

#searchLine2{
margin:0px; padding:0px; width:410px; height:50px; line-height:40px;float:right;
margin-bottom:30px;
}
#searchLine2>input,#searchLine2>a>input{
line-height:25px;
}

#searchLine>li:nth-child(3n+1){
margin-right:40px;
}

#top10{
width:60px;
margin-right:20px;
}

#new10,#searchbtn,#writebtn{
height:30px; width:69px;
}

#top10>a,#new10>a{color:black; font-weight:bold; margin-bottom:20px;}

#searchbtn,#writebtn{
		padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
	}
	/*버튼*/
	#searchbtn:hover,#writebtn:hover{
		background: gray;
		color:white;
		display: inline-block;
	}



/*  레시피 리스트----------------------------------------------                 */

.recipeList{
   float:left; 
   width:100%;
   height:100%;
   margin:0 auto;
   padding:0 auto;
   border-top:1px solid #ddd;
    }    
 
 .recipeList>div{
 width:100%;
 heigh:220px;
 
 }
 
 .recipeList>div>ul{
 width:100%;
 margin-top:10px;
 margin-bottom:10px;
 background-color:#eee;
 height:210px;
 border-radius:3px;
 }
 
 .recipeList>div>ul>li>img{
    width:140px;
    height:200px;
    float:left;
    margin-top:4px;
    margin-right:10px;
    border-radius:5px;
 }   
 
 .recipeList>div>ul>li>a>img{
    width:140px;
    height:200px;
    float:left;
    margin-top:4px;
    margin-right:10px;
    border-radius:5px;
 }   
 
 
 .recipeList>div>ul>li:nth-child(5n+2){
    margin-top:10px;
    height:20px;
    float:left;
 }
 
  .recipeList>div>ul>li:nth-child(5n+3){
    height:20px;  margin-top:3px;
    float:left;
    width:80%;
 }
 
   .recipeList>div>ul>li:nth-child(5n+4){
    margin-top:12px;
    height:110px;
    width:50%;
    float:left;
 }
 
   .recipeList>div>ul>li:nth-child(5n+5){
   width:890px;
    height:20px;
    padding-left:610px;
    
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
	    <div id="recipettile"><b>HOME</b></div></br></br>
	    
	     <div class="bxslider">
	      <ul id="slider" >
			  <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr4.jfif"/></a></li>
			  <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr4.jfif"/></a></li>	
			  <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr4.jfif"/></a></li>
			  <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr4.jfif"/></a></li>  
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
	     <li id="top10"><a href="#">TOP10</a></li>
	     <li id="new10"><a href="#">NEW10</a></li>
	    </ul>
	    
	    <div id="searchLine2">
	    <select name="selectSearch" id="selectSearchid">
	                   <option>제목</option>
	                   <option>글쓴이</option>
	                   <option>글내용</option>
	                </select>
	    <input type="text" name="search"  placeholder="검색어를 입력하세요"/>
	    <input type="submit" id="searchbtn" value="Search"/>
	    <a href="<%=request.getContextPath() %>/recipeWrite"><input type="submit" id="writebtn" value="글쓰기"/></a>
	    </div>
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
		               
			              
			              
			             
						  
						  <ul id="recipeListul">
			                 <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr3.jfif"></a></li>
				             <li> 제목: <a href="recipeView?recipenum=${data.recipenum}">${data.recipetitle}</a> </li>
				             <li> 작성자: ${data.userid} </li>
							 <li> 내용: <a href="recipeView?recipenum=${data.recipenum}">${data.recipecontent}</a> </li> 
							 <li>★추천수 ${data.reciperecommend}, 조회수${data.recipehit} ,${data.recipewritedate}</li>
							 
						  </ul>
						  
						  <ul id="recipeListul">
			                 <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr3.jfif"></a></li>
				             <li> 제목: <a href="recipeView?recipenum=${data.recipenum}">${data.recipetitle}</a> </li>
				             <li> 작성자: ${data.userid} </li>
							 <li> 내용: <a href="recipeView?recipenum=${data.recipenum}">${data.recipecontent}</a> </li> 
							 <li>★추천수 ${data.reciperecommend}, 조회수${data.recipehit} ,${data.recipewritedate}</li>
							 
						  </ul>
						  
						  <ul id="recipeListul">
			                 <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr3.jfif"></a></li>
				             <li> 제목: <a href="recipeView?recipenum=${data.recipenum}">${data.recipetitle}</a> </li>
				             <li> 작성자: ${data.userid} </li>
							 <li> 내용: <a href="recipeView?recipenum=${data.recipenum}">${data.recipecontent}</a> </li> 
							 <li>★추천수 ${data.reciperecommend}, 조회수${data.recipehit} ,${data.recipewritedate}</li>
							 
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