<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>

/*  기본설정----------------------------------------------                 */

.section{
	width: 1080px;
	background-color: white;
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
	font-size:14px;
	
}


	#cMyPageLeft{
		display: block;
	}


a:active,a:link,a:visited,a:hover{
      text-decoration: none;
      color:black;
   }
   
#section{
font-size:17px;
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

#infoTitle{
float:left;
width:100%;
height:20px;
margin-top:40px;
font-weight:bold;
margin-bottom:40px;
}


.infobtn{
float:left;
margin-bottom:4%;
padding-left:80%;
width:100%;
}


/*  게시판----------------------------------------------                 */


#infolistbox{
width:100%;
float:left;
border-bottom:1px solid #eee;
margin-bottom:40px;
}


.infoListTitle{
float: left;
width: 100%;
border-bottom:2px solid #ddd;
padding-left:0px;
}

.infoList,.innerviewpage{
    float:left;
	width: 100%;
	padding-left:0px;
	margin-bottom:30px;
}


.infoList>li,.infoListTitle>li{
	width: 10%;
	float: left;
	line-height:40px;
	height:40px;
}

.infoListTitle>li:nth-child(5n+1){
width:10%;
margin-left:10%;
}

.infoListTitle>li:nth-child(5n+2){
width:40%;
}

.infoListTitle>li:nth-child(5n+3){
width:15%;
}

.infoListTitle>li:nth-child(5n+4){
width:15%;
}



.infoList>li:nth-child(6n+1){
	width: 10%;
	padding-left:80px;
}

.infoList>li:nth-child(6n+3){
	width: 35%;
}

.infoList>li:nth-child(6n+4){
	width: 20%;
}

.infoList>li:nth-child(6n+6){
	width: 15%;
	text-align:center;
}

/* ------게시판 버튼-----------*/

/*버튼*/
	#infowrbtn,#infodebtn{
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
	#infowrbtn:hover,#infodebtn:hover{
		background: gray;
		color:white;
		display: inline-block;
	}

#infobutton{
       padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
        line-height: 20px;
        height:25px;
}

#infobutton:hover{
background-color:#eee;
color:red;
display: inline-block;
}


.infobtn{
width:100%;
float:left;
margin-bottom:15px;
}
<!-------------------문의보기 팝업창------------------------->
/*표*/
table{
	width:1080px;	
	border-spacing: 0;
	text-indent: initial;
	border-top:2px solid lightgray;
	border-bottom:2px solid lightgray;
}
th, .th{
	display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
  		background-color:#f6f6f6;;
  		/*#fcfcfc*/
}
thead{
	border-bottom: 2px solid #ccc;
    border-top: 2px solid #ccc;
    width:100%;
}
tr{
	display: table-row;
    vertical-align: inherit;
    border-color: inherit;
    height:50px;
}
.td, .content{
	padding-left:20px;
	
}
.content{
	padding: 20px 0 20px;
}
td, .td,{
	height:50px;
}
.tr_head{
	font-weight:bold;
	border-top:2px solid lightgray;
	border-bottom:2px solid lightgray;
}
.tr_head li{
	float:left;
}
.menu, .th{
	width:150px; text-align:center;
}
.td, .th{ line-height:50px; }
.td{
	width:30%; line-height:50px;
}

#intable{
width:100%;
}


<!--문의 작성 팝업------------------------------------------>

#infopopDiv{
float:left;
width:100%;
}

#infoDivcontent{
float:left;
background-color:#eee;
width:100%;

}

#infoDivTitle{
color:black;
background-color:#ddd;
}

#subjectBox{
padding-left:10px;
padding-right:10px;
height:40px;
width:100%;
margin-bottom:40px;

}
#subjectBox>textarea{
padding-left:20px;
padding-right:20px;
width:100%;
height:40px;
border:none;
margin-top:10px;
}

#ContentBox{
padding-left:10px;
padding-right:10px;
height:400px;
width:100%;

}

#ContentBox>textarea{
width:100%;
height:400px;
border:none;
}

#BtnBox{
float:left;
margin-top:5px;
margin-bottom:10px;
width:50%;
padding-left:400px;
}

#selectBox{
float:left;
width:50%;
}

#infowritebtn,#infobackbtn {
    line-height:25px;
	height: 25px;
	width: 60px;
}

#infowritebtn,#infobackbtn{
	color: #666666;
	border-radius: 8px;
	background: #fff;
	box-shadow: 0 0px 3px 0 rgba(0, 0, 0, 0.5);
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border: none;
}

/*버튼*/
#infowritebtn:hover,#infobackbtn:hover {
	background: gray;
	color: white;
	display: inline-block;
}



</style>
<script>

