<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
/*================ 본문 시작 =================*/

/*---------- 본문 컨테이너 -----------*/
#cMyPageLeft{
	display: block;
}
.seller_title{
	margin-top: 30px;
	width: 100%;
	height: 30px;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 50px;
}
#info_container{
	width: 100%;
	margin: 0 auto 30px auto;
}
#info_container>div{
	margin-bottom: 30px;
}
/* 프로필 이미지*/
#profile_box{
	width: 100%;
	height: 200px;
	text-align: center;
	margin: 0px auto 30px auto;
	border: 1px solid #ddd;
	background-color: #fff;
}
#farmname{
	font-size: 12px;
	margin-bottom: 10px;
}
#profile_box img{
	width: 100px;
	height: 110px;
	margin: 10px auto 0 auto;
}

/* 농장 소개 */
#farm_info>div,#farm_contact>div:nth-child(1),#farm_repMenu>div:nth-child(2){
	width: 150px;
	font-size: 20px;
	font-family: 나눔고딕;
	font-weight: bold;
}
#farm_info,#farm_contact,#farm_repMenu{
	display: flex;
}
#contact_content{
	width: 90%;
	border: 1px solid #ddd;
	padding: 10px;
}
#contact_content div{
	overflow: auto;
	margin-top: 5px;
}
#contact_content span{
	width: 130px;
	float: left;
}
#contact_content p{
	float: left;
	margin: 0;
}

/* 대표 메뉴 */
#repMenu_content{
	width: 90%;
	display: flex;
	border: 1px solid #ddd;
	overflow: hidden;
}
#repMenu_content img{
	width: 150px;
	height: 150px;
	float: left;
}
#repMenu_content>div>div{
	display:flex;
}
#repMenu_content>div>div{
	margin: 10px;
}
#repMenu_content>div>p{
	margin: 0 10px 10px 10px;
	font-weight: bold;
}

#repMenu_content span{
	color: red;
}

#info_frm>div:last-child{
	width: auto;
	text-align: center;
}
#edit_btn{
	display: inline;
	margin: 0 auto;
	padding: 5px 10px;
	color: #fff;
	background-color: #aaa;
	border: 0px;
}
#info_container{
	margin-bottom: 200px;
}
/*---------- 본문 컨테이너 끝 -----------*/

/*================ 본문 끝 =================*/
</style>
<script>
</script>

<div class="section">
	<div class="seller_title">농장소개</div>
			<input type="hidden" name="storenum" value="${result.storenum}"/>
			<!-- info 컨테이너 묶기 width:700px 고정 -->
			<div id="info_container">
				<div id="profile_box">
					<img src="<%=request.getContextPath()%>/resources/img/${result.farmprofile}"/>
					<div id="farmname" name="farmname">${result.farmname }</div>
					<div>
						방문자수 : ${result.farmvisitor}명<br/>
						농장 즐겨찾기수 : 
						<c:if test="${favorite==null}">
							0명
						</c:if>
						<c:if test="${favorite!=null}">
							${favorite}명
						</c:if>
					</div>
				</div><!-- profile_box 종료 -->
				<hr/>
				<div id="farm_info">
					<div>INFO</div>
					<p name="farmintro">${result.farmintro }</p>
				</div><!-- farm_info 종료 -->
				<div id="farm_contact">
					<div>CONTACT</div>
					<div id="contact_content">
						<b>스토어 정보</b>
						<div><span>상호명</span><p name="storename">${result.storename }</p></div>
						<div><span>대표자</span><p name="sellername">${result.sellername}</p></div>
						<div><span>사업자등록번호</span><p name="sellerreginum">${result.sellerreginum }</p></div>
						<div><span>사업장 소재지</span><p name="storeaddr">${result.storeaddr} ${result.storedetailaddr }</p></div>
						<div><span>예금주</span><p name="bankname">${result.bankname }</p></div>
						<div><span>은행명</span><p name="bank">${result.bank }</p></div>
						<div><span>계좌번호</span><p name="bankaccount">${result.bankaccount }</p></div>
						<div><span>E-Mail</span><p name="storeemail">${result.storeemail }</p></div>
					</div>
				</div><!-- farm_contact 종료 -->
				<!-- 대표메뉴 -->
				<div id="farm_repMenu">
					<%-- <input type="hidden" name="productnum" value="${result.productnum }"/>  --%>
					<div>대표메뉴</div>
					<%-- <div id="repMenu_content">
						<img src="<%=request.getContextPath()%>/resources/img/${result.thumbimg}" name="thumbimg"/>
						<div>
							<div><span name="saleselect">${result.saleselect }%</span>&nbsp;<p name="productprice">${result.productprice }원</p></div>
							<p name="productname">${result.productname }</p>
						</div>
					</div> --%>
				</div>
			</div><!-- info_container 종료 -->
</div>