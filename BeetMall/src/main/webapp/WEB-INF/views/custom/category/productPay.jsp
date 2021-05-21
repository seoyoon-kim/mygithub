<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	#mainname{
	    border-bottom: 3px solid rgb(252,118,45);
        margin-top: 80px;
        margin-bottom: 30px;
	}
	/* 표 */
	#custommer{
	    width: 100%;
    	border-top: 2px solid #cecece;
	}
	#tooltip{
		width: 150px;
	    border: solid #e4e4e4;
	    border-width: 0 1px 1px 0;
	    padding: 7px 10px 7px 15px;
	    font-weight: 700;
	    text-align: right;
	    background: #f4f4f4;
	}
	#selected{
		border-bottom: 1px solid #e4e4e4;
    	padding: 10px 16px;
	}
	/* 표끝 */
	#info{
	  	text-align: center;
	  	margin:30px;
	}
	#pay{
		text-align: center;
		margin-bottom: 50px;
	}
	#payyy{
	    width: 350px;
	    height: 50px;
	    background-color: rgb(252,118,45);
	    border: 1px solid lightgray;
	}
	#receiver>h2, #receiver>div{
		float:left;
	}
	#receiver{
		overflow: auto;
	}
	#receivermain{
		margin-top:30px;
	}
	#paymentinfo{
		margin-top:30px;
	}
	#checkcheck{
	    padding-top: 33px;
	    padding-left: 21px;
	}
	.putbox{
		width: 200px;
	    height: 25px;
	    padding: 12px 10px;
	    box-sizing: border-box;
	}
	#zipcode{
		width: 150px;
	}
	#addr{
		margin-top:5px;
		width: 250px;
	}
	#addrDetail{
		margin-top:5px;
		width: 180px;
	}
	#addrSearch{
    	margin-left: 15px;
	}
	#havepoint{
		padding-bottom: 10px;
	}
	#pointCheck{
		margin-left: 15px;
	}
</style>
<script>
	$(function(){
		//주소검색햇을때 쓰는 API
		$("#addrSearch").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	$("#zipcode").val(data.zonecode);
		            $("#addr").val(data.address);
		            document.getElementById('addrDetail').focus();
		        }
		    }).open();
		});
		
		//총결제금액 대입하기
		var total = $("#tototal").val(); //총금액
		var discount = $("#discount").val(); //할인액
		var deliveryprice = parseInt($("#deliveryprice").val()); //배송비
		var tototaal = total - discount + deliveryprice; //계산해서 나온 총합
		var orderprice22 = total - discount + deliveryprice;
		var havingPoint = $("#mypoint").val(); //현재 포인트
		var point = 0; //포인트 금액
		var hellopoint = havingPoint-point; //현재포인트에서-포인트 뺸값
		var asdf = tototaal-point; //포인트가 더많을때를 대비한 변수
		
		$("#totototo").empty();
		$("#totototo").html("<h3>"+tototaal+"원</h3>");
		
		//포인트썻을때 총결제금액 바꾸기
		$("#pointCheck").click(function(){
			point = $("#usePoint").val();
			asdf = tototaal-point;
			if(asdf>=100){
				if(hellopoint>0){
					if(point%100==0){
						tototaal = tototaal-point;
						hellopoint = havingPoint-point;
						$("#totototo").empty();
						$("#totototo").html("<h3>"+tototaal+"원</h3>");
						$("#pointCheck").prop('readonly', true);
					}
				}
			}
		});
		
		//결제 API
		var IMP = window.IMP; // 생략가능
		IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		$("#payyy").click(function(){
			if($("#username").val() != null && $("#zipcode").val() != null && $("#addr").val() !=null && $("#addrDetail").val() != null && $("#userphone").val() != null &&
			   $("#username").val() != '' && $("#zipcode").val() != '' && $("#addr").val() !='' && $("#addrDetail").val() != '' && $("#userphone").val() != ''){
				IMP.request_pay({
				    pg : 'html5_inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '${vo4}',
				    amount : tototaal,
				    buyer_email : '${vo.useremail}',
				    buyer_name : '${vo.username}',
				    buyer_tel : '${vo.userphone}',
				    buyer_addr : '${vo.useraddr}',
				    buyer_postcode : '${vo.userzipcode}'
				}, function(rsp) {
				    if(rsp.success){
				        var send = "?username=${vo.username}&userphone=${vo.userphone}&orderprice="+tototaal;
				        	send +="&receiver="+$("#username").val()+"&receiverphone="+$("#userphone").val();
				        	send +="&deliveryzipcode="+$("#zipcode").val()+"&deliveryaddr="+$("#addr").val()+"&deliverydetailaddr="+$("#addrDetail").val();
				        	send +="&deliveryprice="+$("#deliveryprice").val()+"&deliveryoption="+$("#deliveryoption").val();
				        	send +="&deliverymemo="+$("#deliverymemo").val()+"&usedpoint="+point;
				        	send +="&mypoint=${vo.point}&realpayment="+tototaal+"&optionnum="+$("#optionnum").val();
				        	send +="&productnum="+$("#productnum").val()+"&orderquantity="+$("#orderquantity").val()+"&orderprice22="+orderprice22+"&hellopoint="+hellopoint;
				        location.href="/sshj/productPayBuy"+send
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        alert(msg);
				    }
				});
			}else{
				alert("받는사람 정보를 입력해주세요");
			}
		});

		
		//AJAX써서 기존정보동일 클릭시 가져오기
		$("#same").change(function(){
	        if($("#same").is(":checked")){
	        	$.ajax({
	    			url:"/sshj/productPaySame",
	    			success : function(data){
	    				console.log(data);
	    				$('#username').val(data.username);
	    				$('#zipcode').val(data.userzipcode);
	    				$('#addr').val(data.useraddr);
	    				$('#addrDetail').val(data.userdetailaddr);
	    				$('#userphone').val(data.userphone);
	    			}, error : function(){
	    				alert("정보가져오기 오류발생...");
	    			}
	    		});
	        }else{
	        	$('#username').val("");
				$('#zipcode').val("");
				$('#addr').val("");
				$('#addrDetail').val("");
				$('#userphone').val("");
	        }
	    });
	});
	
	function pooint(){
		var point = document.getElementById('usePoint').value;
		console.log(point);
	}
