<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!-- font-family: 'Nanum Gothic', sans-serif; -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- font-family: 'NanumSquare', sans-serif !important; -->
<style>

/*  기본설정----------------------------------------------                 */
a:hover, a:active, a:visited, a:link {
    text-decoration: none;
    color: black;
}

#main {
	font-size: 20px;
}

.section {
	width: 1080px;
	margin: 0 auto;
}

#searchBtn {
	top: 0px;
	left: 0px;
}

#cMyPageLeft {
	display: block;
}

 .wrapTitle{
	   margin-top: 30px;
	   height: 30px;
	   line-height: 30px;
	   /* color: #fff; */
	   color:black;
	   font-weight:bold;
	   font-size:1em;
	   text-indent: 0.4em;
	   /* background-color: rgb(224,102,102); */
	   margin-bottom:30px;
	}

/* ------------------페이징처리부분-------------------- */
.page_wrap {
	text-align: center;
	font-size: 0;
	padding-bottom: 30px;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 35px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat
		center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat
		center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat
		center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat
		center center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

/* ---------------페이징 처리끝-------------------- */
/*--------------상단 메뉴바들-------------------->*/
#recitb {
	height: 30px;
	margin-left:50px;
    margin-top: 50px;
}

#reciTitle {
	width: 100%;
	color: rgb(252, 118, 45);
	margin-top: 10px;
	margin-bottom: 15px;
	font-size: 1em;
	height: auto;
	
}

#myrecipeTop {
	float: left;
	width: 970px;
}

#myrecipeTop2 {
	float: left;
	width: 60px;
}

#myrecipeTop2>li,#myrecipeTop2>input {
	padding-right: 10px;
}

/*------------------------하단 게시판메뉴-----------------------------------*/
#recimainbox,#recimainbox2 {
	float: left;
	width: 100%;
	padding-left: 10px;
	margin-left:50px;
	margin-top:20px;
}

#recipebox,#recipebox2{
	padding-top: 10px;
	padding-bottom: 10px;
	width: 30%;
	float: left;
}

#recipebox2>ul{
float:left;
}

#recipebox>ul>li>a>img,#recipebox2>ul>li>a>img{
	width: 270px;
	height: 170px;
	border-radius: 3px;
}

#recipebox>ul>li:nth-child(5n+1),#recipebox2>ul>li:nth-child(5n+1){
	width: 100%;
}

#recipebox>ul>li:nth-child(5n+2),#recipebox2>ul>li:nth-child(5n+2){
	width: 100%;
	font-weight: bold;
	margin-top: 5px;
}

#recipebox>ul>li:nth-child(5n+3),#recipebox2>ul>li:nth-child(5n+3){
	width: 100%;
}

#recipebox>ul>li:nth-child(5n+4),#recipebox2>ul>li:nth-child(5n+4){
	width: 80%;
	font-size: 0.5em;
}

#recipebox>ul>li:nth-child(5n+5),#recipebox2>ul>li:nth-child(5n+5){
	width: 10%;
}

/*-------------------------------------------*/
/*버튼*/
#myrbtn, #goodrbtn {
	padding: 3px 10px;
	color: #666666;
	border-radius: 5px;
	background: #fff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border: none;
}

#norebtnmy,#norebtnkeep{
	padding: 3px 10px;
	color: #fff;
	border-radius: 5px;
	background: gray;
	text-decoration: none;
	display: inline-block;
	border: none;
	height: 25px;
	font-size: 0.5em;
}

/*버튼*/
#myrbtn:hover, #goodrbtn:hover {
	background: gray;
	color: white;
	display: inline-block;
}

#myrbtn:active, #goodrbtn:active {
	background: gray;
	color: white;
	display: inline-block;
}
</style>
<script>

$(document).ready(function logno(){
	if(${logId==null}){
		if(confirm("로그인후 이용해주세요")){
			location.href="login"
		}
	}
});
	
////////////////로그인 했는지 체크/////////내가쓴 레시피///////////////


	 
$(document).ready(function(){		  
	  $("#myrbtn").click(function(){
		   $("#recimainbox").show()
		   $("#recimainbox2").hide()
		   $("#myrbtn").css("background-color","#eee")
		   $("#goodrbtn").css("background-color","#fff")
		   
		   	var btnchange1="<input type='button' id='norebtnmy' value='선택제거' />"
		    document.getElementById("norebtnli").innerHTML=btnchange1;
	
	  })
	  
});
	  
