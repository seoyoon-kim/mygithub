<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
		<!-- font-family: 'Nanum Gothic', sans-serif; -->

	
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/basicStyle.css">
</head>

<style>
	li, label{list-style-type:none; padding-bottom:10px;}
	li{padding-bottom:10px;}
	select{height:28px;}
	input, textarea, select{
		border:1px solid lightgray; 
		border-radius: 8px;
	}
	input,select,button{height:30px;}
	textarea{
		width:100%;
	}

/*검색하기*/
	/*카테고리*/
	.wrapTitle{margin-bottom:10px;}
	.category_title{
	   width: 100%;
	   height: 30px;
	   line-height: 30px;
	   font-weight:bold;
	   text-indent: 0.4em;
	   color: rgb(252,118,45);
	}
	hr{margin:10px 0 10px 0;}
	.category_wrap{
		border:1px solid lightgray;
		border-radius:8px;
		padding:20px;
		margin:10px;
	}
	/* 리뷰 검색 */
	#categoryList{
	   width: 90%;
	   margin: 20px auto;
	   border: 1px solid #aaa;
	   border-radius: 5px;
	}
	
	#categoryList>strong{
	   text-indent: 0.4em;
	}
	
	#categoryListMiddle{
	   width: 100%;
	   height: 170px;
	   display: flex;
	   flex-basis: 1;
	   margin-bottom: 10px;
	}
	
	#categoryListMiddle ul{
	   border-top: 1px solid #aaa;
	   border-bottom: 1px solid #aaa;
	   overflow: auto;
	   flex: 1;
	   display: flex;
	   flex-direction: column;
	   
	}
	
	#category{
	   border-right: 1px solid #aaa;
	}
	#category li:hover, #categoryListMiddle li:hover{
		font-weight:bold;
	}
	
	#categoryListMiddle li{
	   width: 100%;
	   text-indent: 0.4em;
	   display: flex;
	}
	
	#categoryListMiddle span{
	   margin-left: auto;
	   margin-right: 10px;
	}
	
	#categoryManagement{
	   width: 100%;
	   display: flex;
	   flex-wrap: wrap;
	}
	
	#categoryManagement li{
	   text-indent: 0.4em;
	   margin-right: 5px;
	}
	#mcategory>li{padding-left:10px;}
/*제목*/
	.registerNameNotice, .notice{
		font-size:0.6em;
		color:#EAA954;
	}
	.saleProductNameRegi{
		padding-bottom:5px;
	}
/*판매가격*/
	#total_price, #productprice{
		font-weight:bold;
		font-size:17px;
		color:orange;
	}
	label{margin-right:10px;}
/*옵션*/
	.regi_option_table input{
		border:none;
		height:30px;
	}
	th{
		height: 30px;
	}
	table,td {
		border:1px solid lightgray;
	}
/*상품내용*/

/*상세설명*/
	.info_detail{
		width:90%;
		margin-left:40px;
		height:700px;
	}
	.note-editable, .note_editor {
		height:500px; width:80%;
	}
/*배송*/
	#pay{height:50px; line-height:30px;}
/*취소 저장하기 버튼*/
	.end_button_wrap{
		text-align:center;
	}
	.save_btn, .cancel_btn{
		width: 100px;
		height: 35px;
		background: #fff;
		margin: 20px 10px 40px 0 ;
	}
	span{line-height:30px;}
	
