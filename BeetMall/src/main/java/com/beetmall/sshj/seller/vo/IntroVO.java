package com.beetmall.sshj.seller.vo;

public class IntroVO {
	// 판매자 테이블
	private String userid; // 아이디
	private int storenum; // 농장번호
	private String storename; // 상호명
	private String sellername; // 대표자
	private long sellerreginum; // 사업장등록번호
	private String sellerregiimg; // 사업자 등록증 이미지
	private String regiapproval; // 승인여부
	private String regiapprovaldate; // 승인날짜
	private int storezipcode; // 사업장 우편번호
	private String storeaddr; // 사업장 주소
	private String storedetailaddr; // 사업장 상세주소
	private String storeemail; // 사업장 이메일
	private String bank; //은행명
	private String bankname; // 예금주
	private long bankaccount; // 판매자 계좌번호
	
	// 농장 테이블
	private String farmname; // 농장이름
	private String farmintro; // 소개
	private String farmprofile; //농장 이미지
	private int farmvisitor; //방문자수
	// 농장테이블에 상품번호 추가
	
	//대표상품으로 쓸 상품 테이블 즉, 대표상품은 productnum 이겠다.
	private int productnum; // 상품번호
	private String saleselect; //할인액
	private int productprice;//가격
	private String productname;//상품명
	private String thumbimg; // 썸네일 이미지
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getStorenum() {
		return storenum;
	}
	public void setStorenum(int storenum) {
		this.storenum = storenum;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getSellername() {
		return sellername;
	}
	public void setSellername(String sellername) {
		this.sellername = sellername;
	}
	public long getSellerreginum() {
		return sellerreginum;
	}
	public void setSellerreginum(long sellerreginum) {
		this.sellerreginum = sellerreginum;
	}
	public String getSellerregiimg() {
		return sellerregiimg;
	}
	public void setSellerregiimg(String sellerregiimg) {
		this.sellerregiimg = sellerregiimg;
	}
	public String getRegiapproval() {
		return regiapproval;
	}
	public void setRegiapproval(String regiapproval) {
		this.regiapproval = regiapproval;
	}
	public String getRegiapprovaldate() {
		return regiapprovaldate;
	}
	public void setRegiapprovaldate(String regiapprovaldate) {
		this.regiapprovaldate = regiapprovaldate;
	}
	public int getStorezipcode() {
		return storezipcode;
	}
	public void setStorezipcode(int storezipcode) {
		this.storezipcode = storezipcode;
	}
	public String getStoreaddr() {
		return storeaddr;
	}
	public void setStoreaddr(String storeaddr) {
		this.storeaddr = storeaddr;
	}
	public String getStoredetailaddr() {
		return storedetailaddr;
	}
	public void setStoredetailaddr(String storedetailaddr) {
		this.storedetailaddr = storedetailaddr;
	}
	public String getStoreemail() {
		return storeemail;
	}
	public void setStoreemail(String storeemail) {
		this.storeemail = storeemail;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public long getBankaccount() {
		return bankaccount;
	}
	public void setBankaccount(long bankaccount) {
		this.bankaccount = bankaccount;
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
	public String getSaleselect() {
		return saleselect;
	}
	public void setSaleselect(String saleselect) {
		this.saleselect = saleselect;
	}
	public int getProductprice() {
		return productprice;
	}
	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getThumbimg() {
		return thumbimg;
	}
	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}
	
	
}
