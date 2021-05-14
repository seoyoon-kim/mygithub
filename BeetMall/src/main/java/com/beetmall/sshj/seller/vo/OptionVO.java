package com.beetmall.sshj.seller.vo;

public class OptionVO {
	//option 옵션 선택
	private int optionnum; //옵션번호   fk=productnum상품번호 
	private int productnum;
	private String optionname; // 옵션상품이름
	private String optionstock; //옵션 총 재고수량
	private String optionnowstock; //옵션 현재 재고수량( 초기값 = 총재고수량)
	private String optionprice; //옵션가격
	public int getOptionnum() {
		return optionnum;
	}
	public void setOptionnum(int optionnum) {
		this.optionnum = optionnum;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getOptionname() {
		return optionname;
	}
	public void setOptionname(String optionname) {
		this.optionname = optionname;
	}
	public String getOptionstock() {
		return optionstock;
	}
	public void setOptionstock(String optionstock) {
		this.optionstock = optionstock;
	}
	public String getOptionnowstock() {
		return optionnowstock;
	}
	public void setOptionnowstock(String optionnowstock) {
		this.optionnowstock = optionnowstock;
	}
	public String getOptionprice() {
		return optionprice;
	}
	public void setOptionprice(String optionprice) {
		this.optionprice = optionprice;
	}
	
	
}
