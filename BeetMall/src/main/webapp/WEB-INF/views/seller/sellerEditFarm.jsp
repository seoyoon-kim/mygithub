<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/xstyle_sellerEditFarm.css">
<script>
	function selectImg(e){
		$('#farmprofile').click();
	}
	
	function check(e){
		const fileSize = e.files[0].size;
		const extensionCheck = $(e).val().split('.');
		const maxSize = 4 * 1024 * 1024 ; // 4 MB 최대용량
		const extentionArr = ['png','jpg','jpeg','gif','JPG','JPEG','PNG','GIF'];
		
		// 파일 사이즈 확인 4mb 제한
		if(fileSize > maxSize){
			alert('업로드 파일 최대 용량은 4MB이하 입니다.');
			$('#farmprofile').val('');
			return false;
		}
		
		// 확장자 확인 , 이미 걸렀지만 호오오옥시나 또 건드는 사람 있을경우.....
		for(let i = 0; extentionArr.length; i++){
			console.log(extentionArr[i]);
			console.log(extensionCheck[1]);
			if(extentionArr[i] == extensionCheck[1]){
				break;
			}
			
			if(extentionArr.length-1 == i){
				alert('업로드 파일의 확장자는 jpg, jpeg, gif, png 종류만이 가능합니다.')
				$('#farmprofile').val('');
				return false;
			}
		}
		
		
		// 미리보기
		const reader = new FileReader();
		
		reader.onload = (e) => {
			$('#nowImg').attr('src',e.target.result);
		}
		reader.readAsDataURL(e.files[0]);
	}
	
	
	
	
	///// 
	
	function emailCheckSeller(){
		// 판매자 이메일 검사
		var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if($("#storeemail").val()==null||$("#storeemail").val()==''){
			alert("이메일을 입력하세요")
			return false;
		}else if(!emailreg.test(document.getElementById("storeemail").value)){
			alert("이메일이 잘못 입력되었습니다.");
			return false;			
		}
	}
