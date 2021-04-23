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
/*  기본설정----------------------------------------------                 */
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

/* 전체설정----------------------------------------------                 */


ul>li {
	list-style-type: none;
}

#reciList, #recivb, #reciContenView {
	padding: 0px;
	margin: 0px;
}

/*  큰제목----------------------------------------------                 */

#recit {
	width: 300px;
	padding: 0px;
	margin: 0px;
	color:rgb(224,102,102);
}

/*  게시글 리스트----------------------------------------------                 */

#reciList {
	width: 100%;
	margin-bottom: 5%;
}

#reciList>li {
	width: 10%;
	float: left;
	border-bottom: 1px solid #ddd;
}

#reciList>li:nth-child(6n+2) {
	width: 50%;
}

/*  글안에 내용----------------------------------------------                 */

#reciContenView {
	width: 100%;
	height:40px;
	background-color:#eee;
}

#reciContenView>li {
	width: 10%;
	float: left;
	line-height:40px;
}

#reciContenView>li:nth-child(6n+2) {
	width: 50%;
}

/*  해당 게시글 보기----------------------------------------------                 */

#rcontent {
	float: left;
	padding: 5%;
	width: 100%;
	background-color: #EBDFE2;
}


/*  하단표시----------------------------------------------                 */

#recivb {
	width: 100%;
	margin-bottom: 10%;
}

#recivb>li {
	width: 2%;
	float: left;
	line-height:20px;
}

#recivb>li:nth-child(6n+1) {
	width: 10%;
}

#recivb>li:nth-child(6n+2) {
	width: 82%;
}

#recivb>li>img{
 width:20px;
}


/*  검색표시----------------------------------------------                 */

#searchbox {
	text-align: center;
}


</style>

<body>

<div class="section">

    <!-- ------------------------큰제목----------------------------------- -->
      <h5 id="recit" ><b>레시피</b></h5>
     <!-- ------------------------게시글 리스트----------------------------------- -->  
      <div id="slist">
        
        <select name="selectOrder" style="float:right">
	                   <option>최신순</option>
	                   <option>추천순</option>
	                   <option>조회수순</option>	                  
	    </select><br/>   
	    <hr/> 
	     
	      <ul id="reciList">
		         <li><b>번호</b></li>
		         <li><b>제목</b></li>
		         <li><b>작성자</b></li> 
		         <li><b>추천수</b></li>
		         <li><b>조회수</b></li>
		         <li><b>작성일</b></li>  
		         
		         <li>123</li>
		         <li>맛있는 요리!</li>
		         <li>작성자</li> 
		         <li>50</li>
		         <li>72</li>
		         <li>2020.01.23</li>
		         
		         <li>123</li>
		         <li>맛있는 요리!</li>
		         <li>작성자</li> 
		         <li>50</li>
		         <li>72</li>
		         <li>2020.01.23</li>    
		         
		         <li>123</li>
		         <li>맛있는 요리!</li>
		         <li>작성자</li> 
		         <li>50</li>
		         <li>72</li>
		         <li>2020.01.23</li>      
	
		    <!--    <c:forEach var="data" items="${list}">    --> 
		         <li>${data.recipenum}</li>
		         <li><a href="">${data.recipetitle}</a></li>
		         <li>${data.userid}</li> 
		         <li>${data.reciperecommend}</li>
		         <li>${data.recipehit}</li>
		         <li>${data.recipewritedate}</li> 	
		    <!--   </c:forEach>        -->
	     
	      </ul>      
	     
	      
	    
	      
	   </div>   
	   
	   
	   
	<!-- -----------------------------페이지 표시----------------------------------------- --> 
	   
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
	      
	<!-- ------------------------게시글 보기----------------------------------- -->     
	  

	  <ul id="reciContenView">
	  <li>번호:${vo.recipenum}</li>
	  <li>제목:${vo.recipetitle}</li>
	  <li>작성자:${vo.userid}</li>
	  <li>추천수:${vo.reciperecommend}</li>
	  <li>조회수:${vo.recipehit}</li> 
	  <li>작성일:${vo.recipewritedate}</li>
	  </ul>

	  
	  <div id="rcontent">글내용 :  
			  베트남 피자 반짱느엉 만들기
		
		돼지고기 볶아주기 갈은 돼지고기에 소금과 후추 마늘을 넣고 볶아주세요.
		
		돼지고기, 옥수수, 건새우 계란 섞기 ...
		
		라이스페이퍼 위에 2의 재료 올리고 굽기 ...
		
		파 올려주기 ...
		
		칠리소스 뿌리기 ...
		
		치즈 올려주기 ...
		
		라이스페이서 반으로 접어주기
		
		 베트남 피자 반짱느엉 만들기
		
		돼지고기 볶아주기 갈은 돼지고기에 소금과 후추 마늘을 넣고 볶아주세요.
		
		돼지고기, 옥수수, 건새우 계란 섞기 ...
		
		라이스페이퍼 위에 2의 재료 올리고 굽기 ...
		
		파 올려주기 ...
		
		칠리소스 뿌리기 ...
		
		치즈 올려주기 ...
		
		라이스페이서 반으로 접어주기
		
		 베트남 피자 반짱느엉 만들기
		
		돼지고기 볶아주기 갈은 돼지고기에 소금과 후추 마늘을 넣고 볶아주세요.
		
		돼지고기, 옥수수, 건새우 계란 섞기 ...
		
		라이스페이퍼 위에 2의 재료 올리고 굽기 ...
		
		파 올려주기 ...
		
		칠리소스 뿌리기 ...
		
		치즈 올려주기 ...
		
		라이스페이서 반으로 접어주기
		
	  
		
	   </div>
	    <c:if test="${logId==vo.userid}">  
		   <a href="">수정</a>
		   <a href="">삭제</a>
		</c:if>
	  
	  
	<!-- ------------------------하단 표시들----------------------------------- --> 
	  <ul id="recivb">
	  <li>추천해요</li>
	  <li>레시피즐겨찾기</li>
	  <li><img src="img/cicon01.png"></li>
	  <li><img src="img/cicon02.png"></li>
	  <li><img src="img/cicon03.png"></li>
	  <li><img src="img/cicon02.png"></li>
	  </ul>
	  
	  
	 <!-- ------------------------검색 기능----------------------------------- -->  
	 <div id="searchbox">
	  <input type="text" name="search" placeholder="검색어를 입력하세요"/>
	  <input type="submit" value="Search"/>
	 </div> 
	  





</div>
</body>
</html>