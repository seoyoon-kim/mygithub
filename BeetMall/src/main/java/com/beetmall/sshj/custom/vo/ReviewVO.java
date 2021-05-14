package com.beetmall.sshj.custom.vo;

public class ReviewVO {
	private int reviewnum;
	private int ordernum;
	private int productnum;
	private String reviewcontent;
	private String userid;
	private String reviewwritedate;
	private int reviewrecommend;
	private String reviewimg;
	private double reviewscore;
	private int reviewreport;
	private String reviewanswer;
	private int reviewcount;
	
	public int getReviewlike() {
		return reviewcount;
	}
	public void setReviewlike(int reviewcount) {
		this.reviewcount = reviewcount;
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
	
	
	
}
