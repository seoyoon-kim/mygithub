<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script>
	function boardDel(no){
		if(confirm("삭제하시겠습니까?")){
			location.href="boardDel?no=${vo.no}";
		}
	} 
	
	//ajax를 이용한 댓글 처리
 	//댓글 등록 클릭->컨트롤러->DAO insert->select로 댓글 목록 전체 List 가져오기
 	$(function(){
 		
 		//댓글 목록 전체 선택
 		function replyList(){ 
 			//서버에 가서 해당 글의 댓글을 선택하여 #replyList에 보여주기
 			var url = "/home/replyList";
 			var params = "no=${vo.no}";
 
 			$.ajax({
 				url:url,
 				data:params,
 				success:function(result){
 					var $result = $(result); //result에 vo가 댓글수만큼 있고 $를 붙여서 변수로 전환
 					
 					var tag = "<h3>댓글보기</h3>";
 						tag += "<ul>";
 					$result.each(function(idx, obj){
 						tag += "<li style='border-bottom:1px solid #ddd;'><div>"+obj.userid +"("+obj.replydate+")";
 						
 						if(obj.userid=="${logId}"){
 							tag += "<input type='button' value='수정'/>";
 							tag += "<input type='button' value='삭제' title='"+obj.num+"'/>";
 						}
 						
 						tag += "<br/>"+obj.content+"</div>";
 						
 						if(obj.userid=="${logId}"){ 
 							//수정폼 만들기
 							tag += "<div style='display:none'>";
 							tag += "<form method='post'>"
 							tag += "<textarea name='content' style='width:500px; height:80px;'>"+obj.content+"</textarea>";
 							tag += "<input type='submit' value='수정하기'/>";
 							tag += "<input type='hidden' name='num' value='"+obj.num+"'/>";
 							tag += "</form></div>"
 						}
 						tag += "</li>";
 					});
 					tag += "</ul>";
 					$("#replyList").html(tag);
 				},error:function(e){
 					console.log('댓글 가져오기 에러'+e.responseText);
 				}
 			});
 		}
 		
 		//댓글쓰기
 		$("#replyWriteBtn").click(function(){ 
 			if($("#content").val()!=''){ 
 			var url = "/home/replyWriteOk"; 
 			var params = $("#replyWriteFrm").serialize();//데이터 no=181&content=작성내용 
 
 			$.ajax({
 				url:url,
 				data:params,
 				success:function(result){
 					replyList();
 					$("#content").val("");
 					console.log("댓글 쓰기 작성 성공->"+result);
 				},error:function(e){
 					console.log("댓글 쓰기 작성 실패"+e.responseText);
 				}
 			});
 			}else{
 				alert("댓글을 입력 후 등록하세요");
 			}
 		});
 		//댓글 수정
 		$(document).on('submit', '#replyList form', function(){
 			var url = "/home/replyEditOk";
 			var params = $(this).serialize(); //or content=090&num=24
 			$.ajax({
 				url:url,
 				data:params,
 				type:"POST",
 				success:function(result){
 					replyList();		
 				}, error:function(){
 					console.log("댓글 수정 에러"+e.responseText);
 				}
 			});
 			
 		});
 		
 		replyList();//글내용보기가 실행되면 댓글이 ajax로 실행된다
 		//수정 버튼 선택시 수정 폼 보여주기
 		$(document).on('click','#replyList input[value=수정]',function(){  
 			$("#replyList>ul>li>div:nth-child(1)").css("display","block");
 			$("#replyList>ul>li>div:nth-child(2)").css("display","none");
 			
 			$(this).parent().css("disply", "none");
 			$(this).parent().next().css("display", "block");
 		});
 		
 		//댓글 삭제하기
 		$(document).on('click', '#replyList input[value=삭제]',function(){
 			if(confirm('댓글을 삭제하시겠습니까?')){
 				var url = "/home/replyDel";
 				var params = "num="+$(this).attr("title");
				
 				$.ajax({
 					url : url,
 					data : params,
 					success:function(){
 						replyList();
 					}, error:function(){
 						console.log("댓글 삭제 실패"+e.responseText);
 					}
 				});
 			}else{
 				
 			}
 		});
 		
 	}); 
 </script> 
<style>
#replyList{margin:50px 200px; border-top:2px solid lightblue; padding-top:20px;}
#replyList>ul>li{list-style-type:none;}
</style>
</head>
<body>
	<div class="container"> 
		<h1>글 내용보기</h1>
		번호 : ${vo.no}<br/>
		작성자 : ${vo.userid}<br/>
		작성일 : ${vo.writedate}, 조회수 : ${vo.hit}<br/>
		제목 : ${vo.subject}<br/>
		내용 : ${vo.content}<br/>
		<c:if test="${logId==vo.userid}">
		<a href="boardEdit?no=${vo.no}">수정</a>
		<a href="javascript:boardDel()">삭제</a>
		</c:if>
		<div id="prevNext"> 
			<c:if test="${dto.step==0}"> 
				<a href="claseView?no=${dto.no-1}"> 이전글 </a><br/> 
			</c:if>
			<c:if test="${dto.step==0} && ${dto.no+1 ne 0}"> 	
				 <a href="claseView?no=${dto.no+1}"> 다음글</a> 
			</c:if>
		</div>
		<div id="prevNext"> 
			이전글 : 
			<c:if test="${vo.nextNo==0}">
				${vo.nextSubject}  
			</c:if>
			<c:if test="${vo.nextNo>0}"> 
				<a href="claseView?no=${vo.nextNo}">${vo.nextSubject}</a>
			</c:if>
			다음글 : 
			<c:if test="${vo.prevNo==0}">
				${vo.prevSubject}  
			</c:if>
			<c:if test="${vo.prevNo>0}"> 
				<a href="claseView?no=${vo.prevNo}">${vo.prevSubject}</a>
			</c:if><br/> 
		</div>
	</div> 
		<!-- 댓글 리스트 -->
 	<div id="replyList"></div> 
</body>
</html>