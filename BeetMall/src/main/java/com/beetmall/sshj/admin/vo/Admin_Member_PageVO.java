package com.beetmall.sshj.admin.vo;

public class Admin_Member_PageVO {

	private int pageNum = 1;
	private int onePageNum = 5;
	private int onePageRecord = 10;
	
	private int totalRecord;
	private int totalPage;
	private int startPageNum=1;
	
	private int lastPageRecord;
	private String userid;
	private String type;
	private int month;
	private int userType;
	private String searchWord;
	private String searchKey;
	
	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		
		// 시작페이지 계산 
		startPageNum = ((pageNum-1)/onePageNum*onePageNum)+1;
	}

	public int getOnePageNum() {
		return onePageNum;
	}

	public void setOnePageNum(int onePageNum) {
		this.onePageNum = onePageNum;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// 총레코드수 / 한페이지당 레코드 수
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
		
		// 마지막 페이지 레코드 수
		if(totalRecord%onePageRecord == 0) {
			lastPageRecord = onePageRecord;
		}else {
			lastPageRecord = totalRecord%onePageRecord;
		}
		
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getLastPageRecord() {
		return lastPageRecord;
	}

	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}


}
