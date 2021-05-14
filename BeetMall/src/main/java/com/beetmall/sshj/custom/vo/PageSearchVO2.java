package com.beetmall.sshj.custom.vo;

public class PageSearchVO2 {
//	필요한정보를 세팅
	private int pageNum2=1;//현재페이지
	private int onePageNum2=5;//한페이지당 페이지 번호수
	private int onePageRecord2=12;//한페이지당 레코드 수
	
//	디비에서 가져오는 정보
	private int startPageNum2=1;//시작페이지-
	private int totalPage2;//총페이지수-
	private int totalRecord2;//총레코드수(게시글)-
	private int lastPageRecord2;//마지막페이지에 남은 레코드수
	
//  디비에서 가져오는정보
	private String searchKey2;//검색키
	private String searchWord2;//검색어
	
	
	public int getPageNum2() {
		return pageNum2;
	}
	public void setPageNum2(int pageNum2) {
		this.pageNum2 = pageNum2;
		
		//시작페이지 번호를 계산
		startPageNum2 =(pageNum2-1)/onePageNum2*onePageNum2+1;
	}
	
	public int getOnePageNum2() {
		return onePageNum2;
	}
	public void setOnePageNum2(int onePageNum2) {
		this.onePageNum2 = onePageNum2;
	}
	public int getstartPageNum2() {
		return startPageNum2;
	}
	public void setStartNum2(int startNum2) {
		this.startPageNum2 = startNum2;
	}
	public int getOnePageRecord2() {
		return onePageRecord2;
	}
	public void setOnePageRecord2(int onePageRecord2) {
		this.onePageRecord2 = onePageRecord2;
	}
	public int getTotalPage2() {
		return totalPage2;
	}
	public void setTotalPage2(int totalPage2) {
		this.totalPage2 = totalPage2;
	}
	public int getTotalRecord2() {
		return totalRecord2;
	}
	public void setTotalRecord2(int totalRecord2) {
		this.totalRecord2 = totalRecord2;
		
		//총레코드 수를 이용하여 총 페이지수를 계산하기
		totalPage2 = (int)Math.ceil(totalRecord2/(double)onePageRecord2); //36 
		
		//마지막페이지 레코드수
		if(totalRecord2%onePageRecord2==0) {
			lastPageRecord2 = onePageRecord2;
		}else {
			lastPageRecord2 = totalRecord2%onePageRecord2; //마지막페이지의 남은 레코드수
		}
	}

	public int getLastPageRecord2() {
		return lastPageRecord2;
	}
	public void setLastPageRecord2(int lastPageRecord2) {
		this.lastPageRecord2 = lastPageRecord2;
	}
	public String getSearchKey2() {
		return searchKey2;
	}
	public void setSearchKey2(String searchKey2) {
		this.searchKey2 = searchKey2;
	}
	public String getSearchWord2() {
		return searchWord2;
	}
	public void setSearchWord2(String searchWord2) {
		this.searchWord2 = searchWord2;
	}
}
