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
/*  기본설정----------------------------------------------                 */
#deliverinfoBox{
width:100%;
float:left;
}
#title1{

}

</style>


<body>

<div class="section">

    <div id="payBox">
        <div id="deliverinfoBox">
           <div id="title1">배송지정보</div>
              <ul>
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
           <div>배송요청사항</div>
           <div><input type="text" name="deliverMsg" id="deliverMsg"/></div>
        </div>
        
        
        <div id="productBox">
           <div>구매상품</div>
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
