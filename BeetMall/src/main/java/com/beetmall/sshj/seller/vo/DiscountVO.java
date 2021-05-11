package com.beetmall.sshj.seller.vo;

public class DiscountVO {
	//할인
	private int productnum; 
	private int saleprice; //할인가격
	private String salestart; //할인 시작
	private String salefinish; //할인 끝
	//할인율
	private int salepercent; //할인율 담을 변수
	//판매가-할인금액 = 할인적용된 판매가
	private int sellprice;
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public String getSalestart() {
		return salestart;
	}
	public void setSalestart(String salestart) {
		this.salestart = salestart;
	}
	public String getSalefinish() {
		return salefinish;
	}
	public void setSalefinish(String salefinish) {
		this.salefinish = salefinish;
	}
	public int getSalepercent() {
		return salepercent;
	}
	public void setSalepercent(int salepercent) {
		this.salepercent = salepercent;
	}
	public int getSellprice() {
		return sellprice;
	}
	public void setSellprice(int sellprice) {
		this.sellprice = sellprice;
	}
	
	
}
