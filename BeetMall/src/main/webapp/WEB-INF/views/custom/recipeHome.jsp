<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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

		


<style>
/*  기본설정----------------------------------------------                 */

a:hover, a:active, a:visited, a:link {
    text-decoration: none;
    color: black;
}
#mypageMenubar{
	display:block;
}

#section{
background-color:white;
margin:0 auto;
font-family: 'Nanum Gothic', sans-serif;
width:1080px;
}

ul>li{
list-style-type:none;
}

a:active,a:link,a:visited,a:hover{
      text-decoration: none;
      color:black;
 
   }

#menuListUl{
font-size:17px;
}

#mypageMenubar{
	display:block;
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
margin:0px; padding:0px; width:530px;
height:50px;
line-height:40px;
float:left;
margin-bottom:30px;
}

#searchLine2{
float:left;
margin:0px;  width:550px; height:50px; line-height:40px;
margin-bottom:30px;
padding-left:100px;
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

#top10,#new10{color:black; font-weight:bold; margin-bottom:20px;}

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
width:100%;
float:left;
margin-bottom:30px;
}

#recipeListul{
width:100%;
float:left;
margin-top:10px;
margin-left:10px;
height:300px;

}

#recipeListul>li:nth-child(7n+1){
float:left;
height:300px;

}


#recipeListul>li:nth-child(7n+1)>a>img{
height:300px;
padding:10px;
}

#recipeListul>li:nth-child(7n+1)>a{
float:left;
}

#recipeListul>li:nth-child(7n+2)>a{
float:left;
padding-left:10px;
padding-top:10px;
padding-right:400px;
padding-bottom:10px;
width:840px;
height:55px;
line-height:55px;
font-weight:bold;

}

#recipeListul>li:nth-child(5n+3){
float:left;
padding-left:10px;
width:840px;
padding-right:400px;
color:gray;
}

#recipeListul>li:nth-child(5n+4){
float:left;
padding-left:10px;
width:840px;
height:190px;
padding-right:400px;
padding-top:5px;
}

#recipeListul>li:nth-child(5n+5){
float:left;
padding-left:450px;
width:840px;
}

#section{
font-size:17px;
}
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




function top10(){ 
	  $('#top10').css('color','black');	  	  
	  $('#new10').css('color','#eee');		  
}


function new10(){ 
	  var txt1=""; 
	  $('#new10').css('color','black');	  
	  $('#top10').css('color','#eee');	  
}



</script>

<body onload="top10()" >


  <div class="section" id="section">
  
<!-- -------------------------슬라이더-------------------------------------- -->  
	    <div id="recipettile"><b>HOME</b></div></br></br>
	    
	     <div class="bxslider">
	      <ul id="slider" >
			  <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr5.jfif"/></a></li>
			  <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr4.jfif"/></a></li>	
			  <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr5.jfif"/></a></li>
			  <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr4.jfif"/></a></li>  
		  </ul>
	     </div>

<!-- -------------------------탑서치부분-------------------------------------- -->		    
	    <ul id="searchLine">
	    <li><select name="selectOrder" id="selectOrder">
	                   <option>추천수순</option>
	                   <option>조화수순</option>
	                   <option>최신순</option>
	                </select></li>
	     <li id="top10" onclick="top10()">TOP10</li>
	     <li id="new10" onclick="new10()">NEW10</li>
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
	    
	
<!-- -------------------------레시피 리스트들-------------------------------------- -->	
        
   
	    <div class="recipeList">
	    
   
		         <c:forEach var="data" items="${list}">   
		             <ul id="recipeListul">
		              <li><a href="recipeView?recipenum=${data.recipenum}"><img src="img/cr5.jfif"></a></li>
		              <li><a href="recipeView?recipenum=${data.recipenum}">맛있는 딸기 케이크</a></li>
		              <li>${data.userid}</li>
		              <li><a href="recipeView?recipenum=${data.recipenum}">딸기와 유기농 계란을 이용한 케이크 레시피</a></li>
		              <li>★추천해요 ${data.reciperecommend} 조회수${data.recipehit} {data.recipewritedate}</li>
		            </ul>
		         </c:forEach>  
		           
	
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
