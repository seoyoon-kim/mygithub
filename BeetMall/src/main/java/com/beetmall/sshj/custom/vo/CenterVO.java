package com.beetmall.sshj.custom.vo;


//관리자에게 문의하기 VO=CenterVO
public class CenterVO {
	private int qmnum;
	private String userid;
	private String content;
	private String qmtitle;
	private String qmdate;
	private String qmanswer;
	private String qmoption;
	
	public int getQmnum() {
		return qmnum;
	}
	public String getQmtitle() {
		return qmtitle;
	}

	public void setQmtitle(String qmtitle) {
		this.qmtitle = qmtitle;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	
	
}
