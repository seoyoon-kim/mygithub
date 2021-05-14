package com.beetmall.sshj.seller.vo;

public class OrderSaleVO {
	/*
	 * [주문관리] 주문번호, 상품명, 수량, 주문일, 주문자명, 아이디, 전화번호, 배송요청, 결제금액, 주문상태, 배송정보 
	 * -모달 주문번호,
	 * 주문일, 주문상품명, 결제일, 수량, 결제금액,옵션, 포인트사용, 결제방법, 할인금액, 실결제금액, 받는분, 받는분 연락처, 배송지,
	 * 배송메모, 주문자명, 주문자연락처, 주문자id, 택배, 송장번호, 배송비 배송정보, 히스토리
	 * 
	 * [판매관리] 주문번호, 상품명, 수량, 주문일, 주문자명, 아이디, 전화번호 , 배송요청, 결제금액, 클레임상태, 클레임정보 
	 * -모달
	 * 주문번호, 주문일, 주문상품명, 결제일, 수량, 결제금액,옵션, 포인트사용, 결제방법, 할인금액, 실결제금액, 받는분, 받는분 연락처,
	 * 배송지, 배송메모, 주문자명, 주문자연락처, 주문자id, 택배, 송장번호, 배송비 배송정보, 히스토리 , 클레임종류, 클레임 사유
	 */
// ordertbl, orderdetail, product, optiontbl, claim, delivery , deliverynow
//ordertbl
	public int ordernum; //주문번호
	public String userid; // 주문자 아이디
	public String orderdate; // 주문날짜 
	public String username; // 주문자명
	public String userphone; //전화번호
	public String orderprice; //주문금액
	public String orderoption; //주문방법(픽업or택배:?)
	public String receiver; // 받는사람
	public String receiverphone; //휴대폰번호
	public int deliveryzipcode; //우편번호
	public String deliveryaddr; //주소
	public String deliverydetailaddr;//상세주소
	public int deliveryprice;//배송비
	public String deliveryoption; //배송지명
	public String deliveryname;//배송지명
	public String deliverymemo;//배송요청사항
	public String paymentdate; //결제날짜
	public String paymentoption; //결제방법
	public int usedpoint;//사용한 마일리지
	public int realpayment; // 실결제금액
	public int optionnum; //주문한 옵션 번호
	
	
//orderdetail(구매목록 - productnum으로 연결)
	public int productnum; //상품번호 
	public int orderquantity; //수량
	public String orderstatus; //주문현재상황
	public String orderfirm; //구매확정날짜

//product
	public String productname; //상품명
//option
	public String optionname;
	
//delivery 
	public int deliverynum; //배송번호
	public int invoice; //송장번호
	public String deliverycompany; //택배사
	
//deliverynow (배송현재상황)
	public String deliverystatus; //배송현재상황
	public String deliverydate; //날짜
//claim
	public String claimkind; //클레임종류 (취소 0 반품 1)
	public String claimstatus; //클레임 상태
	public String claimContent; //클레임 내용
	public String claimdate; //클레임 날짜
	public String delivery; //배송???
	
}
