<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/xstyle_sellerReview.css">

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<section>
	<!-- 사이드바 -->
	<nav>
		<ul>
			<li><a href="#">상품 관리</a></li>
			<li><a href="#">상품 등록</a></li>
			<li><a href="#">주문 관리</a></li>
			<li><a href="#">판매 관리</a></li>
			<li><a href="seller_sales">매출 관리</a></li>
			<li><a href="#">정산 관리</a></li>
			<li><a href="#">배송 관리</a></li>
			<li><a href="seller_review">리뷰/문의 관리</a></li>
			<li><a href="intro_farm">회원정보수정</a></li>
		</ul>
	</nav>
	<!-- 본문 시작 -->
	<article>
		<!-- 검색창 -->
		<div id="search_container">
			<span id="search_box">
				<input type="text" id="search" name="search" placeholder="검색하기"><a href="#" onclick="return false;"><img id="search_icon" src="<%=request.getContextPath()%>/resources/img/xsearch_icon.png"/></a>
			</span>
		</div>
		
		<div class="wrap">
			<!-- 리뷰 보기 -->
			<div class="wrapContainer">
				<div class="wrapTitle">리뷰보기</div>
				<ul id="reviewInfo">
					<li>새 리뷰</li>
					<li>3건</li>
					<li>미답변</li>
					<li>0</li>
					<li>사용자 총 평점</li>
					<li>4.32/5</li>
					<li>전체 리뷰 수</li>
					<li>351</li>
				</ul>
			</div><!-- 리뷰 보기 끝 -->
			
			<!-- 리뷰 검색 -->
			<div class="wrapContainer">
				<div class="wrapTitle">리뷰 검색</div>
				<div id="categoryList">
					<strong>&nbsp;&nbsp;카테고리</strong>
					
					<div id="categoryListMiddle">
						<ul id="category">
							<li>견과류<span>&gt;</span></li>
							<li>건과류<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							<li>채소<span>&gt;</span></li>
							
						</ul>
						<ul id="mcategory">
							<li>땅콩</li>
						</ul>
					</div>
					
					<form method="" action="" id="">
						<ul id="categoryManagement">
							<li>채소&gt;가지<span>⊠</span></li>
							<li>채소&gt;가지<span>⊠</span></li>
							<li>채소&gt;가지<span>⊠</span></li>
							<li>채소&gt;가지<span>⊠</span></li>
							<li>채소&gt;가지<span>⊠</span></li>
							<li>채소&gt;가지<span>⊠</span></li>
							<li>채소&gt;가지<span>⊠</span></li>
						</ul>
						
						<div id="categorySearch_container">
							<select class="categorySearch_container_child" id="categoryDate" name="categoryDate">
								<option>년별</option>
								<option selected="월별">월별</option>
								<option>일별</option>
							</select>
							<input class="categorySearch_container_child" type="month" id="categoryCalendar_start" required/>
							<input class="categorySearch_container_child" type="month" id="categoryCalendar_end" required/>
							<select class="categorySearch_container_child" id="subject" name="subject">
								<option>상품명</option>
								<option>리뷰 내용</option>
								<option>등록자</option>
							</select>
							<input class="categorySearch_container_child" type="text" id="searchKey" name="searchKey" placeholder="검색어를 입력해주세요"/>
							<input class="categorySearch_container_child" type="submit" value="검색"/>
						</div>
					</form>
				</div><!-- categoryList 끝 -->
			</div><!-- 리뷰 검색 끝 -->
			
			<!-- 리뷰 출력 -->
			<!-- 정렬방법 고르기 -->
			<div id="sortContainer">
				<select id="sortSelect">
					<option>최신순</option>
					<option>평점 높은 순</option>
					<option>평점 낮은 순</option>
				</select>
			</div>
			
			<ul id="reviewList">
				<li>상품명</li>
				<li>평점</li>
				<li>포토</li>
				<li>리뷰 내용</li>
				<li>등록자</li>
				<li>등록일</li>
				<li>답변 여부</li>
				
				<li>고구마</li>
				<li>4.5</li>
				<li>이미지</li>
				<li><a href="">좋아요좋아요좋아요좋아요</a></li>
				<li>고구마맛탕좋아</li>
				<li>21/04/08</li>
				<li>답변 완료</li>
			</ul>
			<!-- 리뷰 출력 끝 -->
		</div>
	</article><!-- 본문 끝 -->
	
	<div id="popup">
		<div class="wrapContainer_Edit1">
			<form method="" action="">
				<div class="wrapTitle">리뷰</div>
				<ul id="reivewManagement">
					<li>
						<b>구매상품</b>
						<img src="<%=request.getContextPath()%>/resources/img/xprofile_img.png" id="repMenu_img"/>
						<div>싸고 맛있는 빵빠레빵빠빵</div>
					</li>
					<li>
						<b>등록자</b>
						tkaudeotk00
					</li>
					<li>
						<b>등록일</b>
						2021.05.02
					</li>
					<li>
						<b>평점</b>
						<div>★★★★★</div>
						<img src="<%=request.getContextPath() %>/resources/img/xgood.png" id="good_img"/> : 2
					</li>
				</ul>
				<div>
					<br/><b>&nbsp;&nbsp;&nbsp;리뷰 내용</b><br/>
					<div id="reviewContent">
						<p> 이제 드디어 대저 토마토 먹을 수 있네요 대저 토마토 처음 먹어봤는데요 너무 맛있어요</p>
						<img src="<%=request.getContextPath() %>/resources/img/xprofile_img.png" id="repMenu_img"/>
					</div>
				</div>
				
				<!-- 섬머노트 -->
			  	<div id="summernote"><p></p></div>
				  <script>
				    $(document).ready(function() {
				        $('#summernote').summernote({
				        	placeholder: '300자 이내로 입력해주세요',
				        	tabsize: 2,
				            height: 150
				        });
				    });
				  </script>
				<div id="popupBtnContainer">
					<input type="submit" name="popupOk" value="확인"/>
					<input type="submit" name="popupClose" value="닫기"/>
					<input type="submit" name="popupDeclaration" value="신고">
				</div>
			</form>  	  
		</div>
	</div><!-- 리뷰 보기 팝업 끝 -->
	
	<!-- 신고하기 -->
	<div id="declaration">
		<div class="wrapContainer_Edit1">
			<div class="wrapTitle">신고하기</div>
			<form method="" action="" id="declarationFrm">
				<div>2021/03/26</div>
				<div>
					신고 대상 리뷰 : 21.03.02<br/>
					신고 대상 아이디 : tkaudeotk02<br/>
					구매품명: 대저짭짤이 토마토(10Kg)
				</div>
				<div>
					<select>
						<option>신고 사유</option>
						<option>비방/욕설</option>
						<option>허위</option>
						<option>성희롱</option>
						<option>기타</option>
					</select>
				</div>
				<div>
					<input type="text" width="200px" placeholder="300자 이내로 작성">
					<input type="submit" value="보내기"/>
				</div>
			</form>
		</div>
	</div>
</section>
