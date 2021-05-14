package com.beetmall.sshj.seller.vo;

public class SellerReviewVO {
	private int reviewnum; // 리뷰글번호
	private int ordernum; // 주문번호 
	private int productnum; // 상품번호 
	private String reviewcontent; // 리뷰내용
	private String userid; // 아이디
	private String reviewwritedate; // 리뷰 작성일
	private int reviewrecommend; // 리뷰 추천수
	private String reviewimg; // 리뷰 이미지
	private int reviewscore; // 리뷰 별점
	private int reviewreport; // 리뷰 신고
	private String reviewanswer; // 판매자 답변
	
	private String productname; // 상품 - 상품명
	private int totalReview; // 리뷰 총 갯수
	private int nullReview; // 미답변 리뷰 갯수
	private int newReview; // 새 리뷰 갯수
	private double totalScore; // 총 별점
	
	private String startDate; // 시작날짜
	private String endDate; // 종료날짜
	private String searchTxt; // 검색어
	private int[] mcatenumDataArr; // mcatenum 배열
	
	private int sortStr; // 정렬기준
	private String sellerId; // sellerid를 저장할 vo
	private String reportReason; //신고사유 받을 vo
	private String reportContent; //신고 내용 받을 vo
	
	///////////////////////////////////////////////////////////////////////////
	
	//페이징
	private int pageNum=1; // 현재 누른 페이지
	private int onePageNum=10; // 한페이지당 페이지 번호수
	private int onePageRecord=10; // 한페이지당 레코드 수
	
	private int totalPage; //총 페이지, lastPage 마지막 페이지
	private int totalRecord; //총 레코드수
	private int startPageNum=1; //시작페이지
	
	private int lastPageRecord=10; //마지막 페이지의 남은 레코드수
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		// 시작페이지 번호 계산
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
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		// 총 레코드수를 이용하여 총페이지수를 구한다.
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
		
		//마지막 페이지 레코드 수
		if(totalRecord%onePageRecord == 0) { // totalRecord % 10 == 0 이면 한페이지당 갯수가 딱 맞다는 것이다.
			lastPageRecord = onePageRecord; // 그렇기 때문에 onePageRecord 10을 lastPageRecord로 넣어주면 되고
		} else {
			lastPageRecord = totalRecord%onePageRecord; // 나머지가 있다면, 그 숫자가 마지막 페이지의 record 수가 된다.
		}
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
	
	///////////////////////////////// 페이징 ////////////////////////////////////

	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	
	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSearchTxt() {
		return searchTxt;
	}
	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}
	public int[] getMcatenumDataArr() {
		return mcatenumDataArr;
	}
	public void setMcatenumDataArr(int[] mcatenumDataArr) {
		this.mcatenumDataArr = mcatenumDataArr;
	}
	
	
	
	public int getSortStr() {
		return sortStr;
	}
	
	public void setSortStr(int sortStr) {
		this.sortStr = sortStr;
	}
	
	
	
	public int getTotalReview() {
		return totalReview;
	}

	public void setTotalReview(int totalReview) {
		this.totalReview = totalReview;
	}

	public int getNullReview() {
		return nullReview;
	}

	public void setNullReview(int nullReview) {
		this.nullReview = nullReview;
	}

	public int getNewReview() {
		return newReview;
	}

	public void setNewReview(int newReview) {
		this.newReview = newReview;
	}

	public double getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(double totalScore) {
		this.totalScore = totalScore;
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

	public int getProductnum() {
		return productnum;
	}

	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}

	public String getReviewcontent() {
		return reviewcontent;
	}

	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public int getReviewscore() {
		return reviewscore;
	}

	public void setReviewscore(int reviewscore) {
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

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}
	
	
}
