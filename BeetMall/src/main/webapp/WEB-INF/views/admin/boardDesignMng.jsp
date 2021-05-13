<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/top.jspf" %>
<%@ include file="/inc/leftBar.jspf" %> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1"/>
 
  
 
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

 <!-- css파일 -->
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin.css" type="text/css"> 
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin_2.css" type="text/css">
<style> 
	#contentBox {
		height:4400px;
	}
	/*컨테이너 공통*/
	#randomBox, #bannerContainer, #todayContainer{ 
		position:relative;
	 	width:1000px;
	 	height:300px;     
	 }  
	 .addBtn{
	 	border-color:gray;
	 	color:dimgray;
	 }
	.delBtn{
		border-color:lightgray;
		color:gray;
	}
	/*배너 이미지*/
	#bannerContainer{ 	
	 	height:360px;
	}
	/*페이징 이미지 링크*/
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
	
	   .bottommm>input{
	  	background-color:#eee;
	  	height:30px;
	  	border:1px solid lightgray;
	  	width:100px; 
	  }
	/*=================css 파일이 안먹어서 임시로 쓰는 곳. css 중복으로 먹으면 지우기====*/
 	  
</style>
<script>
$(document).ready(function(){ 
	/*이미지 파일명 추출*/
	  var fileTarget = $('#file'); 
	  fileTarget.on('change', function(){ // 값이 변경되면
		  if(window.FileReader){ //modern browser
			  var filename = $(this)[0].files[0].name; 
		  } else { // old IE 
	        	var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
	        } 
	        // 추출한 파일명 삽입 
	        $(this).siblings('.uploadFile').val(filename); 
	    });  
});

	/*섬머노트*/
	$(document).ready(function() {
	  $('.summernote').summernote({
		  height: 300,                  
		  focus: true,
		  callbacks: {	//이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				},
				onPaste: function (e) {
					var clipboardData = e.originalEvent.clipboardData;
					if (clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
			}
	  });
	});
</script>  
<div id="body1">
<div id="container">
		<div id="topBar">			
			<h5><strong>디자인 관리</strong></h5>			
		</div>  
		<div id="contentBox">  
		<!----------------------- 랜덤룰렛 파트 ------------------>
	   		<div id="randomBox">
		 	<div id="randomTitle"><div>랜덤룰렛</div></div>
		 		<ul class="randomUl">
		 			<li><div >
							<label for="file" class="attach"> 
								이미지 첨부하기
							</label>
							<input type="file" style="width: 500px;" id="file">
							<input class="uploadFile" value="" placeholder="이미지 파일만 업로드하세요">
						</div>
					</li> 
					<li><input type="text" value="" placeholder="링크 입력"/></li> 
					<li><button class="success addBtn" value="" name="" >추가</button></li> 
					<li><button class="success delBtn" value="" name="" >삭제</button></li> 
		 		</ul>
		 		<ul class="randomUl">
		 			<li><div >
							<label for="file" class="attach"> 
								이미지 첨부하기
							</label>
							<input type="file" style="width: 500px;" id="file">
							<input class="uploadFile"  value="" placeholder="이미지 파일만 업로드하세요">
						</div>
					</li> 
					<li><input type="text" value="" placeholder="링크 입력"/></li> 
					<li><button class="success addBtn" value="" name="" >추가</button></li> 
					<li><button class="success delBtn" value="" name="" >삭제</button></li> 
		 		</ul>
		 		<ul class="randomUl">
		 			<li><div >
							<label for="file" class="attach"> 
								이미지 첨부하기
							</label>
							<input type="file" style="width: 500px;" id="file">
							<input class="uploadFile"  value="" placeholder="이미지 파일만 업로드하세요">
						</div>
					</li> 
					<li><input type="text" value="" placeholder="링크 입력"/></li> 
					<li><button class="success addBtn" value="" name="" >추가</button></li> 
					<li><button class="success delBtn" value="" name="" >삭제</button></li> 
		 		</ul>
		 		<ul class="randomUl">
		 			<li><div >
							<label for="file" class="attach"> 
								이미지 첨부하기
							</label>
							<input type="file" style="width: 500px;" id="file">
							<input class="uploadFile"  value="" placeholder="이미지 파일만 업로드하세요">
						</div>
					</li> 
					<li><input type="text" value="" placeholder="링크 입력"/></li> 
					<li><button class="success addBtn" value="" name="" >추가</button></li> 
					<li><button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 		</ul> 
		 	</div>
		 	
		 	<!----------------- 배너 이미지 파트 ------------------>
	   		<div id="bannerContainer">
			 	<div id="bannerTitle"><p>배너 이미지</p></div> 	
			 	<section id="bannerBox">	
			 		<ul>
			 			<li>
			 				<div class="bannerImg">
			 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
			 				</div>
			 			</li>
			 			<li><button class="success addBtn" value="" name="" >추가</button>
						<button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 				<li><input type="text" placeholder="링크 입력"></li>
			 		</ul>	
			 		<ul>
			 			<li>
			 				<div class="bannerImg">
			 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
			 				</div>
			 			</li>
			 			<li><button class="success addBtn" value="" name="" >추가</button>
						<button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 				<li><input type="text" placeholder="링크 입력"></li>
			 		</ul>	
			 		<ul>
			 			<li>
			 				<div class="bannerImg">
			 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
			 				</div>
			 			</li>
			 			<li><button class="success addBtn" value="" name="" >추가</button>
						<button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 				<li><input type="text" placeholder="링크 입력"></li>
			 		</ul>	
			 		<ul>
			 			<li>
			 				<div class="bannerImg">
			 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
			 				</div>
			 			</li>
			 			<li><button class="success addBtn" value="" name="" >추가</button>
						<button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 				<li><input type="text" placeholder="링크 입력"></li>
			 		</ul>	
			 		<ul>
			 			<li>
			 				<div class="bannerImg">
			 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
			 				</div>
			 			</li>
			 			<li><button class="success addBtn" value="" name="" >추가</button>
						<button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 				<li><input type="text" placeholder="링크 입력"></li>
			 		</ul>		
				</section> 	 
		 	</div> 
		 	
		 	<!------------- 오늘의 상품 파트 --------------->
		 	<div id="todayContainer">
			 	<div id="todayHeader">오늘의 상품</div>
			 	<section id="todayBox">		 
					<ul>
			 			<li>
			 				<div class="todayImg">
			 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
			 				</div>
			 			</li>
			 			<li><button class="success addBtn" value="" name="" >추가</button>
						<button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 				<li><input type="text" placeholder="링크 입력"></li>
			 		</ul>	
					<ul>
			 			<li>
			 				<div class="todayImg">
			 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
			 				</div>
			 			</li>
			 			<li><button class="success addBtn" value="" name="" >추가</button>
						<button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 				<li><input type="text" placeholder="링크 입력"></li>
			 		</ul>
			 		<ul>
			 			<li>
			 				<div class="todayImg">
			 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
			 				</div>
			 			</li>
			 			<li><button class="success addBtn" value="" name="" >추가</button>
						<button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 				<li><input type="text" placeholder="링크 입력"></li>
			 		</ul>
			 		<ul>
			 			<li>
			 				<div class="todayImg">
			 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
			 				</div>
			 			</li>
			 			<li><button class="success addBtn" value="" name="" >추가</button>
						<button class="success delBtn delBtn" value="" name="" >삭제</button></li> 
		 				<li><input type="text" placeholder="링크 입력"></li>
			 		</ul>
				</section> 	 
		 	
		 	<!------------------ 카테고리 관리파트--------------------->
			<div id="cateContainer">
				<div id="cateHeader">카테고리 관리</div>
			 	<div id="sectionBox">	
				 	<section id="cateBox1">	
				 		<label>대분류 카테고리</label>	
				 		<div class="cateSmHeader">
							<span>순서</span>
							<span>카테고리</span>
						</div>
						<hr class="hr">
						<div>
							<ul>
					 			<li><input type="text" value="1"></li>
					 			<li><input type="text" value="쌀/잡곡"></li>
					 			<li><button class="success delBtn" value="" name="" >삭제</button></li> 
				 			</ul>
					 		<ul>
					 			<li><input type="text" value="2"></li>
					 			<li><input type="text" value="과일"></li>
					 			<li><button class="success delBtn" value="" name="" >삭제</button></li> 
					 		</ul>
					 		<ul>
					 			<li><input type="text" value="3"></li>
					 			<li><input type="text" value="채소"></li>
					 			<li><button class="success delBtn" value="" name="" >삭제</button></li> 
					 		</ul>
					 		<ul>
					 			<li><input type="text" value="4"></li>
					 			<li><input type="text" value="견과류"></li>
					 			<li><button class="success delBtn" value="" name="" >삭제</button></li> 
					 		</ul>
				 		</div>
						<hr class="hr">
				 		<div class="addCate">
				 			<input type="text" placeholder="새 카테고리를 입력해주세요">
				 			<button class="success addBtn " value="" name="" >추가</button>
				 		</div>
				 	</section>
				 	<!-- 오른쪽 2차 카테고리 관리 -->
				 		<section id="cateBox2">	
				 		<label>중분류 카테고리</label>	 
						<div class="cateSmHeader">
							<span>순서</span>
							<span>카테고리</span>
						</div>
						<hr class="hr">
						<table class="tg" style="undefined;table-layout: fixed; width: 390px">
							<colgroup>
							<col style="width: 100px">
							<col style="width: 45px">
							<col style="width: 140px">
							<col style="width: 110px">
							</colgroup>
							<thead>
							  <tr>
							    <th class="tg-7eit cateMainName" rowspan="4"> <input type="text" value="쌀"> </th>
							    <th class="tg-7eit cateNum"> <input type="text" value="1"> </th>
							    <th class="tg-7eit cateName"> <input type="text" value="백미"> </th>
							    <th class="tg-7eit"> <button class="success delBtn" value="" name="" >삭제</button> </th>
							  </tr>
							  <tr>
							    <td class="tg-7eit cateNum"> <input type="text" value="2"> </td>
							    <td class="tg-7eit cateName"> <input type="text" value="현미"> </td>
							    <td class="tg-7eit"> <button class="success delBtn" value="" name="" >삭제</button> </td>
							  </tr>
							  <tr>
							    <td class="tg-7eit cateNum"> <input type="text" value="3"> </td>
							    <td class="tg-7eit cateName"> <input type="text" value="햅쌀"> </td>
							    <td class="tg-7eit"> <button class="success delBtn" value="" name="" >삭제</button> </td>
							  </tr>
							  <tr>
							    <td class="tg-7eit cateNum"> <input type="text" value="4"> </td>
							    <td class="tg-7eit cateName"> <input type="text" value="잡곡"> </td>
							    <td class="tg-7eit"> <button class="success delBtn" value="" name="" >삭제</button> </td>
							  </tr>
							</thead>
						</table> 
						<hr class="hr">
						<table class="tg" style="undefined;table-layout: fixed; width: 390px">
							<colgroup>
							<col style="width: 100px">
							<col style="width: 45px">
							<col style="width: 140px">
							<col style="width: 110px">
							</colgroup>
							<thead>
							  <tr>
							    <th class="tg-7eit cateMainName" rowspan="4"> <input type="text" value="과일"> </th>
							    <th class="tg-7eit cateNum"> <input type="text" value="1"> </th>
							    <th class="tg-7eit cateName"> <input type="text" value="딸기"> </th>
							    <th class="tg-7eit"> <button class="success delBtn" value="" name="" >삭제</button> </th>
							  </tr>
							  <tr>
							    <td class="tg-7eit cateNum"> <input type="text" value="2"> </td>
							    <td class="tg-7eit cateName"> <input type="text" value="사과"> </td>
							    <td class="tg-7eit"> <button class="success delBtn" value="" name="" >삭제</button> </td>
							  </tr>
							  <tr>
							    <td class="tg-7eit cateNum"> <input type="text" value="3"> </td>
							    <td class="tg-7eit cateName"> <input type="text" value="포도"> </td>
							    <td class="tg-7eit"> <button class="success delBtn" value="" name="" >삭제</button> </td>
							  </tr> 
							</thead>
						</table> 	
						<hr class="hr">
				 		<div class="addCate">
					 		<select name="sort" > 
				   				<option value="대분류" selected>대분류</option>
				   				<option value="쌀">쌀</option>
				   				<option value="과일">과일</option> 
				   				<option value="곡식">곡식</option> 
				   				<option value="채소">채소</option>  
				  			</select>
				 			<input type="text" placeholder="새 카테고리를 입력해주세요">
				 			<button class="success addBtn " value="" name="" >추가</button>
				 		</div>
				 	</section>
				 </div>
		 	</div>  
				 	
					<!----------------------- 팝업 파트 ------------------>
				 	<div id="popContainer">
						<div id="popHeader">팝업 관리</div>
					 	<div id="popBox">	
				 			<section id="popBox1">	
				 					<img src="<%=request.getContextPath()%>/img/y_tomato.jpg"/>
				 			</section>
				 			<section id="popBox2">	
				 				<div>
									<label for="file" class="attach"> 
										이미지 첨부하기
									</label>
									<input type="file" style="width: 500px;" id="file">
									<input class="uploadFile"  value="" placeholder="이미지 파일만 업로드하세요">
								</div>
				 				<div id="popDate">
				 					<input type="date" id="from">
				 					<div id="fromTo">&nbsp;&nbsp;~&nbsp;&nbsp;</div>
				 						<input type="date" id="todate"> 
				 					</div>
				 				<input type="text" value="링크 입력">
				 			</section>
				 		</div>
				 	</div>
				 	 
					<!----------------------- 이용안내 파트 ------------------>
				 	<div id="useInfoContainer">
						<div id="useInfoHeader">이용안내 관리</div>
					 	<div id="useInfoBox">	
				 			<textarea name="summerContent" class="summernote" ></textarea>				 			 
				 		</div>
				 		<div class="bottommm">
				 			<input type="submit" value="작성하기" class="btn write_btn" id="write_btn"/>
				 			<input type="button" value="취소" class="btn write_btn" id="cancle_btn" onClick="location.href='<%=request.getContextPath() %>/recipeView'"/>
						</div>
				 	</div>
				 	 
				 	 <!----------------------- 개인정보 처리방침 파트 ------------------>
				 	<div id="infoHandleContainer">
						<div id="infoHandleHeader">개인정보 처리방침 관리</div>
					 	<div id="infoHandleBox">	 
				 			<textarea name="summerContent" class="summernote" ></textarea>	
				 		</div>
				 		<div class="bottommm">
				 			<input type="submit" value="작성하기" class="btn write_btn" id="write_btn"/>
				 			<input type="button" value="취소" class="btn write_btn" id="cancle_btn" onClick="location.href='<%=request.getContextPath() %>/recipeView'"/>
						</div>
				 	</div> 
				 	 
				 	 <!----------------------- 사이트 이용약관 파트 ------------------>
				 	<div id="useTermsContainer">
						<div id="useTermsHeader">사이트 이용약관 관리</div>
					 	<div id="useTermsBox">	
				 			<textarea name="summerContent" class="summernote" ></textarea>	
				 		</div>
				 		<div class="bottommm">
				 			<input type="submit" value="작성하기" class="btn write_btn" id="write_btn"/>
				 			<input type="button" value="취소" class="btn write_btn" id="cancle_btn" onClick="location.href='<%=request.getContextPath() %>/recipeView'"/>
						</div>
				 	</div>
				 	
				 	 <!----------------------- 전자금융거래 이용약관 파트 ------------------>
				 	<div id="financialContainer">
						<div id="financialHeader">전자금융거래 이용약관 관리</div>
					 	<div id="financialBox">	
				 			<textarea name="summerContent" class="summernote" ></textarea>	
				 		</div>
				 		<div class="bottommm">
				 			<input type="submit" value="작성하기" class="btn write_btn" id="write_btn"/>
				 			<input type="button" value="취소" class="btn write_btn" id="cancle_btn" onClick="location.href='<%=request.getContextPath() %>/recipeView'"/>
						</div>
				 	</div> 
				 </div>
			</div>
	</div>  
</div> 
</html>