</style>
<script>
//1. 카테고리 변경
$(function(){
	// 데이터에서 불러오기 

/* 
대분류 번호
1	건과류
2	견과류
3	과일
4	쌀
5	잡곡/혼합곡
6	채소
*/
	
	var dried_fruits = ['감말랭이', '건망고','건바나나','건자두', '건포도', '곶감', '기타건과류'];
	var nut = ['대추','땅콩','마카다미아','밤','아몬드','은행','잣','캐슈너트','피스타치오','피칸','해바라기씨','호두','호박씨','기타견과류'];
	var fruits = ['감', '감귤', '과일바구니','딸기','레몬','리치','망고','매실','바나나','배','복분자','복숭아','블루베리','사과','석류','수박','아보카도','오렌지','자두', '자몽','참외','천혜향 ','체리','키위/참다래', '토마토', '파인애플','포도','한라봉','혼합과일세트', '기타과일'];
	var rice = ['기능성쌀','백미','찹쌀', '현미', '흑미'];
	var multigrain = ['기장','기타잡곡','녹두','들깨','메밀','보리','수수','옥수수','율무','참깨','콩','팥','혼합곡'];
	var vegetable =['감자','건나물','고구마','고추','기타채소류','단호박','당근','대파','더덕','도라지','마','마늘','무','배추','버섯','부추','브로콜리','산나물','삶은나물','상추','새싹채소','생강','시금치','쌈채소','아스파라거스','알로에','애호박','양배추','양파','연근','열무','오이','우엉','죽순','쪽파','피망/파프리카'];
	$('#category>li').click(function(){
		var option=$(this).text();
		console.log(option);
		//견과류
		if(option=='견과류>'){
			$('#mcategory').empty();
			for(var i=0; i<nut.length; i++){
				var tag; 
				tag = "<li>"+nut[i]+"</li>";
				$('#mcategory').append(tag);
			} //for end
		//건과류	
		}else if(option=='건과류>'){
			$('#mcategory').empty();
			for(var i=0; i<dried_fruits.length; i++){
				var tag; 
				tag = "<li>"+dried_fruits[i]+"</li>";
				$('#mcategory').append(tag);
			}//for end
		}else if(option=='과일>'){
			$('#mcategory').empty();
			for(var i=0; i<fruits.length; i++){
				var tag; 
				tag = "<li>"+fruits[i]+"</li>";
				$('#mcategory').append(tag);
			}//for end
		}else if(option=='쌀>'){
			$('#mcategory').empty();
			for(var i=0; i<rice.length; i++){
				var tag; 
				tag = "<li>"+rice[i]+"</li>";
				$('#mcategory').append(tag);
			}//for end
		}else if(option=='잡곡/혼합곡>'){
			$('#mcategory').empty();
			for(var i=0; i<multigrain.length; i++){
				var tag; 
				tag = "<li>"+multigrain[i]+"</li>";
				$('#mcategory').append(tag);
			}//for end
		}else if(option=='채소>'){
			$('#mcategory').empty();
			for(var i=0; i<dried_fruits.length; i++){
				var tag; 
				tag = "<li>"+vegetable[i]+"</li>";
				$('#mcategory').append(tag);
			}//for end
		}//if else end
		
	});
});
//버튼 클릭시 위로 올라가기 방지
	$('button').click(function(e){
		e.preventDefault();   
		e.stopPropagation();
		return false;
	});
		
//서머노트
	$(document).ready(function() {
		  $('#summernote').summernote();
		});
	
//썸네일 메인이미지 업로드 미리보기
	function readURL(input) {
         if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(event) {
                    $('#thumb_image').attr('src', event.target.result);
                }
              reader.readAsDataURL(input.files[0]); //in
            }
        }
//작은 썸네일 업로드 미리보기 (실패)
	
$(document).ready(function(){	
//할인
		$('#sale_check').click(function(){
			$('#sale_ul').css('display','block');
		});
		$('#sale_uncheck').click(function(){
			$('#sale_ul').css('display','none');
		});
	

//버튼
	/* 	$('.btn').mouseover('click',function(){
			$(this).css('background', 'gray').css('color','white');
		});
		 */
//국내산, 수입산
		$('#import').on('click',function(){
			$('#import_wrap').css('display','block');
		});
		$('#domestic').click(function(){
			$('#import_wrap').css('display','none');
		});
		
//택배
		$('#delivery').on('click',function(){
			$('#delivery_option').css('display','block');
		});
		$('#pickup').click(function(){
			$('#delivery_option').css('display','none');
		});
		
	
//판매기간 설정
	$('#sell_check').on('click',function(){
		$('#sell_start_finish').css('display','block');
		$('#date_group').css('display','block');
	});
	$('#sell_uncheck').on('click',function(){
		$('#sell_start_finish').css('display','none');
		$('#date_group').css('display','none');
	});

//특정기간만 할인 날짜 가져오기
	//현재 날짜 구하기
	//https://ninearies.tistory.com/197
	
//할인판매가 계산

//기간설정하면 달력날짜 바꾸기

//옵션 적용안함 이면 표 비활성화

	$('#option_tbody').children('tr').css('display','none');
	$('#select_option').change(function(){
		var option = $(this).val();
		console.log(option);
		
		for(var i=0; i<5; i++){
			if(option=='i'){
				$('#option_tbody').children('tr').each(function(){
					
				});
				
			}
		}
	});
	
	
	
});		

//취소 history back
	


