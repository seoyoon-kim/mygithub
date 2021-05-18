package com.beetmall.sshj.admin.vo;

public class Admin_HomeVO {	
	private int realpayment; // 매출액
	private int newOrder; // 신규주문
	
	private String reviewanswer; // 리뷰미답변
	private String qmanswer; // 문의미답변
	
	private String orderstatus; // 주문 현재상태
	private int ordercount; // 주문 현재상태 갯수
	
	private String infotitle; // 공지 제목
	private String infowritedate; // 공지 등록일
	 
	private String monthData; // 월 언제인가
	private long payData; // 월 금액 합계
	
	private int regiapproval; //판매자 사업자 등록증 신청 승인여부
	private int acknowledgment; // 승인 건수
	private int waiting; // 대기중 건수 
	
	private int reportOver; // 신고 접수 건수
	private int reportWaiting; // 신고 처리 대기중
	
	public int getRealpayment() {
		return realpayment;
	}
	public void setRealpayment(int realpayment) {
		this.realpayment = realpayment;
	}
	public int getNewOrder() {
		return newOrder;
	}
	public void setNewOrder(int newOrder) {
		this.newOrder = newOrder;
	}
	public String getReviewanswer() {
		return reviewanswer;
	}
	public void setReviewanswer(String reviewanswer) {
		this.reviewanswer = reviewanswer;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public int getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}
	public String getInfotitle() {
		return infotitle;
	}
	public void setInfotitle(String infotitle) {
		this.infotitle = infotitle;
	}
	public String getInfowritedate() {
		return infowritedate;
	}
	public void setInfowritedate(String infowritedate) {
		this.infowritedate = infowritedate;
	}
	public String getMonthData() {
		return monthData;
	}
	public void setMonthData(String monthData) {
		this.monthData = monthData;
	}
	public long getPayData() {
		return payData;
	}
	public void setPayData(long payData) {
		this.payData = payData;
	}
	public int getRegiapproval() {
		return regiapproval;
	}
	public void setRegiapproval(int regiapproval) {
		this.regiapproval = regiapproval;
	}
	public int getAcknowledgment() {
		return acknowledgment;
	}
	public void setAcknowledgment(int acknowledgment) {
		this.acknowledgment = acknowledgment;
	}
	public int getWaiting() {
		return waiting;
	}
	public void setWaiting(int waiting) {
		this.waiting = waiting;
	}
	public int getReportOver() {
		return reportOver;
	}
	public void setReportOver(int reportOver) {
		this.reportOver = reportOver;
	}
	public int getReportWaiting() {
		return reportWaiting;
	}
	public void setReportWaiting(int reportWaiting) {
		this.reportWaiting = reportWaiting;
	}
	public String getQmanswer() {
		return qmanswer;
	}
	public void setQmanswer(String qmanswer) {
		this.qmanswer = qmanswer;
	}
	
	
}
