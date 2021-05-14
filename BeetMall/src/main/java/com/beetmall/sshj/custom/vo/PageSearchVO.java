package com.beetmall.sshj.custom.vo;

public class PageSearchVO {
//	필요한정보를 세팅
	private int pageNum=1;//현재페이지
	private int onePageNum=5;//한페이지당 페이지 번호수
	private int onePageRecord=12;//한페이지당 레코드 수
	
//	디비에서 가져오는 정보
	private int startPageNum=1;//시작페이지-
	private int totalPage;//총페이지수-
	private int totalRecord;//총레코드수(게시글)-
	private int lastPageRecord;//마지막페이지에 남은 레코드수
	
//  디비에서 가져오는정보
	private String searchKey;//검색키
	private String searchWord;//검색어
	
	//과일,분류,픽업,베스트상품, 신상품떄문에 나눈것
	private String item; //과일,채소,쌀잡곡등 품목들
	private	String type; //평점낮은순, 평점높은순, 가격순, 가격낮은순 
	private String pick; //픽업
	
	//돈카테고리때문에 나눈것
	private String pay; //돈
	private String payStart; //돈시작
	private String payfinish; //돈끝
	
	//지역카테고리때문에 나눈것
	private String area;
	private String searchAreaList;
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		
		//시작페이지 번호를 계산
		startPageNum =(pageNum-1)/onePageNum*onePageNum+1;
	}
	
	public int getOnePageNum() {
		return onePageNum;
	}
	public void setOnePageNum(int onePageNum) {
		this.onePageNum = onePageNum;
	}
	public int getstartPageNum() {
		return startPageNum;
	}
	public void setStartNum(int startNum) {
		this.startPageNum = startNum;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int geTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		//총레코드 수를 이용하여 총 페이지수를 계산하기
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord); //36 
		
		//마지막페이지 레코드수
		if(totalRecord%onePageRecord==0) {
			lastPageRecord = onePageRecord;
		}else {
			lastPageRecord = totalRecord%onePageRecord; //마지막페이지의 남은 레코드수
		}
	}

	public int getLastPageRecord() {
		return lastPageRecord;
	}
	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPick() {
		return pick;
	}
	public void setPick(String pick) {
		this.pick = pick;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getPayStart() {
		return payStart;
	}
	public void setPayStart(String payStart) {
		this.payStart = payStart;
	}
	public String getPayfinish() {
		return payfinish;
	}
	public void setPayfinish(String payfinish) {
		this.payfinish = payfinish;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getSearchAreaList() {
		return searchAreaList;
	}
	public void setSearchAreaList(String searchAreaList) {
		this.searchAreaList = searchAreaList;
	}
}
