package com.beetmall.sshj.admin.vo;

public class Admin_WishVO {

	//category 대분류
	private int catenum;
	private String catename;
	
	//mcategory 중분류
	private String mcatename;
	
	//Product 상품등록
	private int productnum; //상품번호
	private String userid; //판매자 아이디
	private int mcatenum; // 중분류 카테고리 번호
	private String productname; //상품명 
	
	private int productprice; //판매가격
	private String saleselect; //할인여부
	private String saleb; //b급 선택여부
	private String sellstart;//판매시작일
	private String sellfinish;//판매종료일
	
	private int totalstock;//총재고수량  
	private int nowstock;//현재재고수량 ( count(productnum) from orderdetail)
	
	private String thumbimg;//썸네일이미지
	
	
	private String productcontent;//내용
	
	private int deliveryoption;//배송방법
	private int deliveryprice;//배송비
	private String paymentoption;//배송비 결제방식
	
	private String selloption;//판매단위
	private String sellweight;//중량/용량
	
	private String origin;//원산지
	
	private int wrapping;//보관,포장타입
	
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
	//할인율
	private int salepercent; //할인율 담을 변수
	//판매가-할인금액 = 할인적용된 판매가
	private int sellprice;
	
	
	//농장 vo
	private int storenum;
	private String farmname;
	private String farmprofile;
	
	//리뷰 VO
	private int reviewnum;
	private int ordernum;
	private String reviewcontent;
	private String reviewwritedate;
	private int reviewrecommend;
	private String reviewimg;
	private double reviewscore;
	private int reviewreport;
	private String reviewanswer;
	private int reviewcount;
	
	//리뷰 좋아요 누른 테이블
    private int reviewgood;
    
    //상품 문의 테이블
    private int qnum;
    private String qcontent;
    private String qwritedate;
    private int qopen;
    private String qanswer;
    private String qtitle;
    //
    private int wishnum;
    private int wishoptionnum;
    private int wishcode;
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
	public String getMcatename() {
		return mcatename;
	}
	public void setMcatename(String mcatename) {
		this.mcatename = mcatename;
	}
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
	public String getProductcontent() {
		return productcontent;
	}
	public void setProductcontent(String productcontent) {
		this.productcontent = productcontent;
	}
	public int getDeliveryoption() {
		return deliveryoption;
	}
	public void setDeliveryoption(int deliveryoption) {
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
	public int getWrapping() {
		return wrapping;
	}
	public void setWrapping(int wrapping) {
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
	public String getFarmprofile() {
		return farmprofile;
	}
	public void setFarmprofile(String farmprofile) {
		this.farmprofile = farmprofile;
	}
	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}
	public String getReviewwritedate() {
		return reviewwritedate;
	}
	public void setReviewwritedate(String reviewwritedate) {
		this.reviewwritedate = reviewwritedate;
	}
	public int getReviewrecommend() {
		return reviewrecommend;
	}
	public void setReviewrecommend(int reviewrecommend) {
		this.reviewrecommend = reviewrecommend;
	}
	public String getReviewimg() {
		return reviewimg;
	}
	public void setReviewimg(String reviewimg) {
		this.reviewimg = reviewimg;
	}
	public double getReviewscore() {
		return reviewscore;
	}
	public void setReviewscore(double reviewscore) {
		this.reviewscore = reviewscore;
	}
	public int getReviewreport() {
		return reviewreport;
	}
	public void setReviewreport(int reviewreport) {
		this.reviewreport = reviewreport;
	}
	public String getReviewanswer() {
		return reviewanswer;
	}
	public void setReviewanswer(String reviewanswer) {
		this.reviewanswer = reviewanswer;
	}
	public int getReviewcount() {
		return reviewcount;
	}
	public void setReviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}
	public int getReviewgood() {
		return reviewgood;
	}
	public void setReviewgood(int reviewgood) {
		this.reviewgood = reviewgood;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQwritedate() {
		return qwritedate;
	}
	public void setQwritedate(String qwritedate) {
		this.qwritedate = qwritedate;
	}
	public int getQopen() {
		return qopen;
	}
	public void setQopen(int qopen) {
		this.qopen = qopen;
	}
	public String getQanswer() {
		return qanswer;
	}
	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public int getWishnum() {
		return wishnum;
	}
	public void setWishnum(int wishnum) {
		this.wishnum = wishnum;
	}
	public int getWishoptionnum() {
		return wishoptionnum;
	}
	public void setWishoptionnum(int wishoptionnum) {
		this.wishoptionnum = wishoptionnum;
	}
	public int getWishcode() {
		return wishcode;
	}
	public void setWishcode(int wishcode) {
		this.wishcode = wishcode;
	}
    
    
}
