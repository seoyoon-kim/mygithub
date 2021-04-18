<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/xstyle_review.css">
<section>
	<!-- 사이드바 -->
	<nav>
		<ul>
			<li><a href="#">상품 관리</a></li>
			<li><a href="#">상품 등록</a></li>
			<li><a href="#">주문 관리</a></li>
			<li><a href="#">판매 관리</a></li>
			<li><a href="#">매출 관리</a></li>
			<li><a href="#">정산 관리</a></li>
			<li><a href="#">배송 관리</a></li>
			<li><a href="#">리뷰/문의 관리</a></li>
			<li><a href="#">회원정보수정</a></li>
		</ul>
	</nav>
	<!-- 본문 시작 -->
	<article>
		<!-- 검색창 -->
		<div id="search_container">
			<span id="search_box">
				<input type="text" id="search" name="search" placeholder="검색하기"><a href="#" onclick="return false;"><img id="search_icon" src="<%=request.getContextPath()%>/resources/xsearch_icon.png"/></a>
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
				<div class="categoryContainer">
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
				</div><!-- categoryContainer 끝 -->
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
</section>