$(()=>{
		// 판매자 이메일 인증코드 전송
		$("#storeemailBtn").click(function(){
			console.log('눌렸나요');
			if(emailCheckSeller()!=false){
				var url = 'emailSendSeller';
				var param = "SendToEmail="+$("#storeemail").val();
				$.ajax({
					url : url,
					data : param,
					success :function(data){
						alert("인증코드 전송에 성공했습니다. 이메일을 확인해주세요!");
					}, error : function(){
						alert("인증코드 전송에 실패하였습니다 잠시후 다시 시도해주세요");
					}
				})
				
			}
		})
		
		// 판매자 이메일 인증코드 확인
		$("#storeemailCheckBtn").click(function(){
			if($("#storeemailCheck").val()!=null || $("#storeemailCheck").val()!=''){
				var url = 'emailCheckSeller';
				var param = "emailCode="+$("#storeemailCheck").val();
				$.ajax({
					url : url,
					data : param,
					success : function(data){
						console.log(data);
						if(data == 1){
							alert("인증에 성공하였습니다.");							
							$("#checkEmailSellerResult").val('Y');
							$("#storeemailCheck").attr("readonly",true);
						}else{
							alert("인증코드가 일치하지 않거나 인증에 실패하였습니다.");
						}
					}, error : function(){
						alert("인증에 실패하였습니다.");
					}
				});
			}
		})
		
})
</script>
<section>
	<%@include file="/WEB-INF/views/inc/sellerHeader.jsp"%>
	<!-- 본문 시작 -->
	<article>
		<div class="seller_title">농장소개 수정</div>

		<form method="post" action="javascript:editCheck()">
			<input type="hidden" name="storenum" value="${result.storenum}" />
			<div id="info_container">
				<div id="profile_box">
					<input type="file" id="farmprofile" name="farmprofile" style="display: none;" onchange="javascript:check(this)" accept="image/png, image/jpg, image/jpeg, image/gif" /> 
					<a href="javascript:selectImg(this)"><img id="nowImg" src="<%=request.getContextPath()%>/resources/img/${result.farmprofile}" /></a><br /> 
					*프로필 이미지 클릭시 파일첨부<br /> <input type="text" id="farmname" name="farmname" value="${result.farmname }" style="width: 100px; height: 25px" />
					<div>
						방문자수 : ${result.farmvisitor}명<br /> 농장 즐겨찾기수 : ${favorite}명
					</div>
				</div>
				<!-- profile_box 종료 -->
				<hr />
				<div id="farm_info">
					<div>INFO</div>
					<textarea rows="5" cols="80" name="farmintro">${result.farmintro }</textarea>
				</div>
				<!-- farm_info 종료 -->
				<div id="farm_contact">
					<div>CONTACT</div>
					<div id="contact_content">
						<b>스토어 정보</b>
						<script>
								function editCheck(){
									let test = '한글자';
									let eng = 'test';
									// 이메일 검사
									var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
									// 이름 검사
									var namereg = /^[가-힣]{2,4}$/;
									// 계좌번호 검사
									var accountreg = /^[0-9]{11,15}$/;
									
									
									
									console.log(test.charCodeAt(0));
									console.log(eng.charCodeAt(0));
									if( $('#sellername').val() == null || $('#sellername').val() == '' ){
										alert('대표자 이름을 입력해주세요');
										return false;
									} else if ( $('#storename').val() == null || $('#storename').val() == '' ){
										alert('상호명을 입력해주세요');
										return false;
									} else if ( $('#bankname').val() == null || $('#bankname').val() == '' ){
										alert('예금주를 입력해주세요');
										return false;
									} else if ( $('#bankaccount').val() == null || $('#bankaccount').val() == '' ){
										alert('계좌번호를 입력해주세요');
										return false;
									} else if ( $('#storeemail').val() == null || $('#storeemail').val() == '' ){
										alert('이메일을 입력해주세요')
										return false;
									}
									
									if( !namereg.test($('#sellername').val()) ){ // 대표자 검사
										alert("이름은 2~4글자만 가능합니다.");
									} else if($('#storename').val().length > 30){ // storename이 30자 이상이면 막는다.
										alert('상호명은 30자 이하여야 합니다');
										return false;
									} else if( !namereg.test($('#bankname').val()) ){ // 예금주 검사
										alert('이름은 4글자 이하여야 합니다')
										return false;
									} else if( !accountreg.test(parseInt($('#bankaccount').val(),10))){ // 계좌번호 검사
										alert('올바른 계좌번호를 입력해주세요')
										return false;
									} else if( !emailreg.test( $('#storeemail').val()) ){ // 이메일 검사
										alert('올바른 이메일을 입력해주세요')
										return false;
									}
									
									
								}
								
								
						</script>
						<div>
							<span>상호명</span><input type="text" id="storename" name="storename" value="${result.storename }" style="width: 400px" />
						</div>
						<div>
							<span>대표자</span><input type="text" id="sellername" name="sellername" value="${result.sellername}" style="width: 400px" />
						</div>
						<div>
							<span>사업자등록번호</span>
							<p name="sellerreginum">${result.sellerreginum }</p>
						</div>
						<div>
							<span>사업장 소재지</span>
							<p name="storeaddr">${result.storeaddr}${result.storedetailaddr }</p>
						</div>
						<div>
							<span class="spanstar">은행</span>
							<select name="bank" id="bankName">
								<option value="index" disabled selected>은행명선택</option>
								<option value="국민">국민</option>
								<option value="비씨">비씨</option>
								<option value="신한">신한</option>
								<option value="현대">현대</option>
								<option value="삼성">삼성</option>
								<option value="롯데">롯데</option>
								<option value="외환">외환</option>
								<option value="NH">NH</option>
								<option value="하나">하나</option>
								<option value="우리">우리</option>
								<option value="광주">광주</option>
								<option value="수협">수협</option>
								<option value="씨티">씨티</option>
								<option value="전북">전북</option>
								<option value="제주">제주</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="케이뱅크">케이뱅크</option>
							</select>
						</div>
						<div>
							<span class="spanstar">계좌번호</span><input type="text" name="bankaccount" id="bankaccount" value="${result.bankaccount }" />
						</div>
						<div>
							<span class="spanstar">예금주</span><input type="text" name="bankname" id="bankname" value="${result.bankname }" />
						</div>
						<div>
							<span class="spanstar">이메일</span><input type="text" name="storeemail" id="storeemail" style="margin-right: 5px;" value="${result.storeemail }" /><input type="button" value="인증코드 전송" id="storeemailBtn" class="btn" />
						</div>
						<div>
							<span>인증하기</span><input type="text" name="storeemailCheck" id="storeemailCheck" style="margin-right: 5px;" value="" /><input type="button" value="인증하기" id="storeemailCheckBtn" class="btn" />
						</div>
					</div>
				</div>
				<!-- farm_contact 종료 -->
				<!-- 대표메뉴 -->
				<div id="farm_repMenu">
					<input type="hidden" name="productnum" value="${result.productnum }" />
					<div>대표메뉴</div>
					<div id="repMenu_content">
						<img src="<%=request.getContextPath()%>/resources/img/${result.thumbimg}" name="thumbimg" />
						<div>
							<div>
								<span name="saleselect">${result.saleselect }%</span>&nbsp;
								<p name="productprice">${result.productprice }원</p>
							</div>
							<p name="productname">${result.productname }</p>
						</div>
					</div>
				</div>
			</div>
			<!-- info_container 종료 -->
			<div style="margin:30px auto; width:100px;">
				<input type="submit" id="edit_btn" value="수정하기" />
			</div>
		</form>
		
		
		<table class="product_table">
				<thead>
					<!-- table 메뉴 14개-->
					<tr>
						<th class="listMenu"><input type="checkbox" checked id="productCheck" name="" value=" title="판매상품 전체 선택"></th>
						<th class="listMenu">상품번호</th>
						<th class="listMenu">대분류</th>
						<th class="listMenu">중분류</th>
						<th class="listMenu">상품이름</th>
						<th class="listMenu" id="thumbImg">대표이미지</th>
						<th class="listMenu">재고수량</th>
						<th class="listMenu">판매시작일</th>
						<th class="listMenu">판매가</th>
						<th class="listMenu">할인금액</th>
						<th class="listMenu">할인적용판매가</th>
						<th class="listMenu">할인율</th>
						<th class="listMenu">할인기간</th>
						<th class="listMenu">판매상태</th>
					</tr>
				</thead>
				<!-- 전체보기 판매상품 리스트 -->
				<!-- 판매상태: 판매중 or 판매완료 -->
				<!-- 판매 완료는 회색처리 -->
				<!-- 할인율은 할인가로 계산(내림)해서 넣기 -->
				<!-- 페이징추가 -->
				<tbody>
					<!-- table 1 line -->
					<c:forEach var="vo" items="${productList}">
					<tr class="tbl_line">
						<td  class="tbl_line_cell"><div id="productCheck"><input type="checkbox" checked id="oneItemCk" name="oneItemCk" checked="checked" title="상품 선택"></div></td>
						<td class="tbl_line_cell"><div id="productNum"><span id="productNum">${vo.productnum}</span></div></td>
						<!-- 대분류 번호 숨기기 -->
						<td class="tbl_line_cell">	
							<div id="mCategory">
								<span id="mCateName">${vo.catename }</span>
								<input type="hidden" value="${vo.catenum}"/>
							</div>
						</td>
						<!-- 중분류 번호 숨기기 -->
						<td class="tbl_line_cell">
							<div id="category">
								<span id="cateName">${vo.mcatename }</span>
								<input type="hidden" value="${vo.mcatenum}"/>
							</div>
						</td>
						<td class="tbl_line_cell"><div id="product"><span id="productName"><a href="">${vo.productname}</a></span></div></td>	
						<td class="tbl_line_cell"><div id="thumbnail"><img src="${vo.thumbimg}"/></div></td>
						<td class="tbl_line_cell"><div id="stock"><span id="unsoldStock">90</span>/<span id="totalStock">${vo.totalstock }</span></div></td>
						<td class="tbl_line_cell"><div id="regiDate">${vo.sellstart}</div></td>
						<td class="tbl_line_cell"><div id="productprice"><span id="price_num">${vo.productprice }</span><span id="won">원</span></div></td>
						<td class="tbl_line_cell"><div id="saleprice"><span id="price_num">${vo.saleprice}</span><span id="won">원</span></div></td>
						<td class="tbl_line_cell"><div id="sellprice"><span id="price_num">${vo.sellprice}</span><span id="won">원</span></div></td>
						<td class="tbl_line_cell"><div id="salepercent"><span id="salepercent">${vo.salepercent}</span>%</div></td>
						<td class="tbl_line_cell"><div id="saleperiod"><span id="salestart">${vo.salestart }</span> ~ <span id="salefinish">${vo.salefinish }</span></div></td>
						<td class="tbl_line_cell"><div id="saleStatus"><span id="statusText">판매중</span></div></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
	</article>
</section>
