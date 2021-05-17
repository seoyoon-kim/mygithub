<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- css -->  
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin_2.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/xstyle_farm.css">
<style> 
	#topBar>h5{
    	padding-left: 240px;
    	width: 600px !important; 
	}
	#container{
		left:170px !important;
	}
	 #contentBox{
	 	height:1780px;
	 	top:30px;
	 }
	 #infoBox {
    	top: -350px !important;
    }
	 #infoHeader{
	 	padding-top:10px;
	 } 
	 #info{
	 	top:-285px;
	 	left:-250px;
	 }
	  #info li:nth-of-type(5){
	 	padding-left:460px;
	 } /*좌하 신고 정보*/
	 #reportBox{
	 	top:-470px !important; 
	 	height:120px;
	 	left:0;
	 }
	 #reportTitle{ 
	 	position:relative; 
	 	top:0;
	 	left:0;
	 	width:500px; 
	 } 
	 #reportHeader{
	 	display:flex; 
	 	left:-70px;
	 	margin-left:100px !important;
	 }
	#reportHeader>li:nth-of-type(2){ 
	 	left:100px;
	 }
	 #report{
	 	top:-45px;
	 	left:100px;
	 }
	 #reportBox button{
	 	top:-115px;
	 	left:370px;
	 }
	 #sellerEdit{
	 	box-shadow: 4px 6px 15px -7px #C4C4C4;
	 	position:relative;
	 	top:-320px; 
	 	border-radius:10px;
	 	height:1000px;
	 }
	 #farmInfo>h5{
	 	margin:5px 0 0 10px;
	 }
	 #bottommm{
	 	margin-top:20px !important;
	 	left:-50px !important;
	 }
	 hr{
	 	border-color:dimgray !important;
	 }
</style>
<script>
</script>
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<h5><strong><a href="sellerInfoEditA">판매자 정보 수정</a></strong></h5>
		</div>  
		</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
   		<div id="contentBox">
		 	<div id="companyBox">
		 	<div id="companyTitle"><p>사업자 정보</p></div>
		 		<ul id="companyHeader">
		 			<li>법인명</li>
		 			<li>대표자</li>
		 			<li>사업자 등록번호</li>
		 			<li>계좌정보</li>
		 			<li>사업장 소재지</li>
		 			<li>사업자 인증</li> 
		 		</ul>
		 		<ul id="company">
		 			<li><div>Suyeonfarm</div></li>
		 			<li><div>kangsan Lee</div></li>
		 			<li><div>123456-1234567</div></li>
		 			<li><div>경식은행</div><div>15684-23-1454684</div></li>
		 			<li><div>서울시 마포구 백범로 자바56길 132-56</div></li>
		 			<li><div>대기중</div>
		 				<button class="success" value="" name="" id="certiSee">보기</button>
		 			</li> 
		 		</ul>
		 	</div>
		 	<div id="infoBox">
		 	<div id="infoTitle"><p>개인 정보</p></div>
		 		<ul id="infoHeader">
		 			<li>이름</li>
		 			<li>아이디</li>
		 			<li>생년월일</li>
		 			<li>연락처</li>
		 			<li>이메일</li>
		 			<li>주소</li>
		 			<li>가입일</li> 
		 		</ul>
		 		<ul id="info">
		 			<li><div>김윤수</div></li>
		 			<li><div>yoonjoochacha</div></li>
		 			<li><div>1993/02/23</div></li>
		 			<li><div>010-3026-8562</div></li>
		 			<li><div>seoyoon@google.com</div></li>
		 			<li><div>서울시 마포구 백범로 자바56길 132-56</div></li>
		 			<li><div>2020/01/26</div></li> 
		 		</ul>
		 		<div id="infoBtns">
		 			<button class="success" value="" name="" id="back">뒤로</button> 
		 			<button class="success" value="" name="" id=" ">판매 상품 보기</button>   
		 			<button class="success" value="" name="" id=" e">수정</button> 
		 			<button class="success" value="" name="" id=" e">삭제</button> 
		 		</div>
		 	</div>
		 	<div id="reportBox">
		 	<div id="reportTitle"><p>신고 정보</p></div>
		 		<ul id="reportHeader">
		 			<li>신고 횟수</li>
		 			<li>총 정지 일</li> 
		 		</ul>
		 		<ul id="report">
		 			<li><div id="reportNum">1</div>회</li>
		 			<li><div id="reportDays">7</div>일</li> 
		 		</ul>
		 		<button class="success" value="" name="" id="reportCheck">자세히 보기</button>
		 		
		 	</div>
		 	<div id="farmInfo"><h5><strong>판매자 농장 정보</strong></h5></div>
				<!-- info 컨테이너 묶기 width:700px 고정 -->
				<div id="sellerEdit">
					<div id="info_container">
						<div id="profile_box">
							<img src="<%=request.getContextPath()%>/resources/img/xprofile_img.png"/><br/>
							<input type="text" id="farmname" name="farmname" style="width:100px;height:25px" value="작은 농부 이강산"/>
							<div>
								방문자수 : ${farmvisitor }23명<br/>
								즐겨찾기 수 : 54명
							</div>
						</div><!-- profile_box 종료 -->
						<hr/>
						<div id="farm_info">
							<div>INFO</div>
							<textarea rows="5" cols="80" name="farmintro" >제가 키운건 자부심 있습니다.제 아들, 딸, 손주까지 먹입니다! 한번드셔보이소</textarea>
						</div><!-- farm_info 종료 -->
						<div id="farm_contact">
							<div>CONTACT</div>
							<div id="contact_content">
								<b>스토어 정보</b>
								<div><span>상호명</span><input type="text" name="storename" style="width:400px" value="금강산 푸르게 푸르게"/></div>
								<div><span>대표자</span><input type="text" name="sellername" style="width:400px" value="금강산"/></div>
								<div><span>사업자등록번호</span><input type="text" style="width:400px" name="sellerreginum" value="622-220-11234" readonly></div>
								<div><span>사업장 소재지</span><input type="text" style="width:400px" name="storeaddr" value="서울특별시 영등포구 ..." readonly></div>
								<div><span>은행명</span><input type="text" name="bank" style="width:400px" value="신한은행"/></div>
								<div><span>예금주</span><input type="text" name="bankname" style="width:400px" value="이강산"/></div>
								<div><span>계좌번호</span><input type="text" name="bankaccount" style="width:400px" value="5453654-1535454-21"/></div>
								<div><span>E-Mail</span><input type="text" name="storeemail" style="width:400px" value="aijimi1983@google.com"/></div>
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
						<div id="bottommm">
						<input type="submit" value="수정하기" class="btn write_btn" id="write_btn"/>	
						<input type="reset" value="다시쓰기" class="btn write_btn" id="reset_btn"/>
						<input type="button" value="취소" class="btn write_btn" id="cancel_btn" onClick="location.href='<%=request.getContextPath() %>/recipeView'"/>
									
					</div>
					</div><!-- info_container 종료 -->
				</div>
		</div>
		
		<!-- 사업자 등록증 모달창 -->
		<div id="modal">
			<div id="modalHeader"> 사업자 등록증</div>
			<img class="cartImg" src="./img/y_certiImg.jpg" >
			<hr>
			<div id="modalBtns">
				<button class="success" value="" name="" id="">인증 확인</button>
				<button class="success" value="" name="" id="">반려</button>
				<button class="success" value="" name="" id="">취소</button>
			</div>  
		</div>		 
	</div>
</div>

