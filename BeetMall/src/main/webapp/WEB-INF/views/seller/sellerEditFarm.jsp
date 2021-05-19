<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/xstyle_sellerEditFarm.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		
		
		$("#sellerzipSearch").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            $("#storezipcode").val(data.zonecode);
		            $("#storeaddr").val(data.address);
		            document.getElementById('storedetailaddr').focus();
		        }
		    }).open();
		})
})

// 수정하기 누르면 업데이트
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
	} else if ( $('#bank').val() == null || $('#bank').val() == '' ){
		alert('은행을 선택해주세요');
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
	
	$('#updateFrm').submit();
}

// 대표메뉴 수정 누르면 window open 되는 함수
function menuEditOpen(){
	window.name = "농장수정";
	
	window.open("sellerEditFarmListView", "대표메뉴 선택창", "width=1200, height=600, resizable = no, scrollbars = no");
}

// 대표메뉴 선택시 이미지 변경하는 함수
function imgChange(data){
	console.log('test');
	console.log(data);
	$('#repMenu_content>img').attr('src',data);
}
</script>
<section>
	<%@include file="/WEB-INF/views/inc/sellerHeader.jsp"%>
	<!-- 본문 시작 -->
	<article>
		<div class="seller_title">농장소개 수정</div>

		<form method="post" action="sellerEditFarmUpdate" id="updateFrm" enctype="multipart/form-data">
			<input type="hidden" name="storenum" value="${result.storenum}" />
			<div id="info_container">
				<div id="profile_box">
					<input type="hidden" name="farmprofile" value="${result.farmprofile}" >
					<input type="file" id="farmprofile" name="filename" style="display: none;" onchange="javascript:check(this)" accept="image/png, image/jpg, image/jpeg, image/gif"/> 
					<a href="javascript:selectImg(this)"><img id="nowImg" src="<%=request.getContextPath()%>/resources/img/${result.farmprofile}" /></a><br /> 
					*프로필 이미지 클릭시 파일첨부<br /> <input type="text" id="farmname" name="farmname" value="${result.farmname }" style="width: 100px; height: 25px" />
					<div id="profileData">
						방문 : ${result.farmvisitor}명 | 농장 즐겨찾기 : ${favorite}명
					</div>
				</div>
				<!-- profile_box 종료 -->
				<hr />
				<div id="farm_info">
					<div>INFO</div>
					<textarea name="farmintro">${result.farmintro }</textarea>
				</div>
				<!-- farm_info 종료 -->
				<div id="farm_contact">
					<div>CONTACT</div>
					<div id="contact_content">
						<b>스토어 정보</b>
						<div>
							<span>상호명</span><input type="text" id="storename" name="storename" value="${result.storename }" style="width: 400px" />
						</div>
						<div>
							<span>대표자</span><input type="text" id="sellername" name="sellername" value="${result.sellername}" style="width: 400px" />
						</div>
						<div>
							<span>사업자등록번호</span>
							<p>${result.sellerreginum }</p>
						</div>
						<div>
							<span>사업장 소재지</span>
							<div>
								<input type="button"  id="sellerzipSearch" value="우편번호 검색" style="margin-right:5px;" class="btn"/>
								<input type="text" name="storezipcode" id="storezipcode" readonly  style="width:100px;"value="${result.storezipcode }"/>
								<input type="text" name="storeaddr" id="storeaddr" style="margin-top:5px; width:302px;" readonly  placeholder="우편 번호 검색을 통해 입력해주세요"value="${result.storeaddr }" />
								<input type="text" name="storedetailaddr" id="storedetailaddr" style="margin-top:5px; width:540px;" placeholder="상세 주소 입력" value="${result.storedetailaddr }"/>
							</div>				
						</div>
						<div>
							<span class="spanstar">은행</span>
							<select name="bank" id="bank">
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
					<input type="hidden" id="productnum" name="productnum" value="${result.productnum }" />
					<div>대표메뉴<br><input type="button" value="대표메뉴 수정" id="MenuEditBtn" onclick="javascript:menuEditOpen()"></div>
					<div id="repMenu_content">
						<img src="<%=request.getContextPath()%>/resources/img/${result.thumbimg}" name="thumbimg"/>
						<div>
							<div id="openerProductname">${result.productname }</div>
							<div>
								<c:if test="${result.saleselect != '0' && result.saleselect != null}">
									판매금액 : <div id="openerProductPrice">${ result.productprice - result.saleprice }</div>원
								</c:if>
								<c:if test="${result.saleselect == '0' || result.saleselect == null }">
									판매금액 : <div id="openerProductPrice">${result.productprice }</div>원
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- info_container 종료 -->
			<div style="margin:30px auto; width:100px;">
				<input type="button" id="edit_btn" value="수정하기" onclick="editCheck()" />
			</div>
		</form>
		
		
	</article>
</section>
