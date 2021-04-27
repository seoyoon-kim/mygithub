<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

</head>
<style>

/*  기본설정----------------------------------------------                 */
.section{
	width: 1080px;
	background-color: white;
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
	
}
#section{
font-size:17px;
}

/*  기본설정----------------------------------------------                 */
#deliverinfoBox{
width:100%;
float:left;
}

#title1,#title2,#title3{
float:left;
width:100%;
height:30px;
border-bottom:1px solid #ddd;
margin-top:40px;
margin-bottom:40px;
padding-left:10px;
}
/*  배송지정보----------------------------------------------                 */

#infoul{
width:100%;
float:left;
padding-left:10px;
height:500px;
}

#infoul>li:nth-child(14n+1){
float:left;
width:200px;
}

#infoul>li:nth-child(14n+2),#infoul>li:nth-child(14n+2)>input{
float:left;
width:300px;
}

</style>


<body>

<div class="section" id="section">

    <div id="payBox">
        <div id="deliverinfoBox">
           <div id="title1">배송지정보</div>
              <ul id="infoul">
	               <li>배송지명</li>   <li><input type="text" name="adrr2" id="adrr2"/></li>
	               <li>받는분</li>    <li><input type="text" name="adrr2" id="adrr2"/></li>  <li><input type="checkbox" name="boardCheckBox" value=""/></li>
	               <li>휴대폰</li>    <li></li>
	               <li>주소</li>     <li><input type="button" value="주소검색"></li> <li><input type="text" name="adrrnum" id="adrrnum"/></li>
	                                <li><input type="text" name="adrr1" id="adrr1"/></li>
	                                <li><input type="text" name="adrr2" id="adrr2"/></li>
	               <li>배송방법</li>  <li></li>
              </ul>
         </div>
        
        
        <div id="deliveraskBox">
           <div id="title2">배송요청사항</div>
           <div><input type="text" name="deliverMsg" id="deliverMsg"/></div>
        </div>
        
        
        <div id="productBox">
           <div id="title3">구매상품</div>
           <ul>
              <li>상품</li>
              <li>판매가</li>
              <li>수량</li>
              <li>구매가격</li>         
           </ul>
           
           <ul>
              <li><img src="img/cr4.jfif"> <div>맛있는사과</div> <div>맛있는 사과 설명입니다. 사과는 사과 사과 아작아작</div></li>
              <li>17,980원</li>
              <li>1</li>
              <li>17,980원</li>         
           </ul>
           
           
        </div>
           

    </div>

</div>

<div style="clear:both;"></div>
