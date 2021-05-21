 package com.beetmall.sshj.admin.vo;

public class Admin_Board_PageVO {

	private int pageNum = 1;
	private int onePageNum = 5;
	private int onePageRecord = 12;

	private int startPageNum=1;
	private int totalPage;
	private int totalRecord;
	private int lastPageRecord; 
	 
	private String searchKey;//검색키
	private String searchWord;//검색어
	

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
}