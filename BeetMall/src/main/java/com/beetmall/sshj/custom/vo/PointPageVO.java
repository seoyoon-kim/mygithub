package com.beetmall.sshj.custom.vo;

public class PointPageVO {
	private int pageNum = 1;
	private int onePageNum = 5;
	private int onePageRecord = 12;
	
	private int totalRecord;
	private int totalPage;
	private int startPageNum=1;
	
	private int lastPageRecord;

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
