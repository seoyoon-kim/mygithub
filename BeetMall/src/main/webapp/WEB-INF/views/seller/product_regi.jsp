<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/inc/sellerHeader.jsp" %> 
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
		<!--jquery datepicker사용하기  -->
		 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	
		 <!-- css -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/basicStyle.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/headerStyle.css">
</head>
<style>
	li{margin-bottom:15px;}
	li>span{line-height:30px;}
	ul{margin-bottom:5px}
	label{margin:0; line-height:30px;}
	select{height:28px;}
	input, textarea, select{
		border:1px solid lightgray; 
		font-size:14px;
	}
	input{padding:2px}
	input,select,button{height:30px;}
	textarea{
		width:100%;
	}
	input[type="radio"], input[type="checkbox"]{
		margin-right:5px; height:10px;
	}
	/* div*/
	.category_title{
	   width: 100%;
	   height: 30px;
	   line-height: 30px;
	   text-indent: 0.4em;
	   font-size:16px;
	   margin-top:20px;
	   margin-bottom:10px;
	   font-size:16px;
	}
	.category_wrap{
		border:1px solid lightgray;
		padding:20px;
		margin-bottom:10px;
	}
	.category_wrap li{
		padding-left:10px;
	}
	 .category_wrap>div{margin-bottom:20px; font-size:15px;}
	/* 리뷰 검색 */
	/* 카테고리 검색 */
	#categoryList{
	   width: 90%;
	   margin: 30px auto;
	   border: 1px solid lightgray;
	}
	
	#categoryListMiddle{
	   width: 100%;
	   height: 170px;
	   display: flex;
	   flex-basis: 1;
	   margin-bottom: 5px;
	   border-top:1px solid lightgray;
	}
	
	#categoryListMiddle ul{
	   border-bottom: 1px solid lightgray;
	   overflow: auto;
	   flex: 1;
	   display: flex;
	   flex-direction: column;
	   overflow-x:hidden;
	   overflow-y:auto; 
	   	width: 25px;
	}
	
	#category{
	   border-right: 1px solid lightgray;
	   font-size:14px;
	}
	#category a{
	   color: black;
	}
	#category li{ 
		margin:5px;
	}
	#categoryListMiddle li{
	   width: 100%;
	   text-indent: 0.4em;
	   display: flex;
	   margin-top:5px;
	}
	
	#categoryListMiddle span{
	   margin-left: auto;
	   margin-right: 10px;
	}
	
	#categoryManagement{
	   width: 90%;
	   display: flex;
	   flex-wrap: wrap;
	   margin-left: 55px;
	}
	#categoryManagement a{
	   color: black;
	   font-weight: bold;
	}
	#mcategory li>a{
	   color: black;
	}
	
/*해당 목록에 대한 설명 또는 주의사항*/
	.notice{
		font-size:0.75em;
		color:gray;
	}
/*판매가격*/
	#total_price{
		font-weight:bold;
		font-size:17px;
	}
	label{margin-right:10px;}
