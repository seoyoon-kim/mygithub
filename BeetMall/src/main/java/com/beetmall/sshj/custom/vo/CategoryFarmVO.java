package com.beetmall.sshj.custom.vo;

public class CategoryFarmVO {
	private int storenum; //농장번호
	private String farmname; //농장이름
	private String farmintro; //소개
	private String farmprofile; //프로필이미지
	private int farmvisitor; //방문자수
	private int productnum; //대표상품끌어오기위해서 넣은것
	private String storeaddr; //주소
	public int getStorenum() {
		return storenum;
	}
	public void setStorenum(int storenum) {
		this.storenum = storenum;
	}
	public String getFarmname() {
		return farmname;
	}
	public void setFarmname(String farmname) {
		this.farmname = farmname;
	}
	public String getFarmintro() {
		return farmintro;
	}
	public void setFarmintro(String farmintro) {
		this.farmintro = farmintro;
	}
	public String getFarmprofile() {
		return farmprofile;
	}
	public void setFarmprofile(String farmprofile) {
		this.farmprofile = farmprofile;
	}
	public int getFarmvisitor() {
		return farmvisitor;
	}
	public void setFarmvisitor(int farmvisitor) {
		this.farmvisitor = farmvisitor;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getStoreaddr() {
		return storeaddr;
	}
	public void setStoreaddr(String storeaddr) {
		this.storeaddr = storeaddr;
	}
}
