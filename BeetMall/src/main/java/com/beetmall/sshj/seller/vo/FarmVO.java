package com.beetmall.sshj.seller.vo;

public class FarmVO {
	// 카테고리 대분류
	private int catenum; // 대분류 번호
	private String catename; // 대분류 이름
	private int catesort; // 대분류 정렬기준
	private String cateimg; // 대분류 사진
	
	// 카테고리 중분류
	private int mcatenum; // 중분류 번호
	private String mcatename; // 중분류 이름
	private int mcatesort; // 중분류 정렬기준
	
	// 차트에 들어갈 데이터?
	private int[] resultData; // 뷰단에 존재하는 가져와야 할 데이터 목록[배열]
	private int ordernum; // 주문번호
	private String productname; // 상품이름(제목)
	private int productnum; // 상품번호 
	private int orderquantity; // 수량
	private String orderconfirm; // 구매확정일자
	private int orderprice; // 구매한 가격
	private String userid; // 유저아이디
	
	// 날짜 데이터 저장할 변수
	private String startCalendarDataValue;
	private String endCalendarDataValue;
	
	public FarmVO() {};

	
	
	public String getProductname() {
		return productname;
	}


	public void setProductname(String productname) {
		this.productname = productname;
	}


	public String getStartCalendarDataValue() {
		return startCalendarDataValue;
	}
	public void setStartCalendarDataValue(String startCalendarDataValue) {
		this.startCalendarDataValue = startCalendarDataValue;
	}
	public String getEndCalendarDataValue() {
		return endCalendarDataValue;
	}
	public void setEndCalendarDataValue(String endCalendarDataValue) {
		this.endCalendarDataValue = endCalendarDataValue;
	}
	public int[] getResultData() {
		return resultData;
	}
	public void setResultData(int[] resultData) {
		this.resultData = resultData;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public int getOrderquantity() {
		return orderquantity;
	}
	public void setOrderquantity(int orderquantity) {
		this.orderquantity = orderquantity;
	}
	public String getOrderconfirm() {
		return orderconfirm;
	}
	public void setOrderconfirm(String orderconfirm) {
		this.orderconfirm = orderconfirm;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	//////////////////차트, 엑셀에 들어갈 데이터..////////////////////////
	public int getCatenum() {
		return catenum;
	}
	public void setCatenum(int catenum) {
		this.catenum = catenum;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public int getCatesort() {
		return catesort;
	}
	public void setCatesort(int catesort) {
		this.catesort = catesort;
	}
	public String getCateimg() {
		return cateimg;
	}
	public void setCateimg(String cateimg) {
		this.cateimg = cateimg;
	}
	public int getMcatenum() {
		return mcatenum;
	}
	public void setMcatenum(int mcatenum) {
		this.mcatenum = mcatenum;
	}
	public String getMcatename() {
		return mcatename;
	}
	public void setMcatename(String mcatename) {
		this.mcatename = mcatename;
	}
	public int getMcatesort() {
		return mcatesort;
	}
	public void setMcatesort(int mcatesort) {
		this.mcatesort = mcatesort;
	}
	
	
}