/*옵션*/
	.regi_option_table input{
		border:none;
		height:30px;
	}
	th{
		height: 30px;
		font-size:13px;
		text-align:center;
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
	
/*placeholder*/

input::-webkit-input-placeholder { font-size: 90%; padding-left:5px;}
#optionstock::-webkit-input-placeholder, #optionprice::-webkit-input-placeholder{ font-size: 90%; text-align:right;}
#optionname::-webkit-input-placeholder{ font-size: 90%; text-align:center;}
input::-moz-placeholder { font-size: 90%;padding-left:5px; }
input:-ms-input-placeholder { font-size: 90%;padding-left:5px; }
input:-moz-placeholder { font-size: 90%; padding-left:5px;}
input::placeholder { font-size: 90%; padding-left:5px;}

</style>
<script>

$(function(){
	//1. 카테고리 변경
	// 데이터에서 불러오기 
	   //선택한 대분류 카테고리에 속한 중분류 카테고리 불러오기
      $(document).on('click',"#category>li",function(){
         // 선택된 카테고리 번호
         let cateNum = $(this).val();
         // 태그를 이용해 선택된 카테고리의 중분류 카테고리를 담는 변수
         let tag ="";
         
         // category 대분류 클릭시  bold처리
         $('#category>li').css('font-weight','normal');
         $(this).css('font-weight','bold');
         
         
         // 카테고리 리스트가 널이 아닐경우
         <c:if test="${cateList!=null }">
            //  카테고리 번호가 무엇인지에 따라서 불러온다, 카테고리 번호가 1이면 중분류 카테고리 1번의 값들을 불러오기
            <c:forEach var="mcateList" items="${cateList}">
               if(${mcateList.catenum}==cateNum){
                  tag += "<li value='${mcateList.catename}'>"
                        +"<input type='hidden' name='mcatenum' value='${mcateList.mcatenum}'/>"
                        +"<a href='#' onclick = 'return false;'/>${mcateList.mcatename}</a></li>";	
               }
            </c:forEach>
            $('#mcategory').html(tag);
         </c:if>
      });//1. end
	
      //2. mcategory 중분류 클릭시 
      $(document).on('click',"#mcategory>li",function(){
    	  // 선택한 중분류 bold처리
    	  $('#mcategory>li').css('font-weight','normal');
          $(this).css('font-weight','bold');
         
          // 선택한 목록의 중분류 이름, 번호 구하기
          let selectName = $(this).text();
          let selectNum = $(this).children().val();
          // li 개수 구하여 상품 등록은 한 개의 카테고리만 선택 가능
          let liLength = $('#categoryManagement>li').length;
          if(liLength>=1){
             return alert('판매 상품 등록은 한 가지 카테고리만 선택해주세요.\n원하시는 품목이 없으신 경우 관리자에게 문의해주세요.'); 
          }
          // 선택된 목록 [카테고리 선택] 하단에 보여주기 
          let tag = "<li value="+selectNum+">"+"<input type='hidden' value="+selectName+">"+"<a href='#' onclick='return false'><label for='categoryManagement' id='categoryManagement_label'>선택한 상품 카테고리 : </label>"+$(this).attr('value')+"&gt;"+selectName+"<span>⊠</span></a></li>";
          $('#categoryManagement').append(tag);
      });  //2 end
      
      //3. 선택한 중분류 삭제
      //append로 값을 동적으로 추가해줄 경우 새로 html이 실행 된 것이 아니기 때문에 html에서는 그 값을 읽지 못한다.
      // 그렇기 때문에 document를 사용해 다시 html을 읽기만 해서 싹 둘러보고 찾아서 삭제
      $(document).on('click','#categoryManagement>li',function(){
             
         // 삭제하기 위해서는 어떤 것이 선택되었는지?
         // 그리고 삭제하는 데이터가 추가 된 것 중에 몇번째에 있는지 알 수 있어야 한다.
         let liLength = $('#categoryManagement>li').length;
             
         // 선택된 목록의 이름과 번호를 구한다.
         let selectName = $(this).text();
         let selectNum = $(this).children().val();
             
             
         // 선택된 아이템의 텍스트를 걸러야 한다.
         let selectGtPosition = selectName.indexOf(">")+1;
         let selectBoxPosition = selectName.indexOf("⊠");
         let selectNameResult = selectName.substring(selectGtPosition,selectBoxPosition);
         $(this).remove();
      });//3 end

//버튼 클릭시 위로 올라가기 방지
	$('button').click(function(e){
		e.preventDefault();   
		e.stopPropagation();
		return false;
	});
 

//상품명
	//글자 수 입력에 대한 글자수 변경
	//100자 넘으면 alert 
	$('#product_register_name').keyup(function(){
		var content = $(this).val();//입력된 상품명의 value
		var count = content.length;
		$('#count').html(count);
		if(count>100){
			alert('상품명은 최대 100자까지 입력 가능합니다.').
			$(this).val(content.substring(0,100));
			$('#count').html(100);
		}
	});
//서머노트
	$(document).ready(function() {
		  $('#summernote').summernote({
			  focus: true,
			  lang: "ko-KR",	
			  //콜백 함수
	          callbacks : { 
	          onImageUpload : function(files, editor, welEditable) {
	          // 파일 업로드(다중업로드를 위해 반복문 사용)
	          for (var i = files.length - 1; i >= 0; i--) {
	          uploadSummernoteImageFile(files[i],
	          this);
	          		}
	          	}
	          }  
		  });
		  $('#summernote').css('z-index','-100px'); 
		  $('#summernote').summernote('enable');
	});
	
//이미지 파일 업로드
	
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}	
//썸네일 메인이미지 업로드 미리보기
$('#thumbimg').on('change',function(){
	console.log('함수 확인 이미지 ㅇ미ㅣ지')
	readURL(this);
});
	function readURL(input) {
		console.log('이미지 읽기 함수 이동 확인');
         if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(event) {
        	 		console.log('img 미리보기 확인');
                    $('#thumbimg1').attr('src', event.target.result);
                }
              reader.readAsDataURL(input.files[0]); //in
            }
        }

//등록페이지 
	$(document).ready(function(){	
		$('.btn').click(function(){
			$('btn').css('border','3px solid black');
		})
////할인 설정, 설정안함 버튼에 따라 하위 선택 보이기 
	
		$('input[name="saleselect"]').change(function(){
			if($('input[name="saleselect"]:checked').val()=="1"){
				console.log($('input[name="saleselect"]:checked').val());
				//세일 정보 입력 ul
				$('#sale_ul').css('display','block');
				
			}
			if($('input[name="saleselect"]:checked').val()=="0"){
				console.log($('input[name="saleselect"]:checked').val());
				//세일정보 입력ul 숨기기
				$('#sale_ul').css('display','none');
			}
		});
//못난이 할인 default 
		if($('#saleb').val() != '1' || $('#saleb').val()==' '){
			$('#saleb').val('0');
		}
//국내산, 수입산
		$('#import').on('click',function(){
			$('#import_wrap').css('display','block');
			$(this).css('background-color','lightgray')
			$('#domestic').css('background-color','white')
		});
		$('#domestic').click(function(){
			$(this).css('background-color','lightgray')
			$('#import').css('background-color','white')
			$('#import_wrap').css('display','none');
		}); //국내산,수입산 end
		
		$('input[name="origin"]').change(function(){
			if($('input[name="origin"]:checked').val()=="수입산"){
				console.log($('input[name="origin"]:checked').val());
				//세일 정보 입력 ul
				$('#import_wrap').css('display','block');
				
			}
			if($('input[name="origin"]:checked').val()=="국내산"){
				console.log($('input[name="origin"]:checked').val());
				//세일정보 입력ul 숨기기
				$('#import_wrap').css('display','none');
			}
		});
//택배
		$('#deliverysel').change(function(){
			var option = $(this).val();

			if(option=='1'){ //답변완료
				$('#delivery_option').css('display','none');
			}			
			if(option=='2' || option=='3'){ //답변대기중
				$('#delivery_option').css('display','block');
			}
		});
	
//옵션 적용안함 이면 표 비활성화
	
		$('#select_option').change(function(){
			var option=$(this).val();
			var tag = '';
			$('#option_tbody *').remove();
			console.log(option);
			for(var i = 0; i<option; i++){
					tag="<tr id=tr"+i+"><td><input type='text' name='optionname' id='optionname' placeholder='상품명을 입력해주세요.'/></td>"
					tag+="<td><input type='number' name='optionstock' id='optionstock' min='100' placeholder='개'/></td>"
					tag+="<td><input type='number' name='optionprice' id='optionprice' placeholder='원'/></td></tr>"
					$('#option_tbody').append(tag);
			}
		});


		$('input[name="optionselect"]').change(function(){
			if($('input[name="optionselect"]:checked').val()=="1"){
				console.log($('input[name="optionselect"]:checked').val());
				//세일 정보 입력 ul
				$('#add_option_ul').css('display','block');
				
			}
			if($('input[name="optionselect"]:checked').val()=="0"){
				console.log($('input[name="optionselect"]:checked').val());
				//세일정보 입력ul 숨기기
				$('#add_option_ul').css('display','none');
			}
		});// 옵션 선택 end
		
// 못난이할인
	 	if($('#saleb').val()!='1'){
	 		$('$saleb').val() =='0';
	 		console.log('못난이할인 noncheck saleb value -> ',$('$saleb').val());
	 	}

//취소 버튼 클릭 시 뒤로 가기
		$('#cancel_btn').click(function(){
			history.back();
		});

	});// 등록페이지srcipt end		
//입력 금액과 할인금액을 바로 보여주는 ajax
$(function(){
	$('#saleprice').keyup(function(){
		if($("input[name=saleselect]:checked").val()==0){
			$('#saleprice').val('');
			console.log('saleselect value ->', $("input[name=saleselect]:checked").val());
			console.log($('#saleprice').val());
		}
		priceAjax();
		
	})	
	$('#productprice').keyup(function(){
		priceAjax();
	})	
});
function priceAjax(){
	var productprice = $('#productprice').val();
	var saleprice = $('#saleprice').val();
	var totalprice = productprice - saleprice; 
	var url = window.location.href;
	if(productprice != ''){
		$.ajax({
			url: url,
			type:"post",
			data:{
				'productprice' : productprice,
				'saleprice' : saleprice,
				'totalprice' : totalprice
			},
			success : function(data){
				console.log('success');
				$('#total_price').html(totalprice);
				$('#discount_price').html(saleprice);
				if($("input[name=saleselect]:checked").val()==0){
					$('#saleprice').val('');
				}
			}, error: function(e){
				console.log('ajax error :'+ e.status); }
		});

	}
	}
});//function end