</script>
<body>
	<div class="main">
		
	<!-- 사이드바 -->
	<nav>
		<ul>
			<li><a href="<%=request.getContextPath()%>/product_list">상품관리</a></li>
			<li><a href="<%=request.getContextPath()%>/product_regi">상품등록</a></li>
			<li><a href="<%=request.getContextPath()%>/order_management">주문 관리</a></li>
			<li><a href="<%=request.getContextPath()%>/sale_management">판매 관리</a></li>
			<li><a href="seller_sales">매출 관리</a></li>
			<li><a href="">정산 관리</a></li>
			<li><a href="">배송 관리</a></li>
			<li><a href="seller_review">리뷰/문의 관리</a></li>
			<li><a href="intro_farm">회원정보수정</a></li>
		</ul>
	</nav>
	
	<!-- 가운데 content -->
	<div id="article">
	<div class="wrapTitle">판매관리</div>
		<!--검색하기 -->
		<!-- 상품등록 -->
		<!-- 카테고리 -->
		<!-- 상품명 -->
		<!-- 판매가격 설정-->
		<!-- 옵션 -->
		<!-- 재고수량 -->
		<!-- 상품이미지 -->
		<!-- 상세설명 -->
		<!-- 배송 -->
		<!-- 상품내용 -->
		<!-- 취소 저장하기 버튼 -->
	<form method="post" action="">
	<!-- 카테고리 -->
		<div class="category_wrap">
		 <div class="category_title">카테고리</div>
		 	<hr/>
            <div id="categoryList">
               <strong>&nbsp;&nbsp;카테고리 선택</strong>
               
               <div id="categoryListMiddle">
               <!-- 대분류 선택 -->
                  <ul id="category">
                     <li id="dried_fruits">건과류<span>&gt;</span></li>
                     <li id="nut">견과류<span>&gt;</span></li>
                     <li id="fruits">과일<span>&gt;</span></li>
                     <li id="rice">쌀<span>&gt;</span></li>
                     <li id="multigrain">잡곡/혼합곡<span>&gt;</span></li>
                     <li id="vegetable">채소<span>&gt;</span></li>
                  </ul>
              <!-- 중분류 선택 -->
                  <ul id="mcategory">
        			<!-- 중분류 카테고리 배열로 들어옴 -->
                  </ul>
               </div>
        
            </div><!-- categoryList end -->
		<ul id="categoryManagement">
                  <li>쌀&nbsp; &gt;현미&nbsp;<span>⊠</span></li>
                  <li><span  class="notice">상품과 맞지 않는 카테고리를 등록할 경우 판매중지, 판매금지될 수 있습니다.</span></li>
        </ul>
		
		</div><!-- categorySelection div end -->
		
	<!-- 상품명-->
	<div class="category_wrap">
		<div class="category_title">상품명 등록</div>
		<hr/>
			<ul>
				<li><label for="">상품명</label>&nbsp;
					<input type="text" name="productname" id="productRegisterName" size="70"/><span>0/100</span><br/>
					<span class="notice">
					판매 상품과 직접 관련이 없는 다른 상품명, 스팸성 키워드 입력 시 관리자에 의해 판매 금지될 수 있습니다.<br/>
					유명 상품 유사문구를 무단으로 도용하여 ~스타일, ~st 등과 같이 기재하는 경우 별도 고지 없이 제재될 수 있습니다. <br/>
					상품명을 검색최적화 가이드에 잘 맞게 입력하면 검색 노출에 도움이 될 수 있습니다. <br/>
					</span>
				</li>
			</ul>
		</div> <!-- productNameRegi div end -->
	<!-- 판매가격 설정-->
	<div class="category_wrap">
		<div class="category_title">판매가격</div>
		<hr/>
		<ul>
			<li><label>판매가 </label>&nbsp;<input type="number" name="productprice" id="productprice" min="100" placeholder="숫자만 입력하세요."/><span>원</span></li>
			<br/>
			<li>
				<label>할인여부 </label>&nbsp;
				<input type="button" name="saleselect" class="btn" id="sale_check" value="설정">&nbsp;
				<input type="button" name="saleselect"  class="btn" id="sale_uncheck" value="설정안함">
			</li>
			<ul id="sale_ul" style="display:none">
				<li><label>전체할인 </label>&nbsp;<input type="number" name="saleprice" id="saleprice" placeholder="할인적용금액" max="0"/><span>원</span>&nbsp;<span>할인</span></li>
				<li><input type="checkbox" name="saledate" id=""/><span>특정기간만 할인</span></li>
				<li>
					<input type="date" name="salestart" id="salestart"  class="start_date"/> ~ <input type="date" name="salefinish" id="finish_date"/>
					<span class="notice">특정기간이 지난후에는 판매가로 적용됩니다.</span>
				</li>
				<li>
					<label for="">할인 판매가</label>&nbsp; <span id="total_price" >9000</span>&nbsp;원 &nbsp;(-<span id="discount_price">0</span>원 할인) 
					<span class="notice">수수료는 전체매출에서 2%차감된금액입니다.&nbsp;<a href="">안내 바로가기</a></span>
				</li>
				<li><input type="checkbox" name="saleb" id="saleb"/><span>못난이 할인 상품으로 등록</span></li>
			</ul>
			<li>
				<label>판매기간</label>&nbsp;&nbsp;
				<input type="button" name="selldate" class="btn" id="sell_check"  value="설정"/ >&nbsp;
				<input type="button" name="selldate" class="btn" id="sell_uncheck" value="설정안함"/>
			</li>
			<li id="date_group"><label>기간설정</label><div id="btn_group">
				<input type="button" name="" class="btn" value="5일"/>
				<input type="button" name="" class="btn" value="10일"/>
				<input type="button" name="" class="btn" value="15일"/>
				<input type="button" name="" class="btn" value="30일"/>
				<input type="button" name="" class="btn" value="60일"/>
				</div>
			</li>
			<li id="sell_start_finish"><input type="date" name="sellstart" id="sale_start" class="start_date"/> ~ <input type="date" name="sellfinish" id="finish_date"/></li>
		</ul>
		</div>
	<!-- 재고수량 -->
	<div class="category_wrap">
	 <div class="category_title">재고수량</div>
	 <hr/>
			<ul>
				<li><label>재고수량</label>&nbsp; <input type="number" name="totalstock" id="totalstock" min="0"/><span>개</span></li>
				<li><span class="notice">판매할 총 재고량을 입력하세요.</span></li>
			</ul>			
	</div>	
