package com.beetmall.sshj.seller.vo;

public class SellerMainVO {
	private String userid; // 아이디
	
	private int realpayment; // 매출액
	private int newOrder; // 신규주문
	
	private String reviewanswer; // 리뷰미답변
	private String qanswer; // 문의미답변
	
	private String orderstatus; // 주문 현재상태
	private int ordercount; // 주문 현재상태 갯수
	
	
	private String infotitle; // 공지 제목
	private String infowritedate; // 공지 등록일
	 
	
	
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
	public int getNewOrder() {
		return newOrder;
	}
	public void setNewOrder(int newOrder) {
		this.newOrder = newOrder;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getRealpayment() {
		return realpayment;
	}
	public void setRealpayment(int realpayment) {
		this.realpayment = realpayment;
	}
	public String getReviewanswer() {
		return reviewanswer;
	}
	public void setReviewanswer(String reviewanswer) {
		this.reviewanswer = reviewanswer;
	}
	public String getQanswer() {
		return qanswer;
	}
	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}
	
	
	
}