</script>
<input type="hidden" id="tototal" value="${vo2}"/> <!-- 총금액 -->
<input type="hidden" id="discount" value="${vo3}"/> <!-- 할인액 -->
<input type="hidden" id="productnum" value="${vo.productnum}"/> <!-- 번호 -->
<input type="hidden" id="deliveryprice" value="${vo.deliveryprice}"/> <!-- 배송비 -->
<input type="hidden" id="mypoint" value="${vo.point}"/> <!-- 포인트  -->
<input type="hidden" id="productname" value="${vo4}"/> <!-- 상품이름 -->
<input type="hidden" id="deliveryoption" value="${vo5}"/> <!-- 옵션 -->
<input type="hidden" id="optionnum" value="${vo6}"/> <!-- 옵션번호 -->
<input type="hidden" id="orderquantity" value="${vo7}"/> <!-- 총개수 -->

<div class="section">
	<div id="mainname"><h1>주문/결제</h1></div>
	<div>
		<h2>구매자 정보</h2>
		<table id="custommer">
			<tbody>
				<tr>
					<td id="tooltip">이름</td>
					<td id="selected">${vo.username}</td>
				</tr>
				<tr>
					<td id="tooltip">이메일</td>
					<td id="selected">${vo.useremail}</td>
				</tr>
				<tr>
					<td id="tooltip">휴대폰번호</td>
					<td id="selected">${vo.userphone}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="receivermain">
		<div id="receiver">
			<h2>받는사람 정보</h2>
			<div id="checkcheck"><input type="checkbox" id="same"/>기존 정보와 동일</div>
		</div>
		<table id="custommer">
			<tbody>
				<tr>
					<td id="tooltip">이름</td>
					<td id="selected"><input type="text" class="putbox" id="username" name="receiver" placeholder="이름을 입력해주세요"/></td>
				</tr>
				<tr>
					<td id="tooltip">배송주소</td>
					<td id="selected"><input type="text" placeholder="우편번호" class="putbox" id="zipcode" name="deliveryzipcode"/><button id="addrSearch">주소검색</button><br/>
									  <input type="text" placeholder="주소를 입력해주세요" class="putbox" id="addr" name="deliveryaddr"/><br/>
									  <input type="text" placeholder="상세주소를 입력해주세요" class="putbox" id="addrDetail" name="deliverydetailaddr"/>
					</td>
				</tr>
				<tr>
					<td id="tooltip">연락처</td>
					<td id="selected"><input type="text" class="putbox" id="userphone" name="receiverphone" placeholder="연락처를 입력해주세요"/></td>
				</tr>
				<tr>
					<td id="tooltip">배송요청사항</td>
					<td id="selected"><input type="text" class="putbox" id="deliverymemo" name="deliverymemo" placeholder="요청사항을 입력해주세요"/></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="paymentinfo">
		<h2>결제정보</h2>
		<table id="custommer">
			<tbody>
				<tr>
					<td id="tooltip">총가격</td>
					<td id="selected">${vo2}원</td>
				</tr>
				<tr>
					<td id="tooltip">할인가격</td>
					<td id="selected">${vo3}원</td>
				</tr>
				<tr>
					<td id="tooltip">배송비</td>
					<td id="selected">${vo.deliveryprice}원</td>
				</tr>
				<tr>
					<td id="tooltip">포인트</td>
					<td id="selected"><div id="havepoint">보유포인트 : ${vo.point}원</div>
									  <div>사용할 포인트 : <input type="number" class="putbox" min="100" max="${vo.point}" step="100" id="usePoint"/><button id='pointCheck'>적용하기</button></div>
									  <div>※100원 단위로 사용할 수 있습니다.</div></td>
				</tr>
				<tr>
					<td id="tooltip">총결제금액</td>
					<td id="selected"><div id="totototo"><h3>11,500원</h3></div></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="info">위 주문내용을 확인 하였으며, 회원 본인은 결제에 동의합니다.</div>
	<div id="pay"><button id="payyy">결제하기</button></div>
</div>