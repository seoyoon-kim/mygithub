<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/xstyle_editFarm.css">
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
	

</script>
<section>
	<%@include file="/WEB-INF/views/inc/sellerHeader.jsp" %>	
	<!-- 본문 시작 -->
	<article>
		<div class="seller_title">농장소개 수정</div>
	
		<form method="post" action="javascript:editCheck()">
			<input type="hidden" name="storenum" value="${result.storenum}"/>
			<div id="info_container">
				<div id="profile_box">
					<input type="file" id="farmprofile" name="farmprofile" style="display:none;" onchange="javascript:check(this)" accept="image/png, image/jpg, image/jpeg, image/gif"/>
					<a href="javascript:selectImg(this)"><img id="nowImg" src="<%=request.getContextPath()%>/resources/img/${result.farmprofile}"/></a><br/>
					<input type="text" id="farmname" name="farmname" value="${result.farmname }" style="width:100px;height:25px"/>
					<div>
						방문자수 : ${result.farmvisitor}명<br/>
						농장 즐겨찾기수 : ${favorite}명
					</div>
				</div><!-- profile_box 종료 -->
				<hr/>
				<div id="farm_info">
					<div>INFO</div>
					<textarea rows="5" cols="80" name="farmintro">${result.farmintro }</textarea>
				</div><!-- farm_info 종료 -->
				<div id="farm_contact">
					<div>CONTACT</div>
					<div id="contact_content">
						<b>스토어 정보</b>
						<script>
								function editCheck(){
									let test = '한글자';
									let eng = 'test';
									console.log(test.charCodeAt(0));
									console.log(eng.charCodeAt(0));
									if($('#storename').val().length > 30){ // storename이 30자 이상이면 막는다.
										alert('상호명은 30자 이하여야 합니다');
										return false;
									} else if($('#sellername').val().length > 8){
										
									}
								}
						</script>
						<div><span>상호명</span><input type="text" id="storename" name="storename" value="${result.storename }" style="width:400px"/></div>
						<div><span>대표자</span><input type="text" id="sellername" name="sellername" value="${result.sellername}" style="width:400px"/></div>
						<div><span>사업자등록번호</span><p name="sellerreginum">${result.sellerreginum }</p></div>
						<div><span>사업장 소재지</span><p name="storeaddr">${result.storeaddr} ${result.storedetailaddr }</p></div>
						<div><span>예금주</span><input type="text" id="bankname" name="bankname" value="${result.bankname }" style="width:400px"/></div>
						<div><span>은행명</span><input type="text" id="bank" name="bank" value="${result.bank }" style="width:400px"/></div>
						<div><span>계좌번호</span><input type="text" id="bankaccount" name="bankaccount" value="${result.bankaccount }" style="width:400px"/></div>
						<div><span>E-Mail</span><input type="text" id="storeemail" name="storeemail" value="${result.storeemail }" style="width:400px"/></div>
					</div>
				</div><!-- farm_contact 종료 -->
				<!-- 대표메뉴 -->
				<div id="farm_repMenu">
					<input type="hidden" name="productnum" value="${result.productnum }"/> 
					<div>대표메뉴</div>
					<div id="repMenu_content">
						<img src="<%=request.getContextPath()%>/resources/img/${result.thumbimg}" name="thumbimg"/>
						<div>
							<div><span name="saleselect">${result.saleselect }%</span>&nbsp;<p name="productprice">${result.productprice }원</p></div>
							<p name="productname">${result.productname }</p>
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