<!-- 옵션 -->
	<div class="category_wrap">
		<div class="category_title">옵션</div>
			<hr/>
			<ul class="regi_option_wrap">
				<li><label>옵션 갯수</label>&nbsp;
					<select id="select_option" name="selectoption">
						<option selected value='none'>적용안함</option>
						<option value='1'>1</option>
						<option value='2'>2</option>
						<option value='3'>3</option>
						<option value='4'>4</option>
						<option value='5'>5</option>
					</select>
				</li>
				<li><label>옵션 목록</label>
					<table class="regi_option_table">
						<thead>
							<tr>
								<th>옵션명</th>
								<th>가격</th>
								<th>재고수량</th>
							</tr>
						</thead>
						<tbody id="option_tbody">
							<tr id='tr1'>
								<td><input type="text" name="optionname" id="optionname" placeholder="상품명을 입력해주세요."/></td>
								<td><input type="number" name="optionstock" id="optionstock" min="100" placeholder="원"/></td>
								<td><input type="number" name="optionprice" id="optionprice" placeholder="개"/></td>
							</tr>
							<tr id='tr2'>
								<td><input type="text" name="optionname" id="optionname" placeholder="상품명을 입력해주세요."/></td>
								<td><input type="number" name="optionstock" id="optionstock" min="100" placeholder="원"/></td>
								<td><input type="number" name="optionprice" id="optionprice" placeholder="개"/></td>
							</tr>
							<tr id='tr3'>
								<td><input type="text" name="optionname" id="optionname" placeholder="상품명을 입력해주세요."/></td>
								<td><input type="number" name="optionstock" id="optionstock" min="100" placeholder="원"/></td>
								<td><input type="number" name="optionprice" id="optionprice" placeholder="개"/></td>
							</tr>
							<tr id='tr4'>
								<td><input type="text" name="optionname" id="optionname" placeholder="상품명을 입력해주세요."/></td>
								<td><input type="number" name="optionstock" id="optionstock"  min="100" placeholder="원"/></td>
								<td><input type="number" name="optionprice" id="optionprice" placeholder="개"/></td>
							</tr>
							<tr id='tr5'>
								<td><input type="text" name="optionname" id="optionname" placeholder="상품명을 입력해주세요."/></td>
								<td><input type="number" name="optionstock" id="optionstock"  min="100" placeholder="원"/></td>
								<td><input type="number" name="optionprice" id="optionprice" placeholder="개"/></td>
							</tr>
						</tbody>
					</table>
				</li>
				<li><span class="notice">상세페이지에 예시) 호박고구마 1kg (+3000원)으로 표기됩니다.</span></li>
			</ul>
			</div>
	<!-- 상품이미지 -->
	<div class="category_wrap">
		<div class="category_title">상품 이미지</div>
		<hr/>
			<ul>
				<li><label>대표이미지</label><br/>
					<img name="thumb_image" id="thumb_image"src="#" alt="image upload" style="width:300px;"/><br/>
					<input type="file" id="thumb_image_upload" accept="img/*" onchange="readURL(this);" /></li>
				<li>
					<img name=""  id="thumb_image_small" width="200" src="#" alt="image upload" />&nbsp;	
					<img name=""  id="thumb_image_small"  width="200" src="#" alt="image upload" />&nbsp; 
					<img name=""  id="thumb_image_small"  width="200" src="#" alt="image upload" /></br>
		 			<input type="file" id="thumb_image_uplaod" accept="img/*" multiple/>
		 		</li>
		   </ul>	
		</div>
	<!-- 상세설명 -->
	<div class="category_wrap">
		<div class="category_title">상세설명</div>
		<hr/>
		<textarea id="summernote" name="editordata"></textarea>
		</div>
	<!-- 배송 -->
	<div class="category_wrap">
		<div class="category_title">배송</div>
			<hr/>
			<ul>
				<li><label>배송방법</label>&nbsp; 
					<input type="button" name="deliveryoption" class="btn" id="delivery" value="택배"/>
					<input type="button" name="deliveryoption" class="btn" id="pickup" value="픽업">
				</li>
				<ul id="delivery_option">
					<li><label>배송비</label>&nbsp;
						<input type="number" name="deliveryprice" id="delivery_price"/><span>원</span>	 <!-- 픽업 선택시 배송비 0원 고정 -->
					</li>
					<li id="pay"><label>결제방식</label>&nbsp;
						<input type="radio" name="paymentoption" id="delivery_price_option" value="착불"/><label for="착불">착불</label>&nbsp;
						<input type="radio" name="paymentoption" id="delivery_price_option" value="선결제"/><label for="선결제">선결제</label>&nbsp;
						<input type="radio" name="paymentoption" id="delivery_price_option"  value="착불 또는 선결제"/><label for="착불또는선결제">착불 또는 선결제</label>
					</li>
				</ul>
			</ul>
		</div>
	<!-- 상품내용 -->
	<div class="category_wrap">
		<div class="category_title">상품 내용</div>
			<hr/>
			<ul>
				<li><label for="">판매단위</label>&nbsp;
					<input type="number" name="selloption" id=""/>
					<select id="select_unit">
						<option value="none">해당없음</option>
						<option value="pack">팩</option>
						<option value="box">박스</option>
					</select>
				</li>
				<li><label for="">중량/용량</label>&nbsp;
					<input type="number" name="sellweight" id="sellweight" />
					<select id="select_weight">
						<option value="g">g</option>
						<option value="kg">kg</option>
					</select>
				</li>
				<li><label for="">원산지</label>&nbsp;
					<input type="button" name="origin" class="btn" id="domestic" value="국내산"/> <input type="button" name="origin" class="btn" id="import" value="수입산"/>
					<div id="import_wrap" style="display:none">
						<input type="button" name="origin" id="china" class="btn" class="import_nation" value="중국산"/>
						<input type="button" name="origin" id="japan" class="btn" class="import_nation" value="일본산"/>
						<input type="button" name="origin"  id="malaysia" class="btn" class="import_nation" value="말레이시아산"/>
						<input type="button" name="origin" id="philippines" class="btn" class="import_nation" value="필리핀산"/>
						<input type="button" name="origin" id="vietnam" class="btn" class="import_nation" value="베트남산">
						<input type="button" name="origin" id="chile" class="btn" class="import_nation" value="칠레산"> 
					</div>
				</li>
				<li><label for="보관/포장타입">보관/ 포장타입</label>&nbsp;
					<select id="select_packing" name="wrapping">
						<option value='실온'>실온</option>
						<option value='냉장'>냉장</option>
						<option value='냉동'>냉동</option>
					</select>
				</li>
				<li><label for="">상품정보</label><br/>
					<textarea placeholder="간략한 상품정보를 입력해주세요."></textarea>
				</li>
				<li><label for="">주의사항</label><br/>
					<textarea placeholder="주의사항을 입력해주세요."></textarea>
				</li>
				<li><label for="">보관방법</label><br/>
					<textarea placeholder="보관방법을 입력해주세요. 예) 습기가 없는 서늘한 곳에 보관하세요."></textarea>
				</li>
				<li><label for="">유통기한</label><br/>
					<textarea placeholder="유통기한을 입력해주세요. 예) 수령후 일주일 또는, 신선식품이므로 가능한 빨리 드시기를 바랍니다."></textarea>
				</li>
			</ul>
		</div>
		<hr/>
	<!-- 취소 저장하기 버튼 -->
		<div class="end_button_wrap">
			<input type="button" class="cancel_btn" class="btn" value="취소">
			<input type="submit" name="" value="저장하기" class="save_btn" class="btn"/>
		</div>
	</form>
	</div><!-- article end -->
	</div><!-- main end -->
</body>
</html>