package com.beetmall.sshj.vo;

public class ProductVO {
	private int productnum; //상품번호
	private String userid; //판매자 아이디
	private int mcatenum; //중분류 카테고리 번호
	private String productname; //상품명 
	private int productprice; //판매가격
	private String saleselect; //할인여부
	private String saleb; //b급 선택여부
	private String sellstart;//판매시작일
	private String sellfinish;//판매종료일
	private int totalstock;//총재고수량
	private int nowstock;//현재재고수량
	private String thumbimg;//썸네일이미지
	private String addimg;// 추가이미지
	private String productcontent;//내용
	private String deliveryoption;//배송방법
	private int deliveryprice;//배송비
	private String paymentoption;//배송비 결제방식
	private String selloption;//판매단위
	private String sellweight;//중량/용량
	private String origin;//원산지
	private String wrapping;//보관,포장타입
	private String productinfomation;//상품정보
	private String prevention;//주의사항
	private String deadline;//유통기한
}
