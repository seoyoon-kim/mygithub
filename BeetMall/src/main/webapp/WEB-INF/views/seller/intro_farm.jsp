<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/xstyle_farm.css">
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
		<div id="search_container">
			<span id="search_box">
				<input type="text" id="search" name="search" placeholder="검색하기"><a href="#" onclick="return false;"><img id="search_icon" src="<%=request.getContextPath()%>/resources/img/xsearch_icon.png"/></a>
			</span>
		</div>
		
		<form method="post" action="edit_farm" id="info_frm">
			<input type="hidden" name="storenum" value="${storenum}"/>
			<!-- info 컨테이너 묶기 width:700px 고정 -->
			<div id="info_container">
				<div id="profile_box">
					<img src="<%=request.getContextPath()%>/resources/img/xprofile_img.png"/>
					<div id="farmname" name="farmname">사나없이 사나마나</div>
					<div>
						방문자수 : ${farmvisitor }명<br/>
						즐겨찾기 : 즐겨찾기 수 명
					</div>
				</div><!-- profile_box 종료 -->
				<hr/>
				<div id="farm_info">
					<div>INFO</div>
					<p name="farmintro">제가 키운건 자부심 있습니다!</p>
				</div><!-- farm_info 종료 -->
				<div id="farm_contact">
					<div>CONTACT</div>
					<div id="contact_content">
						<b>스토어 정보</b>
						<div><span>상호명</span><p name="storename">금강산 푸르게</p></div>
						<div><span>대표자</span><p name="sellername">이강산</p></div>
						<div><span>사업자등록번호</span><p name="sellerreginum">622-220-11234</p></div>
						<div><span>사업장 소재지</span><p name="storeaddr">서울특별시 영등포구 ...</p></div>
						<div><span>은행명</span><p name="bank">신한은행</p></div>
						<div><span>예금주</span><p name="bankname">이강산</p></div>
						<div><span>계좌번호</span><p name="bankaccount">110-393-12341234</p></div>
						<div><span>E-Mail</span><p name="storeemail">rkdtksfl96@hanmail.net</p></div>
					</div>
				</div><!-- farm_contact 종료 -->
				<div id="farm_repMenu">
					<input type="hidden" name="productnum" value="productnum"/> 
					<div>대표메뉴</div>
					<div id="repMenu_content">
						<img src="<%=request.getContextPath()%>/resources/img/xeggplant.jpg" name="thumbimg"/>
						<div>
							<div><span name="">14%</span>&nbsp;<p name="saleprice">50,000원</p></div>
							<p name="productname">상추 품평회에서 대상 수상한 정말 맛있는 상추 설탕 먹여서 키움</p>
						</div>
					</div>
				</div>
			</div><!-- info_container 종료 -->
			<div>
				<input type="submit" id="edit_btn" value="수정하기"/>
			</div>
		</form>
	</article>
</section>