//판매기간/ 할인기간 날짜 설정

$(function(){
	//오늘 날짜 구하기
	  var thisDate = new Date();
      var thisYear = thisDate.getFullYear();        //해당 연
      var thisMonth = thisDate.getMonth() + 1;    //해당 월
	  var today = thisYear + "/" + thisMonth +"/"+ thisDate;

     //datepicker 옵션 설정
	 var dateFormat ="yy/mm/dd",
	 from = $('.start_date').datepicker({
		 showOn:"both",
		 defalutDate:"+1w",
		 changeMonth:true,
		 numberOfMonths:2,
		 changeMonth: true,//콤보박스에서 년 선택 가능
	     changeYear: true, //콤보박스에서 월 선택 가능
	     buttonText: "날짜선택",
	     dateFormat: 'yy/mm/dd',
	     language:'kr',
	     minDate:0, //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전, 0: 오늘)
	     showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	     
	 });
	 from = $('.start_date').on('change', function(){
		// 시작일(.start_date) datepicker가 닫힐때 최소 날짜(minDate)를 선택한 시작일로 지정
		 to.datepicker('option','minDate',getDate(this));		
	 }),
	 to=$('.finish_date').datepicker({
		 showOn:"both",
		 dafaultDate:'+1w',
		 changeMonth:true,
		 numberOfMonths:2,
		 changeMonth: true,
	     changeYear: true,
	     buttonText: "날짜선택",
	     dateFormat: 'yy/mm/dd',
	     language:'kr',
	     maxDate: "+5Y" //최대 선택일자(+1D:하루후, +1M:한달후, +1Y:일년후)    
	 })
	 to=$('.finish_date').on('change',function(){
		 from.datepicker('option','maxDate',getDate(this));
	 });
	//시작일의 초기값을 설정
	$('.start_date').datepicker('setDate', 'today');
	//판매일의 초기값을 설정
	$('.finish_date').datepicker('setDate', '+5Y');	 //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
	
	function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	      return date;
	    }
});
$(function(){
	


//submit 등록하기 전 유효성검사
$('submit').click(function(){
	
	//유효성검사 
	//전체
	//선택한 날짜가 오늘 이전일 경우 넘어가지 않기 메세지 띄우기
	
	//-------카테고리 선택-------
	//카테고리가 선택되지 않은 경우
	if($('#categoryManagement>li').val()==null){
		return alert('판매 상품 카테고리를 선택해주세요');
	}
	//-------상품명------------
	//상품명이 공백일 경우
	if($('#product_register_name').text()=='' || $('#product_register_name').val()==null || $('#product_register_name').val() == '' ){
       return alert('상품명을 입력해주세요.'); 
       return false;
  }
	//상품명이 100자가 넘는 경우
	if($('#product_register_name').text().length>100){
      return alert('상품명은 100자 이내로 작성해주세요.'); 
      return false;
 }
 //--------판매가격-------
 //판매가격이 입력되지 않은 경우
	if($("#productprice").val()==null || $("#productprice").val()=='' || $("#productprice").val()<0  || $("#productprice").text()==''){ 
		alert("판매 금액을 입력해주세요."); 
		return false;
	} 
 if($("input[name=saleselect]:checked").val() == ''){
	   alert("할인 적용 여부를 선택해주세요."); 
		return false;
 }
	//할인설정 
	if($("input[name=saleselect]:checked").val() == 1){
	   //할인금액이 입력되지 않은 경우
		if($("#saleprice").val()==null || $("#saleprice").val()=='' || $("#saleprice").val()<0  || $("#saleprice").text()==''){ 
			alert("할인 금액을 입력해주세요."); 
			return false;
		} 
	 }
	
	//날짜를 입력하지 않은 경우
	   if($('.start_date').val()==null || $('start_date').val()==''){
		   return alert('판매 날짜를 입력해주세요');
		   return false;
	   }
	//--------재고수량---------
	//재고수량을 입력하지 않은 경우
	if($('#totalstock').text('') || $('#totalstock').val()==null || $("#totalstock").val()<0 || $("#totalstock").text()==''){
		return alert('재고 수량을 입력해주세요.');
		return false;
	}
	//-------옵션------------
	if($("input[name=optionselect]:checked").val() == ''||$("input[name=optionselect]:checked").val() == null){
		return alert('옵션 적용 여부를 선택해주세요.');
		return false;
	}
	//옵션 선택 후 값을 입력하지 않은 경우
	if($("input[name=optionselect]:checked").val() == '1'){
		if($('#select_option').val()=='0'){
			return alert('추가할 옵션 갯수을 선택해주세요.');
			return false;
		}
		if($('#optionname').val()=='' && $('#optionstock').val()=='' && $('#optionprice').val()==''){
			return alert('옵션 목록을 정확히 입력해주세요.');
			return false;
		}
		
	}
	//------상품 이미지-------
	//대표 이미지를 업로드 하지 않은 경우
	if($('#thumbimg').val()==null || $('#thumbimg').val()==''){
		alert("대표 이미지를 설정해주세요.");
		return false;
	}
	//------상세설명---------
	//상세설명이 빈칸인 경우
	if($("#productcontent").val()==null || $("#username").val()==''){ 
		alert("상품 상세 설명을 입력해주세요"); 
		return false;
	}
	//-------배송-----------
	//택배 또는 픽업 버튼 중 어느것도 선택하지 않은 경우
	if($("#deliverysel").val()==null || $("#deliverysel").val()==''){ 
		alert("배송방법을 입력해주세요"); 
		return false;
	}
	//택비 설정
	//배송비를 입력하지 않은 경우
	if($("#deliveryprice").val()==null || $("#deliveryprice").val()=='' || $("#deliveryprice").val()<0 || $("#deliveryprice").text()==''){ 
		alert("배송비를 입력해주세요"); 
		return false;
	}
	//배송비 결제 방식을 선택하지 않은 경우
	if($("#deliveryoption").val()==null || $("#deliveryoption").val()=='' ){ 
		alert("배송방법을 선택해주세요"); 
		return false;
	}
	//-------상품내용-------------
	//판매단위를 입력하지 않은 경우
	if($("#selloption").val()==null || $("#selloption").val()==''){ 
		alert("판매단위를 입력해주세요"); 
		return false;
	}
	//중량/용량 과 g/kg 중 하나라도 입력하지 않은 경우
	if($("#sellweight").val()==null || $("#selloption").val()==''){ 
		alert("판매상품의 중량/용량을 입력해주세요"); 
		return false;
	}
	
	//원산지 선택하지 않은 경우
	if($("#origin").val()==null || $("#origin").val()==''){ 
		alert("원산지를 선택해주세요"); 
		return false;
	}
	//보관/포장타입을 선택하지 않은 경우
	if($("#wrapping").val()==null || $("#wrapping").val()==''){ 
		alert("보관/포장타입을 선택해주세요"); 
		return false;
	}
	//상품정보, 주의사항, 보관방법, 유통기한이 빈칸일 경우
	if($("#productinfomation").val()==null || $("#productinfomation").val()==''){ 
		alert("상품정보를 입력해주세요"); 
		return false;
	}
	if($("#prevention").val()==null || $("#prevention").val()==''){ 
		alert("주의사항 입력해주세요"); 
		return false;
	}
	if($("#deadline").val()==null || $("#deadline").val()==''){ 
		alert("유통기한 입력해주세요"); 
		return false;
	}
		return true;
	}); //submit 유효성검사 end
});
</script>
<body>
	<div class="main">
	<div id="article">
	<div class="wrapTitle" style="font-size:20px">상품등록</div>
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
	<form method="post" name="product_regi_form" id="product_regi_form" action="product_regi_ok" enctype="multipart/form-data">
	<!------------------------------------------ 카테고리------------------------------------------------->
	 <div class="category_title">카테고리</div>
		<div class="category_wrap">
            <div id="categoryList">
               <strong>&nbsp;&nbsp;카테고리 선택</strong>
                 <div id="categoryListMiddle">
                  <!--카테고리에서 대분류 카테고리 선택-------------------------->
                  <ul id="category"><!-- 카테고리 리스트에서 모든 카테고리 리스트를 가져오지만 우선 대분류만 보이게 한다.-->
                     <c:if test="${cateList!=null}">
                        <!-- 변수 i를 선언해주고 -->
                        <c:set var="i" value="1"/>
                        <!-- 변수 i 즉, catenum이 i와 일치하는 데이터 하나를 가지고 오면 
                                 i를 더해주어 다음 조건을 만들어 다음 번호 것만 가져오게 한다 -->
                           <c:forEach var="categoryList" items="${cateList}">
                              <c:if test="${categoryList.catenum==i}">
                                 <li value="${categoryList.catenum}"><a href="#" onclick="return false">${categoryList.catename}</a><span>&gt;</span></li>
                                 <c:set var="i" value="${i+1 }"/>
                              </c:if>
                           </c:forEach>
                        <c:remove var="i"/>
                     </c:if>
                  </ul>
                  
                  <!--카테고리에서 중분류 카테고리 선택-------------------------->
                  <ul id="mcategory"></ul>
               </div>
  				<!--------------------------선택된 카테고리 항목-------------------------->
            </div><!-- categoryList end -->
			<ul id="categoryManagement"></ul>
			<span class="notice" style="margin-left:55px;">등록한 판매상품은 고객님이 선택하신 카테고리로 분류되어 홈페이지에 적용됩니다. 원하시는 상품 카테고리가 없거나, 변경을 원하는 경우 관리자에게 문의해주세요.</span>
		</div><!-- categorySelection div end -->
		
	<!----------------------------------------------상품명------------------------------------------>
		<div class="category_title">상품명 등록</div>
	<div class="category_wrap">
			<ul>
				<li><label for="">상품명</label>&nbsp;
					<input type="text" name="productname" id="product_register_name" maxlength="100" size="100"/>&nbsp;<span id="count"></span>/<span id="max_count">100</span><br/>
					<span class="notice" >
					판매 상품과 직접 관련이 없는 다른 상품명, 스팸성 키워드 입력 시 관리자에 의해 판매 금지될 수 있습니다.<br/>
					유명 상품 유사문구를 무단으로 도용하여 기재하는 경우 별도 고지 없이 제재될 수 있습니다. <br/>
					상품명을 검색최적화 가이드에 잘 맞게 입력하면 검색 노출에 도움이 될 수 있습니다. <br/>
					</span>
				</li>
			</ul>
		</div> <!-- productNameRegi div end -->
		
	<!-----------------------------------------------판매가격 설정--------------------------------------->
	<div class="category_title">판매가격</div>
	<div class="category_wrap">		
		<ul>
			<li><label>판매가격 </label>&nbsp;<input type="number" name="productprice" id="productprice" min=100 placeholder="숫자만 입력하세요."/>&nbsp;<span>원</span></li>
			<br/>
			
			<li> 
				<label>판매기간</label>&nbsp;&nbsp;<span class="notice">판매 기간을 설정해주세요. 미선택시 판매시작일은 등록일, 판매종료일은 5년이내로 지정됩니다.</span>
			</li>
			<li id="sell_start_finish"><label for="start_date" >판매시작일</label><input type="text" name="sellstart" id="sellstart" class="start_date" max="2099-12-31"/> ~ <label for="finish_date">판매종료일</label><input type="text" name="sellfinish" id="sellfinish" class="finish_date" max="2099-12-31"/></li>
		
			<li>
				<label>할인여부 </label>&nbsp;
				<input type="radio" value="1" name="saleselect" id="sale_check"><label for="설정">설정</label>
				<input type="radio" value="0" name="saleselect" id="sale_uncheck"><label for="설정안함">설정안함</label>
			</li>
			<ul id="sale_ul" style="display:none; background-color:#fcfcfc;">
				<li>
					<label>할인금액 </label>&nbsp;
					<input type="number" name="saleprice" id="saleprice" placeholder="할인적용금액" min=0 />&nbsp;<span>원</span>&nbsp;<span>할인</span>
				</li>
				<li>
					<span class="notice">원하시는 할인 시작일과 할인 종료일을 설정하고 싶으시면, 특정기간만 할인을 선택해주세요. 미선택시 할인시작일은 등록일, 할인종료일은 5년이내로 지정됩니다.</span>
				</li>
				<li id="sale_period">
					<label for="start_date">할인시작일</label><input type="text" name="salestart" id="salestart"  class="start_date " max="2099-12-31"/> ~  <label for="finish_date">할인종료일</label><input type="text" name="salefinish" id="saledate" class="finish_date" max="2099-12-31"/>
					<span class="notice">특정기간이 지난후에는 판매가로 적용됩니다.</span>
				</li>
				
				<li><input type="checkbox" name="saleb" id="saleb" value="1"/><label for="saleb">못난이 할인 상품으로 등록</label></li> 
				<!-- default = 0 , 컨트롤러에서 선택 안하면 0으로 값이 지정되도록 설정할 것-->
			</ul>
			<li>
				<label for="">최종 판매가격</label>&nbsp; <span id="total_price" ></span>&nbsp;원 &nbsp;(-<span id="discount_price"></span>원 할인) 
				<span class="notice">수수료는 전체매출에서 2%차감된금액입니다.&nbsp;<a href="">안내 바로가기</a></span>
			</li>
		</ul>
		</div>
	
	<!-----------------------------------------------재고수량--------------------------------------->
	 <div class="category_title">재고수량</div>
	<div class="category_wrap">
			<ul>
				<li><label>재고수량</label>&nbsp; <input type="number" name="totalstock" id="totalstock" min=0 value=0/>&nbsp;<span>개</span></li>
				<li><span class="notice">판매할 총 재고량을 입력하세요.</span></li>
			</ul>			
	</div>	
	<!-----------------------------------------------옵션--------------------------------------->
	<div class="category_title">옵션</div>
	<div class="category_wrap">
			<ul class="regi_option_wrap">
				<li>
					<input type="radio" value="1" name="optionselect" id="add_option"><label for="옵션추가">옵션추가</label>
					<input type="radio" value="0" name="optionselect" id="none_option"><label for="추가안함">추가안함</label>
				</li>
				<ul id="add_option_ul" style="display:none; background-color:#fcfcfc;">
				<li><label>옵션 갯수</label>&nbsp;
					<select id="select_option" name="option_count"> 
						<option selected value='0'>옵션추가</option>
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
								<th>재고수량</th>
								<th>가격</th>
								
							</tr>
						</thead>
						<tbody id="option_tbody">
							<!--  선택한 value 값 만큼 표 추가  -->
						</tbody>
					</table>
				</li>
				</ul>
				<li><span class="notice">상세페이지에 예시) 호박고구마 1kg (+3000원)으로 표기됩니다.</span></li>
			</ul>
			</div>
	<!-----------------------------------------------상품 이미지-------------------------------------->
	<div class="category_title">상품 이미지</div>
	<div class="category_wrap">
			<ul>
				<li><label>대표이미지</label><br/>
					<span class="notice">홈페이지에 연출되는 대표 이미지를 업로드해주세요.</span><br/>
					<img name="thumbimg1" id="thumbimg1" src="#" alt="image upload" style="width:400px;"/><br/>
					<input type="file" id="thumbimg" name ="file" accept="img/*" />
				</li>
		   </ul>	
		</div>
 	<!-----------------------------------------------상세설명------------------------------------->
	<div class="category_title">상세설명</div>
	<div class="category_wrap">
		<textarea id="summernote"  name="productcontent"></textarea> <!-- name="editordata" -->
		</div>
	<!-----------------------------------------------배송----------------------------------------->
	<div class="category_title">배송</div>
	<div class="category_wrap">
			<ul>
				<li><label>배송방법</label>&nbsp; 
					<select name="deliveryoption" id="deliverysel" >
						<option value="1" id="pickup">픽업</option>
						<option value="2" id="delivery">택배</option>
						<option value="3" id="delandpick">택배/픽업</option>
					</select>
				</li>
				<ul id="delivery_option" style="display:none; background-color:#fcfcfc;">
					<li><label>배송비</label>&nbsp;
						<input type="number" name="deliveryprice" id="deliveryprice" min=0  />&nbsp;<span>원</span>	 <!-- 픽업 선택시 배송비 0원 고정 -->
					</li>
					<li id="pay"><label>결제방식</label>&nbsp;
						<input type="radio" name="paymentoption" id="delivery_price_option" value="1"/><label for="착불">착불</label>&nbsp;
						<input type="radio" name="paymentoption" id="delivery_price_option" value="2"/><label for="선결제">선결제</label>&nbsp;
						<input type="radio" name="paymentoption" id="delivery_price_option"  value="3"/><label for="착불또는선결제">착불 또는 선결제</label>
					</li>
				</ul>
			</ul>
		</div>
	<!----------------------------------------------상품내용--------------------------------------->
	<div class="category_title">상품 내용</div>
	<div class="category_wrap">
			<ul>
				<li><label for="">판매단위</label>&nbsp;
					<input type="number" name="selloptionnum" id="selloption"  min="0" onchange="javascript:removeCommaReturn(this);"/>
					<select id="select_unit" name="selloptionunit" onchange="javascript:removeCommaReturn(this);">
						<option value=" ">해당없음</option>
						<option value="팩">팩</option>
						<option value="박스">박스</option>
					</select>
					<input type="hidden" name="selloption" id="selloption_hidden"/>
				</li>
				<li><label for="">중량/용량</label>&nbsp;
					<input type="number" name="sellweightnum" id="sellweight" min="0" onchange="javascript:removeCommaReturn(this);"/>
					<select id="select_weight" name="sellweightunit" onchange="javascript:removeCommaReturn(this);">
						<option value="g">g</option>
						<option value="kg">kg</option>
					</select>
					<input type="hidden" name="sellweight" id="sellweight_hidden"/>
				</li>
				<li><label for="">원산지</label>&nbsp;
					<input type="radio" value="국내산" name="origin" id="domestic"><label for="국내산">국내산</label>
					<input type="radio" value="수입산" name="origin" id="import"><label for="수입산">수입산</label>
					<div id="import_wrap" style="display:none; background-color:#fcfcfc;">
						<input type="radio" value="중국산" name="origin" id="china"><label for="중국산">중국산</label>
						<input type="radio" value="일본산" name="origin" id="japan"><label for="일본산">일본산</label>
						<input type="radio" value="말레이시아산" name="origin" id="malaysia"><label for="말레이시아산">말레이시아산</label>
						<input type="radio" value="필리핀산" name="origin" id="philippines"><label for="필리핀산">필리핀산</label>
						<input type="radio" value="베트남산" name="origin" id="vietnam"><label for="베트남산">베트남산</label>
						<input type="radio" value="칠레산" name="origin" id="chile"><label for="칠레산">칠레산</label>
					</div>
				</li>
			
				<li><label for="보관/포장타입">보관/ 포장타입</label>&nbsp;
					<select id="select_packing" name="wrapping">
						<option value='0'>실온</option>
						<option value='1'>냉장</option>
						<option value='2'>냉동</option>
					</select>
				</li>
				<li><label for="">상품정보</label><br/>
					<textarea placeholder="간략한 상품정보를 입력해주세요." id ="productinfomation" name="productinfomation"></textarea>
				</li>
				<li><label for="">주의사항</label><br/>
					<textarea placeholder="주의사항을 입력해주세요." id="prevention" name="prevention"></textarea>
				</li>
				<li><label for="">유통기한</label><br/>
					<textarea placeholder="유통기한을 입력해주세요. 예) 수령후 일주일 또는, 신선식품이므로 가능한 빨리 드시기를 바랍니다." id="deadline" name="deadline"></textarea>
				</li>
			</ul>
		</div>
		<hr/>
	<!--------------------------------------------취소/ 저장하기 버튼---------------------------------------->
		<div class="end_button_wrap">
			<input type="button" id="cancel_btn" class="btn" value="취소" onclick="location.href='seller/product_list'">
			<input type="submit" name="submit" value="등록하기" id="save_btn" class="btn"/>
		</div>
	</form>
	</div><!-- article end -->
	</div><!-- main end -->
</body>
</html>