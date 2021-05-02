package com.beetmall.sshj.seller.vo;

public class ProductVO {
	//Product 상품등록
	private int productnum; //상품번호
	private String userid; //판매자 아이디
	private int mcatenum; // 카테고리 번호
	private String productname; //상품명 
	
	private int productprice; //판매가격
	private String saleselect; //할인여부
	private String saleb; //b급 선택여부
	private String sellstart;//판매시작일
	private String sellfinish;//판매종료일
	
	private int totalstock;//총재고수량
	private int nowstock;//현재재고수량 ( 초기값 = 총재고수량)
	
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
	
	//option 옵션 선택
	private int optionnum; //옵션번호   fk=productnum상품번호 
	private String optionname; // 옵션상품이름
	private String optionstock; //옵션 총 재고수량
	private String optionnowstock; //옵션 현재 재고수량( 초기값 = 총재고수량)
	private String optionprice; //옵션가격
	
	//할인
	private int saleprice; //할인가격
	private String salestart; //할인 시작
	private String salefinish; //할인 끝
	
	//상품
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMcatenum() {
		return mcatenum;
	}
	public void setMcatenum(int mcatenum) {
		this.mcatenum = mcatenum;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getProductprice() {
		return productprice;
	}
	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	public String getSaleselect() {
		return saleselect;
	}
	public void setSaleselect(String saleselect) {
		this.saleselect = saleselect;
	}
	public String getSaleb() {
		return saleb;
	}
	public void setSaleb(String saleb) {
		this.saleb = saleb;
	}
	public String getSellstart() {
		return sellstart;
	}
	public void setSellstart(String sellstart) {
		this.sellstart = sellstart;
	}
	public String getSellfinish() {
		return sellfinish;
	}
	public void setSellfinish(String sellfinish) {
		this.sellfinish = sellfinish;
	}
	public int getTotalstock() {
		return totalstock;
	}
	public void setTotalstock(int totalstock) {
		this.totalstock = totalstock;
	}
	public int getNowstock() {
		return nowstock;
	}
	public void setNowstock(int nowstock) {
		this.nowstock = nowstock;
	}
	public String getThumbimg() {
		return thumbimg;
	}
	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}
	public String getAddimg() {
		return addimg;
	}
	public void setAddimg(String addimg) {
		this.addimg = addimg;
	}
	public String getProductcontent() {
		return productcontent;
	}
	public void setProductcontent(String productcontent) {
		this.productcontent = productcontent;
	}
	public String getDeliveryoption() {
		return deliveryoption;
	}
	public void setDeliveryoption(String deliveryoption) {
		this.deliveryoption = deliveryoption;
	}
	public int getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(int deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	public String getPaymentoption() {
		return paymentoption;
	}
	public void setPaymentoption(String paymentoption) {
		this.paymentoption = paymentoption;
	}
	public String getSelloption() {
		return selloption;
	}
	public void setSelloption(String selloption) {
		this.selloption = selloption;
	}
	public String getSellweight() {
		return sellweight;
	}
	public void setSellweight(String sellweight) {
		this.sellweight = sellweight;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getWrapping() {
		return wrapping;
	}
	public void setWrapping(String wrapping) {
		this.wrapping = wrapping;
	}
	public String getProductinfomation() {
		return productinfomation;
	}
	public void setProductinfomation(String productinfomation) {
		this.productinfomation = productinfomation;
	}
	public String getPrevention() {
		return prevention;
	}
	public void setPrevention(String prevention) {
		this.prevention = prevention;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	//옵션
	
	public int getOptionnum() {
		return optionnum;
	}
	public void setOptionnum(int optionnum) {
		this.optionnum = optionnum;
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
	
	//할인
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
	

	
}
