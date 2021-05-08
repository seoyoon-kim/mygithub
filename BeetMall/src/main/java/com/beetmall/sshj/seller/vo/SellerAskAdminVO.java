package com.beetmall.sshj.seller.vo;

public class SellerAskAdminVO {
	//userqboard 관리자에게문의하기
	private int qmnum; //글번호
	private String userid; //작성자아이디
	private String qmcontent; //제목
	private String qmtitle; // 내용
	private String qmdate; //문의한 날짜
	private String qmanswer; //답변내용
	private String qmoption; //문의유형
	private String qmanserdate; //문의답변날짜 
	
	public int getQmnum() {
		return qmnum;
	}
	public void setQmnum(int qmnum) {
		this.qmnum = qmnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getQmcontent() {
		return qmcontent;
	}
	public void setQmcontent(String qmcontent) {
		this.qmcontent = qmcontent;
	}
	public String getQmtitle() {
		return qmtitle;
	}
	public void setQmtitle(String qmtitle) {
		this.qmtitle = qmtitle;
	}
	public String getQmdate() {
		return qmdate;
	}
	public void setQmdate(String qmdate) {
		this.qmdate = qmdate;
	}
	public String getQmanswer() {
		return qmanswer;
	}
	public void setQmanswer(String qmanswer) {
		this.qmanswer = qmanswer;
	}
	public String getQmoption() {
		return qmoption;
	}
	public void setQmoption(String qmoption) {
		this.qmoption = qmoption;
	}
	public String getQmanserdate() {
		return qmanserdate;
	}
	public void setQmanserdate(String qmanserdate) {
		this.qmanserdate = qmanserdate;
	}
	
	
}
