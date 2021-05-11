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
	
	
	private int startPageNum=1;
	private int lastPageNum;
	private int pageNum=1;
	private int totalPageNum;
	private int totalRecord;
	private int oneRecordNum=10;
	
	

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
