package com.beetmall.sshj.seller.vo;

public class ProductVO {
	//상품목록의 체크박스에서 선택된 상품번호 배열을 담을 변수
	private String[] oneProductCheck;
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
	
	private Integer productprice; //판매가격
	private char saleselect; //할인여부
	private char optionselect; //옵션여부
	private char saleb; //b급 선택여부
	private String sellstart;//판매시작일
	private String sellfinish;//판매종료일
	
	private Integer totalstock;//총재고수량  
	private int nowstock;//현재재고수량 ( count(productnum) from orderdetail)
	private int soldstock; //팔린 재고 (orderdetail에서 가져오기)
	
	private String thumbimg;//썸네일이미지
	
	private String productcontent;//내용
	
	private String deliveryoption;//배송방법
	private Integer deliveryprice;//배송비
	private String paymentoption;//배송비 결제방식
	
	private String selloption;//판매단위
	private String selloptionnum; //판매단위 숫자
	private String selloptionunit; //판매단위 단위
	private String sellweight;//중량/용량
	private String sellweightnum; //중량용량 숫자
	private String sellweightunit; //중량용량 단위
	
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
	private Integer saleprice; //할인가격
	private String salestart; //할인 시작
	private String salefinish; //할인 끝
	//할인율
	private int salepercent; //할인율 담을 변수
	//판매가-할인금액 = 할인적용된 판매가
	private int sellprice;
	
	
	//대분류, 중분류
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
	
	
	//상품목록의 체크박스에서 선택된 상품번호 배열을 담을 변수

	public String[] getOneProductCheck() {
		return oneProductCheck;
	}
	public void setOneProductCheck(String[] oneProductCheck) {
		String productTemp = "";
		if(oneProductCheck != null) {
			for(int i = 0; i< oneProductCheck.length; i++) {
				productTemp += oneProductCheck[i];
				
				if(i<oneProductCheck.length-1) {
					productTemp+=",";
				}
			}
		}
		
		this.oneProductCheck = productTemp.split(",");
	}
	
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
	public Integer getProductprice() {
		return productprice;
	}
	public void setProductprice(Integer productprice) {
		this.productprice = productprice;
	}
	public char getSaleselect() {
		return saleselect;
	}
	public void setSaleselect(char setSaleselect) {
		this.saleselect = setSaleselect;
	}
	public char getSaleb() {
		return saleb;
	}
	public void setSaleb(char saleb) {
		this.saleb = saleb;
	}
	public char getOptionselect() {
		return optionselect;
	}
	public void setOptionselect(char optionselect) {
		this.optionselect = optionselect;
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
	public Integer getTotalstock() {
		return totalstock;
	}
	public void setTotalstock(Integer totalstock) {
		this.totalstock = totalstock;
	}
	public int getNowstock() {
		return nowstock;
	}
	public void setNowstock(int nowstock) {
		this.nowstock = nowstock;
	}
	public int getSoldstock() {
		return soldstock;
	}
	public void setSoldstock(int soldstock) {
		this.soldstock = soldstock;
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
	public String getDeliveryoption() {
		return deliveryoption;
	}
	public void setDeliveryoption(String deliveryoption) {
		this.deliveryoption = deliveryoption;
	}
	public Integer getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(Integer deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	public String getPaymentoption() {
		return paymentoption;
	}
	public void setPaymentoption(String paymentoption) {
		this.paymentoption = paymentoption;
	}
	//상품내용
	public String getSelloption() {
		this.selloption = selloptionnum + selloptionunit;
		return selloption;
	}
	public void setSelloption(String selloption) {
		this.selloption = selloptionnum + selloptionunit;
	}
	public String getSellweight() {
		this.sellweight = sellweightnum + sellweightunit;
		return sellweight;
	}
	public void setSellweight(String sellweight) {
		this.sellweight = sellweightnum + sellweightunit;
	}
	
	//상품내용 숫자+단위
	public String getSelloptionnum() { 
		return selloptionnum;
	}
	public void setSelloptionnum(String selloptionnum) {
		this.selloptionnum = selloptionnum;
	}
	public String getSelloptionunit() {
		return selloptionunit;
	}
	public void setSelloptionunit(String selloptionunit) {
		this.selloptionunit = selloptionunit;
	}
	public String getSellweightnum() {
		return sellweightnum;
	}
	public void setSellweightnum(String sellweightnum) {
		this.sellweightnum = sellweightnum;
	}
	public String getSellweightunit() {
		return sellweightunit;
	}
	public void setSellweightunit(String sellweightunit) {
		this.sellweightunit = sellweightunit;
	}
	//상품내용
	
	
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
	public Integer getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(Integer saleprice) {
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
	//할인율
	public int getSalepercent() {
		return salepercent;
	}
	public void setSalepercent(int salepercent) {
		this.salepercent = salepercent;
	}
	//할인적용된 판매가
	public int getSellprice() {
		return sellprice;
	}
	public void setSellprice(int sellprice) {
		this.sellprice = sellprice;
	}

	
	
	
	
}