$(function(){
	var popup = $(document)
	var eventX, eventY, divX, divY, moveX, moveY, flag=false;
	function setMoveStart(){
		eventX = event.clientX;
		eventY = event.clientY;
		divX = parseInt()
	}
	
})

</script>
<div class="section" id="section">

 <!-- ----------------문의 상단------------------------ -->
  <div id="infoTitle">*******의 문의내역 입니다.</div>
  
  <div class="infobtn">
  <input type="submit" id="infowrbtn" value="문의 작성"/>
  <input type="submit" id="infodebtn" value="문의 삭제"/>
  </div>
  
 <!-- ----------------게시판------------------------ -->
 
  <div id="infolistbox">
	  <ul class="infoListTitle">
	    <li><b>번호</b></li>
	    <li><b>내용</b></li>
	    <li><b>일시</b></li>
	    <li><b>상태</b></li>
	    <li><b>답변보기</b></li>
	  </ul>	    
	   
	   
	  <ul class="infoList">
	   
	    <li><input type="checkbox" name="boardCheckBox" value=""/></li>
	    <li>123</li>
	    <li><a href="">너무 맛이 없어요</a></li>
	    <li>2020-03-28 13:00</li>
	    <li>확인중</li>
	    <li><input type="button" value="확인하기" id="infobutton"/></li>
	    
	    <li><input type="checkbox" name="boardCheckBox" value=""/></li>
	    <li>123</li>
	    <li><a href="">너무 맛이 없어요</a></li>
	    <li>2020-03-28 13:00</li>
	    <li>확인중</li>
	    <li><input type="button" value="확인하기" id="infobutton"/></li>
	    
	    <li><input type="checkbox" name="boardCheckBox" value=""/></li>
	    <li>123</li>
	    <li><a href="">너무 맛이 없어요</a></li>
	    <li>2020-03-28 13:00</li>
	    <li>확인중</li>
	    <li><input type="button" value="확인하기" id="infobutton"/></li>
	    
	    <li><input type="checkbox" name="boardCheckBox" value=""/></li>
	    <li>123</li>
	    <li><a href="">너무 맛이 없어요</a></li>
	    <li>2020-03-28 13:00</li>
	    <li>답변완료</li>
	    <li><input type="button" value="확인하기" id="infobutton"/></li>
	    
	    
	    <li><input type="checkbox" name="boardCheckBox" value=""/></li>
	    <li>123</li>
	    <li><a href="">너무 맛이 없어요</a></li>
	    <li>2020-03-28 13:00</li>
	    <li>답변완료</li>
	    <li><input type="button" value="확인하기" id="infobutton"/></li>
	    
	  </ul>
  </div>
  
  
  
  
  <!-- -----------------문의 보기 --------------------------- -->

			<table id="intable">
				<tbody>
					<tr class="tr_head">
						<th class="menu">번호</th>
						<td><span class="td">123</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">일시</th>
						<td ><span class="td">2020.3.25</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">상태</th>
						<td ><span class="td">답변완료</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">글제목</th>
						<td><span class="td">너무 맛이 없어요</span></td>
					</tr>		
					<tr>
						<td colspan="2">
							<span class="infocontent" >너무 맛이 없어요!!.. 이렇게 맛이없나요?</span>
						</td>	
					</tr>
					<tr style="border-top:3px solid #ddd; border-bottom:3px solid #ddd;">
						<td colspan="2">
							<span class="inforeply" >문의 답변이 입력되는곳</span>
						</td>	
					</tr>
				</tbody>
				
			</table>
		</fieldset>
		<c:if test="${logId==vo.userid}">
			<a href="">수정</a>
			<a href="">삭제</a>
		</c:if>
 <!-- -----------------문의 작성 팝업 --------------------------- -->
 
 		<div id="infopopDiv">
			
				
				<div id="infoDivTitle">문의작성하기<span style="float:right;text-align:right;margin-right:10px;font-size:30px;line-height:30px;">&times;</span></div>
				<div id="infoDivcontent">
					<div id="subjectBox"><textarea>제목을 입력해 주세요</textarea></div>
					
					<div id="ContentBox"><textarea></textarea></div>
					<div id="selectBox">
							<input type="radio" name="lockbtn" value="unlock" checked/>공개
		                    <input type="radio" name="lockbtn" value="lock"/>비공개
					</div>	
					<div id="BtnBox">
					       <input type="button" id="infowritebtn" value="작성" checked/>
		                   <input type="button" id="infobackbtn" value="취소"/>
					</div>	<!-- BtnBox -->
				</div>	<!-- infoDivcontent -->
			
		</div>    <!-- infopopDiv -->
  
  
  
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
