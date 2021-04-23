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
<script>


</script>

</head>
<style>

#searchBtn{
top:0px;
left:0px;
}

.section{
	width: 1080px;
	background-color: white;
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
	
}

/*--------------------게시판+타이틀---------------------------*/


.wishListTitle{
width: 100%;
border-bottom:2px solid #ddd;
margin-top:3%;
}

.wishList{
	width: 100%;
}

.wishListTitle>li{
float: left;
line-height:40px;
}

.wishListTitle>li:nth-child(4n+1){
width:45%;
text-align:center;
}

.wishListTitle>li:nth-child(4n+2){
width:10%;
}

.wishListTitle>li:nth-child(4n+3){
width:5%;
}

.wishListTitle>li:nth-child(4n+4){
text-align:center;
width:40%;
}

/*--------------------게시판 리스트들---------------------------*/


.wishList{
margin-left:2%;
}

.wishList>li{
	float:left;
	height:60px;
	width:10%;
	line-height:60px;
	
}

.wishList>li:nth-child(7n+1){
 width:15%;
 
}



.wishList>li:nth-child(7n+2){
 width:30%;

}


.wishList>li:nth-child(7n+4){
 width:20%;

}


.wishList>li:nth-child(7n+7){
 width:5%; 

}


.wishList>li>img{
width:50px;
border-radius:5px;
}

/*--------------------게시판 버튼들---------------------------*/

#nogetbutton{
line-height:20px;
float:right;
border:1px solid #ddd;
}

#getbutton,#getAllbutton{
line-height:30px;
border-radius:10px;
border:1px solid #ddd;
}

#wishCenterButton{
text-align:center;
}

#wishPriceTitle{
float:right;
}

</style>




<body>
<div class="section">
   <!-- 큰제목 ---------------------------------------------->
   
   <b> <h3>*********의 장바구니 입니다.</h3></b>
   
   <input type="button" value="선택상품제거" id="nogetbutton"/>

<!-- ----------------게시판------------------------ -->
  <div class="wishlistbox">
  
	  <ul class="wishListTitle"> 	   
	    <li><b>상품</b></li>
	    <li><b>판매가</b></li>
	    <li><b>수량</b></li>
	    <li><b>구매가격</b></li>	   
	  </ul>	    
	   
	   
	  <ul class="wishList">
	    <li><img src="img/cr3.jfif"></li>
	    <li>맛있는오렌지</li>
	    <li>17,900</li>
	    <li>
	      <select name="selectwish">
	                   <option>1</option>
	                   <option>2</option>
	                   <option>3</option>	                  
	       </select>
	    </li>
	    <li>17,900</li>	    
	    <li><input type="button" value="구매하기" id="getbutton"/></li>
	    <li><input type="checkbox" name="boardCheckBox" value=""/></li>
	    
	    
	    <li><img src="img/cr3.jfif"></li>
	    <li>맛있는오렌지</li>
	    <li>17,900</li>
	    <li>
	      <select name="selectwish">
	                   <option>1</option>
	                   <option>2</option>
	                   <option>3</option>	                  
	       </select>
	    </li>
	    <li>17,900</li>	    
	    <li><input type="button" value="구매하기" id="getbutton"/></li>
	    <li><input type="checkbox" name="boardCheckBox" value=""/></li>

	  </ul>
  </div>

<!-- ----------------게시판 밑에 버튼------------------------ -->

<div id="wishCenterButton">
<input type="button" value="선택주문" id="getbutton"/>
<input type="button" value="전체주문" id="getAllbutton"/>
</div>

<!-- ----------------게시판 밑에 총가격------------------------ -->

<div id="wishPriceTitle">
<h4>장바구니 현재 금액</h4>
<h2 style="color:red;"><b>29,960</b></h2>
</div>















<div style="clear:both;"></div>

</div>
</body>
</html>