//////////////장바구니 레시피////////////	  
$(document).ready(function(){
	  $("#goodrbtn").click(function(){
		  
		   $("#recimainbox").hide()
		   $("#recimainbox2").show()
		   $("#myrbtn").css("background-color","#fff")
		   $("#goodrbtn").css("background-color","#eee")
		   
		   var btnchange2="<input type='button' id='norebtnkeep' value='즐겨찾기제거' />"
		   document.getElementById("norebtnli").innerHTML=btnchange2;
		   	
		
		var url = "customMyrecipe2";		
		var data2= "id=${logId}";
		console.log(url,data2);
		
		
		$.ajax({
			url:url,
			data:data2,
			success:function(result){
				   
				   var $result=$(result);
				  
				    
				   $result.each(function(idx,data2){
   
					   $("#recimainbox2").append(							   
							   "<div id='recipebox2'><ul><li><a href='recipeView?recipenum="+data2.recipenum+"&id=${logId}'><img src='img/"+data2.recipemainimg+"'id='rtitleImg'/></a></li>"+
					           "<li><a href='recipeView?recipenum="+data2.recipenum+"&id=${logId}'>"+data2.recipetitle+"</a></li>"+   
					           "<li>"+data2.userid+"</li>"+
							   "<li>추천수("+data2.reciperecommend+")  조회수"+data2.recipehit+"</li>"+
							   "<li><input type='checkbox' name='recipeCheckBox' id='myrcheck2' value='recipenum="+data2.recipenum+"' /></li><ul></div>"		   
					   );
					   
				   });				  
				
				
	},error:function(e){
	console.log(e.responseText);
	console.log("장바구니 불러오기 실패");
			}
		})
		  

	  })

 });	
     
 ///////////내가쓴 레시피 제거/////////////// 
$(document).ready(function(){	
        $('#norebtnmy').click(function () {

          //var check = $('input:checkbox[id="#myrcheck"]').is(':checked');

          
         
          
  		  var url = "recipeDelete";		
		  var data = $('#myrcheck1').val();
			console.log(url,data);
			$.ajax({
				url:url,
				data:data,
				success:function(result){
					console.log('내가쓴 레시피 삭제 성공');
					
					
				},error:function(e){
					console.log(e.responseText);
					console.log("내가쓴 레시피 삭제 실패");
				}
			})
          
          
        });
    });
 
 /////////////장바구니 레시피 제거////////////
/*
        $('#norebtnkeep').click(function () {

          //var check = $('input:checkbox[id="#myrcheck"]').is(':checked');
         
  		  var url = "recikeepDelete";		
		  var  = $('#myrcheck2').val();
		  
			console.log(url,data);
			$.ajax({
				url:url,
				data:data,
				success:function(result){
					console.log('내가 담은 레시피 삭제 성공');
					
					
				},error:function(e){
					console.log(e.responseText);
					console.log("내가 담은 레시피 삭제 실패");
				}
			})
          
          
        });
  */ 
 
  
</script>

<body>
	<div class="section" id="main" >
		
			<div id="reciTitle">
				<div class="wrapTitle">${logId}님의 마이레시피 내역입니다.</div>				
			</div>

			<!--------------상단 메뉴바들-------------------->
			<div id="recitb">
				<div id="myrecipeTop">
					<input type="button" id="myrbtn" value="나의 레시피" /> <input
						type="button" id="goodrbtn" value="즐겨찾기 레시피" />
				</div>
				<ul id="myrecipeTop2">
					<li id="norebtnli"><input type="button" id="norebtnmy" value="선택제거" /></li>
					<li></li>
				</ul>
			</div>
		
		<!--------------마이레시피 게시판 이미지들-------------------->
		
		
		<div id="recimainbox" >
		   <c:forEach var="data" items="${list}">
		     
					<div id="recipebox">
					      
									<ul>
										<li><a href="recipeView?recipenum=${data.recipenum}&id=${logId}"><img src="img/${data.recipemainimg}" id="rtitleImg"/></a></li>
										<li><a href="recipeView?recipenum=${data.recipenum}&id=${logId}">${data.recipetitle}</a></li>
										<li>${data.userid}</li>
										<li>추천수(${data.reciperecommend}) 조회수 ${data.recipehit}</li>
										<li><input type="checkbox" name="recipeCheckBox" id="myrcheck1" value="recipenum=${data.recipenum}&id=${logId}" /></li>
									</ul>
						  
					</div> 
			 
			</c:forEach>
        
		</div>
		
		<!--------------즐겨찾기 게시판 이미지들-------------------->
	    <div id="recimainbox2" style="display:none">
	    
	
		   
		    
			
			
        
		</div>
		<!--------------페이징 표시-------------------->


		<div class="page_wrap">
			<div class="page_nation">
				<a class="arrow pprev" href="#"></a> <a class="arrow prev" href="#"></a>
				<a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a>
				<a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a>
				<a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a
					class="arrow next" href="#"></a> <a class="arrow nnext" href="#"></a>
			</div>
		</div>







	</div>