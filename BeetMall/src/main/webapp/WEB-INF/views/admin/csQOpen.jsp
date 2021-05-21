<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/inc/top.jspf" %> 
 
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 
<style>
	#mypageMenubar{
		display:block;
	} 
	a:hover, a:active, a:visited, a:link {
   		color: black;
    }
    a{
    	color:black;
    }
	answer_line{
		width:100%; 	
		background-color:#f6f6f6; 
		height:20px; 
	}
	#qmtitle, select{border:none;}
	#qmtitle{width:300px; color:lightgray;}
	#qmtitle{width:500px}
	.write_btn{width:150px; margin-left:20px;}
	a{color:black;}
  	/*왼쪽 메뉴바*/
  	label{
  		margin-bottom:0;
  		display:block;
  	}
  	/*제목 바*/
  	#topBar{ 
	  	position:absolute;
	  	top:200px;
	  	left:-25px;
	  	font-size:20px;
	  	color:white;
  	}
  	#topBar strong{
  		padding-left:355px;
  	}
  	input{
  		border:none;
  		font-weight:normal;
  	}
   /*표*/
   form{
	   	position:absolute;
	   	top:-95px;
	   	left:210px;
	   	width:1351px;
   }
   .menu{
   		text-align:center;
   }
   th, .th{
   		background-color:#E9E9E9;
	}
	.td, form input{
	  background-color:#F8F7F7;
	} 
	table{
		width:1080px;	
		border-spacing: 0;
		text-indent: initial;	
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
		font-size:15px;
	}
	th, .th{
		height:40px;
		font-size:15px;
		width:80px; text-align:center;
		display: table-cell;
	    vertical-align: inherit;
	    font-weight: bold;
	    text-align: -internal-center; 
	}
	th:not(#smallTitle){
	    border-right:1px solid lightgray;
	}
	#smallTitle{
		text-align:center;
	}
	thead, .answer_content, .td{
		border-bottom: 1px solid #ccc;
	    border-top: 1px solid #ccc;
	    width:100%;
	}
	tr{
		display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	    height:40px;
	    border-bottom:1px solid lightgray;
	}
	.td, .qmcontent{
		padding-left:20px;
		
	}
	.qmcontent{
		margin: 20px 0 20px;
	}
	td, .td{
		height:40px;
	}
	.tr_head{
		font-weight:bold;
	}
	.tr_head li{
		float:left;
	}
	.td, .th{ line-height:40px;}
	.td{
		width:30%; line-height:40px; 
	} 
	.td{
		width:0;
	}
	#bottommm{ 
		margin : 1771px 0 40px 0 ;  
		display:flex;
		top:20px;
	}
	#bottommm>input{
		border:1px solid gray;
		width:150px;
	}
	.write_btn{
		height:40px;
	}   
	input[type="submit"].btn:hover, input[type="button"].btn:hover, input[type="reset"].btn:hover{
   	  background: #b3b3b3 !important;
	  color:white;
	  display: inline-block;
	  outline: 0;
	} 
	#file-upload-button{
		height:28px;
	}
	#qContent, #aContent{
		font-weight:normal; 
		height:300px;
		padding:15px;
	}  
	.empty{
		height:25px;
	}
</style> 
	<div id="topBarContainer">
		<div id="topBar">
			<strong><a href="csQOpen">상품 문의 보기</a></strong> 
		</div>
	</div>	
<div id="body1"> 
<%@ include file="/inc/leftBar.jspf" %> 
<div class="container">
	<div id="box"> 	
	<form method="post" action="noticeWriteOk">
		<table>
			<tbody> 
				<tr class="tr_head">
					<th class="menu" >문의 번호</th>
					<td class="td" colspan="3">
						<div id="qNum">
							${vo.qnum }
						</div>
					</td>
				</tr>
				<tr class="tr_head">
					<th class="menu" >아이디</th>
					<td class="td" colspan="3">
						<div id="writer">
							${vo.custom }
						</div>
					</td>
				</tr>
				<tr class="tr_head">
					<th class="menu">제목</th>
					<td  class="td">
						<div id="qTitle">
							${vo.qtitle }
						</div>	
					</td>
				</tr>
				<tr class="tr_head">
					<th class="menu">등록일</th>
					<td  class="td">
						<div id="writedate">
							${vo.qwritedate }
						</div>
					</td>
				</tr>  
				<tr class="tr_head">
					<th class="menu">소비자 문의 내용</th> 
					<td colspan="4" style="background-color:white;">
						<div id="qContent" style="overflow: auto;">
							${vo.qcontent }
						</div>
					</td>
				</tr> 
				<tr class="empty">
					<th class="empty" colspan="4" style="background-color:white; border-right:white 1px solid"></th>
				</tr> 
			 			
				<!-- 판매자 답변 -->
				<tr>
					<th id="smallTitle" colspan="4">판매자 답변</th>
				</tr>
				<tr class="tr_head">
					<th class="menu" >아이디</th>
					<td class="td" colspan="3">
						<div id="writer">
							${vo.seller }
						</div>
					</td>
				</tr>
				<tr class="tr_head">
					<th class="menu">등록일</th>
					<td  class="td">
						<div id="writedate">
							<c:if test="${vo.qanswerdate== null}">
								테스트용이라서 없습니다
							</c:if>
							<c:if test="${vo.qanswerdate != null}">
								${vo.qanswerdate}
							</c:if>
						</div>
					</td>
				</tr> 
				<tr class="tr_head">
					<th class="menu">판매자 답변 내용</th> 
					<td colspan="4" style="background-color:white;">
						<div id="aContent" style="overflow: auto;">
							<c:if test="${vo.qanswer==null }">
							 	답변 대기중입니다.
							</c:if>
							<c:if test="${vo.qanswer!=null }">
							 	${vo.qanswer }
							</c:if>
						</div>
					</td>
				</tr> 
				<tr class="empty">
					<th class="empty" colspan="4" style="background-color:white; border-right:white 1px solid"></th>
				</tr> 
				<!-- 관리자 답변 -->
				<tr style="display: none;">
					<th id="smallTitle" colspan="4">답변 작성</th>
				</tr>
				<tr class="tr_head" style="display: none;">
					<th class="menu">등록일</th>
					<td  class="td">
						<div id="writedate">
							21/04/21
						</div>
					</td>
				</tr> 
				<tr style="display: none;">
					<td class="question_content" colspan="4">
						<textarea id="qmcontent" name="qmcontent" class="summernote" placeholder="답변내용을 입력해주세요."></textarea>
					</td>	
				</tr>
			</tbody>
		</table>
			<div id="bottommm" style="display: none;">
				<input type="submit" value="작성하기" class="btn write_btn" id="write_btn" style="visibility: hidden;"/>	
				<input type="reset" value="다시쓰기" class="btn write_btn" id="reset_btn" style="visibility: hidden;"/>
				<input type="button" value="취소" class="btn write_btn" id="cancel_btn" onClick="location.href='javascript:history.back()'" style="visibility: hidden;"/>
							
			</div>
		</form>
		</div>
</div>
</div> 
<style>
	table {
	    width: 1080px;
	    border-spacing: 0;
	    text-indent: initial;
	    border-top: 2px solid lightgray;
	    border-bottom: 2px solid lightgray;
	    font-size: 15px;
	    position: absolute;
	    top: 140px;
	    /* height: 3000px; */
	}
</style>